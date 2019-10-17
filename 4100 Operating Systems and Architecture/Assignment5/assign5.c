/* CSCI 4100
* Programming Assignment 5
* The Turtle Shell - a simple shell that executes commands
*/

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define MAX_LINE 256
#define MAX_ARGS 64

int is_blank(const char *cmd);
void parse_args(const char *cmd, char *argv[]);
void read_line(char *line);
void main_menu();

int main()
{
	// calls the main menu function
	main_menu();	
}
/* This function is to help keep the int main() clean.
*  This is the main menu for the program. The while loop will only exit
*  if the user types in exit or enters in a valid command.
*/

void main_menu()
{
	char* str[MAX_ARGS];											// creates pointer str with 64
	char line[MAX_LINE];											// creates line of 256
	char lowercaseExit[] = "exit";									// creates string "exit"
	char exitWithSpace[] = "exit ";									// creates string "exit "

	while (1)
	{
		printf(">");												// outputs message 
		read_line(line);											// reads the user's input

		if (is_blank(line) == 1)									// if the user enters a space or nothing then
		{
			main_menu();											// calls the main menu function 
		}

		if (strcmp(line, lowercaseExit) == 0)						// if the user enters "exit"
		{
			puts("[exiting turtle shell]");							// outputs message
			exit(0);												// exits with exit code 0
		}

		if (strcmp(line, exitWithSpace) == 0)						// if the user enters "exit " then
		{
			puts("[exiting turtle shell]");							// outputs message
			exit(0);												// exits with exit code 0
		}

		parse_args(line, str);										// parse's the user's input

		pid_t ParentOrChildIdentifier = fork();						// creates processor ID fork process
		if (ParentOrChildIdentifier > 0)							// if the processor ID is greater than zero
		{
			wait(NULL);												// calls the wait function and passes null
		}
		else if (execvp(str[0], str) == -1)							// child process
		{
			fprintf(stderr, "turtle: %s command not found.\n", line);
			exit(1);												// exits sucessfully with 1
		}
	}
}

/* Checks if a string contains only whitespace
* str - the string to check
* returns 1 if str contains whitespace, 0 otherwise
*/
int is_blank(const char *str)
{
	int i = 0;
	while (str[i] != '\0') {
		if (!isspace(str[i++]))
			return 0;
	}
	return 1;
}

/* Reads a line of text from the console
* line - an allocated array of characters of size MAX_LINE
* where the function can store all of the characters read.
*/
void read_line(char *line)
{
	char c;
	int chars_read = 0;
	while ((c = getchar()) != '\n' && chars_read < MAX_LINE)
		line[chars_read++] = c;
	line[chars_read] = '\0';
}

/* Breaks a command line into individual strings containing the
* command and all of its arguments
* cmd - a string containing the command line
* argv - an allocated array of strings of size MAX_ARGS where the
* command and its arguments will be stored.
*/
void parse_args(const char *cmd, char *argv[])
{
	int argc = 0;
	while (*cmd != '\0' && argc < MAX_ARGS) {
		int i = 0;
		while (!isspace(cmd[i]) && cmd[i] != '\0') i++;
		argv[argc] = (char *)malloc(i + 1);
		strncpy(argv[argc], cmd, i);
		while (isspace(cmd[i])) i++;
		cmd += i;
		argc++;
	}
	if (argc < MAX_ARGS)
		argv[argc] = NULL;
	else
		argv[MAX_ARGS - 1] = NULL;
}

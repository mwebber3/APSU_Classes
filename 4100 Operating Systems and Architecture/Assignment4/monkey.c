/*CSCI 4100 Assignment 4*/
/*Description: This program will copy a file like the cp command but without the options*/
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	char content[4096];
	FILE *firstFile, *secondFile; 

	/*If the arguments are not equal to three than an error appears and the program exits*/
	/*Else, it opens both of the files (one with read permissions the other with write)*/

	if (argc != 3) 
	{
		fputs("Usage: monkey source destination\n", stderr);
		exit(1);
	}
	else 
	{
		firstFile = fopen(argv[1], "r");
		secondFile = fopen(argv[2], "w");
		/*firstFile = open(argv[1], O_RDONLY);
		secondFile = open(argv[2], O_RDWR);*/
	}

	/*If either of the files are empty than an error is displayed*/
	/*Else, it copies the contents of the first file and places the content into the second file*/

	if (firstFile == NULL || secondFile == NULL)
	{
		fputs("No such file or directory.\n", stderr);
		exit(1);
	}
	else 
	{
		while(fgets(content, sizeof(content), firstFile) !=NULL)
		{
			fprintf(secondFile, "%s", content);
		}
	}

	/*Closes both of the files*/

	fclose(firstFile);
	fclose(secondFile);
}

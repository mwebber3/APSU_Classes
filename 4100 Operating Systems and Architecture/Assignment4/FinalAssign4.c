/*Author: MWebber*/
/*CSCI 4100 Assignment 4*/
/*Description: This program will copy a file like the cp command but without the options*/
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	char buffer[4096]; /*buffer which is set t0 4kb*/
	char *firstFile = (argv[1]); /*firstFile is set to first argument after monkey*/
	char *secondFile = (argv[2]); /*secondFile is set to second argument after monkey*/
	const int FourKB = 4096; /*creates integer constant set to 4kb*/

	ssize_t chars_read; /*declares chars_read*/
	ssize_t chars_written; /*declares chars_written*/

	int fd, fd2; /*declares integers fd and fd2*/


	fd = open(firstFile, O_RDONLY, 0644); /*opens first file as read only*/
	[fd2 = creat(secondFile, 0666); /*creates or rewrites to the second file (read write permissions)*/

	if (fd == -1 || argc != 3) /*if fd == -1 or there are less/more than 3 arguments*/
	{
		perror(argv[1]); /*error message is displayed*/
		exit(1); /*exits with exit code 1*/
	}
	while(chars_read != 0) /*while loop to continue copying the file if it is larger than 4kb*/
	{
		chars_read = read(fd, buffer, FourKB); /*reads from the first file*/
		chars_written = write(fd2, buffer, chars_read); /*writes to the second file*/
	}
}

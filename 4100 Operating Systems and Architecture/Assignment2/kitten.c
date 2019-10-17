#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	FILE *file;
	if (argc != 2)
	{
		printf("File Name: %s name.type\n");
	}
	else 
	{
		file = fopen(argv[1], "r");
	}
	if (file == NULL) 
	{
		printf("The file could not be found.\n");
	}
	else
	{
		int i;
		while ((i = fgetc(file)) != EOF)
		{
			printf("%c", i);
		}		
	fclose(file);
	}
}

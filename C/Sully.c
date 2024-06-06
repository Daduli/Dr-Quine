#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main()
{
	int i = 5;
	if (i)
	{
		if (!access("Sully_5.c", F_OK))
			i--;
		char name[10];
		snprintf(name, 10, "Sully_%d", i);
		char filename[100];
		strcpy(filename, name);
		strcat(filename, ".c");
		char * source = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c#include <unistd.h>%1$c%1$cint main()%1$c{%1$c	int i = %4$d;%1$c	if (i)%1$c	{%1$c		if (!access(%2$cSully_5.c%2$c, F_OK))%1$c			i--;%1$c		char name[10];%1$c		snprintf(name, 10, %2$cSully_%3$cd%2$c, i);%1$c		char filename[100];%1$c		strcpy(filename, name);%1$c		strcat(filename, %2$c.c%2$c);%1$c		char * source = %2$c%5$s%2$c;%1$c		void *fd = fopen(filename, %2$cw%2$c);%1$c		fprintf(fd, source, 10, 34, 37, i, source);%1$c		char cmd[500];%1$c		snprintf(cmd, 500, %2$cgcc %3$cs -o %3$cs && ./%3$cs%2$c, filename, name, name);%1$c		fclose(fd);%1$c		system(cmd);%1$c	}%1$c}";
		void *fd = fopen(filename, "w");
		fprintf(fd, source, 10, 34, 37, i, source);
		char cmd[500];
		snprintf(cmd, 500, "gcc %s -o %s && ./%s", filename, name, name);
		fclose(fd);
		system(cmd);
	}
}
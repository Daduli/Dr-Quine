#include <stdio.h>

/*
Function use to print the source code
*/
void	display()
{
	char *source = "#include <stdio.h>%1$c%1$c/*%1$cFunction use to print the source code%1$c*/%1$cvoid	display()%1$c{%1$c	char *source = %2$c%3$s%2$c;%1$c	printf(source, 10, 34, source);%1$c}%1$c%1$cint	main()%1$c{%1$c	/*%1$c	Display the source code%1$c	*/%1$c	display();%1$c}";
	printf(source, 10, 34, source);
}

int	main()
{
	/*
	Display the source code
	*/
	display();
}
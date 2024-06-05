#include <stdio.h>

#define FILE "Grace_kid.c"
#define DATA "#include <stdio.h>%1$c%1$c#define FILE %2$cGrace_kid.c%2$c%1$c#define DATA %2$c%3$s%2$c%1$c#define CODE(flag) int main() {fprintf(fopen(FILE, flag), DATA, 10, 34, DATA);}%1$c%1$cCODE(%2$cw%2$c)"
#define CODE(flag) int main() {fprintf(fopen(FILE, flag), DATA, 10, 34, DATA);}

CODE("w")
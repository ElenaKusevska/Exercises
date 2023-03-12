#include <stdio.h>
#include <stdlib.h>

//-------------------------
// reading from stdin:
//-------------------------

int main()
{

char str [20];
int i, c;

// using scanf:

printf("What's your name?");
scanf("%10s", str);
printf("how old are you?");
scanf("%d", &i);
printf("%10s, %d\n", str, i);

// using getchar:

printf("give me a number");

//  To clear the newline from the input buffer,
//  because scanf leaves a newline trailing
//  behind:

while ( getchar() != '\n') 
{ c=getchar(); }

c=getchar();
printf("you enterd:\n");
putchar(c);
printf("\n");

return 0;
}

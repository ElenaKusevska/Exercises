#include <stdio.h>

int main()
{
   int i;
   for (i=1; i < 11; i++)
   {
      printf ("%d", i);
      if (i < 5)
      {
         printf(" is less than 5\n");
      }
      else if (i > 5)
      {
         printf(" is greater than 5\n");
      }
      else
      {
         printf(" is equal to 5\n");
      }
   
   }
return 0;
}



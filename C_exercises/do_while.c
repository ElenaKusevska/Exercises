#include <stdio.h>

int main() {
  char yn;

  do {
    printf("Continue? ");
    scanf("%1s", &yn);
  }
  while(yn != 'n');

  printf("done\n");

  return 0;
}

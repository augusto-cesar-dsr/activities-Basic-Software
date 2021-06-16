#include <stdio.h>

#include "temp1.h"

#include "temp2.h"



int a = 0xAA11BB22;
// char a = 1; 



int main (void) {

  foo();

  printf("%d = 0x%.8X\n", a, a);

  return 0;

}
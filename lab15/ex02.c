#include <stdio.h>



int main()

{

  short i = 10;

  short j = 20;

  short k = 30;

  unsigned char r = 16;



  if (i < 20 || j < 30) // i < 20 || j >= 30

    r = r >> 1;

  if (j > 30 && k < 20) // j <= 30 && k >= 20

    r = r / 2;

  if ( (i > 20 && j > 30) || k > 20) // k > 20 || (i <= 20 andj <= 30)

    r = r + 100;



  printf("%u\n", r);   // Imprime como 'unsigned int'



  return 0;

}
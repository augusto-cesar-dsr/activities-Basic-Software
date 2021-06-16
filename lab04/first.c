#include <stdio.h>



int main(void) {

  unsigned int x = 0x87654321;

  unsigned int a, b;



  // Manter o byte menos significativo de x e os outros bits em '0'

  a = x & 0x000000ff;



  // O byte mais significativo com todos os bits em '1' e manter os outros bytes com o mesmo valor dos bytes de x

  //b = 0xFF000000 | x;
  //b = (0x00FFFFFF & x) | 0xFF000000;
  b = x | (~(0x00FFFFFF )); //por negação


  printf("a = 0x%08X\n", a);

  printf("b = 0x%08X\n", b);



  return 0;

}
#include <stdio.h>



unsigned int convertB2L(unsigned int x) {
  unsigned int valor = 0x000000FF;
  unsigned int t1, t2, t3, t4;
  
  t1 = valor & x;
  t1 = t1<<(8*3);
  t2 = (valor << 8) & x;
  t2 = t2 << 8;
  t3 = (valor << (8*3)) & x;
  t3 = t3 >> (8*3);
  t4 = (valor << (8*2)) & x;
  t4 = t4 >> 8;

  return t1 | t2 | t3 | t4;
}

/*unsigned int convertB2L(unsigned int x) {
    return  x >> 24 |
            (x  & 0x00ff0000) >> 8 |
            (x  & 0x0000ff00) << 8 |
            x << 24;

}*/

int main() {

  unsigned int b = 0x12AB34CD;

  unsigned int l = convertB2L(b);



  printf("b = 0x%08X\n", b);

  printf("l = 0x%08X\n", l);



  return 0;

}
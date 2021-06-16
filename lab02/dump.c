#include <stdio.h>



void dump(void *addr, int n) {

  unsigned char *p = addr;

  while (n--) {

    printf("%p - %02x\n", p, *p);

    p++;

  }

}
/*
int main() {

  char i = (char) 10000;

  dump(&i, sizeof(i));

  return 0;

}*/
int main() {

  char p[] = "7509";
  
  //printf("\n %d\n", strlen(p));
  
  dump(p, sizeof(p));

  return 0;

}
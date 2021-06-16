#include <ctype.h>

#include <stdio.h>


int string2num(char *s, int k) {

  int a = 0;

  for ( ; *s; s++)
    if (isdigit(*s)) a = a*k + (*s - '0');
    else if(*s > 96) a = a*k + (*s - 87);
    else a = a*k + (*s - 55);

  return a;

}



int main () {

  //printf("==> %d\n", string2num("1234"));

  //printf("==> %d\n", string2num("1234") + 1);

  //printf("==> %d\n", string2num("1234") + string2num("1"));
  
  printf("%d\n", string2num("777", 8));
  
  printf("%d\n", string2num("777", 10));

  printf("%d\n", string2num("1a", 16));

  printf("%d\n", string2num("a09b", 16));

  printf("%d\n", string2num("k09b", 36));

  return 0;

}
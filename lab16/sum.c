#include <stdio.h>



int sum(const char *prefix, int v1, short v2, int *s)

{

   int r;

   *s = v1 + v2;

   r = printf("%s: %d\n", prefix, *s);

   return r;

}
#include <stdio.h>



int a = 30;

int b = 45;



int main()

{

  if (a > b) // 30 > 45 :|─|: 30 <= 45

    printf("'a' é maior do que 'b'\n");            // utilize 'print_rax_as_string'

  if (b >= a) // 45 >= 30 :|─|: 45 < 30

    printf("'a' não é maior do que 'b'\n");        // utilize 'print_rax_as_string'

  return 0;

}
#include <stdio.h>



int nums[4] = {65, -105, 111, 34};



int main(){

    int i = 0;

    int s = 0;



    while (i < 4) // i >= 4

    s = s + nums[i++];         // tmp = i; i = i+1; s = s + num[tmp];



    printf ("soma = %d\n", s);

    return 0;

}
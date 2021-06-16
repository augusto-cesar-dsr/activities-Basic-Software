#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n){
    int cont;
    unsigned char temp=0x80;
    for(cont = 0; cont < n; cont++){
        temp = temp & x;
        x = x << 1;
        temp = temp >> 7;
        x = x |temp;
        temp = 0x80;
    }
    return x;
}

int main(void){
    unsigned char x = 0x61;
    printf("\n 0x%08X", rotate_left(x,1));
    printf("\n 0x%08X", rotate_left(x,2));
    printf("\n 0x%08X \n", rotate_left(x,7));
    return 0;
}
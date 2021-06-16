#include <stdio.h>



void toggle(int *value, int bit){

    *value = (*value^(0x00000001 << bit));

}



int main() {

    int value;



    value = 0x00000000;

    toggle(&value, 0);

    printf("0x00000001 == 0x%08X\n", value);



    value = 0xF0000000;

    toggle(&value, 31);

    printf("0x70000000 == 0x%08X\n", value);



    value = 0xF002000F;

    toggle(&value, 16);

    printf("0xF003000F == 0x%08X\n", value);



    return 0;

}
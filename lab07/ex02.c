#include <stdio.h>

#include <stdlib.h>



int xbyte(unsigned int word, int bytenum) {

    unsigned char byte;
    signed char b;
    int i;
    
    for (i = 0; i< bytenum; i++){
        word = word/256;
    }
    
    byte = (unsigned char) word;
    b = (signed char)byte;
    for (i = 0; i<8; i++){
        b = b/2;
    }

    b = (signed char)byte;
    
    if (b >= 0 ){
        return (0xFFFFFF00 + (unsigned int) byte);
    }

    b = (signed char)(byte*2);
    
    if (b >= 0 ){
        return (unsigned int) byte*256;
    }

    return ((unsigned int) byte *256*256)+ 0xFF00FFFF;
}



int main(int argc, char **argv) {

    int x;



    x = xbyte(0x01ABCD02, 0);

    printf ("0x%08X\n", x);    // 0xFFFFFF02 (caso 1)



    x = xbyte(0x01ABCD02, 1);

    printf ("0x%08X\n", x);    // 0xFFCDFFFF (caso 3)



    x = xbyte(0x01ABCD02, 2);

    printf ("0x%08X\n", x);    // 0x0000AB00 (caso 2)



    x = xbyte(0x11E032A5, 0);

    printf ("0x%08X\n", x);    // 0x0000A500 (caso 2)



    x = xbyte(0x11E032A5, 1);

    printf ("0x%08X\n", x);    // 0xFFFFFF32 (caso 1)



    x = xbyte(0x11E032A5, 2);

    printf ("0x%08X\n", x);    // 0xFFE0FFFF (caso 3)



    x = xbyte(0x11E032A5, 3);

    printf ("0x%08X\n", x);    // 0xFFFFFF11 (caso 1)



    x = xbyte(0xABCD, 3);

    printf ("0x%08X\n", x);    // 0xFFFFFF00 (caso 1)



    x = xbyte(0xABCD, 1);

    printf ("0x%08X\n", x);    // 0x0000AB00 (caso 2)



    return 0;

}
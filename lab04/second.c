#include <stdio.h>



int odd_ones(unsigned int x) {
    int cont, res;
    unsigned int m = 1; //, final = 0;
    //res = 0;
    /*for (cont = 1; cont < 32 ; cont++, m=m<<1){
        final = m & x;
        if(final != 0) res++;
    }*/
    for (cont = 0, res = 0; cont < 32 ; cont++, m = m << 1){
        if((m & x) != 0) res++;
    }
    return (res & 0x01);

}



int main() {

    unsigned int v;



    v = 0x01010101;

    printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");



    v = 0x01030101;

    printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");



    return 0;

}
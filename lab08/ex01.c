#include <stdio.h>

//#include <math.h>



#define getsig(i)        ((i)>>31 & 1)

#define getexp(i)        ((i)>>23 & 0xff)

#define getfrac(i)       ((i) & 0x7fffff)

#define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )



typedef union {

    float f;

    unsigned int i;

} U;



float float2(float f){
    U i;
    unsigned int sig, exp, frac;
    
    i.f = f;
    exp = getexp(i.i)+1;
    sig = getsig(i.i);
    frac = getfrac(i.i);
    i.i = (makefloat(sig,exp,frac));
    return i.f;
}

int main(void){
    float f=15213.0;
    printf("%f\n",float2(f));
}
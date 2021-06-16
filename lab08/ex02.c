
#include <stdio.h>

#include <math.h>



#define getsig(i)        ((i)>>31 & 1)

#define getexp(i)        ((i)>>23 & 0xff)

#define getfrac(i)       ((i) & 0x7fffff)

#define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )



typedef union {

    float f;

    unsigned int i;

} U;



float int2float(int i){
    U n;
    unsigned int sig, exp, frac;
    
    if (i == 0){
        sig = exp = frac = 0;
        n.i = makefloat(0,0,0);
        return n.f;
    }

    if(i<0){
        sig = 1;
        i = -i;
    }
    else sig = 0;
    
    exp = 1; 
    while(exp < 32){
        if(i>pow(2,exp)) exp++;
        else break;
    }
    exp = exp-1;
    frac = i ^ (1<<(exp));
    
    if(exp<=23) frac = frac << (23 - exp);
    else frac = frac >> (exp - 23);
    /*
    printf("\nsinal %u\n",sig);
    printf("expoente %u\n",exp);
    printf("mantissa %X\n\n",frac);
    */
    n.i = makefloat(sig,exp+127,frac);
    
    return n.f;

}



int main() {

    int i;



    printf("\n******** int2float ****************\n");



    //i = 15213;
    i=0;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    i = 1;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    i = -1;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    i = 0x7fffffff;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    i = -i;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    i = 12345;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    i = -12345;

    printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



    return 0;

}
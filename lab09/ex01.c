#include <stdio.h>

#include <math.h>

#include <limits.h>



#define getsig(x) ((x)>>31 & 1)

#define getexp(x) ((x)>>23 & 0xff)

#define getfrac(x) ((x) & 0x7fffff)

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))



typedef union {

    float f;

    unsigned int i;

} U;



int float2int(float f){
    U n;
    unsigned int sig, exp, fra;

    if (f > 0 && f < 1) return (int) 0;

    if(f<0){
        sig = 1;
        f = -f;
    }
    else sig = 0;

    n.f = f;
    exp = getexp(n.i)-127;
    if (exp <=23){
        fra = (getfrac(n.i)>>(23-exp));
        fra = fra+(1<<exp);
        if(sig == 1){
            fra = fra*-1;
            return (int) fra;
        }
        else return (int) fra;
    }
    else if (exp < 31){
        fra = (getfrac(n.i)<<(exp-23));
        fra = fra+(1<<exp);
        if(sig == 1 && exp < 31){
            fra = fra*-1;
            return (int) fra;
        }
        else return (int) fra;
    }
    else{
        if(sig == 1) return (int) INT_MIN;
        else return (int) INT_MAX;
    }
}



int main(){

    float f;

    printf("\n******** float2int ****************\n");

    f = 0.0;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = 1.0;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = -1.0;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = 12345.0;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = -12345.0;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = 1.5;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = 2.5;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = 2.4;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = 0.5;

    printf(" %+10.4f -> %d\n", f, float2int(f));

    f = (float)pow(2,31);

    printf(" %+10.4f (2^31) = overflow -> %d\n", f, float2int(f));

    f = -f;

    printf(" %+10.4f (-2^31) = overflow -> %d\n", f, float2int(f));

    f = (float)pow(2,32);

    f = -f;

    printf(" %+10.4f (-2^32) = overflow -> %d\n", f, float2int(f));

    return 0;

}
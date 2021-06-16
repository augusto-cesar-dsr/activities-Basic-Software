#include <stdio.h>

#define getsig(x) ((x)>>63 & 1)

#define getexp(x) ((x)>>52 & 0x03ff)

#define getfrac(x) ((x) & 0x0fffffffffffff)

#define makefloat(s,e,f) ((s & 1)<<63 | (((e) & 0x03ff) << 52) | ((f) & 0x0fffffffffffff))



typedef union {

    double d;

    unsigned long i;

} U;


double maxdouble(double a, double b){
    U n1, n2;
    unsigned long sig1, exp1, fra1;
    unsigned long sig2, exp2, fra2;
    n1.d = a;
    sig1 = getsig(n1.i);
    n2.d = b;
    sig2 = getsig(n2.i);
    
    if(sig1==sig2){
        if(sig1 == 1 && sig2 ==1){
            n1.d = -a;
            n2.d = -b;
            exp1 = getexp(n1.i)-1023;
            exp2 = getexp(n2.i)-1023;
            fra1 = getfrac(n1.i);
            fra2 = getfrac(n2.i);

            if(fra1<=fra2){
                if(exp1 <= exp2) return a;
                else return b;
            }
            else return a;
        }
        else{
            exp1 = getexp(n1.i)-1023;
            exp2 = getexp(n2.i)-1023;
            fra1 = getfrac(n1.i);
            fra2 = getfrac(n2.i);
            if(fra1 <= fra2){
                if(exp1 <= exp2) return b;
                else return a;
            }
            else return b;
        }
    }
    else if(sig1==0 && sig2 ==1) return a;
    else return b;    

}



int main(){

    double a,b;



    a = 1.0;

    b = 2.0;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    a = -1.0;

    b = -2.0;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    a = 1.0;

    b = -2.0;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    a = 1.5;

    b = 1.75;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    a = -1.5;

    b = -1.75;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    a = -1.5;

    b = -2.5;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    a = 1.5;

    b = -1.75;

    printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



    return 0;

}
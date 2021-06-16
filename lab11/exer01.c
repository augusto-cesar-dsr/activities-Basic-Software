#include <stdio.h>


/*
struct S {

  long  a;

  char  b;  

  int   c;

  short d;

};*/
struct S {

    char  c[3];

    int   a;

    union {

        char x[9];

        long y;

    } d;

    short b;

};


void offsets(struct S *ptr) {

    //void *a, *b, *c, *d;
    unsigned long a, b, c, d, ptr1;
    
    //a = ptr;
    //b = ptr - sizeof(*a);
    //c = ptr - (sizeof(*a)+sizeof(*b));
    //d = ptr - (sizeof(*a)+sizeof(*b)+sizeof(*c));
    
    ptr1 = (unsigned long) ptr;
    a = (unsigned long) &ptr->a;
    b = (unsigned long) &ptr->b;
    c = (unsigned long) &ptr->c;
    d = (unsigned long) &ptr->d;
    
    //printf("a -> %p\nb -> %p\nc -> %p\nd -> %p\n", a, b, c, d);
    printf("a = %lu\nb = %lu\nc = %lu\nd = %lu\n",(a-ptr1), (b-ptr1), (c-ptr1), (d-ptr1));
}



//----------------------------------------------

// Cria a variável varS

struct S varS;



int main() {

  offsets(&varS);

  return 0;

}
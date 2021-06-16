# Laboratório - 19 _ 07 de Maio de 2021

1 ─ Traduza apenas o arquivo "main01.c" para Assembly (arquivo “main01.S”) o mais literal possível. 

Obs: Comente o seu código!

### main01.c

    #include <stdio.h>



    #define BLUE 1

    #define RED  2



    struct Circle {

        int  x;

        int  y;

        char filled;

        long color;

    };



    struct Circle c1;



    int main() {

        c1.x = 10;

        c1.y = 2 * c1.x;

        c1.filled = 1;

        if (c1.y > 30)

            c1.color = RED;

        else

            c1.color = BLUE;

        printf("color: %ld, filled: %d\n", c1.color, (int)c1.filled);

        return 0;

    }

Compile e teste o seu programa:

    gcc -no-pie -o main01 main01.c

2 ─ Traduza apenas o arquivo "data.c" para Assembly (arquivo “data.S”) o mais literal possível. 

Obs: Comente o seu código!

### data.h

    #ifndef DATA_H

    #define DATA_H



    struct data {

        int len;

        long elems[5];

    };



    #endif

### data.c

    #include <stdio.h>        // não traduzir para Assembly

    #include "data.h"         // não traduzir para Assembly



    void show(struct data *d) {

        int i;

        long *ptr = d->elems;

        for (i = 0; i < d->len; i++) {

            printf("%ld\n", ptr[i]);

        }

    }

### main02.c

    #include <stdio.h>

    #include "data.h"



    struct data d1 = {3, {1, 2, 3, 0, 0} };

    struct data d2 = {5, {10, 20, 30, 40, 50} };



    void show(struct data *d);



    int main() {

        show(&d1);

        printf("---\n");

        show(&d2);

        return 0;

    }

Compile e teste o seu programa:

    gcc -no-pie -o main02 main02.c data.S
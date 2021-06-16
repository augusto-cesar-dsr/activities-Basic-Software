# Laboratório - 22 _ 18 de Maio de 2021

1 ─ Traduza apenas o arquivo "main.c" para Assembly (arquivo “main.S”) o mais literal possível. 

Obs: Comente o seu código! PRINCIPALMENTE A PILHA COM AS VARIÁVEIS LOCAIS.

### main.c

    #include <stdio.h>



    #include "process.h"



    long sum(node_t *node, int size){

        int i, j;

        void *h = new_sum();

        for (i = 0; i < size; i++) {

            for (j = 0; j < node[i].used; j++)

            add_sum(h, node[i].values[j]);

        }

        return get_sum(h);

    }



    int main(){

        node_t nodes[2];

        init(nodes);

        printf("sum = %ld\n", sum(nodes, 2));

        return 0;

    }

### process.h

    #ifndef PROCESS_H

    #define PROCESS_H



    struct node_s {

        int  size;

        long values[5];

        int  used;

    };



    typedef struct node_s node_t;



    void init(node_t *node);

    void* new_sum();

    void add_sum(void *handler, long val);

    long get_sum(void *handler);



    #endif

### process.c

    #include <stdlib.h>

    #include <string.h>



    #include "process.h"



    void* new_sum() {

        long *ptr = (long*)malloc(sizeof(long));

        *ptr = 0;

        return ptr;

    }



    void add_sum(void *handler, long val) {

        long *ptr = (long*)handler;

        *ptr = *ptr + val;

        handler = NULL;

    }



    long get_sum(void *handler) {

        long s = *((long*)handler);

        free(handler);

        handler = NULL;

        return s;

    }



    void init(node_t *node)

    {

        node_t tmp[2] = {

            {5, {1,2,3,1,1}, 3},

            {5, {4,5,6,7,1}, 4}

        };



        memcpy(node, tmp, 2 * sizeof(node_t));

    }

Compile o seu programa utilizando a linha:

    gcc -no-pie -o process main.S process.c
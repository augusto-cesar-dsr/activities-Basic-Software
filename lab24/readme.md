# Laboratório - 24 _ 25 de Maio de 2021

1 ─ Traduza apenas o arquivo "sum.c" para Assembly (arquivo “sum.S”) o mais literal possível. 

Atenção: na função printf(), a formatação "%f" pede um argumento do tipo double. Além disso, lembre-se de que "%eax" deve conter a quantidade de argumentos do tipo ponto flutuante.

Obs: Comente o seu código!

### sum.c

    #include <stdio.h>



    void mult(int a[], double b[], int size);



    double sum(double limit){

      int i = 4;

      double s = 0.0;

      int vi[4] = {5,6,7,8};

      double vd[4];



      mult(vi, vd, i);



      while (i > 0) {

        s += vd[--i];

        if (s > limit)

          printf("Soma %f maior que o limite %f\n", s, limit);

      }

      return s;

    }

### main1.c

    #include <stdio.h>



    double sum(double limit);



    void mult(int a[], double b[], int size){

      for (int i = 0; i < size; i++)

        b[i] = a[i] * 2.0;

    }



    int main(){

      sum(10.0);

      return 0;

    }

Compile o programa usando o comando abaixo.

    gcc -no-pie -o sum main1.c sum.S

2 ─ Traduza apenas o arquivo "max.c" para Assembly (arquivo “max.S”) o mais literal possível. 

A assinatura da função floor() é a seguinte:

    double floor(double x);

Obs: Comente o seu código!

### max.c

    #include <stdio.h>

    #include <math.h>



    #include "prod.h"



    double max_prod(produto_t *ptr){

      double m = 0.0;

      while (ptr->id) {

        double tmp = floor(ptr->value);

        if (m < tmp)

          m = tmp;

        ptr++;

      }

      return m;

    }

### prod.h

    #ifndef PROD_H

    #define PROD_H



    struct produto_s {

    int id;

    double value;

    };



    typedef struct produto_s produto_t;



    #endif

### main2.c

    #include <stdio.h>

    #include <math.h>



    #include "prod.h"



    produto_t prods[] = {

      {1, 20.5},

      {2, 23.3},

      {3, 13.8},

      {0,  0.0}

    };

    double max_prod(produto_t *ptr);



    int main(){

      double m = max_prod(prods);

      printf("Maximo: %f\n", m);

      return 0;

    }

Compile o programa usando o comando abaixo.

    gcc -no-pie -o max main2.c max.S  -lm
# Laboratório - 21 _ 14 de Maio de 2021

1 ─ Traduza apenas o arquivo "main01.c" para Assembly (arquivo “main01.S”) o mais literal possível. 

Atenção: a variável "s" deve ser obrigatoriamente alocada em um registrador.

Obs: Comente o seu código!

### main01.c

    #include <stdio.h>



    char constante();

    void init(short factor, long *pl, int *pi);



    int main() {

        short s;     // Deve ser registrador

        int i;

        long l;



        s = constante();

        init(s, &l, &i);



        printf("Soma: %ld\n", l + i + s);



        return 0;

    }

### aux01.c

    char constante() { return 0xFF; }



    void init(short factor, long *pl, int *pi){

        *pl = factor*10;

        *pi = factor*20;

    }

Compile o seu código:

    gcc -no-pie -o main01 main01.S aux01.c

2 ─ Traduza apenas o arquivo "calc02.c" para Assembly (arquivo “calc02.S”) o mais literal possível. 

Atenção: as variáveis "i" e "j" devem ser obrigatoriamente alocadas em registradores.

Obs: Comente o seu código!

### calc02.c

    void filli(int *v, int cols, int k);

    void fills(short *v, int cols, int k);



    int calc(){

        int i = 0;       // deve ser registrador

        int j = 4;       // deve ser registrador

        int sum;

        int vet1[5];

        short vet2[5];



        filli(vet1, 5, i);

        fills(vet2, 5, j);



        sum = 0;

        for ( ; i < 5; i++, j--) {

            sum += vet1[i] + vet2[j];

        }



        return sum;

    }

### main02.c

    #include <stdio.h>



    int calc();



    void filli(int *v, int cols, int k){

        int i;

        (void)k;

        for (i = 0; i < cols; i++) {

            v[i] = 1;

        }

    }



    void fills(short *v, int cols, int k){

        int i;

        (void)k;

        for (i = 0; i < cols; i++) {

            v[i] = 2;

        }

    }



    int main(){

        printf("%d\n", calc());

        return 0;

    }

Compile o seu programa:

    gcc -no-pie -o main02 main02.c calc02.S
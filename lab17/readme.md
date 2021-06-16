# Laboratório - 17 _ 30 de Abril de 2021

1 ─ Traduza apenas o arquivo "show.c" para Assembly (arquivo “show.S”) o mais literal possível. 

Lembre-se que a função printf() poderá alterar os registradores caller-saved.

Dica: use registradores callee-saved para 'i', 'vet' e 'size'; ou salve os registradores caller-saved antes de chamar printf().

Obs: Comente o seu código!

show.c

    #include <stdio.h>



    void show(int *vet, int size) {

        int i;

        for (i = 0; i < size; i++)

            printf("%d\n", vet[i]);

    }

### main01.c

    void show(int *vet, int size);



    int vet[7] = {1,2,3,0,4,5,0};



    int main() {

        show(vet, 7);

        return 0;

    }

Compile o seu programa usando:

   gcc -no-pie -o show main01.c show.S

2 ─ Traduza apenas o arquivo "process.c" para Assembly (arquivo "process.S") o mais literal possível.

Obs: Comente o seu código!

### process.c

    int calc(int i, int j, int k, int l, int m, int n);



    int process(int a, int b, int c, int d, int e, int f) {

        int r = calc(f, e, d, c, b, a);

        return r + a + b + c + d + e + f;

    }

### main02.c

    #include <stdio.h>



    int process(int a, int b, int c, int d, int e, int f);



    int calc(int i, int j, int k, int l, int m, int n) {

        printf("calc: %d, %d, %d, %d, %d, %d\n", i, j, k, l, m, n);

        return 0;

    }



    int main() {

    int r = process(1, 2, 3, 4, 5, 6);

    printf("main: %d\n", r);

    return 0;

    }

Compile o seu programa usando:

   gcc -no-pie -o process main02.c process.S
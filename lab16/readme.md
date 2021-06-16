# Laboratório - 16 _ 27 de Abril de 2021

1 ─ Considere o programa a seguir, composto pelos arquivos “main.c” e “sum.c”.

### main.c

    #include <stdio.h>



    int sum(const char *prefix, int v1, short v2, int *sum);



    int val = 432;

    short age = 4;

    int r = 0;

    int err = 0;



    int main()

    {

        err = sum("Hello", val, age, &r);

        printf("[INFO] %d\n", err);

        return 0;

    }

### sum.c

    #include <stdio.h>



    int sum(const char *prefix, int v1, short v2, int *sum)

    {

        int r;

        *sum = v1 + v2;

        r = printf("%s: %d\n", prefix, *sum);

        return r;

    }

Traduza apenas o arquivo "main.c" para Assembly (arquivo “main.S”) o mais literal possível.  Comente o seu código!

Teste o seu programa, comparando a saída com a versão C.

Utilize o template abaixo para construir o seu código (note que "return 0" não está traduzido).

    .section .rodata



    .data



    .text

    .globl main

    main:

        pushq %rbp

        movq  %rsp, %rbp



        # Seu código aqui...



        # return 0

        leave

        ret

2 ─ Considere o programa a seguir, composto pelos arquivos “main.c” e “filtro.c”

### main.c

    #include <stdio.h>



    #define LEN 4

    #define LIM 10



    int filtro(unsigned char x, short lim);



    int i = 0;

    unsigned char vet[LEN] = {12,3,20,8};



    int main() {

        for ( ; i < LEN; i++) {

            printf("%d\n", filtro(vet[i], LIM));

        }

        return 0;

    }

### filtro.c

    int filtro(unsigned char x, short lim) {

        int r;

        unsigned short a = (unsigned short)x;

        unsigned short b = (unsigned short)lim;

        if (a < b)

            r = 0;

        else

            r = (int)lim;

        return r;

    }

Traduza apenas o arquivo "main.c" para Assembly (arquivo “main.S”) o mais literal possível.  Comente o seu código!

Use o template do exercício (1).

Importante: a função printf() pode sobrescrever os valores de alguns registradores, ou seja, não confiem que depois do printf() os registradores manterão os valores que você colocou antes de chamar a função. (veremos isso nas próximas aulas)

## Exercício Extra
3 ─ Traduza o programa “filtro.c” para Assembly (arquivo “filtro.s”) o mais literal possível. Comente o seu código!

Use o template do exercício (1). Lembre de trocar o nome da função de "main" para "filtro".

Teste o seu programa, comparando a saída com a versão C.
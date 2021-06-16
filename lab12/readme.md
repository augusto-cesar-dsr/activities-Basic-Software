# Laboratório - 12 _ 09 de Abril de 2021

1 - Sejam os dois arquivos em C abaixo:

## main.c

    #include <stdio.h>



    // Indica que as variáveis existem e são definidas em outro lugar

    extern char c;

    extern int i;

    extern unsigned int ui;

    extern long l;

    extern unsigned long ul;

    extern int v[5];

    extern unsigned short us;



    void aux();



    int main(){

        aux();

        printf("c  = %d\n", c);

        printf("us = %u\n", us);

        printf("i  = %d\n", i);

        printf("ui = %u\n", ui);

        printf("l  = %ld\n", l);

        printf("lu = %lu\n", ul);

        printf("v  = {%d, %d, %d, %d, %d}\n", v[0], v[1], v[2], v[3], v[4]);

        return 0;

    }

## aux.c

    // Cria e inicializa as variáveis

    char c = -20;

    int i = -256;

    unsigned int ui = 1024;

    long l = 128;

    unsigned long ul = 2048;

    int v[5] = {10,20,30,40,50};

    unsigned short us = 111;



    void aux(){

        long *ptr;

        i = c;

        ui = i;

        ul = ui;

        us = ul;

        c  = 10 + i - 5;

        i = v[2];

        v[4] = v[3] * c;

        ptr = &l;

        *ptr = 128;

    }

Compile e teste o programa:

    gcc -no-pie -o main main.c aux.c

Agora, traduza o arquivo “aux.c” para Assemly (arquivo “aux.S”) utilizando o template abaixo. A tradução deve ser o mais literal possível, seguindo as regras dadas nas aulas, ou seja, não é para ficar interpretando e otimizando o código.

## aux.S

    .data





    .text



    .globl aux

    aux:

        pushq %rbp

        movq  %rsp, %rbp



        # Se necessário, usar apenas os registradores:

        # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10



        # Seu código aqui...



        leave

        ret

Compile e teste o programa:

    gcc -no-pie -o main-asm main.c aux.S

- Dica: 

1. Comece traduzindo todas as variáveis de aux() de C para o arquivo Assembly

2. Comente todos as linhas da função aux() de C

3. Descomente uma linha de aux() de C e traduza essa linha para Assembly

4. Compile o código somente C (main) e depois compile o outro usando o Assembly (main-asm)

5. Rode os dois programas e veja se os resultados são os mesmos
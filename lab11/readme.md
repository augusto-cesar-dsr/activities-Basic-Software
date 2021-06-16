# Laboratório - 11 _ 06 de Abril de 2021

1 - O termo "offset" do campo é usado para dizer qual é o deslocamento em bytes do campo em relação ao início da estrutura. Por exemplo, na estrutura abaixo, o offset de “m” é 0 (zero), o offset de “n” é 4 e o offset “p”  é 8 bytes do início da estrutura:

    struct X {

        int  m;      // +0 bytes do início

        int  n;      // +4 bytes do início

        long p;      // +8 bytes do início

    };

No código C abaixo, assuma que a "struct S" sempre possui quatro campos com os nomes "a", "b", "c" e "d" (mas que podem ter tipos diferentes).

Dessa forma,  implemente a função offsets(), que dado o ponteiro para o início de uma “struct S”, ela calcula e exibe o offset dos campos "a'", "b", "c" e "d".

Obs: A função deve funcionar sem alteração para qualquer definição da "struct S", desde que a estrutura tenha os quatro campos citados, mesmo que os campos estejam em qualquer ordem.

    #include <stdio.h>



    // struct S {

        //   campo a;

        //   campo b;

        //   campo c;

        //   campo d;

    // };



    void offsets(struct S *ptr) {

        // calcular e exibir os offsets

    }



    //----------------------------------------------

    // Cria a variável varS

    struct S varS;



    int main() {

        offsets(&varS);

        return 0;

    }

Para testar o seu código, use as duas definições da "struct S" abaixo. Faça as contas "na mão" para verificar que a função implementada está correta.

    Exemplo A

    struct S {

        long  a;

        char  b;  

        int   c;

        short d;

    };



    Exemplo B

    struct S {

        char  c[3];

        int   a;

        union {

            char x[9];

            long y;

        } d;

        short b;

    };

2 - Analise o programa abaixo, sem executá-lo. Crie um arquivo "exec-02.txt" e descreva o que será impresso na tela e explique por quê?

Depois, execute o programa e compare a saída da execução do programa com a sua resposta.

Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-02.txt" com a razão da divergência de resultados.

Obs: se necessário, use a função dump() para entender o que está acontecendo.

    #include <stdio.h>



    struct X {

        int   a;

        short b;

        int   c;

    };



    // Cria a variável x e inicializa os campos da estrutura

    struct X x = {

        .a = 2048,

        .b = 17,

        .c = 0xBebaCafe

    };



    int main() {

        char  *pChar;

        short *pShort;



        printf("x.a = %d\n", x.a);

        printf("x.b = %d\n", x.b);

        printf("x.c = %x\n", x.c);



        printf("---\n");



        pChar  = (char*)&x;

        pChar  = pChar + 4;

        *pChar = *pChar | 0x20;



        printf("x.a = %d\n", x.a);

        printf("x.b = %d\n", x.b);

        printf("x.c = %x\n", x.c);



        printf("---\n");



        pShort = (short*)&x;

        pShort[3] = 0xFFFF;



        printf("x.a = %d\n", x.a);

        printf("x.b = %d\n", x.b);

        printf("x.c = %x\n", x.c);



        return 0;

    }
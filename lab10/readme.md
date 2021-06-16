# Laboratório - 10 _ 30 de Março de 2021

1 - Analise o programa abaixo, sem executá-lo. Crie um arquivo "exec-01.txt" e descreva o que será impresso na tela e explique por quê?

Depois, assumindo que o endereço da variável "a" é 0x100, da variável "b" é 0x200, execute o programa e compare a saída da execução do programa com a sua resposta.

Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-01.txt" com a razão da divergência de resultados.

    #include <stdio.h>



    void dump(void *p, int n) {

        unsigned char *p1 = p;

        while (n--) {

            printf("%p - 0x%02X\n", p1, *p1);

            p1++;

        }

    }



    int a[2] = {0xA1A2A3A4, 0xB1B2B3B4};

    short b[2][3] = {

                    {0xA1A2, 0xB1B2, 0xC1C2},

                    {0xD1D2, 0xE1E2, 0xF1F2}

                    };



    int main() {

        printf("size(a): %lu\n", sizeof(a));

        printf("size(b): %lu\n", sizeof(b));



        printf("---\n");



        printf("a: \n");

        dump(a, sizeof(a));



        printf("---\n");



        printf("b: \n");

        dump(b, sizeof(b));



        return 0;

    }

2 - Analise o programa abaixo, sem executá-lo. Crie um arquivo "exec-02.txt" e descreva o que será impresso na tela e explique por quê?

Para começar, calcule “na mão” o tamanho, as posições (offsets) de cada campo e o alinhamento da estrutura abaixo (salve no arquivo "exec-2.txt").

Depois, assumindo que o endereço da variável "varx" é 0x100, execute o programa e compare a saída da execução do programa com a sua resposta.

Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-02.txt" com a razão da divergência de resultados.

    #include <stdio.h>



    struct X {

        int   a;

        short b;

        int   c;

    };



    //       campos: a           b       c

    struct X varx = {0xA1A2A3A4, 0xB1B2, 0xC1C2C3C4};



    void dump(void *p, int n) {

        unsigned char *p1 = p;

        while (n--) {

            printf("%p - 0x%02X\n", p1, *p1);

            p1++;

        }

    }



    int main() {

        dump(&varx, sizeof(varx));

        return 0;

    }

3 - Analise o programa abaixo, sem executá-lo. Crie um arquivo "exec-03.txt" e descreva o que será impresso na tela e explique por quê?

Para começar, calcule “na mão” o tamanho, as posições (offsets) de cada campo e o alinhamento da união abaixo (salve no arquivo "exec-3.txt").

Depois, assumindo que o endereço da variável "vary" é 0x100, execute o programa e compare a saída da execução do programa com a sua resposta.

Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-03.txt" com a razão da divergência de resultados.

    #include <stdio.h>



    union Y {

        int   a;

        short b;

        char  c;

    };



    union Y vary;



    void dump(void *p, int n) {

        unsigned char *p1 = p;

        while (n--) {

            printf("%p - 0x%02X\n", p1, *p1);

            p1++;

        }

    }



    int main() {

        vary.a = 0xA1A2A3A4;

        printf("vary.a: \n");

        dump(&vary, sizeof(vary));

        printf("---\n");



        vary.b = 0xA1A2;

        printf("vary.b: \n");

        dump(&vary, sizeof(vary));



        printf("---\n");



        vary.c = 0xC1;

        printf("vary.c: \n");

        dump(&vary, sizeof(vary));



        return 0;

    }
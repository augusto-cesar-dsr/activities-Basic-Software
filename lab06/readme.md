# Laboratório - 06 _ 16 de Março de 2021

1 - Analise o programa abaixo, sem executá-lo. Crie um arquivo "exec-01.txt" e descreva o que será impresso na tela e explique por quê?

Agora, execute o programa e compare a saída da execução do programa com a sua resposta. Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-01.txt" com a razão da divergência de resultados.

    #include <stdio.h>



    char process(char x) {

        return ~x + 1;

    }



    int main(void) {

        printf("%d\n", process(1));

        printf("%d\n", process(-5));

        printf("%d\n", process(35));

        printf("%d\n", process(-42));

        printf("%d\n", process(127));

        printf("%d\n", process(-128));

        return 0;

    }

2 - Analise o programa abaixo, sem executá-lo. Crie um arquivo "exec-02.txt" e descreva o que será impresso na tela e explique por quê?

Obs: Assuma que o endereço da variável "s" é 0x100, da variável "i" é 0x200 e da variável "c" é 0x300.

Agora, execute o programa e compare a saída da execução do programa com a sua resposta. Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-02.txt" com a razão da divergência de resultados.

    #include <stdio.h>



    void dump(void *p, int n) {

        unsigned char *p1 = p;

        while (n--) {

            printf("%p - 0x%02X\n", p1, *p1);

            p1++;

        }

    }



    int main(void) {

        short s = -3;

        int i = -151;

        char c = 150;



        printf("dump de s: %d\n", s);

        dump(&s, sizeof(s));



        printf("\ndump de i: %d\n", i);

        dump(&i, sizeof(i));



        printf("\ndump de c: %d\n", c);

        dump(&c, sizeof(c));



        return 0;

    }

3 - Analise os três programas abaixo, sem executá-los. Crie um arquivo "exec-03.txt" e descreva o que será impresso na tela e explique por quê?

Agora, execute os programas e compare a saída da execução do programa com a sua resposta. Caso o seu resultado seja diferente da execução do programa, adicione uma explicação ao arquivo "exec-03.txt" com a razão da divergência de resultados.

-- prog-01.c

    #include <stdio.h>



    int main (void) {

        unsigned int x = 0xffffffff;

        unsigned int y = 2;

        printf("x = %d, y = %d\n", x, y);

        printf("x é menor do que y? %s\n", (x<y) ? "sim" : "não");

        return 0;

    }



-- prog-02.c

    #include <stdio.h>



    int main (void) {

        int x = 0xffffffff;

        int y = 2;

        printf("x = %d, y = %d\n", x, y);

        printf("x é menor do que y? %s\n", (x<y) ? "sim" : "não");

        return 0;

    }



-- prog-03.c

    #include <stdio.h>



    int main (void) {

        int x = 0xffffffff;

        unsigned int y = 2;

        printf("x = %d, y = %d\n", x, y);

        printf("x é menor do que y? %s\n", (x<y) ? "sim" : "não");

        return 0;

    }
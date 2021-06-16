# Laboratório - 07 _ 19 de Março de 2021

1 - Em C, o programador pode atribuir um signed char, que ocupa 8 bits, a um unsigned int, que ocupa 32 bits, como no trecho abaixo:

    #include <stdio.h>



    int main() {

        signed char sc = -1;

        unsigned int ui = sc;

        printf("0x%08X\n", ui);

        return 0;

    }

Um estudante argumentou que sem um regra rígida, alguém pode implementar um compilador C onde os dois valores para "ui" abaixo seriam válidos:

0x000000FF

0xFFFFFFFF

Crie um arquivo "exec-01.txt" e explique por que seria possível interpretar os dois valores que o estudante citou para "ui" como sendo válidos?

Depois de responder a pergunta anterior, execute o programa C, veja o valor impresso de "ui" e  verifique qual regra é seguida em C.

──────────────────────────────────────────────────────────────────────────

2 - Imagine que, para economizar espaço de armazenamento, utilizarmos uma estrutura de dados que “empacota” quatro valores inteiros com sinal de 1 byte cada, em um inteiro unsigned de 32 bits. Os bytes dentro desse inteiro são numerados, da direita para a esquerda conforme mostrado a seguir:


Sua tarefa é implementar uma função com o protótipo abaixo: 

    int xbyte(unsigned int word, int bytenum);

A função deve inicialmente extrair de word o número “empacotado” indicado por bytenum  (0, 1,  2 ou 3).

A resposta deve ser feita baseada nesse número "empacotado" seguindo as regras abaixo:

Caso 1: se o bit do sinal desse número extraído for '0' (por exemplo, 0bbb bbbb), a função deve retornar o byte extraído na posição Byte 0, como na posição da figura (byte de menor potência), do int de resposta e os demais bytes da resposta devem ser todos com bits '1'.

Caso 2: se o bit de sinal desse número extraído for '1' e o bit à direita do bit do sinal for '0' (por exemplo, 10bb bbbb), o byte extraído deve ser retornado na posição Byte 1  e os demais bits da resposta (Bytes 0, 2 e 3) devem ser todos '0'.

Caso 3: se o bit de sinal desse número extraído for '1' e o bit à direita do bit do sinal for '1' (por exemplo, 11bb bbbb), o byte extraído deve ser retornado na posição Byte 2  e os demais bits da resposta (Bytes 0, 1 e 3) devem ser todos '1'.

No entanto, há uma restrição para a implementação da função:

Não é permitido o uso de operações de manipulação de bits.

Use o template abaixo para implementar e testar a função:

    #include <stdio.h>

    #include <stdlib.h>



    int xbyte(unsigned int word, int bytenum) {

        // Seu código aqui.

    }



    int main(int argc, char **argv) {

        int x;

        if (argc != 3) {

            printf ("Uso: %s <hexadecimal> <bytenum>\n", argv[0]);

            exit(1);

        }



        x = xbyte(0x01ABCD02, 0);

        printf ("0x%08X\n", x);    // 0xFFFFFF02 (caso 1)



        x = xbyte(0x01ABCD02, 1);

        printf ("0x%08X\n", x);    // 0xFFCDFFFF (caso 3)



        x = xbyte(0x01ABCD02, 2);

        printf ("0x%08X\n", x);    // 0x0000AB00 (caso 2)



        x = xbyte(0x11E032A5, 0);

        printf ("0x%08X\n", x);    // 0x0000A500 (caso 2)



        x = xbyte(0x11E032A5, 1);

        printf ("0x%08X\n", x);    // 0xFFFFFF32 (caso 1)



        x = xbyte(0x11E032A5, 2);

        printf ("0x%08X\n", x);    // 0xFFE0FFFF (caso 3)



        x = xbyte(0x11E032A5, 3);

        printf ("0x%08X\n", x);    // 0xFFFFFF11 (caso 1)



        x = xbyte(0xABCD, 3);

        printf ("0x%08X\n", x);    // 0xFFFFFF00 (caso 1)



        x = xbyte(ABCD, 1);

        printf ("0x%08X\n", x);    // 0x0000AB00 (caso 2)



        return 0;

    }
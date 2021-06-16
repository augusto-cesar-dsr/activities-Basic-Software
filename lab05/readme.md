# Laboratório - 05 _ 12 de Março de 2021

1 - Algoritmos de criptografia usam tipicamente diversas operações de manipulação de bits. Algumas dessas operações não são oferecidas diretamente por C, mas podem ser implementadas a partir de suas operações básicas de manipulação de bits (and, or, shift).

Implemente agora a operação rotate_left(), também chamada de "circular left shift":

  unsigned char rotate_left(unsigned char x, int n);

Essa função é similar a um "left shift" (<<), pois desloca seu operando "n" bits para a esquerda. Porém, em vez de preencher as posições livres à direita com zeros, ela as preenche com os "n" bits removidos pelo deslocamento à esquerda.


Considere, por exemplo, o valor 0x61 (0110 0001):

O “rotate left” de 1 bit resulta no valor 0xc2 (1100 0010)

O “rotate left” de 2 bits resulta no valor 0x85 (1000 0101)

O “rotate left” de 7 bits resulta no valor 0xb0 (1011 0000) 

Implemente uma função main() para testar a função rotate_left(). Experimentando alguns valores diferentes para o deslocamento.

Obs: o valor do deslocamento será sempre um valor inteiro no intervalo 0 <= n < 8.

2 - Escreva a função toggle() que alterna um bit informado. A função tem a seguinte assinatura:

void toggle(int *value, int bit);

O parâmetro "bit" pode ser um valor entre 0 e 31, e indica qual bit da variável "value" deve ser alternado, ou seja, se o bit indicado for '0', ele deve ser mudado para '1', se for '1' deve ser mudado para '0'. Os demais bits da variável "value" devem permanecer inalterados.

Os bits de “value” são numerados da seguinte forma:


Use o programa abaixo como template e teste:

    #include <stdio.h>



    void toggle(int *value, int bit)

    {

        // seu código aqui...

    }



    int main() {

        int value;



        value = 0x00000000;

        toggle(&value, 0);

        printf("0x00000001 == 0x%08X\n", value);



        value = 0xF0000000;

        toggle(&value, 31);

        printf("0x70000000 == 0x%08X\n", value);



        value = 0xF002000F;

        toggle(&value, 16);

        printf("0xF003000F == 0x%08X\n", value);



        return 0;

    }
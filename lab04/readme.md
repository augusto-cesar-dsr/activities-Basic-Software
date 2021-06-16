# Laboratório - 04 _ 09 de Março de 2021

1 - Considere uma variável em C, de nome "x", do tipo "unsigned int". Escreva expressões utilizando operações de manipulação de bits que obtenham os seguintes valores:

a) Um valor de 32 bits com o byte menos significativo igual ao byte correspondente de "x" e todos os outros bits iguais a 0.

b) Um valor de 32 bits com o byte mais significativo com todos os bits iguais a '1' e os outros bytes com o mesmo valor dos bytes correspondentes de "x".

Como exemplo:

Se x = 0x87654321, então o resultado da expressão (a) deve ser 0x00000021 e (b) 0xFF654321.

Se x = 0xAABBCCDD, então o resultado da expressão (a) deve ser 0x000000DD e (b) 0xFFBBCCDD.

Se x = 0x01020304, então o resultado da expressão (a) deve ser 0x00000004 e (b) 0xFF020304.

Use o programa abaixo com testar as suas expressões:



    #include <stdio.h>



    int main(void) {

        unsigned int x = 0x87654321;

        unsigned int a, b;



        // Manter o byte menos significativo de x e os outros bits em '0'

        a = ________________ ;



        // O byte mais significativo com todos os bits em '1' e manter os outros bytes com o mesmo valor dos bytes de x

        b = ________________ ;



        printf("a = 0x%08X\n", a);

        printf("b = 0x%08X\n", b);



        return 0;

    }

2 - Escreva uma função que verifique se o número de bits '1' de um inteiro sem sinal é ímpar.

A função tem a seguinte assinatura e deve retornar 0 se o número de bits '1' for par, e um valor diferente de 0 se o número de bits '1' for ímpar.

int odd_ones(unsigned int x);

Obs: a função não pode usar o operador de módulo "%" para testar se um número é par ou ímpar.

Use o programa abaixo como base. Passe diferentes valores de entrada, não esquecendo de verificar se os resultados obtidos estão corretos. Por exemplo, teste os valores 0x01010101 (número par de bits 1) e 0x01030101 (número ímpar de bits 1).



    #include <stdio.h>



    int odd_ones(unsigned int x) {

    // escreva seu código aqui

    }



    int main() {

    unsigned int v;



    v = 0x01010101;

    printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");



    v = 0x01030101;

    printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");



    return 0;

    }

3 - Vimos que os processadores podem trabalhar com a ordem de bytes little-endian ou big-endian.

Converter um valor de big-endian para little-endian é inverter a ordem dos bytes, por exemplo, seja o valor 0x12AB34CD em big-endian, o valor convertido em little-endian seria 0xCD34AB12.

Faça uma função convertB2L() usando o código abaixo, que dado um valor 32 bits sem sinal (unsigned int), converte esse valor de big-endian para little-endian.



    #include <stdio.h>



    unsigned int convertB2L(unsigned int x) {

        // escreva seu código aqui

    }



    int main() {

        unsigned int b = 0x12AB34CD;

        unsigned int l = convertB2L(b);



        printf("b = 0x%08X\n", b);

        printf("l = 0x%08X\n", l);



        return 0;

    }
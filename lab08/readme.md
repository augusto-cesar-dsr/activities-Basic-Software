# Laboratório - 08 _ 23 de Março de 2021
Na linguagem C as operações de manipulação de bits só são permitidas para valores do tipo inteiro, então usaremos uma union como definido abaixo para obter a representação de bits de um float como um unsigned int e vice-versa, ou seja, obter um valor float a partir de sua representação binária.

    typedef union { 

        float f;

        unsigned int i;

    } U;



    U u;

    float f = 0.125;

    unsigned int i;



    u.f = f;     // armazena o float na union

    i = u.i;     // obtém a representação "manipulável" do float



    u.i = i;     // armazena a representação binária na union

    f = u.f;     // obtém o float correspondente a essa representação



Podemos usar a macro makefloat() abaixo para compor a representação de um valor float, dados seus componentes: sinal, expoente e fração. Todos os componentes devem ser informados como unsigned int.

    #define makefloat(s,e,f) (((s) & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

As macros abaixo podem ser usadas para extrair as componentes sinal, expoente e fração de um float a partir da sua representação inteira:

    #define getsig(i)  ((i)>>31 & 1)

    #define getexp(i)  ((i)>>23 & 0xff)

    #define getfrac(i) ((i) & 0x7fffff)

É importante destacar que a macro retorna um unsigned int e não um float. Devemos atribuir o retorno na parte inteira da union para depois recuperar o float da union.

Por exemplo:

    U u;

    unsigned int s = 0; // 1 bit de sinal (0 positivo, 1 negativo)

    unsigned int e = 0; // 8 bits de expoente (menos significativos)

    unsigned int f = 0; // 23 bits da fração (menos significativos)



    u.f = 10.125;

    s = getsig(u.i); // extrai o sinal (passando o inteiro da union)

    e = getexp(u.i); // extrai o expoente (passando o inteiro da union)

    f = getfrac(u.i); // extrai a fração (passando o inteiro da union)



    // ATENÇÃO: retorno de makefloat() deve ser atribuído à parte inteira da union!!!

    u.i = makefloat(s, e, f); // compõe um float, mas retorna 'unsigned int'

    printf("%f\n", u.f); // agora podemos usar a parte float da union

1 - Escreva uma função C chamada float2() que, manipulando diretamente a representação de ponto flutuante, multiplique o valor de seu parâmetro por 2.

    #include <stdio.h>

    #include <math.h>



    #define getsig(i)        ((i)>>31 & 1)

    #define getexp(i)        ((i)>>23 & 0xff)

    #define getfrac(i)       ((i) & 0x7fffff)

    #define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )



    typedef union {

        float f;

        unsigned int i;

    } U;



    float float2(float f)

    {

        // seu código aqui...

    }

Dica: a representação do float segue a forma M * 2E. Qual é o novo valor de 'E' se você multiplicar o float por 2?

2 - Escreva uma função C chamada int2float() que converte um número no formato int para o formato float.

Atenção: Não é para fazer uma conversão direta usando cast, como “f = (float)i”. Utilize as macros acima para fazer a conversão utilizando manualmente, manipulando direta da representação do float. E lembre-se de tratar o 0 (zero).

Use o código como template e teste para sua função de conversão:

    #include <stdio.h>

    #include <math.h>



    #define getsig(i)        ((i)>>31 & 1)

    #define getexp(i)        ((i)>>23 & 0xff)

    #define getfrac(i)       ((i) & 0x7fffff)

    #define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )



    typedef union {

        float f;

        unsigned int i;

    } U;



    float int2float(int i)

    {

        // seu código aqui...

    }



    int main() {

        int i;



        printf("\n******** int2float ****************\n");



        i = 0;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        i = 1;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        i = -1;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        i = 0x7fffffff;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        i = -i;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        i = 12345;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        i = -12345;

        printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));



        return 0;

    }
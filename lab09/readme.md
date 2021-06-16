# Laboratório - 09 _ 26 de Março de 2021

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

1 - Escreva uma função float2int() para converter um número no formato float para o formato int. Sua função deve fazer a conversão sem usar operações de ponto flutuante.

Atenção: assuma que sua função receberá apenas números normalizados e o zero, mas ela deve estar preparada para tratar casos de overflow, pois nem todo valor float pode ser convertido para um inteiro de 32 bits. Em caso de overflow, emita uma mensagem de erro, e retorne os valores INT_MAX ou INT_MIN (de acordo com o sinal). Esses valores são definidos no arquivo de cabeçalho “limits.h”.

Utilize o arquivo abaixo para implementar e testar a sua função:

    #include <stdio.h>

    #include <math.h>

    #include <limit.h>



    #define getsig(x) ((x)>>31 & 1)

    #define getexp(x) ((x)>>23 & 0xff)

    #define getfrac(x) ((x) & 0x7fffff)

    #define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))



    typedef union {

        float f;

        unsigned int i;

    } U;



    int float2int(float f){

        // TODO: seu código aqui...

    }



    int main(){

        float f;

        printf("\n******** float2int ****************\n");

        f = 0.0;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = 1.0;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = -1.0;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = 12345.0;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = -12345.0;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = 1.5;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = 2.5;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = 2.4;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = 0.5;

        printf(" %+10.4f -> %d\n", f, float2int(f));

        f = (float)pow(2,31);

        printf(" %+10.4f (2^31) = overflow -> %d\n", f, float2int(f));

        f = -f;

        printf(" %+10.4f (-2^31) -> %d\n", f, float2int(f));

        f = (float)pow(2,32);

        f = -f;

        printf(" %+10.4f (-2^32 = overflow) -> %d\n", f, float2int(f));

        return 0;

    }

2 - Escreva uma função maxdouble() que recebe dois valores do tipo double e retorna o maior deles.

Sua função não deve fazer uma comparação direta entre os valores. Manipule a representação dos valores double com operações bit a bit para chegar na resposta. Note que as macros e a union do exercício anterior são para float, você deve modificá-las para que funcionem com double antes de usá-las.

Obs: Assuma que você receberá valores normalizados diferente de zero.

Utilize o arquivo abaixo como base para implementar e testar sua função:

    #include <stdio.h>



    // TODO: atualizar as macros e a union



    double maxdouble(double a, double b){

        // TODO: seu código aqui...

    }



    int main(){

        double a,b;



        a = 1.0;

        b = 2.0;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        a = -1.0;

        b = -2.0;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        a = 1.0;

        b = -2.0;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        a = 1.5;

        b = 1.75;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        a = -1.5;

        b = -1.75;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        a = -1.5;

        b = -2.5;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        a = 1.5;

        b = -1.75;

        printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));



        return 0;

    }
# Laboratório - 26 _ 01 de Junho de 2021

Aquecimento
Considere o programa formado pelos arquivos abaixo:

temp1.h

extern int a;

temp1.c

#include <stdio.h>

#include "temp1.h"

#include "temp2.h"



int a = 0xAA11BB22;



int main (void) {

  foo();

  printf("%d = 0x%.8X\n", a, a);

  return 0;

}

temp2.h

extern int b;

void foo(void);

temp2.c

#include "temp1.h"

#include "temp2.h"



int b = 10;



void foo (void) {

  a = -1;

}

Note que os arquivos “temp1.h” e “temp2.h” contém declarações dos símbolos globais exportados, respectivamente, por “temp1.c” e “temp2.c”. A inclusão desses arquivos garante a consistência dessas declarações entre os módulos, tanto para os arquivos que definem os símbolos quanto para os que os importam. 

Compile, ligue e execute esse programa, seguindo os passos abaixo: 

$ gcc -c -Wall -o temp1.o temp1.c

$ gcc -c -Wall -o temp2.o temp2.c

$ gcc -o prog  temp1.o temp2.o

A opção "-Wall" indica para habilitar todos os warnings.

1. Use o programa "nm" para inspecionar os símbolos usados por cada módulo:

  nm temp1.o 

  nm temp2.o

Você consegue inferir o significado das letras que aparecem na saída deste programa (U, T, etc.)?

Use o comando abaixo e confira com o que você respondeu.

  man nm

2. Faça um alteração no arquivo "temp1.c", modificando a linha

  int a = 0xAA11BB22;

para

  char a = 1; 

Recompile somente esse módulo:

$ gcc -c -Wall -o temp1.o temp1.c

O que acontece? Há algum erro? Se sim, em que passo? Compilação? Ligação? 

 2.1. Primeiro, desfaça a mudança no arquivo "temp1.c" feita exercício anterior.

Agora, faça uma alteração no arquivo "temp2.c", modificando a linha

    #include "temp1.h"

para

    extern char a;

Recompile os dois módulos e gere um novo executável  com nome diferente:

$ gcc -c -Wall -o temp1.o temp1.c

$ gcc -c -Wall -o temp2.o temp2.c

$ gcc -o prog2 temp1.o temp2.o

Execute o programa antigo:

$ ./prog

Agora, execute o programa novo e compare com a execução do programa original:

$ ./prog2

O que aconteceu? Você consegue explicar?

2.2. Modifique o arquivo "temp2.c", alterando a declaração

extern char a;

para

int a = 1;

Recompile esse módulo, gere um novo programa e execute-o.

$ gcc -c -Wall -o temp2.o temp2.c

$ gcc -o prog3 temp1.o temp2.o

$ ./prog3

O que acontece agora? Algum erro ocorreu? Se sim, em um passo?

2.3. Modifique o "temp2.c", alterando a declaração

   int a = 1;

para

   int a; 

Recompile esse módulo, gere um novo programa e execute-o.

$ gcc -c -Wall -o temp2.o temp2.c

$ gcc -o prog4 temp1.o temp2.o

$ ./prog4

O que acontece agora? Algum erro ocorreu? Se sim, em um passo?

Se necessário, inspecione os símbolos do programa usando:

   nm prog4

2.4. Modifique o "temp2.c", alterando a declaração

   int a;

para

   static int a = 1;

Recompile esse módulo, gere um novo programa e execute-o.

$ gcc -c -Wall -o temp2.o temp2.c

$ gcc -o prog5 temp1.o temp2.o

$ ./prog5

O que acontece agora? Algum erro ocorreu? Se sim, em um passo?

Se necessário, inspecione os símbolos do programa usando:

   nm prog5

3. Crie o programa “vetor.c” abaixo:

vetor.c

#include <stdio.h>



// 1Mb

#define SIZE 1048576



const int size = SIZE;

char vetor[SIZE] = {0};



int main()

{

   printf("%ld\n", sizeof(vetor));

   return 0;

}

Agora gere o executável:

$ gcc -o vetor vetor.c

Qual é o tamanho do executável?

3.1. Modifique o arquivo "vetor.c", alterando a linha

  char vetor[SIZE] = {0};

para

  char vetor[SIZE] = { [0] = 1, [512] = 2, [1024] = 3 };

Essa alteração vai inicializar o vetor com "1" no índice "0", "2" no índice "512" e "3" no índice "1024". As demais posições serão iniacializadas com "0" (zero).

Agora gere um novo executável:

  gcc -o vetor2 vetor.c

Qual é o tamanho do executável? É o mesmo do exercício anterior? Se não, o que gerou essa mudança?

Se necessário, inspecione o símbolo "vetor" dos programas usando:

  nm vetor

  nm vetor2
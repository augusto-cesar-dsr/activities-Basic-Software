# Laboratório - 23 _ 21 de Maio de 2021

1 ─ Traduza apenas o arquivo "calc1.c" para Assembly (arquivo “calc1.S”) o mais literal possível. 

Obs: Comente o seu código!

### calc1.c

    double calc1(double a, float b){

      return (a+b)*(a-b);

    }

### main1.c

    #include <stdio.h>



    double calc1(double a, float b);



    double calc1_shadow(double a, float b) {

      return (a+b)*(a-b);

    }



    int main(){

      double a = 4.5;

      float  b = 2.125;

      printf("%f == %f\n", calc1(a, b), calc1_shadow(a, b));

      return 0;

    }

Compile o programa usando o comando abaixo. Altere os valores de 'a' e 'b' na main() para validar sua função.

    gcc -no-pie -o calc1 main1.c calc1.S

2 ─ Traduza apenas o arquivo "calc2.c" para Assembly (arquivo “calc2.S”) o mais literal possível. 

Lembre-se da assinatura da função cos():

    double cos(double x);

Atenção: na chamada do printf(), o registrador '%eax' deve conter a quantidade de valores ponto flutuante passados. No caso abaixo, %eax = 3.

Obs: Comente o seu código!

### calc2.c

    #include <stdio.h>

    #include <math.h>



    float calc2(float a, float b){

      double e = a + cos(b);

      printf("a = %f, b = %f, e = %f\n", a, b, e);

      return b;

    }

### main2.c

    #include <stdio.h>

    #include <math.h>

    float calc2(float a, float b);



    float calc2_shadow(float a, float b){

      double e = a + cos(b);

      printf("a = %f, b = %f, e = %f\n", a, b, e);

      return b;

    }



    int main(){

      float a = 3.0;

      float b = 0.0;

      float r1 = calc2(a, b);

      float r2 = calc2_shadow(a, b);

      printf("%f == %f\n", r1, r2);

      return 0;

    }

Compile o programa usando o comando abaixo.

    gcc -no-pie -o calc2 main2.c calc2.S  -lm
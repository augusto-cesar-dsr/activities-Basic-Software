# Laboratorio - 03 _ 05 de Março de 2021
1 - Escreva uma função is_little() que retorne 1 se a memória tem organização little-endian e 0 caso seja big-endian.

Dica: Você pode “quebrar” o sistema de tipos para inspecionar isoladamente os bytes de um valor inteiro de qualquer tamanho…

    #include <stdio.h>



    int is_little()

    {

        // seu código aqui

    }



    int main () {

        if (is_little())

            printf("Little-endian\n"));

        else

            printf("Big-endian\n");

        return 0;

    }

2 - Implemente a função num2string(), a qual recebe um número inteiro na base decimal, a nova base e um ponteiro para um buffer. Essa função deve transformar o número para a nova base preenchendo os caracteres no buffer de resposta (não esqueça de adicionar o terminador de string). A nova base pode ser entre 2 e 36, devendo-se usar os dígitos '0' a '9' e as letras de 'a' a 'z' para representar os dígitos da nova base.

Teste o seu programa usando o exemplo abaixo:

    #include <ctype.h>

    #include <stdio.h>



    void num2string(int num, int base, char *resp)

    {

        // seu código aqui

    }



    int main () {

        char buf[128];



        num2string(1024, 2, buf);

        printf("==> %s\n", buf);



        num2string(1024, 16, buf);

        printf("==> %s\n", buf);



        num2string(1024, 32, buf);

        printf("==> %s\n", buf);



        return 0;

    }


# Laboratório - 15 _ 23 de Abril de 2021

1 - Traduza o programa C abaixo para Assembly o mais literal possível.

Obs: Comente o seu código!

Se necessário, use estes os registradores para valores temporários: %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11.

    #include <stdio.h>



    int nums[4] = {65, -105, 111, 34};



    int main()

    {

        int i = 0;

        int s = 0;



        while (i < 4)

            s = s + nums[i++];         // tmp = i; i = i+1; s = s + num[tmp];



        printf ("soma = %d\n", s);

        return 0;

    }

Para este exercício, utilize a biblioteca "util.S" para substituir as funções printf().

Utilize o template abaixo para construir o seu código:

    .section .rodata



    .data



    .text

    .globl main

    main:

    pushq %rbp

    movq  %rsp, %rbp



    # Seu código aqui...



    movl $0, %eax

    leave

    ret

2 - Traduza o programa C abaixo para Assembly o mais literal possível.

Obs: Comente o seu código!

Se necessário, use estes os registradores para valores temporários: %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11.

Utilize o template do exercício (1) para fazer o seu código.

    #include <stdio.h>



    int main()

    {

        short i = 10;

        short j = 20;

        short k = 30;

        unsigned char r = 16;



        if (i < 20 || j < 30)

            r = r >> 1;

        if (j > 30 && k < 20)

            r = r / 2;

        if ( (i > 20 && j > 30) || k > 20)

            r = r + 100;



        printf("%u\n", r);   // Imprime como 'unsigned int'



        return 0;

    }

## Exercício Extra
3 - Traduza o programa C abaixo para Assembly o mais literal possível.

Obs: Comente o seu código!

Se necessário, use estes os registradores para valores temporários: %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11.

Utilize o template do exercício (1) para fazer o seu código.

    #include <stdio.h>



    /* Teste com diferentes vetores */

    int   nums[] = {10, -21, -30, 45};

    //int   nums[] = {10, -21, -30,  0};

    //int   nums[] = {10,   0, -30, 45};

    short count = 0;



    int main() {

        int i;

        for (i = 0; i < 4; i++) {

            if (nums[i] < 0 || nums[i] > 100)

            continue;

            if (!nums[i])

            break;

            if (nums[i] % 2)

            count++;

        }



        if (i != 4)

            printf("[ERRO] Vetor possui zero\n");

        else

            printf("[INFO] Qtd números ímpares: %d\n", count);



        return 0;

    }
# Laboratório - 14 _ 20 de Abril de 2021
1 ─ Traduza o programa C abaixo para Assembly o mais literal possível.

### ex01.c

    #include <stdio.h>



    int a = 30;

    int b = 45;



    int main(){

        if (a > b)

            printf("'a' é maior do que 'b'\n");            // utilize 'print_rax_as_string'

        if (b >= a)

            printf("'a' não é maior do que 'b'\n");        // utilize 'print_rax_as_string'

        return 0;

    }

Se necessário, use estes os registradores para valores temporários: %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11.

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

Compile o seu código usando:

    gcc -no-pie -o ex01 ex01.S util.S

2 ─ Traduza o programa C abaixo para Assembly o mais literal possível.

Para este exercício, utilize a biblioteca "util.S" para substituir as funções printf() e scanf().

Use o registrador '%r8d' para 'a' e o registrador '%r9' para 'b'.

Se necessário, use estes os registradores para valores temporários: %rax, %rcx, %rdx, %rdi, %rsi, %r10, %r11.

Utilize o template do exercício ( 1 ) para construir o seu código.

    #include <stdio.h>



    int main(){

    int  a;                     // utilize %r8d

    long b;                     // utilize %r9



    scanf("%d", &a);            // utilize 'read_int_to_eax'



    if (a) {

        scanf("%ld", &b);         // utilize 'read_long_to_rax'

        if (b < 5) {

        b = (a << 1) + (a * b);

        printf("%ld\n", b);    // utilize 'print_rax_as_long'

        }

        else {

        a = b ^ 0x1FL;

        printf("0x%X\n", a);   // utilize 'print_eax_as_hex'

        }

    }



    return 0;

    }

Compile o seu código usando:

    gcc -no-pie -o ex02 ex02.S util.S
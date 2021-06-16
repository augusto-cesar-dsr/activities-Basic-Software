# Laboratório - 13 _ 16 de Abril de 2021

1 - Complete o bloco do while na função process() do arquivo "aux.c" de forma que a função percorra a string str e altere todas as letras para minúsculo.

Obs: Assuma que a string só terá letras maiúsculas (não terá espaço, número ou outro símbolo)

### main.c

    #include <stdio.h>



    extern char str[];

    void process();



    int main() {

        process();

        printf("%s\n", str);

        return 0;

    }

### aux.c

    char str[] = "BEBAMUITOCAFE";



    void process()

    {

        char *ptr = str;

        while (*ptr) {

            // Bloco do while

        }

    }

2 - Usando o arquivo abaixo como base, traduza o arquivo "aux.c" para Assembly o mais literal possível.

O código abaixo já possui um esqueleto da função process() com o while, mas não possui a definição da variável str nem o corpo do while. 

Você deve usar obrigatoriamente o registrador %r8 como sendo ptr (note que o linha de atribuição não está feita, vocês devem completar essa parte também).

Caso precise de registradores auxiliares, utilize: %rax, %rcx, %rdx, %rdi, %rsi, %r9, %r10, %r11.

Atenção: comente o seu código indicando o que você está traduzindo.

### aux.S

    .data



    # Definição da variável 'str' aqui...



    .text

    .globl process

    process:

    pushq %rbp

    movq  %rsp, %rbp



    # Inicialização de 'ptr' aqui...

    # ptr = str



    beginwhile:

    cmpb $0, (%r8)

    je endwhile            # while() {



        # Bloco do while



    jmp beginwhile         # }

    endwhile:



    leave

    ret

Para testar, compile o programa junto com o arquivo "main.c":

    $ gcc -no-pie -o e1-asm main.c aux.S

3 - Seja o código C abaixo:

### sum.c

    #include <stdio.h>



    long sum = 0;

    long vet[5] = {10, 20, 30, 40, 50};



    int main(){

        int i = 0;

        long *ptr = vet;

        while (i < 5) {

            sum = sum + *ptr;

            ptr++;

            i++;

        }

        printf("Soma: %ld\n", sum);

        return 0;

    }

Utilize o arquivo abaixo como base e traduza o mais literal possível as partes que faltam do programa C.

Utilize obrigatoriamente o registrador %r8 como ptr  e %ecx como i.

Caso precise de registradores auxiliares, utilize: %rax, %rdx, %rdi, %rsi, %r9, %r10, %r11.

Atenção: comente o seu código indicando o que você está traduzindo.

### sum.S

    .section .rodata



    fmt: .string "Soma: %ld\n"



    .data



    # Definição das variáveis aqui...



    .text



    .globl main

    main:

    pushq %rbp

    movq  %rsp, %rbp



    # Inicializações de 'i' e 'ptr' aqui...



    beginwhile:

    cmpl $5, %ecx

    jge  endwhile      # while() {



        # Bloco do while aqui...



    jmp beginwhile     # }

    endwhile:



    movq $fmt, %rdi    # printf()

    movq sum, %rsi

    movl $0, %eax

    call printf



    movl $0, %eax      # return 0

    leave

    ret


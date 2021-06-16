.section .rodata

# string para printf
fmt: .string "%d\n"

.data

    # variaveis
    .globl i
    .align 4
    i: .long 0

    .globl vet
    vet: .byte 12, 3, 20, 8

.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp

    # Seu código aqui...
    start_for:
        
        cmpl $4, i
        jge end_for

        movslq i, %r10 # movimentando indice para elemento
        imulq $1, %r10 # posicionando indice desejado
        addq $vet, %r10 # posicionado indice no vetor        
        
        movb (%r10), %dil # passando paramentro 1
        movw $10, %si # passando paramentro 2
        
        call filtro # chamando função

        # movl %eax, %r10d

        movq $fmt, %rdi # passando string
        movl %eax, %esi # pegando valor de retorno
        movl $0, %eax # zerando casas decimais

        call printf # chamando printf
        
        # movl i, %r10d
        # addl $1, %r10d
        # movl %r10d, i
        
        addl $1, i
        jmp start_for
    end_for:

    # return 0
    movl $0, %eax
    leave

    ret
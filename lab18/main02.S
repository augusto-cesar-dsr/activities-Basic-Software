.section .rodata

.data
    # definindo vetores/variaveis globais
    .globl v1
    .align 2
    v1: .word 1, 2

    .globl v2
    .align 8
    v2: .quad 1, 2, 3

.text

.globl aux # definiando função aux

aux:

    pushq %rbp

    movq  %rsp, %rbp
    
    subq $32, %rsp # alocando espaço na pilha
    movq %r12, -8(%rbp) # guardando na pilha

    movl $2, %r12d # atribuindo valor na variavel local

    begin_for: # inicio do for
        cmpl $0, %r12d
        jl end_for # comparação

        movq %rdi, -16(%rbp) # guardando na pilha
        movq %rsi, -24(%rbp) # guardando na pilha
        
        movq $v2, %rdx # passando parametros
        movl %r12d, %ecx
        call sum # chamando função

        movq -16(%rbp), %rdi # recuperando da pilha
        movq -24(%rbp), %rsi # recuperando da pilha

        subl $1, %r12d # decremento do for
        jmp begin_for # retornando ao inicio do for
    end_for:
    
    movq -8(%rbp), %r12 # recuperando da pilha
    leave

    ret


.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp
    subq $16, %rsp # alocando espaço na pilha

    movq %r12, -8(%rbp) # guardando na pilha
    
    movl $0, %r12d # declarando variavel local

    begin_while: # inicio do while
        cmpl $2, %r12d # comparação
        jge end_while

        movq $v1, %rdi # passando parametros
        movl %r12d, %esi
        call aux # chamada de função

        addl $1, %r12d # incremento
        jmp begin_while # jump para o inicio do while
    end_while: # fim do while

    movl $0, %eax # return 0
    
    movq -8(%rbp), %r12 # recuperando valor da pilha

    leave

    ret
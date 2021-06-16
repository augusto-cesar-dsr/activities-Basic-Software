.section .rodata

.data

.text

.globl process

process:
    # inicializando RA
    pushq %rbp

    movq  %rsp, %rbp
    
    # alocando memoria para pilha
    subq $48, %rsp
    
    # salvando valores na pilha
    movq %rdi, -8(%rbp) # a
    movq %rsi, -16(%rbp) # b
    movq %rdx, -24(%rbp) # c
    movq %rcx, -32(%rbp) # d
    movq %r8, -40(%rbp) # e
    movq %r9, -48(%rbp) # f

    # passando parametros para função calc
    movl -8(%rbp), %r9d # f ->calc
    movl -16(%rbp), %r8d # e ->calc 
    movl -24(%rbp), %ecx # d ->calc
    movl -32(%rbp), %edx # c ->calc
    movl -40(%rbp), %esi # b ->calc
    movl -48(%rbp), %edi # a ->calc

    # chamando calc
    call calc

    # recuperando valores da pilha
    movq -8(%rbp), %rdi # a
    movq -16(%rbp), %rsi # b
    movq -24(%rbp), %rdx # c
    movq -32(%rbp), %rcx # d
    movq -40(%rbp), %r8 # e
    movq -48(%rbp), %r9 # f

    # realizando soma com r
    addl %edi, %eax # a + r
    addl %esi, %eax # b + a + r
    addl %edx, %eax # c + b + a + r
    addl %ecx, %eax # d + c + b + a + r
    addl %r8d, %eax # e + d + c + b + a + r
    addl %r9d, %eax # f + e + d + c + b + a + r

    # destruindo pilha e relaizando
    # o retorno com o valor do eax
    leave

    ret
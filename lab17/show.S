.section .rodata

fmt: .string "%d\n"

.data

.text

.globl show

show:

    # inicializando RA
    pushq %rbp

    movq  %rsp, %rbp
    
    # alocando espaço em memoria (pilha)
    subq $32, %rsp

    movq %r12, -8(%rbp)
    movq %r13, -16(%rbp)
    movq %r14, -24(%rbp) 
    movq %rbx, -32(%rbp)
    
    movl $0, %r12d # i
    movl %esi, %r13d # size
    movq %rdi, %r14 # vet

    begin_for:
        cmpl %r13d, %r12d
        jge end_for

        movslq %r12d, %rbx
        imulq $4, %rbx
        addq %r14, %rbx

        movq $fmt, %rdi
        movl (%rbx), %esi
        movl $0, %eax
        call printf

        addl $1, %r12d
        jmp begin_for
    end_for:


    movq -8(%rbp), %r12
    movq -16(%rbp), %r13
    movq -24(%rbp), %r14
    movq -32(%rbp), %rbx

    # return 0
    movl $0, %eax
    
    # destruindo RA
    leave

    ret
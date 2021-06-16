.section .rodata

    fmt01: .string "Soma %f maior que o limite %f\n"

    .align 8
    initialize: .double 0.0

.data

.text

.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp
    
    subq $80, %rsp
    
    movl $4, -4(%rbp) # i = 4

    movsd initialize, %xmm1
    movsd %xmm1, -16(%rbp) # s = 0.0;
    
    movl $5, -32(%rbp) # vi[4] = {5,6,7,8};
    movl $6, -28(%rbp)
    movl $7, -24(%rbp)
    movl $8, -20(%rbp)

    # -64(%rbp) => vd[4]

    movsd %xmm0, -72(%rbp) # salvando limits
    leaq -32(%rbp), %rdi # vi
    leaq -64(%rbp), %rsi # vd
    movl -4(%rbp), %edx # i
    call mult # mult(vi, vd, i);
    movsd -72(%rbp), %xmm0 # recuperando limits

    begin_while:
        movl -4(%rbp), %r8d # i > 0
        
        cmpl $0, %r8d # i > 0
        jle end_while
        
        movsd -16(%rbp), %xmm1 # mandando valor de s para um registrador
        
        subl $1, %r8d # i--
        movl %r8d, -4(%rbp) # atualizanbdo valor de i

        movslq %r8d, %r8 # alargando o valor de i
        imulq $8, %r8 # alinhando ao indicie do vetor
        leaq -64(%rbp), %r9 # pegando o endereço da primeira posição do vetor
        addq %r9, %r8 # acessando o endreço de vd[--i]
        addsd (%r8), %xmm1 # s += vd[--i];

        movsd %xmm1, -16(%rbp) # atualizando o valor de s com a soma
        movsd -16(%rbp), %xmm1 # mandando valor de s para um registrador
        
        # if_begin:
            ucomisd %xmm0, %xmm1 # s > limit
            jbe end_if
            
            movsd %xmm0, %xmm2 # mandando o limits para um temporario
            movsd %xmm0, -72(%rbp) # salvando limits
            
            movq $fmt01, %rdi # passando string parametro
            movsd -16(%rbp), %xmm0 # passando s como parametro
            movsd %xmm2, %xmm1 # passando limits como parametro
            movl $2, %eax # dois doubles seram impressos
            call printf # chamando função
            movsd -72(%rbp), %xmm0 # salvando limits
        end_if:

        jmp begin_while # voltando ao inicio do while
    end_while:
    
    # return s
    movsd -16(%rbp), %xmm0
    
    leave

    ret
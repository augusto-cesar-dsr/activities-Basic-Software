.section .rodata

str01: .string "%ld\n" # define string

.data

.text

.globl show

show:

    pushq %rbp

    movq  %rsp, %rbp # inicializa RA
    
    subq $32, %rsp # aloca memoria
    movq %r12, -8(%rbp) # salva o conteudo de %r12
    

    movl $0, %r8d # i = 0
    
    movq %rdi, %r12 # *ptr = d->elems;
    addq $8, %r12 # *ptr = d->elems;
    
    begin_for:
        cmpl (%rdi), %r8d
        jge end_for

        movslq %r8d, %r9 # criando index do vetor
        imulq $8, %r9 # criando index do vetor
        addq %r12, %r9 # acessando a posição do vetor

        movq %rdi, -16(%rbp) # salva o conteudo de %rdi
        movq %r8, -24(%rbp) # salva o conteudo de %r8

        movq $str01, %rdi # passando parametro
        movq (%r9), %rsi # passando parametro
        movl $0, %eax
        call printf # chamando função

        movq -16(%rbp), %rdi # devolve o conteudo salvo de %rdi
        movq -24(%rbp), %r8 # devolve o conteudo salvo de %r8

        addl $1, %r8d # incremento de i
        jmp begin_for # volta ao inicio do for
    end_for:

    movq -8(%rbp), %r12 # devolve o conteudo salvo de %r8

    leave

    ret
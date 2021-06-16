.section .rodata

.data

.text

.globl calc

calc:

    pushq %rbp

    movq  %rsp, %rbp # RA

    subq $48, %rsp # alocando memoria para variáveis
    
    movl $0, %r8d # i
    
    movl $4, %r9d # j
    
    # sum => -4(%rbp)
    # vet1[4] => -8(%rbp)
    # vet1[0] => -28(%rbp)
    # vet2[4] => -30(%rbp)
    # vet2[0] => -40(%rbp)
    
    movq %r8, -48(%rbp)     # salvando o valor de %r8
    leaq -28(%rbp), %rdi    # passando o endereço da primeira posição de vet1
    movl $5, %esi           # passando o int 5 como parametro
    movl %r8d, %edx         # passando i como parametro
    call filli              # chamando filli
    movq -48(%rbp), %r8     # recuperando o valor de %r8

    movq %r9, -48(%rbp)     # salvando o valor de %r9
    leaq -40(%rbp), %rdi    # passando o endereço da primeira posição de vet2
    movl $5, %esi           # passando o int 5 como parametro
    movl %r9d, %edx         # passando o j como parametro
    call fills              # chamando fills
    movq -48(%rbp), %r9     # recuperando o valor de %r9

    movl $0, -4(%rbp)       # sum = 0

    begin_for:              # inicio do for
        cmpl $5, %r8d       # i >= 5
        jge end_for         # se true encerra o for
        
        movslq %r9d, %rax   # alargando indicie
        leaq -40(%rbp, %rax, 2), %rcx # pegando posição do vetor de acordo com o indicie
    
        movswl (%rcx), %r10d # copiando valor na posição selecionada
    
        movslq %r8d, %rax    # alargando indicie
        leaq -28(%rbp, %rax, 4), %rcx # pegando posição do vetor de acordo com o indicie
    
        addl (%rcx), %r10d # somando ao valor capturado anteriormente

        addl %r10d, -4(%rbp) # somando a variavel sum

        incl %r8d # i++
        subl $1, %r9d # j--
        jmp begin_for # reinicia o for
    end_for:

    # return sum
    movl -4(%rbp), %eax
    
    leave

    ret
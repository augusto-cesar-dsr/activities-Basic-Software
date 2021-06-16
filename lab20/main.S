.section .rodata

fmt: .string "Diferença em %d/%d: %ld\n"

.data
    # produto 1 char = 1 byte + 7 de padding
    # produto 1 long = 8 bytes
    # produto 1 int = 4 bytes + 4 de padding
    # size of produto = 24
    # prods = 2*produto

    .globl prods
    .align 8
    prods: .zero 48

.text

# função media
.globl media

media:

    pushq %rbp

    movq  %rsp, %rbp # RA

    movl $0, %r8d # i
    movq $0, %r9 # soma

    begin_for:
        movslq %r8d, %r10 # alargando o i
        cmpq %rsi, %r10 # comparação 
        jge end_for # comparação

        imulq $24, %r10 # criando indicie
        addq %rdi, %r10 # endereço ao indicie
        
        addq $8, %r10 # acessando o preço
        addq (%r10), %r9 # adicionando valores
        
        incl %r8d # incrementando i
        jmp begin_for # jump inicio do for
    end_for:

    # return 0
    movq %r9, %rbx # movendo numerador
    movq %rsi, %rcx # movendo denomindaor
    movq $0, %rdx # zerando o resto
    movq %rbx, %rax # movendo o numerador
    div %rcx # divisão
    # o resultado é armazedado no %rax
    
    leave

    ret

# função main
.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp
    subq $32, %rsp
    
    movq %r12, -8(%rbp)
    movq %r13, -16(%rbp)
    movq %r14, -24(%rbp)

    movl $0, %r13d # declarando i
    
    movq $prods, %r12 # pegando o endereço de memoria

    movb $1, (%r12)  # mes[0] = 1
    movq $100, 8(%r12) # preço[0] = 100
    movl $2020, 16(%r12) # ano[0] = 2020
    
    movb $2, 24(%r12) # mes[1] = 2
    movq $120, 32(%r12) # preco[1] = 120
    movl $2020, 40(%r12) # ano[1] = 2020

    movq $prods, %rdi # passando o vetor como parametro
    movq $2, %rsi # passnado size 2
    call media # chamando  media

    movq %rax, %r14 # capturando retorno de media

    begin_while:
        movslq %r13d, %r10 # alargando i
        
        cmpq $2, %r10 # comparando
        jge end_while # se verdade

        imulq $24, %r10 # criando indicie de acesso ao vetor
        addq %r12, %r10 # criando indicie de acesso ao vetor
        
        movq 8(%r10), %r11 # acesso ao vetor
        subq %r14, %r11 # subtraindo media do valor mensal

        movq $fmt, %rdi # passando pamentro 1
        movsbl (%r10), %esi # passando pamentro 2
        movl 16(%r10), %edx # passando pamentro 3
        movq %r11, %rcx # passando pamentro 4
        movl $0, %eax # zerando casas decimais
        call printf # chamando printf

        incl %r13d # incremento de i
        jmp begin_while # volta ao inicio do loop
    end_while:
    
    movq -8(%rbp), %r12 # recupera valores antes do ret
    movq -16(%rbp), %r13 # recupera valores antes do ret
    movq -24(%rbp), %r14 # recupera valores antes do ret
    
    # return 0
    movl $0, %eax
    
    leave

    ret
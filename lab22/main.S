.section .rodata

fmt: .string "sum = %ld\n" # string para printf

.data

.text

.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp # RA
    
    subq $32, %rsp
    # i => -4(%rbp)
    # j => -8(%rbp)
    # *h => -16(%rbp)
    # parametros  %rdi e %esi
    # sempre salvar %rdi em => -24(%rbp)
    # sempre salvar %rsi em => -32(%rbp)
    
    movq %rdi, -24(%rbp) # salvamento de parametro
    movq %rsi, -32(%rbp) # salvamento de parametro
    
    call new_sum
    movq %rax, -16(%rbp) # guardando
    
    movq -24(%rbp), %rdi # recuperação de parametro
    movq -32(%rbp), %rsi # recuperação de parametro

    movl $0, -4(%rbp) # i = 0
    begin_for1:

        cmpl %esi, -4(%rbp)
        jge end_for_1 # comparação


        movl $0, -8(%rbp) # j = 0
        begin_for2:
            movslq -4(%rbp), %r9 # criando indice de estrutura
            movq $7, %r8 # criando indice de estrutura
            imulq %r9, %r8 # criando indice de estrutura
            leaq 48(%rdi,%r8,8), %r9 # criando indice de variavel na estrutura
            movl (%r9), %r8d # pegando

            cmpl %r8d, -8(%rbp)
            jge end_for_2
            
            movq %rdi, -24(%rbp) # salvamento de parametro
            movq %rsi, -32(%rbp) # salvamento de parametro

            movslq -4(%rbp), %r9 # criando indice de estrutura
            movq $7, %r8 # criando indice de estrutura
            imulq %r9, %r8 # criando indice de estrutura
            
            leaq 8(%rdi, %r8, 8), %r9 # criando indice de acesso ao vetor na estrutura
            
            movslq -8(%rbp), %r8 # criando indice de acesso ao vetor
            leaq (%r9, %r8, 8), %rax # resgatando endereço de memoria com o indicie do vetor
            
            movq -16(%rbp), %rdi # passando h como parametro
            movq (%rax), %rsi # passando node[i].value[j] como parametro
            call add_sum # chamando sum
            
            movq -24(%rbp), %rdi # recuperação de parametro
            movq -32(%rbp), %rsi # recuperação de parametro
            

            addl $1, -8(%rbp) # incremento
            jmp begin_for2 # reinicio do segundo for
        end_for_2:
        
        addl $1, -4(%rbp) # incremento
        jmp begin_for1 # reinicio do segundo for
    end_for_1:

    movq -16(%rbp), %rdi # passando h como parametro
    call get_sum # chamando get_sum
    # return get_sum(h)
    # movq %rax, %rax
    
    leave

    ret

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp # RA

    subq $112, %rsp # alocando estrutura local
    
    leaq -112(%rbp), %rdi # passando o endereço da estrutura como parametro
    call init # chamando init

    leaq -112(%rbp), %rdi # passando o endereço da estrutura como parametro
    movl $2, %esi # passando o tamanho da estrutura como parametro inteiro
    call sum # chamando sum

    movq $fmt, %rdi # passando string como parametro
    movq %rax, %rsi # passando o retorno de sum como parametro
    movl $0, %eax # zerando os pontos flutuantes
    call printf # chamando printf
    

    # return 0
    movl $0, %eax
    
    leave

    ret
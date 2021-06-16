.section .rodata



fmt: .string "Soma: %ld\n"



.data



# Definição das variáveis aqui...
    .globl sum
    .align 8
    sum: .quad 0

    .globl vet
    .align 8
    vet: .quad 10, 20, 30, 40, 50


.text



.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp
    


    # Inicializações de 'i' e 'ptr' aqui...
    movq $vet, %r8
    movl $0, %ecx


beginwhile:

    cmpl $5, %ecx

    jge  endwhile      # while() {

        movq sum, %r9 # registrado recebe o valor da variavel
        addq (%r8), %r9 # registrador recebe a soma com o valor referenciado na memoria
        movq %r9, sum # atualiza o valor da variavel na memoria é atualizado
        
        # addq (%r8), sum # não funciona pois são duas memorias

        addq $8, %r8 # segue para proxima posição do vetor
        incl %ecx  # incrementa em 1 o contador i # equevalente -> addl $1, %ecx
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
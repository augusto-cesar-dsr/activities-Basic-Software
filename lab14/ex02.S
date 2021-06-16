.section .rodata



.data

    .globl a
    .align 4
    a: .long 0

    .globl b
    .align 8
    b: .quad 0


.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp

    # seu código aqui ...
    movl a, %r8d # inicializando variavel int a
    movq b, %r9 # inicializando variavel long b

    call read_int_to_eax     # Lê do teclado -> %eax
    
    movl %eax, %r8d # atribuindo int ao registrador
    movl %r8d, a # atribuindo int ao variavel a
    
    # if_1
        cmpl $0, %r8d
        je end_if # caso a comparação seja igual a zero ele salta direto paa o fim do if
        
        # if_2
            call read_long_to_rax     # Lê do teclado -> %rax
            movq %rax, %r9 # atribuindo long ao registrador
            movq %r9, b # atribuindo long ao variavel b
            
            cmpq $5, %r9 # realiza a comparação de %r9 com 5
            jge bc_else # se o resultado da comparação >= for verdadeiro ele salta as instruções internas,
                        # e vai para o else
            
            movl a, %r8d # pegando o valor da memoria
            movslq %r8d, %r10 # expandindo
            imulq %r10, %r9 # multiplicando com o valor em %r9

            # movl a, %r8d
            shll $1, %r8d # shift 1 bit para esquerda
            movslq %r8d, %r10 # expandindo
            addq %r10, %r9 # somando em %r9

            movq %r9, %rax # movendo para printar
            call print_rax_as_long
            jmp end_if # saindo do if sem passar pelo else

        bc_else: # inicio do else
            movq b, %r9 # pegando o valor de b
            movabs $0x1FL, %r8 # movendo o valor para o %r8
            xorq %r8, %r9 # executando xor
            
            movl %r9d, %r8d # move, salva na memoria e printa
            movl %r8d, a
            movl %r8d, %eax

            call print_eax_as_hex

    end_if: # fim do if primario

    movl $0, %eax

    leave

    ret
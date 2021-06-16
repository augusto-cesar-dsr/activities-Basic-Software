.section .rodata

    str01: .string "'a' é maior do que 'b'\n" # definindo string 01

    str02: .string "'a' não é maior do que 'b'\n" # definindo string 02

.data
    # definindo as variáveis globais
    .globl a
    .align 4
    # a: .long 30 # cod original
    a: .long 60 # testando a outra condicional

    .globl b
    .align 4
    b: .long 45

.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp



    # Seu código aqui...
    movl a, %r8d # pegando valores para registradores
    movl b, %r9d # pegando valores para registradores

    # if1:
        cmpl %r9d, %r8d # comparando %r8d <= %r9d || ou || 30 <= 45
        jle end_if_1 # se a comparação der verdadeiro para menor ou igual realiza o jump,
                     # caso não ele executa a instrução abaixo (the print string)
        
        movq $str01, %rax          # rax = &str01
        call print_rax_as_string
    
    end_if_1:

    # valores alá registradores
    
    movl a, %r8d 
    movl b, %r9d
    
    # if2:
        cmpl %r8d, %r9d # comparando %r9d < %r8d || ou || 45 < 30
        jl end_if_2 # se a comparação der verdadeiro para menor realiza o jump,
                    # caso não ele executa a instrução abaixo (the print string)
        
        movq $str02, %rax          # rax = &str01
        call print_rax_as_string
    end_if_2:

    movl $0, %eax

    leave

    ret
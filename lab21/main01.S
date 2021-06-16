.section .rodata

fmt: .string "Soma: %ld\n"

.data

.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp

    subq $32, %rsp

    # variavel s vai ser o %r11w

    call constante
    movsbw %al, %r11w # variavel s

    movq %r11, -24(%rbp)    # salvando valor de s
    movw %r11w, %di         # passando s por parametro
    leaq -8(%rbp), %rsi     # passando o endereço de memoria de l
    leaq -16(%rbp), %rdx    # passando o endereço de memoria de i
    call init               # chamando init
    movq -24(%rbp), %r11    # recuperando o valor de s

    movswq %r11w, %r11      # alargando o s
    movl -16(%rbp), %r8d    # pegando o valor de i
    movslq %r8d, %r8        # alargando o i
    addq %r11, %r8          # adicionando s ao valor de i
    addq -8(%rbp), %r8      # adicionando l a soma i+s
    
    movq $fmt, %rdi         # passando string fmt
    movq %r8, %rsi          # passando a soma l+i+s
    movl $0, %eax           # 0 pontos flutantes
    call printf             # chamando printf


    # return 0
    movl $0, %eax
    
    leave

    ret
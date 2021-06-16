.section .rodata

str01: .string "color: %ld, filled: %d\n"

.data

    .globl circle
    .align 8
    circle:
        .long 0 # x = +0
        .long 0 # y = +4
        .byte 0 # filled = +8
        .zero 7 # padding
        .quad 0 # color = +16

#    circle:
#        .zero 24
.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp

    movq $circle, %r8 # pegando endereço da memoria
    
    movl $10, (%r8) # atribuindo 10 a x

    movl (%r8), %r9d # calculando o y
    imull $2, %r9d # calculando o y
    movl %r9d, 4(%r8) # atribuindo o y

    movb $1, 8(%r8) # atribuindo o c
    
    # begin_if: if (c1.y > 30)
        cmpl $30, 4(%r8)
        jle begin_else

        movq $2, 16(%r8) # c1.color = RED;

        jmp end_if_else
    begin_else:

        movq $1, 16(%r8) # c1.color = BLUE;
    
    end_if_else:
        
    movq $str01, %rdi # passando parametro
    movq 16(%r8), %rsi # passando parametro
    movsbl 8(%r8), %edx # passando parametro
    movl $0, %eax
    call printf # chamando função
    
    # return 0
    movl $0, %eax
    
    leave

    ret
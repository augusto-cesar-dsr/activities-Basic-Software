.section .rodata

# string para sum
str01: .string "hello"

# string para printf
fmt: .string "[INFO] %d\n"

.data
    # variaveis
    .globl val
    .align 4
    val: .long 432

    .globl age
    .align 2
    age: .word 4

    .globl r
    .align 4
    r: .long 0

    .globl err
    .align 4
    err: .long 0
    
.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp

    # Seu código aqui...
    movq $str01, %rdi # passando paramentro 1
    movl val, %esi # passando paramentro 2
    movw age, %dx # passando paramentro 3
    movq $r, %rcx # passando paramentro 4

    call sum # chamando função

    movl %eax, err # pegando valor de retorno

    movq $fmt, %rdi # passando paramentro 1
    movl err, %esi # passando paramentro 2
    movl $0, %eax # passando paramentro 3
    call printf # invocando função

    # return 0
    movl $0, %eax # forçando return 0
    
    leave

    ret
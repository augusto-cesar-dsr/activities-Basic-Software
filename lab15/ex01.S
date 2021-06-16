.section .rodata

str01: .string "soma = "

.data

    .globl nums # definindo vetor nums
    .align 4
    nums: .long 65, -105, 111, 34

.text

.globl main

main:

    pushq %rbp

    movq  %rsp, %rbp



    # Seu código aqui...
    movl $0, %r8d # definindo i
    movl $0, %r9d # definindo s
    movq $nums, %r11 # puxando vetor

    start_while: # while() {

    cmpl %r8d, $4
    jge end_while    # comparação        

    movl %r8d, %r10d
    incl %r8d


    movslq %r10d, %r12 # criando indice
    imulq $4, %r12 # criando indice com tamanho do dado
    addq %r11, %r12 # acessando enderço do vetor
    addl (%r12), %r9d


    jmp start_while         

    end_while: # }
    
    
    movq $str01, %rax
    call print_rax_as_string

    movl %r9d, %eax
    call print_eax_as_int
    # call print_newline
    
    movl $0, %eax

    leave

    ret
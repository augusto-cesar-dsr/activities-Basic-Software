.data
    
    .globl c
    c: .byte -20
    
    .globl i
    .align 4
    i: .long -256 # .int tambem funfa
    
    .globl ui
    .align 4
    ui: .long 1024
    
    .globl l
    .align 8
    l: .quad 128
    
    .globl ul
    .align 8
    ul: .quad 2048
    
    .globl v
    .align 4
    v: .long 10, 20, 30, 40, 50
    
    .globl us
    .align 2
    us: .word 111 # .short funfa idem


.text



.globl aux

aux:

    pushq %rbp

    movq  %rsp, %rbp



    # Se necessário, usar apenas os registradores:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10



    # Seu código aqui...
    movb c, %al
    movsbl %al, %eax
    movl %eax, i
    
    movl i, %eax
    movl %eax, ui

    movl ui, %eax
    # movlq %eax, %rcx
    movq %rax, ul

    movq ul, %rax
    movw %ax, us
    # movq %rax, ul

    movl i, %eax
    addl $10, %eax
    subl $5, %eax
    # movb %eax, %al
    movb %al, c

    movq $v, %rax
    movl 8(%rax), %ecx
    movl %ecx, i
    
    movb c, %cl
    movsbl %cl, %ecx

    movl 12(%rax), %edx
    imull %ecx, %edx
    movl %edx, 16(%rax)

    movq $l, %r8
    movq $128, (%r8)

    leave

    ret
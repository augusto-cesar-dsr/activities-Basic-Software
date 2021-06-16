.section .rodata

.align 8
init: .double 0.0

.data

.text

.globl max_prod

max_prod:

    pushq %rbp

    movq  %rsp, %rbp
    
    subq $16, %rsp # RA

    movsd init, %xmm0 # m = 0.0;
    movsd %xmm0, -8(%rbp) # m = 0.0;

    begin_while:
        
        movl (%rdi), %r8d # ptr->id
        
        cmpl $0, %r8d # ptr->id
        je end_while

        movq %rdi, -16(%rbp) # salvando rdi
        movsd 8(%rdi), %xmm0 # passando ptr->value
        call floor
        movq -16(%rbp), %rdi # recuperando rdi
        # tmp = %xmm0

        movsd -8(%rbp), %xmm1 # pegando m
        # begin_if
            ucomisd %xmm0, %xmm1 # m < tmp
            jae end_if

            movsd %xmm0, -8(%rbp) # m = tmp;

        end_if:

        addq $16, %rdi # ptr++;
        jmp begin_while # voltando ao inicio do while
    end_while:

    # return m
    movsd -8(%rbp), %xmm0
    
    leave

    ret
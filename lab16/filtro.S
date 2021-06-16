.section .rodata



.data



.text

.globl filtro

filtro:

    pushq %rbp

    movq  %rsp, %rbp

    # Seu código aqui...
    movl $0, %r8d # r

    movzbw %dil, %r9w # a
    movw %si, %r10w # b

    # begin_if:
        cmpw %r10w, %r9w # if( a >= b)
        jge begin_else # goto begin_else

        movl $0, %r8d # r = 0     
        
        jmp end_if_else
    
    begin_else:
        
        movswl %r10w, %r8d
    
    end_if_else:

    # return r
    movl %r8d, %eax

    leave

    ret
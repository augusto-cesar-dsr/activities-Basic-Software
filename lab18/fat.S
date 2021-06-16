.section .rodata

.data

.text

.globl fat

fat:

    pushq %rbp

    movq  %rsp, %rbp

    subq $16, %rsp # alocando espaço

    # begin_if:
    cmpl $0, %edi
    jle end # comparação

        movq %rdi, -8(%rbp) # salvando na pilha
        subl $1, %edi # passando parametro
        
        call fat # chamando função

        movq -8(%rbp), %rdi # recuperando valor que estava na pilha

        imull %edi, %eax # multiplicando

        leave # retornando
        ret

    end:

        movl $1, %eax # return 1
    
        leave
        ret
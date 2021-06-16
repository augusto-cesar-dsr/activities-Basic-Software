.section .rodata

.data

.text

.globl calc1

calc1:

    pushq %rbp

    movq  %rsp, %rbp # RA

    cvtss2sd %xmm1, %xmm2 # convertendo de float 2 double (temp)
    cvtss2sd %xmm1, %xmm1 # convertendo de float 2 double

    addsd %xmm0, %xmm2 # add a in b_temporario
    subsd %xmm1, %xmm0 # (a-b) resultado in a
    mulsd %xmm2, %xmm0 # multiplicando pela soma em b_temp
    # o resultado da multiplicação fica salva no resgistrador deS retorno
    
    leave

    ret
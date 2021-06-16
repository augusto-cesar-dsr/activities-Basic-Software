.section .rodata

fmt: .string "a = %f, b = %f, e = %f\n" # string fixa

.data

.text

.globl calc2

calc2:

    pushq %rbp

    movq  %rsp, %rbp # iniciando RA

    subq $16, %rsp # alocando espaço na pilha 

    movss %xmm0, -4(%rbp) # salvando valores originais
    movss %xmm1, -8(%rbp) # salvando valores originais
    
    cvtss2sd %xmm1, %xmm1 # aumentando de float2double
    
    movsd %xmm1, %xmm0 # passando parametro b too cos
    call cos # chamando cos(b)

    movsd %xmm0, %xmm3 # movendo retorno para variavel temporaria
    
    movss -4(%rbp), %xmm0 # recuperando valor original de a
    movss -8(%rbp), %xmm1 # recuperando valor original de b

    cvtss2sd %xmm0, %xmm4 # aumentando de float2double
    
    addsd %xmm4, %xmm3 # somando retorno cos ao valor da temporaria

    movsd %xmm3, %xmm2 # movendo o resultado da expressão para a variavel e 
    
    movss %xmm0, -4(%rbp) # salvando valores originais
    movss %xmm1, -8(%rbp) # salvando valores originais
    
    movq $fmt, %rdi # passando string como param de format
    cvtss2sd %xmm0, %xmm0 # aumentando de float2double
    cvtss2sd %xmm1, %xmm1 # aumentando de float2double
    movl $3, %eax # qtd de %f
    call printf # chamando printf

    movss -4(%rbp), %xmm0 # recuperando valor original de a
    movss -8(%rbp), %xmm1 # recuperando valor original de b

    movss %xmm1, %xmm0 # return b

    leave

    ret
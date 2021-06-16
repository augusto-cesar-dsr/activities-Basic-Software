.section .rodata

.data

.text


# void myopen(handler_t *h, const char *filename, int flags){

#  h->fd = open(filename, flags);

# }

.globl myopen

myopen:

    pushq %rbp

    movq  %rsp, %rbp # RA
    
    subq $16, %rsp
    # %rdi => *h
    # %rsi => *filename
    # %rdx => int flag

    movq %rdi, -8(%rbp) # salvando em memoria o valor de %rdi
    
    movq $2, %rax # sys_open
    
    movq %rsi, %rdi # filename
    movl %edx, %esi # flags
    movl $0, %edx # mode 0
    syscall # chamada ao sistema operacional
    
    movq -8(%rbp), %rdi # recuperando em memoria o valor de %rdi

    movl %eax, (%rdi) # passando o valor retornado em fd
    
    leave

    ret

# ssize_t myread(handler_t *h){

# return read(h->fd, h->buffer, h->size);

# }

.globl myread

myread:

    pushq %rbp

    movq  %rsp, %rbp # RA
    
    # %rdi = *h
    # %rdi -> %r8
    movq %rdi, %r8 # copiando o valor de %rdi

    movq $0, %rax # sys_read

    movl (%r8), %edi # passando h->fd
    movq 16(%r8), %rsi # passando h->buffer
    movq 8(%r8), %rdx # passando h->size
    syscall # chamada ao sistema operacional

    # return
    # %rax
    
    leave

    ret


# ssize_t mywrite(handler_t *h, size_t count){

# return write(h->fd, h->buffer, count);

# }
.globl mywrite

mywrite:

    pushq %rbp

    movq  %rsp, %rbp # RA
    
    # %rdi = *h
    # %rsi = count

    movq %rdi, %r8 # passando %rdi -> %r8
    movq %rsi, %r9 # passando %rsi -> %r9

    movq $1, %rax # sys_write
    
    movl (%r8), %edi # passando h->fd
    movq 16(%r8), %rsi # passando h->buffer
    movq %r9, %rdx # passando count
    
    syscall # chamada ao sistema operacional
    
    # return %rax
    
    leave

    ret


# int myclose(handler_t *h){

# return close(h->fd);

# }
.globl myclose

myclose:

    pushq %rbp

    movq  %rsp, %rbp # RA
    
    # %rdi = *h

    movq $3, %rax # sys_close

    movl (%rdi), %edi # passando h->fd
    
    syscall # chamada ao sistema operacional

    # return %rax
    
    leave

    ret
.section .rodata

str01: .string "[ERRO] Vetor possui zero"
str02: .string "[INFO] Qtd números ímpares: "

.data

   .globl nums # definindo vetor nums
   .align 4
   nums: .long 10, -21, -30, 45
   # nums: .long 10, -21, -30,  0
   # nums: .long 10,   0, -30, 45

   .globl count # definindo vetor nums
   .align 2
   count: .word 0

.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   # Seu código aqui...
   movl $0, %r8d # i = 0 
   movq $nums, %r11 # addr inicial do vetor

   for_start:
      
      cmpl $4, %r8d # i >=4
      jge for_end
      
      movl %r8d, %r9d # tmp = i

      movl %r8d, %r12d # criando indice
      
      imulq $4, %r12 # criando indice com tamanho do dado
      addq %r11, %r12 # acessando enderço do vetor

      cmpl $0, (%r12) # (%r12) < 0 volta ao inicio
      jl bloco_1
      
      cmpl $100, (%r12) # (%r12) <= 100 salta o if
      jle end_bloco_1
      
      bloco_1:
      
         jmp end_if_3 # continue
      
      end_bloco_1:
      
      cmpl $0, (%r12) # (%r12) == 0 quebra o for
      jne end_if_2
         
         jmp for_end # break
      
      end_if_2:
      
      movl (%r12), %ebx
      
      movl $2, %ecx
      
      # movl $0, %edx
      
      movl %ebx, %eax
      
      cltd
      
      idivl %ecx
      
      cmpl $0, %edx
      je end_if_3

         addw $1, count

      end_if_3:

      addl $1, %r8d # i++
      
      jmp for_start
   
   for_end:
   
   # if_0:
   
   cmpl $4, %r8d
   je else_0

      movq $str01, %rax
      call print_rax_as_string
      call print_newline
      
      jmp end_if_0
   
   else_0:
   
      movq $str02, %rax
      call print_rax_as_string
      
      movswl count, %r10d
      movl %r10d, %eax
      call print_eax_as_int
   
   end_if_0:

   movl $0, %eax

   leave

   ret
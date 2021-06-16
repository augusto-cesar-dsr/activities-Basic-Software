.section .rodata



.data



.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp



   # Seu código aqui...
   movw $10, %r8w # i
   movw $20, %r9w # j
   movw $30, %r10w # k
   movb $16, %r11b # r
   # ###########
   cmpw $20, %r8w # i < 20 || j >= 30
   jl Bloco_1
   
   cmpw $30, %r9w 
   jge end_Bloco_1
   
   Bloco_1:
      
      shrb $1, %r11b # r = r >> 1;
   
   end_Bloco_1:
   # ################################
   cmpw $30, %r9w # j <= 30 && k >= 20   
   jge end_AND_if
   
   cmpw $20, %r10w 
   jge end_AND_if
   
   # Bloco_AND_if
      movb %r11b, %bl
      
      movb $2, %cl
      movzbw %bl, %ax
      divb %cl
      
      movb %al, %r11b

   end_AND_if:
   
   cmpw $20, %r10w # k > 20 || (AND)
   jg Bloco_2
   
   cmpw $20, %r8w  # AND: (i <= 20
   jle end_Bloco_2
   
   cmpw $30, %r9w  # AND: j <= 30)
   jle end_Bloco_2

   Bloco_2:

      addb $100, %r11b # r = r + 100;

   end_Bloco_2:

   movzbl %r11b, %eax # print
   call print_eax_as_uint

   movl $0, %eax

   leave

   ret
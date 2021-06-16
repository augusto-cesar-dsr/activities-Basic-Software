.data
    # Definição da variável 'str' aqui...
    
    .globl str
    str: .byte 'B', 'E', 'B', 'A', 'M', 'U', 'I', 'T', 'O', 'C', 'A', 'F', 'E' # string termina com '\0'





.text

.globl process

process:

   pushq %rbp

   movq  %rsp, %rbp



   # Inicialização de 'ptr' aqui...
    movq $str, %r8 # registrador recebe o endreço inicial do vetor
   # ptr = str



beginwhile:

    cmpb $0, (%r8)

    je endwhile            # while() {

        addb $32, (%r8) # valor do endereço de memoria do registrador recebe +32
        incq %r8        # registrador avança uma posição
    # Bloco do while



    jmp beginwhile         # }

endwhile:



   leave

   ret
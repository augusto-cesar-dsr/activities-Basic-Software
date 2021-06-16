1. A função abaixo faz um “dump” de uma região de memória:

        #include <stdio.h>



        void dump(void *addr, int n) {

            unsigned char *p = addr;

            while (n--) {

            printf("%p - %02x\n", p, *p);

            p++;

            }

        }

Essa função dump() mostra uma sequência de posições de memória, exibindo, para cada posição, o seu endereço e o seu conteúdo (em hexadecimal). O parâmetro "addr" é o endereço inicial a ser mostrado e "n" é o número de bytes.

Um exemplo de uso da função dump() é dado abaixo, mostrando como um inteiro é armazenado na memória: 

    int main() {

        int i = 10000;

        dump(&i, sizeof(i));

        return 0;

    }

Faça as seguintes atividades:

(a) Crie um arquivo em C contendo as funções dump() e main(). Compile e execute o programa. Explique detalhadamente o resultado desse programa. Experimente, se necessário, outros valores para "i".

        ### mostra o endereço de memoria de cada byte usado, e o que está nele.
        arquiterura litle andie

(b) Altere a função main(), trocando o tipo da variável 'i' para long.

        ### a quantidade de bytes mostrados aumenta 

(c) Altere a função main(), trocando o tipo da variável 'i' para short.

        ### apenas 2 bytes são mostrados

(d) Altere a função main(), trocando o tipo da variável 'i' para char. Lembre-se que uma variável do tipo 'char' armazena um valor inteiro.

        ### mostra apenas 1 byte

Obs: Fique atento à faixa de valores que pode ser armazenada no tipo char. Experimente atribuir a essa variável tanto um caractere como o valor do código ASCII correspondente, por exemplo, faça um teste atribuindo primeiro o caractere 'a' e depois com 97.

(e) A mesma técnica pode ser usada para vermos como uma string é armazenada.

Faça o teste com a main() abaixo e depois modifique-a para descobrir os códigos ASCII dos caracteres 'A', ' ', '\n' e '$'.

int main() {

  char p[] = "7509";

  dump(p, sizeof(p));

  return 0;

}

        0x7ffec6bfb623 - 37
        0x7ffec6bfb624 - 35
        0x7ffec6bfb625 - 30
        0x7ffec6bfb626 - 39
        0x7ffec6bfb627 - 00  
2. Compile e execute o seguinte programa:

        #include <ctype.h>

        #include <stdio.h>



        int string2num(char *s) {

            int a = 0;

            for ( ; *s; s++)

                a = a*10 + (*s - '0');

            return a;

        }



        int main () {

            printf("==> %d\n", string2num("1234"));

            printf("==> %d\n", string2num("1234") + 1);

            printf("==> %d\n", string2num("1234") + string2num("1"));

            return 0;

        }

Faça as seguintes atividades:

(a) Procure entender como funciona a função string2num. Mande imprimir o valor de "*s" e de "a" a cada iteração do for, ambos com "%d". O que está acontecendo? O que será o valor de "(*s - '0')" a cada iteração?

    ### ela está trazendo os valores escritos para inteiros, (*s - '0') e o mesmo q eu pegar um caractere e seu codigo em decimal e subtrair o valor 30 dele

(b) Modifique a função string2num do exercício anterior para converter strings contendo numerais escritos em qualquer base entre 2 e 10. A base em que o numeral está escrito deverá ser dada como um segundo parâmetro (do tipo int) para a função.  O retorno de string2num deve ser um int na base 10.

    basta na linha onde a = a*10 +(*s - '0')
    trocar por a = a*k + (*s - '0')

Teste sua função com as chamadas abaixo: 

printf("%d\n", string2num("777", 8));
printf("%d\n", string2num("777", 10));

(c) Modifique novamente a função string2num para aceitar bases maiores que 10. Nesse caso, precisamos de “dígitos” para os valores a partir de 10. Use as letras a-z para isso, com “a” representando o “dígito” 10, “b” representando 11, e assim por diante, até “z” representando o “dígito” 35. (Qual a maior base que podemos usar com esse esquema?)

Dica: talvez as funções isdigit() ou isalpha() possam ser úteis.

    certo nesta parte tive que colocar dois if's um para verificar se era digito e outro para ver se a letra era maior que 96
    ficando assim
    
    if (isdigit(*s)) a = a*k + (*s - '0');
    else if(*s > 96) a = a*k + (*s - 87);
    else a = a*k + (*s - 55);


Teste sua função com as chamadas abaixo:

printf("%d\n", string2num("1a", 16));
printf("%d\n", string2num("a09b", 16));
printf("%d\n", string2num("k09b", 36));
# Laboratório - 25 _ 28 de Maio de 2021

### Aquecimento
O programa abaixo, composto de três arquivos, mostra na saída padrão (ou seja, mostra na tela) o conteúdo de um arquivo passado como parâmetro.

### copia.h

    #ifndef COPIA_H



    #include <stdlib.h>



    //----------------------------------------------------------------------------

    // Considere:

    //   * size_t  -> unsigned long

    //   * ssize_t -> long



    struct handler_s {

        int fd;

        size_t size;

        char *buffer;

    };



    typedef struct handler_s handler_t;



    void myopen(handler_t *h, const char *filename, int flags);

    int myclose(handler_t *h);

    ssize_t myread(handler_t *h);

    ssize_t mywrite(handler_t *h, size_t count);



    #endif

    copia.c

    #include <stdlib.h>

    #include <stdio.h>

    #include <fcntl.h>

    #include <unistd.h>



    #include "copia.h"



    //----------------------------------------------------------------------------

    // Considere:

    //   * size_t  -> unsigned long

    //   * ssize_t -> long



    void myopen(handler_t *h, const char *filename, int flags){

        h->fd = open(filename, flags);

    }



    ssize_t myread(handler_t *h){

        return read(h->fd, h->buffer, h->size);

    }



    ssize_t mywrite(handler_t *h, size_t count){

        return write(h->fd, h->buffer, count);

    }



    int myclose(handler_t *h){

        return close(h->fd);

    }

### main.c

    #include <stdlib.h>

    #include <stdio.h>

    #include <fcntl.h>

    #include <unistd.h>



    #include "copia.h"



    //----------------------------------------------------------------------------

    // Considere:

    //   * size_t  -> unsigned long

    //   * ssize_t -> long



    #define TAM 128



    int main (int argc, char** argv){

        char buf[TAM];

        ssize_t len;



        handler_t input;

        handler_t output;



        // Input será do arquivo

        input.buffer = buf;

        input.size = TAM;



        // Output é para a tela

        // Compartilha o buffer com a entrada

        output.fd = STDOUT_FILENO;

        output.buffer = buf;

        output.size = TAM;



        if (argc != 2) {

                fprintf(stderr, "Usage: %s <nome_arquivo>\n", argv[0]);

                return 1;

        }



    // Abre o arquivo

    myopen(&input, argv[1], O_RDONLY);

        if (input.fd < 0) {

                perror("[ERRO] Falha na abertura do arquivo: ");

                return 1;

        }



    // Exibe o conteúdo do arquivo na tela

        while ((len = myread(&input)) > 0) {

                if (mywrite(&output, len) != len) {

                    perror("[ERRO] Falha na escrita do arquivo: ");

                    return 1;

                }

        }



    myclose(&input);



    return 0;

    }

Analisando o programa, vemos que a função main() chama quatro funções definidas no arquivo "copia.c": myopen(), myread(), mywrite() e myclose().

Cada uma dessas funções é implementada fazendo uma chamada ao SO (sistema operacional), na verdade, uma chamada a uma função wrapper, provida pela biblioteca padrão de C.

Caso tenha dúvida nas chamadas ao SO, use o manual do Linux (na seção 2) para ver a documentação das funções de acesso à arquivo. Basta escrever no terminal:

    $ man 2 open

    $ man 2 close

    $ man 2 write

    $ man 2 read

Obs: Para sair do manual, pressione “q” (de quit).

Compile e execute o programa, testando com alguns arquivos de entrada.

    $ gcc -o copia copia.c main.c

    $ ./copia main.c

    $ ./copia copia.h

1 ─ Crie o arquivo "copia.S" e reimplemente em Assembly as funções do arquivo "copia.c": myopen(), myread(), mywrite() e myclose().

As funções Assembly não devem chamar as funções da biblioteca de C (open, read, write, close), elas devem fazer chamadas diretas ao SO.

Comece substituindo uma função em C por vez, por exemplo, comente a função C myopen() e crie essa função em Assembly. Compile o programa usando o comando abaixo:

    $ gcc -o copia copia.c copia.S main.c

Quando todas as funções forem traduzidas, não é mais necessário o "copia.c":

    $ gcc -o copia copia.S main.c

Para saber mais sobre as chamadas ao sistema, consulte o link para a tabela de syscalls disponível na Turing. Com isso você saberá o código , quais devem ser os parâmetros para chamar o SO e o retorno.
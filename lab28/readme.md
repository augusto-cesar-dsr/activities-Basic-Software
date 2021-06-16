# Laboratório - 28 _ 11 de Junho de 2021

1 ─ Crie dois diretórios, "lib" e "main".

Separe o código C abaixo em "greeting.c" e "greeting.h" (que darão origem a biblioteca "libgreeting"), colocando no diretório "lib". Depois crie um arquivo “prog.c” contendo a main() (que chamará as funções da biblioteca), colocando no diretório "main".

Note que a função show_prefix() é interna, e não será exportada pela biblioteca.


# code

    #include <stdio.h>

    #include <string.h>



    char prefix[128];



    void show_prefix()

    {

      printf("%s", prefix);

    }



    void say_good_evening()

    {

      show_prefix();

      printf("Good evening\n");

    }



    void say_good_morning()

    {

      printf("Good morning\n");

    }



    int main()

    {

      say_good_morning();

      

      strcpy(prefix, "*** ");

      say_good_evening();



      strcpy(prefix, "[INFO] ");

      say_good_evening();



      return 0;

    }


** Compile o codigo de bibliotecas usando
    
    ─ dinamica 
      gcc -fPIC -c <arquivo>.c
      gcc -shared -o lib<arquivo>.so <arquivo>.o
    
    ─ statica
      gcc -c <arquivo>.c
      ar -rc lib<arquivo>.a <arquivo>.o
      ranlib lib<arquivo>.a
    
    ─ programa principal

    ─ ambos compilados com
      gcc -I<path_biblioteca_header> -L<path_biblioteca_com_func> -o <executavel_name> <arquivo_main>.c
    
    ─ caso estiver usando dinamica crie a variavel ambiente:
      export LD_LIBRARY_PATH="<diretorio>"


2 ─ Vá até o diretório "lib" e crie uma biblioteca estática “libgreeting.a” e instale no diretório “/tmp/greeting/static”.

Lembre-se que a instalação é composta dos arquivos “greeting.h” e “libgreeting.a”.

3 ─ Vá até o diretório "lib" e crie uma biblioteca dinâmica “libgreeting.so” e instale no diretório “/tmp/greeting/dynamic”.

Lembre-se que a instalação é composta dos arquivos “greeting.h” e “libgreeting.so”.

4 ─ Liste a tabela de símbolos das bibliotecas geradas com a ferramenta “nm”.

Qual a diferença entre as funções say_good_morning() e show_prefix()?

5 ─ Vá até o diretório "main" e crie um executável, usando “prog.c” e a biblioteca estática "greeting", com o nome "prog-static", depois execute o programa.

6 ─ Vá até o diretório "main" e crie um executável e crie um executável, usando “prog.c” e a biblioteca dinâmica "greeting", com o nome "prog-dynamic", depois execute o programa.

7 ─ Utilize a ferramenta “nm” nos dois programas e compare a situação da função say_good_morning() em ambos. Explique a diferença.

8 ─ Utilize a ferramenta "ldd" nos dois programas. Quais são as bibliotecas dinâmicas que esses programas precisam para serem executados?

9 ─ Modifique a função say_good_morning(), trocando a linha

    printf("Good morning\n");

por

    printf("Good morning!!!!!!!!\n");

Agora crie novamente as bibliotecas estática e dinâmica e as instale novamente nos diretório respectivos diretórios "/tmp/greenting/static" e "/tmp/greeting/dynamic".

Execute novamente os programas (não é necessário recompilar os programas novamente, somente executá-los).

Houve diferença? Por quê?
# Laboratório - 18 _ 04 de Maio de 2021

1 ─ Traduza apenas o arquivo "fat.c" para Assembly (arquivo “fat.S”) o mais literal possível. 

Obs: Comente o seu código!

### fat.c

    int fat (int n) {

        if (n > 0)

            return fat(n-1) * n;

        return 1;  

    }

### main01.c

    #include <stdio.h>



    int fat(int n);



    int main (void) {

        printf("%d\n", fat(5));

        return 0;

    }

Compile os dois arquivos juntos e depois execute “fat”:

    gcc -no-pie -o fat fat.S main01.c

2 ─ Traduza apenas o arquivo "main02.c" para Assembly (arquivo “main02.S”) o mais literal possível. 

Obs: Comente o seu código!

### sum.c

    #include <stdlib.h>

    #include <stdio.h>



    void sum(short *a1, int p1, long *a2, int p2) {

        p1 = (int)a1[p1] + 1;

        p2 = (int)a2[p2] + 1;

        printf("%d\n", p1 + p2);

    }

### main02.c

    short v1[2] = {1, 2};

    long  v2[3] = {1, 2, 3};



    void sum(short *a1, int p1, long *a2, int p2);



    void aux(short *a1, int p1) {

        int i;

        for (i = 2; i >= 0; i--)

            sum(a1, p1, v2, i);

    }



    int main() {

        int i = 0;

        while (i < 2) {

            aux(v1, i);

            i++;

        }

        return 0;

    }

Compile os dois arquivos juntos e depois execute “aux”:

    gcc -no-pie -o sum sum.c main02.S
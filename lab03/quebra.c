#include <stdio.h>

//cod do prof
int is_little(){
    int  i = 1;
    return (*((char *) &i));
}

/*
//meu codigo
int is_little(){
    int  i = 1;
    char *p;
    p  = (char *) &i;
    //printf("%d\n", *p);
    if (*p == 1){
        return 1;
    }
    else return 0;
}*/



int main () {

  if (is_little())

    printf("Little-endian\n");

  else

    printf("Big-endian\n");

  return 0;

}
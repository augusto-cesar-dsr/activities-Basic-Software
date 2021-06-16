#include <ctype.h>

#include <stdio.h>



void num2string(int num, int base, char *resp){
    int cont=0, i=0;
    char a[128] = {0};
    
    if (base<=9){
        while (num!=0){
            a[cont] = ((num%base) + '0');
            //printf("%c",a[cont]);
            num = num/base;
            cont++;
        }
        
    }else{
        while(num!=0){
            if((num%base)<=9){
                a[cont] = ((num%base) + '0');
            }
            else{
                a[cont] = ((num%base) + 'a' - 10);
            }
            num = num/base;
            cont++;
        }
    }
    cont--;
    while(cont>=0){
        resp[i] = a[cont];
        //printf("%c",resp[i]);
        cont--;
        i++;
    }
    resp[i]=0;
    //printf("\n");

}



int main () {

  char buf[128] = {0};
  

  num2string(1, 2, buf);

  printf("==> %s\n", buf);


  num2string(2, 16, buf);

  printf("==> %s\n", buf);

  
  num2string(31, 32, buf);

  printf("==> %s\n", buf);


  return 0;

}
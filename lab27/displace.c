#include <stdio.h>

#include <string.h>



typedef int (*FuncPtr)(int);


// unsigned char codigo[] = {

//       // 0x??, 0x??, 0x??, 0x??, ...
//       0xf3, 0x0f, 0x1e, 0xfa,
//       0x55,
//       0x48, 0x89, 0xe5,
//       0x48, 0x83, 0xec, 0x10,
//       0x89, 0x7d, 0xfc,
//       0x8b, 0x45, 0xfc,
//       0x89, 0xc7,
//       0xe8, 0x00, 0x00, 0x00, 0x00,
//       0xc9, 
//       0xc3

//   };

int sum(int v) {

  return v+2;

}



int mul(int v) {

  return 2*v;

}



int main()

{

  int i, d, *loc;
  
  long PC;
  long addr;

  FuncPtr f;

  

   //---------------------------------------



   // Alterar "calc" para chamar a função "sum"



   //---------------------------------------
  unsigned char codigo[] = {

      // 0x??, 0x??, 0x??, 0x??, ...
      0xf3, 0x0f, 0x1e, 0xfa,
      0x55,
      0x48, 0x89, 0xe5,
      0x48, 0x83, 0xec, 0x10,
      0x89, 0x7d, 0xfc,
      0x8b, 0x45, 0xfc,
      0x89, 0xc7,
      0xe8, 0x00, 0x00, 0x00, 0x00,
      0xc9, 
      0xc3

  };

  PC = (long) &codigo[25]; // pegando o endereço da posição em linha da proxima execução
  addr = (long) &sum; // pegando posição da função sum
  
  d = (int) (addr-PC); // pegando distancia entre funções
  // printf("%d\n", d); 
  loc = (int *) &codigo[21]; // pegando o endereço da primeira posição onde vai o inteiro da distancia
  *loc = d; // atribuido o inteiro (trocando os 0x00 pelo inteiro)

   // Chama a função "calc"

   f = (FuncPtr)codigo;

   i = f(10);

   printf("%d\n", i);



   //---------------------------------------



   // Alterar "calc" para chamar a função "mul"



   //---------------------------------------

  PC = (long) &codigo[25]; // pegando o endereço da posição em linha da proxima execução
  addr = (long) &mul; // pegando posição da função mul
  
  d = (int) (addr-PC); // pegando distancia entre funções
  // printf("%d\n", d); 
  loc = (int *) &codigo[21]; // pegando o endereço da primeira posição onde vai o inteiro da distancia
  *loc = d; // atribuido o inteiro (trocando os 0x00 pelo inteiro)


  // Chama a função "calc"

  f = (FuncPtr)codigo;

  i = f(10);

  printf("%d\n", i);



   return 0;

}
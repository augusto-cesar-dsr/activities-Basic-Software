#include <stdio.h>



/* Teste com diferentes vetores */

int   nums[] = {10, -21, -30, 45};

//int   nums[] = {10, -21, -30,  0};

//int   nums[] = {10,   0, -30, 45};

short count = 0;



int main() {

  int i;

  for (i = 0; i < 4; i++) { // i >= 4

    if (nums[i] < 0 || nums[i] > 100)

      continue;

    if (!nums[i]) // !(num[i] != 0) // num == 0 // assembly: num[i] != 0

      break;

    if (nums[i] % 2)// 0 sai // 1 entra

      count++;

  }



  if (i != 4) // i == 4

    printf("[ERRO] Vetor possui zero\n");

  else

    printf("[INFO] Qtd números ímpares: %d\n", count);



  return 0;

}
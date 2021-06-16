int main() {

  short s;     // Deve ser registrador

  int i;

  long l;



  s = constante();

  init(s, &l, &i);



  printf("Soma: %ld\n", l + i + s);



  return 0;

}
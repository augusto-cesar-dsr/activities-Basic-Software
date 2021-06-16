#ifndef COPIA_H



#include <stdlib.h>



//----------------------------------------------------------------------------

// Considere:

//   * size_t  -> unsigned long

//   * ssize_t -> long



struct handler_s {

  int fd; // 4 

  size_t size; // 8

  char *buffer; // 8

}; // 24



typedef struct handler_s handler_t;



void myopen(handler_t *h, const char *filename, int flags);

int myclose(handler_t *h);

ssize_t myread(handler_t *h);

ssize_t mywrite(handler_t *h, size_t count);



#endif
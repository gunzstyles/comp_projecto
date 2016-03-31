#ifndef FUNCTIONS_H_INCLUDED
#define FUNCTIONS_H_INCLUDED

#include "Structures.h"


No *criaNo(noTipo type, char *value);
No *adicNo(noTipo type, No *filho);
No *criaIrmao(No *no1, No *no2);

#endif /* FUNCTIONS_H_INCLUDED */

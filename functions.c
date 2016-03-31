#include "Structures.h"
#include "functions.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


No *alocaNo(){
	No *no = (No *)malloc(sizeof(No));

	no->type  = Null;
	no->value = NULL;
	no->filho = NULL;
	no->irmao = NULL;

	return no;
}

No *criaNo(noTipo type, char *value){
	No *no = alocaNo();

	no->type = type;
	no->value = value;

	return no;
}

No *adicNo(noTipo type, No *filho){
	No *no = alocaNo();

	no->type = type;
	no->filho = filho;

	return no;
}

No *criaIrmao(No *no1, No *no2){
	No *current = no1;

	if (no1 == NULL)
		return no2;

	while (current->irmao != NULL)
		current=current->irmao;
	
	current->irmao = no2;

	return no1;
}


#ifndef STRUCTURES_H_INCLUDED
#define STRUCTURES_H_INCLUDED


typedef enum {
	Program, /* No raiz */
	Declaration, /* Declaracao de variaveis */
	ArrayDeclaration,
	FuncDeclaration, /* Declaracao . definicao de funcoes */
	FuncDefinition,
	ParamList,
	FuncBody,
	ParamDeclaration,
	StatList, /* Statements */
	If,
	For,
	Return,
	Or, /* Operadores */
	And,
	Eq,
	Ne,
	Lt,
	Gt,
	Le,
	Ge,
	Add,
	Sub,
	Mul,
	Div,
	Mod,
	Not,
	Minus,
	Plus,
	Addr,
	Deref,
	Store,
	Comma,
	Call,
	Char, /* Terminais */
	ChrLit,
	Id,
	Int,
	IntLit,
	Pointer,
	StrLit,
	Void,
	Null /* Especial */
} noTipo;

typedef struct no{
	noTipo type;
	char *value;
	struct no *filho;
	struct no *irmao;
}No;



#endif /* STRUCTURES_H_INCLUDED */

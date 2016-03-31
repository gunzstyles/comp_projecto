#include "Structures.h"
#include "functions.h"
#include <stdio.h>
#include <stdlib.h>

char *search(noTipo type);

void print_no(No *treeNode, int nivel){
	int i;


	if(treeNode!=NULL ){
		for(i=0;i<nivel;i++)
			printf("..");

		printf("%s", search(treeNode->type));
		if(treeNode->value!=NULL)
			printf("(%s)", treeNode->value);
		printf("\n");


		print_no(treeNode->filho, nivel+1);
		print_no(treeNode->irmao, nivel);
	}
}

/*conformizar com a structure */
char *search(noTipo type){
	switch(type){
		case Program:
			return "Program";
		case VarPart:
			return "VarPart";
		case VarDecl:
			return "VarDecl";
		case VarParams:
			return "VarParams";
		case FuncParams:
			return "FuncParams";
		case FuncPart:
			return "FuncPart";
		case FuncDecl:
			return "FuncDecl";
		case FuncDef:
			return "FuncDef";
		case FuncDef2:
			return "FuncDef2";
		case Params:
			return "Params";
		case Assign:
			return "Assign";
		case If:
			return "If";
		case Else:
			return "Else";
		case IfElse:
			return "IfElse";
		case Repeat:
			return "Repeat";
		case StatList:
			return "StatList";
		case ValParam:
			return "ValParam";
		case While:
			return "While";
		case WriteLn:
			return "WriteLn";
		case Add:
			return "Add";
		case And:
			return "And";
		case Call:
			return "Call";
		case Div:
			return "Div";
		case Eq:
			return "Eq";
		case Geq:
			return "Geq";
		case Gt:
			return "Gt";
		case Leq:
			return "Leq";
		case Lt:
			return "Lt";
		case Minus:
			return "Minus";
		case Mod:
			return "Mod";
		case Mul:
			return "Mul";
		case Neq:
			return "Neq";
		case Not:
			return "Not";
		case Or:
			return "Or";
		case Plus:
			return "Plus";
		case RealDiv:
			return "RealDiv";
		case Sub:
			return "Sub";
		case Id:
			return "Id";
		case IntLit:
			return "IntLit";
		case RealLit:
			return "RealLit";
		case String:
			return "String";
		case Null:
			return "Null";
		default:
			return "Not Defined";
	}
	return "";
}

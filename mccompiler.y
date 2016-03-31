%{

    #include <stdio.h>
    #include <string.h>

    #include "functions.h"
    #include "Print.h"


    extern int ncolum, nline;
    extern char* yytext;

    void yyerror (char *s);
    int yylex();

    No *tree = NULL;
	/*VER ESTA PARTE TODA DAQUI PARA A FRENTE ATÉ AO MAIN */
    %}


%union {
    char* string;
    No *node;
}

%token  ASSIGN BEGIN1 COLON COMMA DO DOT ELSE END FORWARD FUNCTION IF LBRAC NOT OUTPUT PARAMSTR PROGRAM RBRAC REPEAT
%token  SEMIC THEN UNTIL VAL VAR WHILE WRITELN AND OR
%token  LT GT EQ NEQ LEQ GEQ PLUS MINUS MULT REALDIV MOD DIV RESERVED

%start start

%type <node> start prog progheading progblock varpart optvarpart vardeclaration idlist optidlist funcpart funcdeclaration funcheading funcident formalparamlist optformalparlist formalparams funcblock statpart compstat statlist optstatlist stat writelnplist optwriteplist expr simpleexpr term factor paramlist optparamlist

%token <string> ID
%token <string> INTLIT
%token <string> REALLIT
%token <string> STRING

%right  ASSIGN
%left   EQ NEQ LT GT LEQ GEQ
%left   PLUS MINUS OR
%left   MULT REALDIV DIV MOD AND
%right  NOT 
%left   RBRAC LBRAC 
%right  THEN ELSE

%%

%%

int main(int argc,const char *argv[]){
    yyparse();
    int i;

    int show_ast = 0;

    for(i = 0; i < argc; i++){
        if(strcmp(argv[i], "-t") == 0)
        show_ast = 1;
    }

    if(show_ast == 1 && tree != NULL)
    print_no(tree, 0);

    return 0;
}

void yyerror (char *s) {
    ncolum=ncolum-strlen(yytext);
    printf ("Line %d, col %d: %s: %s\n", nline, ncolum, s, yytext);

}

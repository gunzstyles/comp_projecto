
lettersSmall= [a-z]+
lettersBig= [A-Z]+
numbers = [0-9]*
limited_numbers = [0-7]

%%
    
id = {"_" | lettersBig | lettersSmall} {"_" | lettersBig | lettersSmall | numbers}* {printf("ID\n");}

{numbers}        {printf("INTLIT(%s)\n", yytext);}


"&"               {printf("AMP\n");}
"&&"              {printf("AND\n");}
"="               {printf("ASSIGN\n");}
"*"               {printf("AST\n");}
"char"            {printf("CHAR\n");}
","               {printf("COMMA\n");}
"/"               {printf("DIV\n");}
"else"            {printf("ELSE\n");}
"for"             {printf("FOR\n");}  

">="              {printf("GE\n");}
">"               {printf("GT\n");}
"if"              {printf("IF\n");}
"int"             {printf("INT\n");}
"{"               {printf("LBRACE\n");}
"<="              {printf("LE\n");}
"("               {printf("LPAR\n");}
"["               {printf("LSQ\n");}
 
"<"               {printf("LT\n");}
 
"-"               {printf("MINUS\n");}
"%"               {printf("MOD\n");}
 
"!="              {printf("NE\n");}
"!"               {printf("NOT\n");}
"||"              {printf("OR\n");}
"+"               {printf("PLUS\n");}
"}"               {printf("RBRACE\n");}
"return"          {printf("RETURN\n");}
")"               {printf("RPAR\n");}
 
"]"               {printf("RSQ\n");}
 
";"               {printf("SEMI\n");}
"void"            {printf("VOID\n");}

"while"|"++"|"--"|"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"long"|"register"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"double"|"enum"|"extern"|"float"|"goto" {printf("RESERVED\n");}


%%
int main(){

yylex();
return 0;
}

int yywrap(){
return 1;
}


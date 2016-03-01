lettersSmall[a-z]
lettersBig[A-Z]
numbers[0-9]
limited_numbers[0-7]

%%

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
\n                
" "               
\t                


"while"|"++"|"--"|"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"long"|"register"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"double"|"enum"|"extern"|"float"|"goto"                                                                {printf("RESERVED(%s)\n", yytext);}

    
("_"|{lettersSmall}|{lettersBig})("_"|{lettersSmall}|{lettersBig}|{numbers})*                                   {printf("ID(%s)\n", yytext);}
{numbers}+                                                                                                      {printf("INTLIT(%s)\n", yytext);}
"\'"{numbers}|{lettersSmall}|{lettersBig}|"\\n"|"\\t"|"\\\\"|"\\\'"|"\\\""|("\\"{limited_numbers}{1,3})"\'"     {printf("CHRLIT(%s)\n", yytext);}

    
%%
int main(){

yylex();
return 0;
}

int yywrap(){
return 1;
}


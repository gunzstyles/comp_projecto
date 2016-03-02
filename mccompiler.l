%option yylineno

%x COMMENT

%{
  #include <string.h>
  #include <stdlib.h>
  #include <stdio.h>

  int n_line;
  int n_column = 1;
%}

lettersSmall[a-z]
lettersBig[A-Z]
numbers[0-9]
limited_numbers[0-7]

CHRLIT            \'([a-zA-Z]|\\n|\\t|\\\\|\\\'|\\\"|\\({limited_numbers}{1,3})|.)\'
STRLIT            \"([a-zA-Z]|{numbers}|\\n|\\t|\\\\|\\\'|\\\"|\\({limited_numbers}{1,3})|.)*\"
ID                ("_"|{lettersSmall}|{lettersBig})("_"|{lettersSmall}|{lettersBig}|{numbers})* 

%%
"/*"              {BEGIN COMMENT; n_line=yylineno; n_column-=yyleng;}
<COMMENT>"*/"     {BEGIN 0;}
<COMMENT>.        {n_column += yyleng;}
<COMMENT>"\n"     {n_column = 1;}
<COMMENT><<EOF>>  {printf("Line %d, col %d: untermined comment\n", n_line, n_column); BEGIN 0;}
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
\n                {n_column=1;}
" "               {n_line+=1;}
\t                {n_line+=1;}


"while"|"++"|"--"|"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"long"|"register"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"double"|"enum"|"extern"|"float"|"goto"         {printf("RESERVED(%s)\n", yytext);}

    
{ID}              {printf("ID(%s)\n", yytext);}
{numbers}+        {printf("INTLIT(%s)\n", yytext);}
{CHRLIT}          {printf("CHRLIT(%s)\n",yytext);}
{STRLIT}          {printf("STRLIT(%s)\n",yytext);}
    
%%
int main(){

yylex();
return 0;
}

int yywrap(){
return 1;
}


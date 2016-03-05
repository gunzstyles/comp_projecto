%option yylineno

%x COMMENT

%{
  int n_line = 1;
  int n_column = 1;
  int flag = 0;
  int comment_line;
  int comment_column;
%}

letters[a-zA-Z]
numbers[0-9]
limited_numbers[0-7]
esc_sequence      \\n|\\t|\\\\|\\\'|\\\"|(\\{limited_numbers}{limited_numbers}?{limited_numbers}?)

CHRLIT            \'([^\n\'\\]|{esc_sequence})\'
UNTER_CHAR        \'([^\\\n\']|{esc_sequence})*\\*[^\n\']*
INVALID_CHAR      \'(\\.|[^\\\'\n])*\'    
    
STRLIT            \"([^\n\"\\]|{esc_sequence})*\"
UNTER_STR         \"([^\n\"]|{esc_sequence}|(\"\\\"))*
INVALID_STR       \"(\\.|[^\n\"\\])*\"   
ID                ("_"|{letters})("_"|{letters}|{numbers})* 

%%

"&"               {if(flag==1)printf("AMP\n");n_column+=yyleng;}
"&&"              {if(flag==1)printf("AND\n");n_column+=yyleng;}
"="               {if(flag==1)printf("ASSIGN\n");n_column+=yyleng;}
"*"               {if(flag==1)printf("AST\n");n_column+=yyleng;}
"char"            {if(flag==1)printf("CHAR\n");n_column+=yyleng;}
","               {if(flag==1)printf("COMMA\n");n_column+=yyleng;}
"/"               {if(flag==1)printf("DIV\n");n_column+=yyleng;}
"else"            {if(flag==1)printf("ELSE\n");n_column+=yyleng;}
"=="              {if(flag==1)printf("EQ\n");n_column+=yyleng;}
"for"             {if(flag==1)printf("FOR\n");n_column+=yyleng;}  

">="              {if(flag==1)printf("GE\n");n_column+=yyleng;}
">"               {if(flag==1)printf("GT\n");n_column+=yyleng;}
"if"              {if(flag==1)printf("IF\n");n_column+=yyleng;}
"int"             {if(flag==1)printf("INT\n");n_column+=yyleng;}
"{"               {if(flag==1)printf("LBRACE\n");n_column+=yyleng;}
"<="              {if(flag==1)printf("LE\n");n_column+=yyleng;}
"("               {if(flag==1)printf("LPAR\n");n_column+=yyleng;}
"["               {if(flag==1)printf("LSQ\n");n_column+=yyleng;}
 
"<"               {if(flag==1)printf("LT\n");n_column+=yyleng;}
 
"-"               {if(flag==1)printf("MINUS\n");n_column+=yyleng;}
"%"               {if(flag==1)printf("MOD\n");n_column+=yyleng;}
 
"!="              {if(flag==1)printf("NE\n");n_column+=yyleng;}
"!"               {if(flag==1)printf("NOT\n");n_column+=yyleng;}
"||"              {if(flag==1)printf("OR\n");n_column+=yyleng;}
"+"               {if(flag==1)printf("PLUS\n");n_column+=yyleng;}
"}"               {if(flag==1)printf("RBRACE\n");n_column+=yyleng;}
"return"          {if(flag==1)printf("RETURN\n");n_column+=yyleng;}
")"               {if(flag==1)printf("RPAR\n");n_column+=yyleng;}
 
"]"               {if(flag==1)printf("RSQ\n");n_column+=yyleng;}
 
";"               {if(flag==1)printf("SEMI\n");n_column+=yyleng;}
"void"            {if(flag==1)printf("VOID\n");n_column+=yyleng;}
\n                {n_column=1; n_line+=1;}
\t                {n_column+=yyleng;}
" "               {n_column+=1;}


"while"|"++"|"--"|"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"long"|"register"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"volatile"|"double"|"enum"|"extern"|"float"|"goto"         {if(flag==1)printf("RESERVED(%s)\n",yytext);n_column+=yyleng;}

    
"/*"              {BEGIN COMMENT;comment_line=yylineno;comment_column=n_column;n_column+=yyleng;}
<COMMENT>"*/"     {BEGIN 0;n_column+=yyleng;}
<COMMENT><<EOF>>  {printf("Line %d, col %d: unterminated comment\n",comment_line,comment_column);BEGIN 0;}
<COMMENT>.        {n_column += yyleng;}
<COMMENT>"\n"     {n_line+=1;n_column =1;}

{ID}              {if(flag==1)printf("ID(%s)\n", yytext);n_column+=yyleng;}
{numbers}+        {if(flag==1)printf("INTLIT(%s)\n", yytext);n_column+=yyleng;}

{CHRLIT}          {if(flag==1)printf("CHRLIT(%s)\n",yytext);n_column+=yyleng;}
{UNTER_CHAR}      {printf("Line %d, col %d: unterminated char constant\n",n_line,n_column);n_column+=yyleng;}
{INVALID_CHAR}    {printf("Line %d, col %d: invalid char constant (%s)\n", n_line, n_column, yytext); n_column += yyleng;}

{STRLIT}          {if(flag==1)printf("STRLIT(%s)\n",yytext);n_column+=yyleng;}
{UNTER_STR}       {printf("Line %d, col %d: unterminated string constant\n", n_line, n_column); n_column += yyleng;}
{INVALID_STR}     {printf("Line %d, col %d: invalid string constant (%s)\n", n_line, n_column,yytext); n_column += yyleng;}                   
.                 {printf("Line %d, col %d: illegal character (%s)\n",n_line,n_column,yytext);n_column+=yyleng;}


%%
int main(int argv, char **argc){
if(argv>1){
    if(strcmp(argc[1],"-l")==0){
        flag = 1;
    }
}
yylex();
return 0;
}

int yywrap(){
return 1;
}


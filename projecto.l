%%
AMP = "&" AND = "&&" ASSIGN = "=" AST = "*" CHAR = char COMMA = "," DIV = "/" ELSE = else EQ = "==" FOR = for
GE = ">="
GT = ">"
IF = if
INT = int LBRACE = "{" LE = "<=" LPAR = "(" LSQ = "["
LT = "<"
MINUS = "-" MOD = "%"
NE = "!="
NOT = "!"
OR = "||"
PLUS = "+" RBRACE = "}" RETURN = return RPAR = ")"
RSQ = "]"
SEMI = ";"
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
 
"]"               {printf("RSQ\n");}
 
";"               {printf("SEMI\n");}

%%
int main(){

yylex();
return 0;
}

int yywrap(){
return 1;
}


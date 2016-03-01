lex mccompiler.l
cc -o mccompiler lex.yy.c
./mccompiler -l < simple.mc
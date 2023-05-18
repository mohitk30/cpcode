%{
   /* Definition section */
  #include<stdio.h>
  #include<string.h>
  #include "prog2.tab.h"
  // extern int yylval;
%}
  
/* Rule Section => flex orog2.l => bison -d prog1_y.y  => gcc lex.yy.c prog1_y.tab.c -lm*/
/* [0-9]+ { yylval=atoi(yytext);  return NUMBER; }*/

%%

 
"&"    { return AND; }
"|"    { return OR; }
"!"     { return NOT; }
"=="    { return EQ; }
"!="    { return NEQ; }
"("     { return LPAREN; }
")"     { return RPAREN; }
[a-zA-Z]+ { yylval.id = strdup(yytext); return IDENTIFIER; }
[ \t\n]  { /* Ignore whitespace */ }

%%

int yywrap() {
    return 1;
}
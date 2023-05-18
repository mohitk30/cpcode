%{
   /* Definition section */
  #include<stdio.h>
  #include<string.h>
  #include "prog2.tab.h"
  extern int yylval;
%}
  
/* Rule Section */
/* [0-9]+ { yylval=atoi(yytext);  return NUMBER; }*/

%%

void {return VOID;}
int  {return INT;}
float {return FLOAT;}
double {return DOUBLE;}
char {return CHAR;}
[a-zA-Z][a-zA-Z]* {return INDENTIFIER;}
[0-9]+            {return CONSTANT;}
"*"               { return '*'; }
"["               { return '['; }
"]"               { return ']'; }
","               { return ','; }
";"               { return ';'; }
[ \t\n]           { /* skip whitespace */ }
.                 {  printf("Invalid character: %s\n", yytext);  return 0; }
  
%%
  
int yywrap()
{
 return 1;
}
 
 
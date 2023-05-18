%{
int n = 0 ;
#include <math.h>
%}

%%


"while"|"if"|"else"|"for"|"do"|"scanf"|"printf"|"int"|"char"|"float"|"switch"|"goto"|"static"|"void"|"break"|"continue"|"case"|"long" {n++;printf("'%s'\t\t keywords \n", yytext);}


[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("'%s'\t\t identifier \n", yytext);}


"<="|"=="|"="|"++"|"-"|"*"|"+"|"/"|">=" {n++;printf("'%s'\t\t operator\n", yytext);}


[(){}|,;] {n++;printf("'%s'\t\t separator \n", yytext);}


[0-9]*"."[0-9]+ {n++;printf("'%s'\t\t float \n", yytext);}


[0-9]+ {n++;printf("'%s'\t\t integer  \n", yytext);}						
[\n]  {n++;printf("%s\t\t next line  \n", yytext);};  
. ;
%%

int yywrap(){}
int main()

{
	 yyin = fopen("_input.txt", "r");
	yylex();
	
	printf("\nTotal no. of token = %d\n", n);
	
}


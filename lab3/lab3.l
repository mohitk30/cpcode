/*** Definition section ***/
%option noyywrap
%{
    #include <stdio.h>
    int n = 0 ;
    #include <math.h>
%}

 
DIGIT[0-9]
LETTER[A-Za-z]
POINT[.]
DOUBLECOMMA["]
  

%%

"while"|"if"|"else"|"for"|"do"|"scanf"|"printf"|"int"|"char"|"float"|"switch"|"goto"|"static"|"void"|"break"|"continue"|"case"|"long"                   {n++;printf("\n Keywords: \t\t%s", yytext);}
"++"|"--"|"+"|"-"|"*"|"/"|"="|"<"|"<="|">"|">="|"&"|"|"|"%"               {n++;printf("\n Operators: \t\t%s", yytext);}
"{"|"}"|"("|")"|"["|"]"|";"|","               {n++;printf("\n Delimeters: \t\t%s", yytext);}
{DIGIT}+                            {n++;printf("\n Integer: \t\t%s",yytext);}
{DIGIT}+{POINT}{DIGIT}+             {n++;printf("\n Float: \t\t%s",yytext);}
{DOUBLECOMMA}+(.)*{DOUBLECOMMA}+    {n++;printf("\n String Literals: \t%s",yytext);}
{LETTER}*({LETTER}|{DIGIT})*        {n++;printf("\n Identefier: \t\t%s",yytext);}
 \n                                 {}
 "//".*                             /* eat up one-line comments */
 [ \t\n]+                           /* eat up whitespace */
 "#".*                              {printf("\n Included Header");}

 .                                  {printf( "\n Unrecognized character: \t%s", yytext );}
 
%%

/*** C Code section ***/
int main(void)
{
    yyin = fopen("_input.c", "r");
    yylex();
    printf("\n\n Total no. of token = %d\n", n);
    return 0;
}
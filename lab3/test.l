/*** Definition section ***/
%option noyywrap
%{
    #include <stdio.h>
%}

DIGIT[0-9]
LETTER[A-Za-z]
POINT[.]

%%


{DIGIT}+                      {printf("\n Int %s",yytext);}
{DIGIT}+{POINT}{DIGIT}+             {printf("\n Float %s",yytext);}
{LETTER}*({LETTER}|{DIGIT})* {printf("\n Identefier %s",yytext);}
 \n                            {printf("\n Next Line ");}



%%
 
/*** C Code section ***/
int main(void)
{
    extern FILE *yyin, *yyout;
 
    /* yyin points to the file input.txt and opens it in read mode*/
    yyin = fopen("_input.txt", "r");
 
    /* yyout points to the file output.txt and opens it in write mode*/
    // yyout = fopen("_output.txt", "w");
    yylex();
    fclose(yyin);
    // fclose(yyout);
    return 0;
}
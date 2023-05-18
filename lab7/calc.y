%{
#include <stdio.h>
#include<stdlib.h>
extern int yylex();
void yyerror(char * s);
%}
%token A B
%%
start: s '\n' {return 0;}
    s:A s B 
    | ;

%%
void yyerror(char * s){
    printf("Error: %s\n",s);
    exit(1);
}
int main(void) {
    printf("Enter String : ");
    if( yyparse()==0){
        printf("No. of and b are equal.\n");
    } 
 return 0;
} 


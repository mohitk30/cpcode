%{

  #include<stdio.h>
  int flag=0;
  int yylex();
  void yyerror();
%}
  
%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
  
%%
  
ArithmeticExpression: E{  
   printf("Result=%d\n", $$); 
   return 0; };

E:E'+'E     {$$=$1+$3; printf("Production Rule used : E->E+E\n");}
 |E'-'E     {$$=$1-$3; printf("Production Rule used : E->E-E\n");}
 |E'*'E     {$$=$1*$3; printf("Production Rule used : E->E*E\n");}
 |E'/'E     {$$=$1/$3; printf("Production Rule used : E->E/E\n");}
 |E'%'E     {$$=$1%$3; printf("Production Rule used : E->E\n");}
 |'('E')'   {$$=$2;    printf("Production Rule used : E->(E)\n");}
 | NUMBER   {$$=$1;    printf("Production Rule used : E->id\n");}
   
 ;
  
%%
  
//driver code
void main()
{
   printf("Enter Any Arithmetic Expression : ");
   yyparse();
}
  
void yyerror()
{
   printf("Entered arithmetic expression is Invalid\n");
   flag=1;
}
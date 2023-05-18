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
   // printf("Result=%d\n", $$); 
   return 0; };

E:E'+'E     {$$=$1+$3;}
 |E'-'E     {$$=$1-$3;}
 |E'*'E     {$$=$1*$3;}
 |E'/'E     {$$=$1/$3;}
 |E'%'E     {$$=$1%$3;}
 |'('E')'   {$$=$2;}
 | NUMBER   {$$=$1;}
  
 ;
  
%%
  
//driver code
void main()
{
   printf("Enter Any Arithmetic Expression : ");
  
   yyparse();
   if(flag==0)
      printf("Entered Arithmetic expression is Valid\n");
}
  
void yyerror()
{
   printf("Entered Arithmetic expression is Invalid\n");
   flag=1;
}
%{

  #include<stdio.h>
  int flag=0;
  int yylex();
  void yyerror();
  int match=0;
%}
  
%token NUMBER

 
%left '(' ')'
  
%%


P: '(' P ')'   { match+=1;}
  | NUMBER
  ;
  
%%
  
//driver code
void main()
{
   printf("Enter Any Parenthesis Expression : ");
   yyparse();

   if( flag ==0){
      printf("Correct Parenthesis, with %d matched parenthesis.\n",match);
   }
}
  
void yyerror()
{
   printf("Entered Parenthesis expression is Invalid\n");
   flag=1;
}
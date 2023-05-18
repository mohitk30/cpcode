%{

  #include<stdio.h>
  #include<string.h>
  int flag=0;
  int yylex();
  void yyerror();
//  declaratorList : declearator
//                 ;
%}
  
%token INDENTIFIER CONSTANT ',' '*' ';' '[' ']' VOID CHAR INT FLOAT DOUBLE
%start declearetiveStatement

  
%%

declearetiveStatement: typeSpecifier declearator';'{  
   // printf("Result=%d\n", $$); 
   return 0; };

typeSpecifier  : VOID
               | CHAR
               | INT
               | FLOAT
               | DOUBLE 
               ;
  


declearator : INDENTIFIER
            | '*'INDENTIFIER
            | INDENTIFIER '[' CONSTANT ']'
            | '*'INDENTIFIER'['CONSTANT']'
  
%%
  
//driver code
void main()
{
   printf("Enter Any Declearative Expression : ");
  
   yyparse();
   if(flag==0)
      printf("Entered Expression is a Declearative\n");
}
  
void yyerror()
{
   printf("Entered Expression is Not a Declearative\n");
   flag=1;
   return;
}
// int yyerror(char *s) {
//     printf("Error: %s\n", s);
//     printf("Entered Expression is Not a Declearative\n");
//     flag=1;
//     return 0;
// }
%{

  #include<stdio.h>
  #include<stdlib.h>
  #include<stdbool.h>
  #include <string.h>
//   #include <stdarg.h> 

  int flag=0;
  int yylex();
  int yyerror(char* msg);

%}


 
%union {
    char* id;
}

%token <id> IDENTIFIER 
%token AND OR NOT EQ NEQ LPAREN RPAREN
%left OR
%left AND
%right NOT
%left EQ NEQ
%type<id> exp exp_2 exp_3 exp_4 exp_5

%%

exp: exp AND exp_2   { printf("Evaluating: %s AND %s  : exp  -> exp  & exp_2  \n", $1, $3); }
    | exp_2          { printf("Evaluating: %s : exp -> exp \n", $1); }
    ;

exp_2: exp_3 OR exp_2    { printf("Evaluating: %s OR %s : exp_2 -> exp_3 | exp_2 \n", $1, $3); }
     | exp_3             { printf("Evaluating: %s : exp_2 -> exp_3 \n", $1); }
     ;

exp_3: exp_4 EQ exp_4    { printf("Evaluating: %s == %s : exp_3 -> exp_4 == exp_4 \n", $1, $3); }
     | exp_4 NEQ exp_4   { printf("Evaluating: %s != %s : exp_3 -> exp_4 != exp_4 \n", $1, $3); }
     | exp_4             { printf("Evaluating: %s : exp_3 -> exp_4\n", $1); }
     ;

exp_4: NOT exp_5         { printf("Evaluating: !%s : exp_4 -> !exp_5 \n", $2); }
     | exp_5             { printf("Evaluating: %s : exp_4 -> exp_5 \n", $1); }
     ;

exp_5: IDENTIFIER       { $$ = $1; printf("Evaluating:   : exp_5 -> IDENTIFIER \n");}
     | LPAREN exp RPAREN { $$ = $2; printf("Evaluating:     : exp_5 -> (exp) \n");}
     ;

%%

int main() {
    printf("Enter Boolean Expression: ");
    yyparse();
    return 0;
}

int yyerror(char* msg) {
    printf("Error: %s\n", msg);
    return 0;
}
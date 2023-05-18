 /*** Definition section ***/
%option noyywrap
%{
    #include <stdio.h>
     int lines = 0,words=0,capitalLetter=0,smallLetter=0,
     numberBetween10_21=0,digit=0,specialCharacter=0,
     delimiter=0,operator=0,relationalOperatorType1=0,
     relationalOperatorType2=0,totalCharacter=0;

     #include <math.h>
     #include <string.h>
     #include <ctype.h>
%}

DIGIT[0-9]  
CLETTER[A-Z] 
SLETTER[a-z]  
LETTER[A-Za-z]
  

%%

"#".*   {printf("-> Header Characters are not included in Calculation\n");}


{DIGIT}*      {if(atoi(yytext)>=10 && atoi(yytext)<=21) 
                     numberBetween10_21++; 
                     digit+=strlen(yytext);  }  


{LETTER}*     {   if(strlen(yytext)>1)words++; 
                    for(int i=0;i<strlen(yytext);++i){
                        if(isupper(yytext[i])) capitalLetter++;
                            else smallLetter++;
                     } }  

"+"|"*"|"-"|"/"|"++"|"--"|"="        {operator++;}  
"<"|">"                              {relationalOperatorType1++;} 
"<="|"=="|">="|"!="                  {relationalOperatorType2++;}  

"#"|"@"|"$"|"^"                      {specialCharacter++;}  
")"|"{"|"}"|"("|"["|"]"|";"|","      {delimiter++;}  
\n                                   {lines++;}

[ \t]+                              {}
.                                   {printf("Unrecognized Character\n");} // un recognized
  
%%

 /*** C Code section ***/
int main(void)
{
yyin = fopen("_input1.c", "r");
    
yylex();  

printf("Total no. of Digits: %d\n",digit);
printf("Total no. Words:  %d\n",words);
printf("Total no. of Capital Letters:  %d\n",capitalLetter);
printf("Total no. of Small Letters:  %d\n",smallLetter);
printf("Total no. of Special Characters:  %d\n",specialCharacter);
printf("Total no. of Delimiters:  %d\n",delimiter);
printf("Total no. of Lines:  %d\n",lines+1);
printf("Total Numbers lies in 10-21 are:  %d\n",numberBetween10_21);
printf("Total no. Operators:  %d\n",operator);
printf("Total no. Relational Operators:  %d\n",relationalOperatorType1+relationalOperatorType2);
printf("Total Characters:  %d\n",digit+capitalLetter+smallLetter+delimiter+specialCharacter+operator+relationalOperatorType1+(relationalOperatorType2*2));

return 0;
}
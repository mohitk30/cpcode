 /*** Definition section ***/
%option noyywrap
%{
    #include <stdio.h>
    #include <math.h>
    #include <string.h>
    #include <stdbool.h>
    int isInvalid=false;
    char invalidString[100];
    int k=0;
    int pre=1;
%}

DIGIT[0-9]
%%
 
("+"|"-"|"*"|"/")?  {      if( pre==-1){
                                for(int i=0;i<strlen(yytext);++i){
                                        invalidString[k++]=yytext[i];
                                }  pre=1;
                            }else{
                                isInvalid=true;
                            }}

{DIGIT}*    {   for(int i=0;i<strlen(yytext);++i){
                 invalidString[k++]=yytext[i];
                }
                pre=-1;}
.           {}
%%
 /*** C Code section ***/
bool isDigit(char ch){
    if( (ch-'0')>=0 && (ch-'0')<=9) return true;
    return false;
}
int calculate(char * s) {
    int n=strlen(s);
    if(n==0)return 0;
    char operation='+';
    int val=0,last=0,res=0;
    for(int i=0;i<n;i++){
        if(isDigit(s[i])){
            val=val*10+(s[i]-'0');
        }
        if(!isDigit(s[i]) && s[i]!=' ' || i==n-1){
            if(operation=='-' || operation=='+'){
                res+=last;
                last=(operation=='+') ? val: -val;
            }
            else if(operation=='*'){
                last=last*val;
            }
            else if(operation=='/'){
                last=last/val;
            }
            operation=s[i];
            val=0;
        }}
    res+=last;
    return res;
}
int main(void)
{
    yyin = fopen("_input2.txt", "r");
    yylex();  
    if(isInvalid || pre==1){
        printf("Expression is invalid: %s\n",invalidString);
    }else{
        printf("Valid Expression\n");
        printf("-> %s",invalidString);
        printf("=%d",calculate(invalidString));
    }
    return 0;
}
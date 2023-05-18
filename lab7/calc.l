%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "calc.tab.h"
%}
%%
 
[a]    {return A;}
[b]    {return B;} 
%%

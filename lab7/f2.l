%option noyywrap
%{
%}

%%
[ \t]	 { /* skip blanks and tabs */ }
\n|.	 { return yytext[0]; }
%%
int main(void)
{ 
    return 0;
}
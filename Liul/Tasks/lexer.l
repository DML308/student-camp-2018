%{
#include "parser.tab.h"
#include <stdlib.h>
%}
%option noyywrap

letter [a-zA-Z]
digit [0-9]
identifier ^[letter_](letter|digit|_)*
number {digit}+(\.{digit}+)?(E[+-]{digit}+)?

%%
"+"  {return ADD;}
"-"  {return SUB;}
"*"  {return MUL;}
"/"  {return DIV;} 
"&&" {return AND;}
"||" {return OR;}
"!"  {return NOT;}
"(" {return LP;}
")" {return RP;}
"=" {return EQU;}
{number}        {yylval = atol(yytext);return NUM;}
{identifier}	{return VAR;}
\n	{return EOL;}
[ \t]+   {}
.   {}
%%


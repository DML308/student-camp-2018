%{
#include <stdio.h>
#include "praser.tab.h"
%}

letter [a-zA-Z]
digit [0-9]
identifier ^[letter_](letter|digit|_)*
number -?[digit]*(\.)?[digit]*

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
{identifier}	{yylval.index = add(yytext);return VAR;}
{number}        {yylval = atod(yytext);return NUM;}
\n	{return EOL;}
[ \t]+   {}
.   yyerror("不支持的字符");
%%


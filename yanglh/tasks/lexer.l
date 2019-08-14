%{
#include"y.tab.h"
#include<stdlib.h>
%}

/* 定义数字 */
digit [0-9]
digits {digit}+
number {digits}(\.{digits})?
/* (E[+-]?digits)? */

/* 当扫描器遇到end-of file时，不会调用yywrap()，简单的假定没有更多的文件可以扫描 */
/* %option noyywrap */

%%
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"&&" {return AND;}
"||" {return OR;}
"!" {return NOT;}
"(" {return OP;}
")" {return CP;}
"\n" {return yytext[0];}
{number} {yylval=atof(yytext);
          return NUMBER;}
%%

int yywrap(void){
    return 1;
}
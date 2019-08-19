%{
//#define YYSTYPE char*
#include"y.tab.h"
#include"main.h"
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
%}

/* 当扫描器遇到end-of-file时，不会调用yywrap()，简单的假定没有更多的文件可以扫描 */
%option noyywrap

/* 定义数字和字母 */
digit [0-9]
digits {digit}+
number {digits}(\.{digits})?
/* (E[+-]?digits)? */
variable [a-zA-Z]+

%%
[\t]
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"&&" {return AND;}
"||" {return OR;}
"!" {return NOT;}
"(" {return OP;}
")" {return CP;}
{number} {yylval.number=atof(yytext);
          return NUMBER;}
("var")|("VAR") {return KEYWORD_VAR;}
{variable} {yylval.index=add(yytext);return VARIABLE;}
[\n] {return EOL;}
. {yyerror("Undefined Symbol!");exit(1);}
%%
/*
int yywrap(void){
    return 1;
}*/
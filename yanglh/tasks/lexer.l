%{
#define TTSTYPE double
%}

/* 定义数字 */
digit [0-9]
digits {digit}+
number {digits}(\.{digits})?
/* (E[+-]?digits)? */

/* 当扫描器遇到end-of file时，不会调用yywrap()，简单的假定没有更多的文件可以扫描 */
%option noyywrap
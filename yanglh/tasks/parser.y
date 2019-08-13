%{
#include<stdio.h>
#include<math.h>
#define YYSTYPE double
%}

%left '|'
%left '&'
%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS
%%
%{
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
#include"main.h"
#include"y.tab.h"

extern double value[100];
extern int set[100];

extern int yylex(void);
extern void yyerror(const char* s);
extern FILE* yyin;
%}

/* union可以为记号指定一个类型 */
%union{
    int index;
    double number;
}
%token<number> ADD SUB MUL DIV AND OR NOT OP CP NUMBER KEYWORD_VAR EOL
%token<number> program
%token<number> line
%token<number> calc
%token<number> expr
%token<number> assignment
%token<index> VARIABLE

%left OR
%left AND
%left ADD SUB
%left MUL DIV
%right NOT
%right UMINUS
%%
program :
        | program line
        ;
line : EOL {printf("Pleas enter:\n");}
     | calc EOL {printf("answer = %d\n",$1);}
     ;
calc : expr
     | assignment
     ;
expr : expr ADD expr {$$=$1+$3;}
     | expr SUB expr {$$=$1-$3;}
     | expr MUL expr {$$=$1*$3;}
     | expr DIV expr {$$=$1/$3;}
     | OP expr CP {$$=$2;}
     | NOT expr {return $$=!$2;}
     | SUB expr {return $$=-$2;} 
     | NUMBER {$$=$1;}
     | VARIABLE {$$=value[$1];}
     ;
assignment : KRYWORD_VAR VARIABLE "=" calc {$$=set($2,$4);}
           ;
%%
int main(){
    char* string;
    printf("whether to read the file? (Y/N):");
    scanf("%s",string);
    if(strcmp(string,"Y")==0 || strcmp(string,"y")==0){
        printf("Please enter file name:");
        scanf("%s",string);
        yyin = fopen(string,"r");
        if(!yyin){
            printf("fail to load file",string);
            exit(-1);
        }
        yyparse();
    }
    else {
        yyin = stdin;
        yyparse();
    }
}
void yyerror(const char *s){
     printf("%s\n",s);
}
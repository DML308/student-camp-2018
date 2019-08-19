%{
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
#include"y.tab.h"

extern double value[100];
extern int set[100];

extern int yylex(void);
extern void yyterminate();
void yyerror(const char* s);
extern FILE* yyin;
%}

/* union可以为记号指定一个类型 */
%union{
    int index;
    double number;
}
%token<number> ADD SUB MUL DIV AND OR NOT OP CP EQUAL NUMBER KEYWORD EOL
%type<number> program
%type<number> line
%type<number> calc
%type<number> expr
%type<number> assignment
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
     | calc EOL {printf("answer = %f\n",$1);}
     ;
calc : expr
     | assignment
     ;
expr : expr ADD expr {$$=$1+$3;}
     | expr SUB expr {$$=$1-$3;}
     | expr MUL expr {$$=$1*$3;}
     | expr DIV expr {$$=$1/$3;}
     | expr AND expr {$$=$1&&$2;}
     | expr OR expr {$$=$1||$2;}
     | OP expr CP {$$=$2;}
     | NOT expr {return $$=!$2;}
     | SUB expr {return $$=-$2;} 
     | NUMBER {$$=$1;}
     | VARIABLE {$$=value[$1];}
     ;
assignment : KEYWORD VARIABLE EQUAL calc {$$=setValue($2,$4);}
           ;

%%
int main(int argc,char** argv){
    char string[25];
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
        printf("over");
    }
    else {  //从命令行输入
        yyin = stdin;
        yyparse();
    }
}
void yyerror(const char *s){
     printf("%s\n",s);
}
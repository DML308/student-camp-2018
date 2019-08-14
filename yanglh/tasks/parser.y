%{
#include<stdio.h>
#include<math.h>
void yyerror(const char *s);
int main();
%}

%token ADD SUB MUL DIV AND OR NOT OP CP NUMBER

%left OR
%left AND
%left ADD SUB
%left MUL DIV
%right NOT
%right UMINUS
%%

lines : lines expr '\n' {printf("answer = %d\n",$2);}
      | /* empty */ {/* empty */}
      ;
expr : expr ADD expr {$$=$1+$3;}
     | expr SUB expr {$$=$1-$3;}
     | expr MUL expr {$$=$1*$3;}
     | expr DIV expr {$$=$1/$3;}
     | OP expr CP {$$=$2;}
     | NOT expr {return $$=!$2;}
     | SUB expr {return $$=-$2;} 
     | NUMBER {$$=$1;}
     ;

%%
void yyerror(const char *s){
     printf("%s\n",s);
}
int main(){
    return yyparse();
}
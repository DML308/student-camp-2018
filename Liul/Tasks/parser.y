%{
# include <stdio.h>
int yylex();
%}

%token VAR NUM ADD SUB MUL DIV AND OR NOT LP RP EOL

%left OR
%left AND 
%left ADD SUB
%left MUL DIV
%right NOT

%%
program :
    | program line
    ;
line : 
    | EOL 
    | decl EOL      
    | calc EOL       {printf("%d\n",$1);}
    ;
calc : expr ADD expr {$$ = $1 + $3;}
     | expr SUB expr {$$ = $1 - $3;}
     | expr MUL expr {$$ = $1 * $3;}
     | expr DIV expr {$$ = $1 / $3;}
     | expr AND expr {$$ = $1 && $2;}
     | expr OR  expr {$$ = $1 || $2;}
     | NOT  expr     {$$ = !$2;}
     | LP expr RP    {$$ = $2;}
     | SUB expr      {$$ = -$2;}
     | NUM           {$$ = $1;}
     | VAR           {$$ = $1;}
decl : 
%%
int main(int argc,char **argv)
{
 yyparse();
 return 0;
}
void yyerror (const char *msg) {
    printf("%s\n",msg);
}

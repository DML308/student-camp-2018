%{
#include <stdio.h>
int yylex(void);
extern void yyerror(const char *msg);
extern FILE *yyin;
%}

%token VAR NUM ADD SUB MUL DIV AND OR NOT LP RP EOL EQU

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
    | expr EOL       {printf("%d\n",$1);}
    ;
expr : expr ADD expr {$$ = $1 + $3;}
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
     ;
%%
/*int main(int argc, char** argv)
{
	if(argc > 1)
	{
		yyin = fopen(argv[1],"r");	
	}
	else
	{
		yyin = stdin;
	} 
	yyparse();
	return 0;
}*/
void yyerror (const char * msg) {
    printf("%s\n",msg);
}

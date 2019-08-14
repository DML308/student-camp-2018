all:calc
y.tab.c y.tab.h:parser.y
	bison -vdty parser.y
lex.yy.c:lexer.l y.tab.h
	flex lexer.l
calc:y.tab.c lex.yy.c y.tab.h
	gcc -o calc y.tab.c lex.yy.c
calculator.out:y.tab.c lex.yy.c
	gcc -o y.tab.c lex.yy.c
y.tab.c:parser.y
	bison -vdty parser.y
lex.yy.c:lexer.l
	flex lexer.l

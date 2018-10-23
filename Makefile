JCalc : y.tab.c y.tab.h lex.yy.c
	cc y.tab.c -ly -ll -o JCalc

y.tab.h : JCalc.y
	yacc -d JCalc.y

lex.yy.c : JCalc.l
	lex JCalc.l


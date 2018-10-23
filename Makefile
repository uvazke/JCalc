JCulc : y.tab.c y.tab.h lex.yy.c
	cc y.tab.c -ly -ll -o JCulc

y.tab.h : JCulc.y
	yacc -d JCulc.y

lex.yy.c : JCulc.l
	lex JCulc.l


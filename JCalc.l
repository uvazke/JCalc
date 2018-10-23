%{
	#include <stdio.h>
	#include <string.h>
	#include "y.tab.h"
	int line=1;
%}

%start COMMENT
%%
<INITIAL>"quit" exit(0);
<INITIAL>"how_many_line" {fprintf(stderr, "%d lines are read.\n", line);return HOW_MANY_LINE;};
<INITIAL>"("		return LP;
<INITIAL>")"		return RP;
<INITIAL>"+"		return ADD;
<INITIAL>"-"		return SUB;
<INITIAL>"*"		return MUL;
<INITIAL>"/"		return DIV;
<INITIAL>"%"		return MOD;
<INITIAL>[1-9][0-9]* {sscanf(yytext,"%d",&yylval);return INT_LITERAL;};
<INITIAL>[A-Za-z_][A-Za-z_0-9]* {sscanf(yytext,"%s",&yylval);return STR;};
<INITIAL>[0-9]*\.[0-9]* ;
<INITIAL>[ \t] ;
<INITIAL>[\n\r]|\r\n {line++;return NL;};
<INITIAL>^#	BEGIN COMMENT;
<INITIAL>. fprintf(stderr, "Please input 'quit' to finish the program.\n");
<COMMENT>\n|\r|\r\n	BEGIN INITIAL;
<COMMENT>.      ;
%%

/*
int main(int argc, char ** argv){
	++argv,--argc;
	if(argc > 0){
		yyin = fopen(argv[0], "r");
		printf("File open.\n");
	}else{
		yyin = stdin;
	}
	if(yyin == NULL){
		fprintf(stderr, "File open is failed.\n");exit(0);
	}
	yylex();	
	printf("%d lines are read\n",line);
	
	return(0);
}
*/
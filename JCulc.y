%{
	#include<stdio.h>
%}
%token NL
%token HOW_MANY_LINE
%token INT_LITERAL
%token STR
%token LP RP ADD SUB MUL DIV MOD

%%

list
	: /* Empty */
	| list expr NL {printf("%d\n", $2);}
	| list string NL 
	{
		fprintf(stderr, "Please input 'quit' to finish the program.\n");
	}
	| list NL
	| HOW_MANY_LINE NL
	| list HOW_MANY_LINE NL

	;
string
	: STR
	| string STR
	| ADD
	| SUB
	| MUL
	| DIV
	| MOD
	;
expr
	: term
	| expr ADD expr {$$ = $1 + $3;}
	| expr SUB term {$$ = $1 - $3;}
	| expr MOD term {$$ = $1 % $3;}
	| expr expr {$$ = $2;}
	;
term
	: factor
	| term MUL term {$$ = $1 * $3;}
	| term DIV term {$$ = $1 / $3;}
	;
factor
	: INT_LITERAL
	| LP expr RP {$$ = $2;}
	;

%%

#include "lex.yy.c"
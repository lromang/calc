%code requires
{
#define YYSTYPE double
#include <stdio.h>
#include <math.h>
}

%token NUMBER
%token ADD SUB MUL DIV FACT SIN COS TAN CSC SEC COT ARCSIN ARCCOS ARCTAN POW OP CP PI
%token EOL


%%

calclist:
| calclist exp EOL { printf("= %f\n", (float)$2); }
;

exp: factor
| exp ADD factor { float aux1 =  $1, aux2 = $3; $$ = aux1 + aux2; }
| exp SUB factor { $$ = $1 - $3; }
;

factor: term
| factor MUL term { $$ = $1 * $3; }
| factor DIV term { $$ = $1 / $3; }
;


term: digit
| NUMBER POW NUMBER { $$ = pow($1, $3); }
| SIN  NUMBER   { double aux = $2; $$ = sin(aux); }
| COS  NUMBER   { double aux = $2; $$ = cos(aux); }
| TAN  NUMBER   { double aux = $2; $$ = tan(aux); }
| SEC  NUMBER   { double aux = $2; $$ = 1/cos(aux); }
| CSC  NUMBER   { double aux = $2; $$ = 1/sin(aux); }
| COT  NUMBER   { double aux = $2; $$ = 1/tan(aux); }
;

digit: NUMBER
| PI { $$ = M_PI; }
| term FACT {
  unsigned int factorial(unsigned int n)
 {
 	unsigned int retval = 1;
        int i = n;
 	while (i > 1){
 		retval *= i;
                i--;
 }
 	return retval;
 };
  $$ = factorial($1);
 }
| OP exp CP { $$ = $2; }
;

%%

main(int argc, char **argv)
{
	yyparse();
}

yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
}

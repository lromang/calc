%{
# include "train.tab.h"
%}


%%
"+"	           {return ADD;}
"-"                {return SUB;}
"*"	           {return MUL;}
"/"	           {return DIV;}
"!"                {return FACT;}
"sin"              {return SIN;}
"cos"              {return COS;}
"tan"              {return TAN;}
"csc"              {return CSC;}
"sec"              {return SEC;}
"cot"              {return COT;}
"arcsin"           {return ARCSIN;}
"arccos"           {return ARCCOS;}
"arctan"           {return ARCTAN;}
"("                {return OP;}
")"                {return CP;}
"^"                {return POW;}
"pi"               {return PI;}
[0-9]+(\.?[0-9]*)?             {yylval = atof(yytext); return NUMBER;}
\n	           {return EOL;}
[ \t]	           {} 
%%




%{
#include "first.tab.h"    
%}

%%
"pop" { return pop; }
"push" { return push; }
"add" { return add; }
"sub" { return sub; }
"mul" { return mul; }
"divi" { return divi; }
"mod" { return mod; }
"print" { return print; }
";"     { return yytext[0]; }
"exit"  { return exit_command;}
[1-9][0-9]* { yylval.num = atoi(yytext); return number; }
.       { ; }

%%
int yywrap()
{
    return 1;
}

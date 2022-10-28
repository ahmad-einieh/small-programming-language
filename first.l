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
"print" { return print; }
[1-9][0-9]* { return number; }

%%
int yywrap()
{
    return 1;
}
// int main()
// {
//     yylex();
//     return 0;
// }
int main(){
    int ntoken ,vtoken;
    ntoken = yylex();
    while(ntoken){
        //printf("%d\n",ntoken);
        ntoken = yylex();
    }
    return 0;
}

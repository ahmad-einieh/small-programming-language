KEYWORD     print|push|pop|add|mul|sub|div
int         [0-9]+

%%

{KEYWORD}   { printf("keyword", yytext); }
{int}       { printf("int", yytext); }
;           { printf("semicolon", yytext); }
\n          { printf("newline", yytext); }

%%
int yywrap() { return 1; }
int main(){
    printf("Enter the expression: ");
    yylex();
    system("pause");
    return 0;
}

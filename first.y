%{
    int yylex();
    void yyerror(char *s);
    #include <stdio.h>
    #include <stdlib.h>
    int stack[512];
    void printElement();
    void pushElement(int x);
    int popElement();
    void addElement();
    void subElement();
    void mulElement();
    void diviElement();
    void modElement();
    int counter = 0;
%}

%union {
    int num;
}

%start Program
%token pop
%token push
%token add
%token sub
%token mul
%token divi
%token print
%token mod
%token <num> number
%token exit_command


%%

Program : SupProgram ';' Program    {;}
        | SupProgram            {;}
        ;
SupProgram  :print          {printElement();}
            |push number    {pushElement($2);}
            |pop            {popElement();}
            |add            {addElement();}
            |mul            {mulElement();}
            |sub            {subElement();}
            |divi           {diviElement();}
            |exit_command   {exit(EXIT_SUCCESS);}
            |mod            {modElement();}
            ;

%%


int main(void)
{
    stack[0]=0;
    stack[1]=0;
    return yyparse();;
}

void printElement()
{
    printf("%d\n", stack[counter-1]);
}

void pushElement(int x)
{
    stack[counter] = x;   
    counter++; 
}

int popElement()
{
    counter--;
    return stack[counter];
}

void addElement()
{
    int a = popElement();
    int b = popElement();
    pushElement(a+b);
}

void subElement()
{
    int a = popElement();
    int b = popElement();
    pushElement(a-b);
}

void mulElement()
{
    int a = popElement();
    int b = popElement();
    pushElement(a*b);
}

void diviElement()
{
    int a = popElement();
    int b = popElement();
    pushElement(b/a);
}

void modElement()
{
    int a = popElement();
    int b = popElement();
    pushElement(a%b);
}


void yyerror(char *s)
{
    printf("Error: %s", s);
}


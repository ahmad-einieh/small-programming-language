%{

    void yyerror(char *s);
    #include <stdio.h>
    #include <stdlib.h>
    int stack[2];
    void print();
    void push(int x);
    int pop();
    void add();
    void sub();
    void mul();
    void div();
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
%token div
%token print
%token <num> number


%%

Program : SupProgram ';' Program    {;}
        | SupProgram
        ;
SupProgram  :print          {print();}
            |push number    {push($2);}
            |pop            {pop();}
            |add            {add();}
            |mul            {mul();}
            |sub            {sub();}
            |div            {div();}
            ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    
    return yyparse();;
}

void print()
{
    printf("%d, ", stack[0]);
}

void push(int x)
{
    stack[counter] = x;   
    counter++; 
}

int pop()
{
    return stack[counter--];
}

void add()
{
    int a = pop();
    int b = pop();
    push(a+b);
}

void sub()
{
    int a = pop();
    int b = pop();
    push(a-b);
}

void mul()
{
    int a = pop();
    int b = pop();
    push(a*b);
}

void div()
{
    int a = pop();
    int b = pop();
    push(a/b);
}


void yyerror(char *s)
{
    printf("Error: %s\n", s);
}


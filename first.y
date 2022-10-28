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
    void divi();
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
%token <num> number


%%

Program : SupProgram ';' Program    {;}
        | SupProgram
        ;
SupProgram  :print          {printElement();}
            |push number    {pushElement($2);}
            |pop            {popElement();}
            |add            {addElement();}
            |mul            {mulElement();}
            |sub            {subElement();}
            |divi           {diviElement();}
            ;

%%

int yywrap()
{
    return 1;
}

int main(void)
{
    stack[0]=0;
    stack[1]=0;
    return yyparse();;
}

void printElement()
{
    printf("%d, ", stack[0]);
    printf("%d, ", stack[1]);

}

void pushElement(int x)
{
    stack[counter] = x;   
    counter++; 
}

int popElement()
{
    counter--
    return stack[counter];
}

void addElement()
{
    int a = pop();
    int b = pop();
    push(a+b);
}

void subElement()
{
    int a = pop();
    int b = pop();
    push(a-b);
}

void mulElement()
{
    int a = pop();
    int b = pop();
    push(a*b);
}

void diviElement()
{
    int a = pop();
    int b = pop();
    push(a/b);
}


void yyerror(char *s)
{
    printf("Error: %s", s);
}


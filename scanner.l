%{
    #include <iostream>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string>
    #include <ctype.h>
    #include <string>

    std::string string_to_upper(std::string);
    int find_white_space(std::string);
    void manage_stack(int);
    int stack = 0;
    int pos = 0;
%}

%option yylineno
%option noyywrap

%%

^[^ \t\n].* {
    manage_stack(find_white_space(yytext));
    REJECT
}

^#(.)*\n {
    // std::cout<<"Comment"<<std::endl;
}

^((\t|\x20)*)\n {
   // std::cout<<"Blank Line"<<std::endl;
}

^(("\x20"|"\x9")*) {
    manage_stack(find_white_space(yytext));
}

("\x20"|"\x9")+ {
   // std::cout<<"Un-needed White Space"<<std::endl;
}

\( {
    std::cout<<"LPAREN "<<yytext<<std::endl;
}

\) {
    std::cout<<"RPAREN "<<yytext<<std::endl;
}

, {
    std::cout<<"COMMA "<<yytext<<std::endl;
}

: {
    std::cout<<"COLON "<<yytext<<std::endl;
}

"\n"? {
    std::cout<<"NEWLINE "<<std::endl;
}

and|break|def|elif|else|for|if|not|or|return|while {
    std::cout<<string_to_upper(yytext)<<" "<<yytext<<std::endl;
}

= {
    std::cout<<"ASSIGN "<<yytext<<std::endl;
}

\+ {
    std::cout<<"PLUS "<<yytext<<std::endl;
}

- {
    std::cout<<"MINUS "<<yytext<<std::endl;
}

\* {
    std::cout<<"TIMES "<<yytext<<std::endl;
}

\/ {
    std::cout<<"DIVIDEDBY "<<yytext<<std::endl;
}

== {
    std::cout<<"EQ "<<yytext<<std::endl;
}

!= {
    std::cout<<"NEQ "<<yytext<<std::endl;
}

> {
    std::cout<<"GT "<<yytext<<std::endl;
}

>= {
    std::cout<<"GTE "<<yytext<<std::endl;
}

\< {
    std::cout<<"LT "<<yytext<<std::endl;
}

\<= {
    std::cout<<"LTE "<<yytext<<std::endl;
}

True {
    std::cout<<"True "<<1<<std::endl;
}

False {
    std::cout<<"False "<<0<<std::endl;
}

([a-z]|[A-Z]|_)([a-z]|[A-Z]|[0-9]|_)* {
    std::cout<<"IDENTIFIER "<<yytext<<std::endl;
}

[0-9]+\.[0-9]+ {
    std::cout<<"FLOAT "<<atof(yytext)<<std::endl;
}

[0-9]+ {
    std::cout<<"INTEGER "<<atoi(yytext)<<std::endl;
}

<<EOF>> {
    // std::cout<<"END OF FILE"<<std::endl;
    manage_stack(0);
    yyterminate();
}

%%

std::string string_to_upper(std::string lower){

   for(int i=0; i < lower.size(); i++){
        lower[i]= toupper(lower[i]);
    }

    return lower;
}

int find_white_space(std::string line){
   int whitespace = 0;

    for(int i = 0; i < line.size(); i++){
        if(line[i] == ' ' | line[i] == '\t' ){
            whitespace++;
        }
    }

    return whitespace;
}

void manage_stack(int whitespace){
    whitespace = whitespace / 4;

    if(whitespace > stack){
        for(int i = 0; i < whitespace - stack; i++){
            std::cout<<"INDENT"<<std::endl;
        }
        stack = whitespace;
    }
    else if (whitespace < stack ){

        for(int i = 0; i < stack - whitespace; i++){
            std::cout<<"DEDENT"<<std::endl;
        }
        stack = whitespace;
    }
    else{
        return;
    }
}

int main() {
    return yylex();
}

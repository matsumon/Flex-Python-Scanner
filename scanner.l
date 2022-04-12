%{
    #include <iostream>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string>
    #include <ctype.h>
    #include <string>

    std::string string_to_upper(std::string);
%}

%option yylineno
%option noyywrap

%%

^#(.)*\n {
    // std::cout<<"Comment"<<std::endl;
}

^((\t|\x20)*)\n {
    std::cout<<"Blank Line"<<std::endl;
}

^((("\x20"|"\x9"){4})*) {
    std::cout<<"INDENT"<<std::endl;
}

("\x20"|"\x9")+ {
    std::cout<<"Un-needed White Space"<<std::endl;
}

\( {
    std::cout<<"LPAREN  "<<yytext<<std::endl;
}

\) {
    std::cout<<"RPAREN  "<<yytext<<std::endl;
}

, {
    std::cout<<"COMMA   "<<yytext<<std::endl;
}

: {
    std::cout<<"COLON   "<<yytext<<std::endl;
}

"\n"? {
    std::cout<<"NEWLINE "<<std::endl;
}

and|break|def|elif|else|for|if|not|or|return|while {
    std::cout<<string_to_upper(yytext)<<"   "<<yytext<<std::endl;
}

= {
    std::cout<<"ASSIGN  "<<yytext<<std::endl;
}

\+ {
    std::cout<<"PLUS    "<<yytext<<std::endl;
}

- {
    std::cout<<"MINUS   "<<yytext<<std::endl;
}

\* {
    std::cout<<"TIMES   "<<yytext<<std::endl;
}

\/ {
    std::cout<<"DIVIDEDBY   "<<yytext<<std::endl;
}

== {
    std::cout<<"EQ  "<<yytext<<std::endl;
}

!= {
    std::cout<<"NEQ "<<yytext<<std::endl;
}

> {
    std::cout<<"GT  "<<yytext<<std::endl;
}

>= {
    std::cout<<"GTE "<<yytext<<std::endl;
}

\< {
    std::cout<<"LT  "<<yytext<<std::endl;
}

\<= {
    std::cout<<"LTE "<<yytext<<std::endl;
}

True {
    std::cout<<"True    "<<1<<std::endl;
}

False {
    std::cout<<"False   "<<0<<std::endl;
}

([a-z]|[A-Z]|_)([a-z]|[A-Z]|[0-9]|_)* {
    std::cout<<"IDENTIFIER  "<<yytext<<std::endl;
}

[0-9]+\.[0-9]+ {
    std::cout<<"FLOAT   "<<yytext<<std::endl;
}

[0-9]+ {
    std::cout<<"INTEGER "<<atoi(yytext)<<std::endl;
}
<<EOF>> {
    std::cout<<"END OF FILE"<<std::endl;
}

%%

std::string string_to_upper(std::string lower){
    for(int i=0; i < lower.size(); i++){
        lower[i]= toupper(lower[i]);
    }
    return lower;
}

int main() {
        return yylex();
}
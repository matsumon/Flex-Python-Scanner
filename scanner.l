%{
    #include <iostream>
    #include <stdio.h>
    #include <stdlib.h>
%}

%option yylineno
%option noyywrap

%%

^\n {
    // std::cout<<"Blank Line"<<std::endl;
}

^#(.)*\n {
    // std::cout<<"Comment"<<std::endl;
}

("\x20"|"\x9"){4} {
    std::cout<<"INDENT"<<std::endl;
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

"\n" {
    std::cout<<"NEWLINE "<<std::endl;
}

and {
    std::cout<<"AND "<<yytext<<std::endl;
}

break {
    std::cout<<"BREAK   "<<yytext<<std::endl;
}

def {
    std::cout<<"DEF "<<yytext<<std::endl;
}

elif {
    std::cout<<"ELIF    "<<yytext<<std::endl;
}

else {
    std::cout<<"ELSE    "<<yytext<<std::endl;
}

for {
    std::cout<<"FOR "<<yytext<<std::endl;
}

if {
    std::cout<<"IF  "<<yytext<<std::endl;
}

not {
    std::cout<<"NOT "<<yytext<<std::endl;
}

or {
    std::cout<<"OR  "<<yytext<<std::endl;
}

return {
    std::cout<<"RETURN  "<<yytext<<std::endl;
}

while {
    std::cout<<"WHILE   "<<yytext<<std::endl;
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
    std::cout<<"True    "<<yytext<<std::endl;
}

False {
    std::cout<<"False   "<<yytext<<std::endl;
}

([a-z]|[A-Z]|_)([a-z]|[A-Z]|[0-9]|_)* {
    std::cout<<"IDENTIFIER  "<<yytext<<std::endl;
}

^[0-9]+\.[0-9]+ {
    std::cout<<"FLOAT   "<<atof(yytext)<<std::endl;
}

[0-9]+ {
    std::cout<<"INTEGER "<<atoi(yytext)<<std::endl;
}
<<EOF>> {
    std::cout<<"END OF FILE"<<std::endl;
}

%%

int main() {
        return yylex();
}
%{
    #include <iostream>
%}

%option yylineno
%option noyywrap

%%

and {
    std::cout<<"AND"<<std::endl;
}

break {
    std::cout<<"BREAK"<<std::endl;
}

def {
    std::cout<<"DEF"<<std::endl;
}

elif {
    std::cout<<"ELIF"<<std::endl;
}

else {
    std::cout<<"ELSE"<<std::endl;
}

for {
    std::cout<<"FOR"<<std::endl;
}

if {
    std::cout<<"IF"<<std::endl;
}

not {
    std::cout<<"NOT"<<std::endl;
}

or {
    std::cout<<"OR"<<std::endl;
}

return {
    std::cout<<"RETURN"<<std::endl;
}

while {
    std::cout<<"WHILE"<<std::endl;
}

= {
    std::cout<<"ASSIGN"<<std::endl;
}

\+ {
    std::cout<<"PLUS"<<std::endl;
}

- {
    std::cout<<"MINUS"<<std::endl;
}

\* {
    std::cout<<"TIMES"<<std::endl;
}

\/ {
    std::cout<<"DIVIDEDBY"<<std::endl;
}

== {
    std::cout<<"EQ"<<std::endl;
}

!= {
    std::cout<<"NEQ"<<std::endl;
}

> {
    std::cout<<"GT"<<std::endl;
}

>= {
    std::cout<<"GTE"<<std::endl;
}

\< {
    std::cout<<"LT"<<std::endl;
}

\<= {
    std::cout<<"LTE"<<std::endl;
}

True {
    std::cout<<"True"<<std::endl;
}

False {
    std::cout<<"False"<<std::endl;
}

([a-z]|[A-Z]|_)([a-z]|[A-Z]|[0-9]|_)* {
    std::cout<<"IDENTIFIER"<<std::endl;
}

^[0-9]+\.[0-9]+ {
    std::cout<<"FLOAT"<<std::endl;
}

[0-9]+ {
    std::cout<<"INTEGER"<<std::endl;
}
<<EOF>> {
    std::cout<<"END OF FILE"<<std::endl;
}

%%

int main() {
        return yylex();
}
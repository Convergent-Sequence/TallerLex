%{
#include <stdio.h>
%}

%option noyywrap

%%
[0-9]+         { printf("NUMBER: %s\n", yytext); }
"+"            { printf("ADD: %s\n", yytext); }
"-"            { printf("SUB: %s\n", yytext); }
"*"            { printf("MUL: %s\n", yytext); }
"/"            { printf("DIV: %s\n", yytext); }
"abs"          { printf("ABS: %s\n", yytext); }
\n             { printf("EOL\n"); }
[ \t]+         { /* Ignorar espacios y tabulaciones */ }
.              { printf("Token no reconocido: %s\n", yytext); }
%%

int main() {
    printf("Ingrese la cadena para analizar (Ctrl+D para finalizar):\n");
    yylex();
    return 0;
}


%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

DIGIT      [0-9]
NUMBER     {DIGIT}+(\.{DIGIT}+)?
OPERATOR   [+\-*/^]
PAREN      [()]
WHITESPACE [ \t\n]

FUNCTION   (sin|cos|tan|log|ln|sqr)
%%
{NUMBER}   { printf("Número: %s\n", yytext); }
{OPERATOR} { printf("Operador: %s\n", yytext); }
{PAREN}    { printf("Paréntesis: %s\n", yytext); }
{FUNCTION} { printf("Función: %s\n", yytext); }
{WHITESPACE} { }

.          { printf("Carácter desconocido: %s\n", yytext); }

%%

int main() {
    char input[256];
    printf("Introduce una operación de calculadora: ");
    
    if (fgets(input, sizeof(input), stdin) != NULL) {
        YY_BUFFER_STATE buffer = yy_scan_string(input);
        yylex();
        yy_delete_buffer(buffer);
    } else {
        printf("Error al leer la entrada.\n");
    }

    return 0;
}

int yywrap() {
    return 1;
}


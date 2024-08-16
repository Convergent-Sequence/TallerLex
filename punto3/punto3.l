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

FUNCTION   (sin|cos|tan|log|ln|sqr|sqrt)
%%
{NUMBER}   { printf("Número: %s\n", yytext); }
{OPERATOR} {
    if (yytext[0] == '+') {
        printf("Operador: %s (suma)\n", yytext);
    } else if (yytext[0] == '-') {
        printf("Operador: %s (resta)\n", yytext);
    } else if (yytext[0] == '*') {
        printf("Operador: %s (multiplicación)\n", yytext);
    } else if (yytext[0] == '/') {
        printf("Operador: %s (división)\n", yytext);
    } else if (yytext[0] == '^') {
        printf("Operador: %s (potenciación)\n", yytext);
    }
}
{PAREN}    { printf("Paréntesis: %s\n", yytext); }
{FUNCTION} {
    if (strcmp(yytext, "sin") == 0) {
        printf("Función: %s (seno)\n", yytext);
    } else if (strcmp(yytext, "cos") == 0) {
        printf("Función: %s (coseno)\n", yytext);
    } else if (strcmp(yytext, "tan") == 0) {
        printf("Función: %s (tangente)\n", yytext);
    } else if (strcmp(yytext, "log") == 0) {
        printf("Función: %s (logaritmo base 10)\n", yytext);
    } else if (strcmp(yytext, "ln") == 0) {
        printf("Función: %s (logaritmo natural)\n", yytext);
    } else if (strcmp(yytext, "sqr") == 0) {
        printf("Función: %s (cuadrado)\n", yytext);
    } else if (strcmp(yytext, "sqrt") == 0) {
        printf("Función: %s (raíz cuadrada)\n", yytext);
    }
}
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

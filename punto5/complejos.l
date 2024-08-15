%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void clasificar_numero_cartesiano(char *numero);
void clasificar_numero_polar(char *numero, double theta);

%}

%%

[0-9]+(\.[0-9]+)?[+-][0-9]+(\.[0-9]+)?i  { clasificar_numero_cartesiano(yytext); }
[0-9]+(\.[0-9]+)?i                       { clasificar_numero_cartesiano(yytext); }
[0-9]+(\.[0-9]+)?                        { clasificar_numero_cartesiano(yytext); }

[0-9]+(\.[0-9]+)?e\^i[0-9]+(\.[0-9]+)?   {
                                          double theta;
                                          sscanf(yytext, "%*[^i]i%lf", &theta);
                                          clasificar_numero_polar(yytext, theta);
                                        }

[0-9]+(\.[0-9]+)?\(cos[0-9]+(\.[0-9]+)?\+isin[0-9]+(\.[0-9]+)?\) {
                                          double theta;
                                          sscanf(yytext, "%*[^c]cos%lf", &theta);
                                          clasificar_numero_polar(yytext, theta);
                                        }

\n                                        { /* ignorar lineas vacias */ }
.                                         { /* ignorar caracteres no reconocidos */ }

%%

void clasificar_numero_cartesiano(char *numero) {
    if (strchr(numero, 'i') != NULL) {
        if (strchr(numero, '+') != NULL || strchr(numero, '-') != NULL) {
            printf("%s es un número complejo\n", numero);
        } else {
            printf("%s es un número imaginario\n", numero);
        }
    } else {
        printf("%s es un número real\n", numero);
    }
}

void clasificar_numero_polar(char *numero, double theta) {

    if (theta == 90) {
        printf("%s es un número imaginario\n", numero);
    } else if (theta == 360 || theta == 0) {
        printf("%s es un número real\n", numero);
    } else {
        printf("%s es un número complejo\n", numero);
    }
}

int main() {
    char nombre_archivo[256];
    printf("Ingrese el nombre del archivo: ");
    scanf("%255s", nombre_archivo);

    FILE *archivo = fopen(nombre_archivo, "r");
    if (archivo == NULL) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = archivo; //asigna,pasa el archivo a lex
    yylex(); //inicia el analsisi lexico
    fclose(archivo);
    return 0;
}
int yywrap(void) { //indica final de la entrada y que no se lee mas
    return 1;
}

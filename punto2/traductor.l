%{
#include <stdio.h>
#include <string.h>

typedef enum { MASCULINO, FEMENINO } Genero;

const char* traduccion_plural(const char* word, Genero genero);
const char* obtener_articulo(Genero genero, int es_plural);

%}

%option noyywrap

%%

the\s+cat     { printf("%s gato ", obtener_articulo(MASCULINO, 0)); }
the\s+cats    { printf("%s %s ", obtener_articulo(MASCULINO, 1), traduccion_plural("gato", MASCULINO)); }
the\s+dog     { printf("%s perro ", obtener_articulo(MASCULINO, 0)); }
the\s+dogs    { printf("%s %s ", obtener_articulo(MASCULINO, 1), traduccion_plural("perro", MASCULINO)); }
the\s+house   { printf("%s casa ", obtener_articulo(FEMENINO, 0)); }
the\s+houses  { printf("%s %s ", obtener_articulo(FEMENINO, 1), traduccion_plural("casa", FEMENINO)); }
the\s+book    { printf("%s libro ", obtener_articulo(MASCULINO, 0)); }
the\s+books   { printf("%s %s ", obtener_articulo(MASCULINO, 1), traduccion_plural("libro", MASCULINO)); }
the\s+apple   { printf("%s manzana ", obtener_articulo(FEMENINO, 0)); }
the\s+apples  { printf("%s %s ", obtener_articulo(FEMENINO, 1), traduccion_plural("manzana", FEMENINO)); }
the\s+car     { printf("%s coche ", obtener_articulo(MASCULINO, 0)); }
the\s+cars    { printf("%s %s ", obtener_articulo(MASCULINO, 1), traduccion_plural("coche", MASCULINO)); }
the\s+tree    { printf("%s árbol ", obtener_articulo(MASCULINO, 0)); }
the\s+trees   { printf("%s %s ", obtener_articulo(MASCULINO, 1), traduccion_plural("árbol", MASCULINO)); }
the\s+flower  { printf("%s flor ", obtener_articulo(FEMENINO, 0)); }
the\s+flowers { printf("%s %s ", obtener_articulo(FEMENINO, 1), traduccion_plural("flor", FEMENINO)); }
the\s+city    { printf("%s ciudad ", obtener_articulo(FEMENINO, 0)); }
the\s+cities  { printf("%s %s ", obtener_articulo(FEMENINO, 1), traduccion_plural("ciudad", FEMENINO)); }
the\s+person  { printf("%s persona ", obtener_articulo(FEMENINO, 0)); }
the\s+people  { printf("%s personas ", obtener_articulo(FEMENINO, 1)); } // Excepción: people -> personas

cat           { printf("gato "); }
cats          { printf("%s ", traduccion_plural("gato", MASCULINO)); }
dog           { printf("perro "); }
dogs          { printf("%s ", traduccion_plural("perro", MASCULINO)); }
house         { printf("casa "); }
houses        { printf("%s ", traduccion_plural("casa", FEMENINO)); }
book          { printf("libro "); }
books         { printf("%s ", traduccion_plural("libro", MASCULINO)); }
apple         { printf("manzana "); }
apples        { printf("%s ", traduccion_plural("manzana", FEMENINO)); }
car           { printf("coche "); }
cars          { printf("%s ", traduccion_plural("coche", MASCULINO)); }
tree          { printf("árbol "); }
trees         { printf("%s ", traduccion_plural("árbol", MASCULINO)); }
flower        { printf("flor "); }
flowers       { printf("%s ", traduccion_plural("flor", FEMENINO)); }
city          { printf("ciudad "); }
cities        { printf("%s ", traduccion_plural("ciudad", FEMENINO)); }
person        { printf("persona "); }
people        { printf("personas "); } // Excepción: people -> personas
and           { printf("y "); } // Traducción de "and"

the           { printf("el/la/los/las "); } // Cuando "the" está solo, traducir como un conjunto de artículos posibles.

[ \t\n]+      { /* Ignora espacios, tabulaciones y nuevas líneas */ }
.             { /* Ignora caracteres no reconocidos */ }

%%

int main()
{
    yylex();
    return 0;
}

const char* traduccion_plural(const char* word, Genero genero)
{
    static char plural[100];
    size_t len = strlen(word);

    if (word[len - 1] == 'a' || word[len - 1] == 'e' || word[len - 1] == 'o')
        snprintf(plural, sizeof(plural), "%ss", word); // Añade "s" para palabras que terminan en vocal
    else
        snprintf(plural, sizeof(plural), "%ses", word);  // Añade "es" para palabras que terminan en consonante

    return plural;
}

const char* obtener_articulo(Genero genero, int es_plural)
{
    if (genero == MASCULINO) {
        if (es_plural)
            return "los";
        else
            return "el";
    } else {
        if (es_plural)
            return "las";
        else
            return "la";
    }
}


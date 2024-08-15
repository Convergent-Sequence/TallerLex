%{
int num_lineas = 0;
int num_palabras = 0;
int num_caracteres = 0;
%}

%%
\n              { num_lineas++; }
[ \t]+          { num_caracteres += yyleng; }
[^a-zA-Z0-9 \n\t]+ { num_caracteres += yyleng; }
[a-zA-Z0-9]+    { num_palabras++; num_caracteres += yyleng; }
.               { num_caracteres++; }
%%

int yywrap(void) {
    return 1;
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *archivo;
        archivo = fopen(argv[1], "r");
        if (!archivo) {
            fprintf(stderr, "No se puede abrir el archivo %s\n", argv[1]);
            return 1;
        }
        yyin = archivo;
    }
    yylex();
    if (num_lineas > 0) {
        num_caracteres += (num_lineas - 1);
    }
    printf("Líneas: %d\n", num_lineas);
    printf("Palabras: %d\n", num_palabras);
    printf("Caracteres: %d\n", num_caracteres);

    return 0;
}



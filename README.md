# TallerLex

Integrantes: <br>
-Camilo Andres López Contreras <br>
-Miguel Fernández De La Cruz <br>
-Kevin Nicolai Rodríguez García <br>

Para poder ejecutar los programas lo primero que debemos de hacer es instalar flex. Esto en la terminal de consolas de Linux.
```
sudo apt-get update
sudo apt-get install flex gcc
```
Luego tenemos que navegar hasta el directorio donde esta el ejecutable y ponemos el nombre del ejecutable. Por ejemplo el de tokens se hace de la siguiente manera:

```
./tokens
```


## Programa 1. Contar lineas palabras y caracteres.

\n: Cuando se encuentra un carácter de nueva línea (fin de línea): <br>

Incrementa num_lineas. <br> 

[ \t]+: Cuando se encuentra uno o más espacios o tabulaciones consecutivas: <br> 

Se incrementa num_caracteres en el valor de yyleng, que es la longitud de la coincidencia. <br>

[^a-zA-Z0-9 \n\t]+: Cuando se encuentra un carácter o secuencia de caracteres que no sean letras, números, espacios, tabulaciones o nuevas líneas (como puntuación o símbolos especiales): <br>

Incrementa num_caracteres en el valor de yyleng. <br> 

[a-zA-Z0-9]+: Cuando se encuentra una secuencia de una o más letras o números: <br>

Incrementa num_palabras. <br> 
Incrementa num_caracteres en el valor de yyleng. <br>

.: Para cualquier otro carácter (esto abarca cualquier cosa que no coincida con las reglas anteriores, como símbolos individuales o caracteres no alfanuméricos): <br>

Incrementa num_caracteres.

## Programa 3. Reconocer símbolos y caracteres de la calculadora

Estas son definiciones de patrones que se utilizan en las reglas de flex: <br>

DIGIT: Define un dígito como cualquier número entre 0 y 9. <br>
NUMBER: Define un número como una secuencia de dígitos, opcionalmente seguida de un punto decimal y más dígitos (es decir, soporta tanto enteros como números decimales). <br>
OPERATOR: Define un operador matemático como +, -, *, /, ^. <br>
PAREN: Define paréntesis ( y ). <br>
WHITESPACE: Define espacios en blanco, tabulaciones y saltos de línea. <br>
FUNCTION: Define funciones matemáticas comunes como sin, cos, tan, log, ln, sqr. <br>

## Programa 4. Reconocimiento de Tokens.

Definición de tokens:

[0-9]+: Reconoce números y los imprime como NUMBER. <br>
"+", "-", "*", "/": Reconoce los operadores de suma, resta, multiplicación y división, respectivamente. <br>
"abs": Reconoce la función abs. <br> 
\n: Maneja el fin de línea e imprime EOL. <br>
[ \t]+: Ignora los espacios y tabulaciones. <br> 
.: Cualquier otro carácter que no coincida con los anteriores es marcado como "Token no reconocido". <br>

Ejemplo de cadena a procesar: 3 + 15 - 45 abs 8


## Programa 5. Clasificador de números complejos.

Recordemos que un número complejo es un número de la forma $z=x+yi$ con $x,y \in \mathbb{R}$.\ <br>
La forma $z=x+yi$ se conoce como forma rectangular, además, $z$ se puede expresar en forma polar como $z = re^{i\theta}=r(\cos \theta + i\sin \theta)$ con $r=\sqrt{x ^2+y^2}$.\ <br>
Para simplificar la lectura del archivo, trabajaremos únicamente con grados. Note que si $z \in \mathbb{R}$ entonces $\theta = 360$, si $z \in \mathbb{C}\setminus\mathbb{R}$ entonces $\theta = 90$ y si $z \in \mathbb{C}$ entonces $\theta\not\in\lbrace 360,90\rbrace$.\ <br>
Según lo anterior si un numero está expresado en la forma polar $r(\cos \theta + i\sin \theta)$ inmediatamente será clasificado como complejo, y si está expresado en la forma $re^{i\theta}$ será clasificado según el valor de $\theta$. <br>

El programa lee un txt con números dispuestos de forma vertical, y clasifica cada uno de ellos. Digamos, el txt 


```
10
3+4i
5
-7i
10e^i90
5(cos90+isin90)
2.5e^i45
6(cos0+isin0)
4(cos360+isin360)
8e^i360
-9.5(cos270+isin270)
12+0i
0e^i0
1.5(cos180+isin180)
7.8e^i180
```

genera el siguiente resultado


```
10 es un número real
3+4i es un número complejo
5 es un número real
7i es un número imaginario
10e^i90 es un número imaginario
5(cos90+isin90) es un número imaginario
2.5e^i45 es un número complejo
6(cos0+isin0) es un número real
4(cos360+isin360) es un número real
8e^i360 es un número real
9.5(cos270+isin270) es un número complejo
12+0i es un número complejo
0e^i0 es un número real
```

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

## Programa 3. Reconocer símbolos y caracteres de la calculadora

## Programa 4. Reconocimiento de Tokens.

Definición de tokens:

[0-9]+: Reconoce números y los imprime como NUMBER.
"+", "-", "*", "/": Reconoce los operadores de suma, resta, multiplicación y división, respectivamente.
"abs": Reconoce la función abs.
\n: Maneja el fin de línea e imprime EOL.
[ \t]+: Ignora los espacios y tabulaciones.
.: Cualquier otro carácter que no coincida con los anteriores es marcado como "Token no reconocido".ç

Ejemplo de cadena a procesar: 3 + 15 - 45 abs 8


## Programa 5. Clasificador de números complejos.

Recordemos que un número complejo es un número de la forma $z=x+yi$ con $x,y \in \mathbb{R}$.\
La forma $z=x+yi$ se conoce como forma rectangular, además, $z$ se puede expresar en forma polar como $z = re^{i\theta}=r(\cos \theta + i\sin \theta)$ con $r=\sqrt{x ^2+y^2}$.\
Para simplificar la lectura del archivo, trabajaremos únicamente con grados. Note que si $z \in \mathbb{R}$ entonces $\theta = 360$, si $z \in \mathbb{C}\setminus\mathbb{R}$ entonces $\theta = 90$ y si $z \in \mathbb{C}$ entonces $\theta\not\in\lbrace 360,90\rbrace$.\
Según lo anterior si un numero está expresado en la forma polar $r(\cos \theta + i\sin \theta)$ inmediatamente será clasificado como complejo, y si está expresado en la forma $re^{i\theta}$ será clasificado según el valor de $\theta$.

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

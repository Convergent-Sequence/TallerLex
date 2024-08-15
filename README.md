# TallerLex

Integrantes: <br>
-Camilo Andres López Contreras <br>
-Miguel Fernández De La Cruz <br>
-Kevin Nicolai Rodríguez García <br>

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

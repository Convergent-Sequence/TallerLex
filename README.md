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

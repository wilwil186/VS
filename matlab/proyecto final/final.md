# Proyecto Final - 15% - Matrices
Buenas tardes mis queridos Estudiantes.

En vista de que ya culminamos las exposiciones sobre los métodos para PVI (EDO's), paso a describir los puntos que se requiere en el Proyecto Final, el cual tiene que ver con operaciones con Matrices:

En primer lugar, su programa debe dar la opción de leer o generar de manera aleatoria una matriz de orden nxm o bien nxn, mostrarla y permitir que se pueda modificar o eliminar algún elemento, fila o columna.
	
Realizar una función B = Escalonar(A,n,m,col) que tenga como entrada la matriz A de orden nxm y realice el proceso de "escalonar" esta matriz hasta la columna col. La salida es la matriz B donde se ha hecho el proceso de escalonar hasta la columna col.
	
Diseñar una función C = Reducir(A,n,m,col) que tenga como entrada la matriz A de orden nxm y realice las operaciones por filas necesarias hasta la columna col de tal forma que la salida C sea la matriz escalonada reducida hasta la columna col. En esta subrutina se debe utilizar la función Escalonar(A,n,m,col).
	
Diseñar una función [B,solucion]=AnalizarSistema(A,b,n,m) que tenga como entrada un sistema de n ecuaciones con m incógnitas con matriz de coeficientes A y términos independientes el vector "b", realice las operaciones por filas necesarias e indique si el sistema tiene solución (solucion = true) y guarde el sistema equivalente en la matriz B.
	
Diseñar una función x = HallarSolucion(A,b,n,m) que se utilice en el caso que el sistema de la parte anterior tenga solución única.
	
Diseñar una función x = HallarBase(A,b,n,m) que se utilice en el caso que el sistema de la parte 4 tenga iinfinita soluciones y halle como generar todas las soluciones del sistema.
	
Diseñar una función dete = Determinante(A,n) que tenga como entrada una matriz cuadrada A de orden n y calcule, usando operaciones por filas, el determinante de la matriz.
	
Diseñar una función B = Inversa(A,n) que tenga como entrada la matriz cuadrada A de orden n y que calcule, si existe, la inversa de esta matriz.
	
Usando programación simbólica, haga una función [f,p] =PolCar(A,n) que tenga como entrada una matriz cuadrada A de orden n y calcule su polinomio característico el cual se archiv a en la variable de salida f. Use funciones como "simplify" o "expand" para efectuar los cálculos con polinomios. Guarde los coeficientes del polinomio ordenados de manera creciente en un vector de salida p.
	
Utilice el método de Horner y de Müller para hallar todos los ceros del polinomio característico, es decir, los autovalores de A (reales y complejos)
	
Haga un menú donde se ofrezca, realizar las tareas anteriores (hallar la forma escalonada, hallar la forma escalonada reducida por filas, resolver sistemas lineales, hallar determinantes, hallar inversas, hallar y graficar el polinomio característico, hallar los autovalores).

Recuerden que deben explicarme sus códigos a más tardar el día viernes 24 de noviembre y martes 28 de noviembre y que este trabajo tiene el valor del 15% del examen final.

Saludos cordiales

JR

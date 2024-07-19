
%{

Paso 1: leer el grado n y crear una función (recursiva)
que genere un vecor Poleg con los coeficientes del n-ésimo polinomio de
Legrende. 
    Paso 1.1 Hacer la gráfica de ese polinomio. 

Paso 2: Hallar las raìces del n-ésimo polinomio de legendre
    Paso 2.1: Modificar el metodo de horner para evaluar Poleg y su 
    derivada en x0 y tambièn guardar los coeficientes del polinomio 
    Q(x) que es el cociente de dividir Poleg por (x-x0). Preste especial 
    atención a la manera como se está creando los polinomios, puede ser que
    se necesite "invertir" el vector Poleg para que Horner los evalúe de 
    manera efectiva
    Paso 2.2. Modificar el método de Newton para hallar una raíz del 
    polinomio Poleg y de su derivada se deben hacer con el método de Honer.
    Paso 2.3. Crear una función r=raices_PL(n,Poleg) que tenga como entrada
    el grado n y el n-ésimo polinomio de Legrende (como vector) y tenga
    como salida el vector r con todas las raices de Poleg. Agregue a la
    gráfrica anterior estos puntos resaltando con un "*". 


Paso 3: Hallar los coeficientes c(k)
    Paso 3.1. Crear una función legk= Lagrende(r,n,k,x0) que tenga como
    entrada el evctor r de las raíces del n-ésimo polinomio ortogonal de
    Legrende, el grado n, el entero k y el valor x0 donde se desea evaluar 
    ln,k. la salida es LagK=productor ((x0-r(j)))/(r(k)-r(j)) con j
    distinto de k.
    paso 3.3 Crar la función c=Calcular_Ck(n,r). que tiene como entrada el
    vector r de las raíces del n-ésimo polinomio ortogonal de Legrende, el
    grado n, el enetero k y el valor x0 donde se desea evaluar Ln,k. la
    salida es Lagk = Producto((x0-r(j))/(r(k)-r(j))) con j distinto de k. 
    Paso 3.2 Crear la función c = Calcular_Ck(n,r). que tiene comoe entrada
    el grado n del polinomio de Legrende y el vector r con raices y la
    salida es el vector c(k) con k=1...n que son los coeficientes
    requeridos en el método de cruadatura y están dados por c(k)=
    intregal(Ln,k(x)) con lìmites -1 y 1. para hacer este cálculo, usaremos
    la regla compuesta de Simpson con N=1000, a=-1, b=1 y h=(b-a)/N.
    
Paso 4: Calcular los pesos de la cuadratura
La función simson se utiliza para calcular los pesos de la cuadratura 
de Gauss. Estos pesos se multiplican por los valores de la función 
evaluados en las raíces de los polinomios de Legendre para obtener la 
aproximación de la integral.

Paso 5: Calcular la aproximación de la integral
Finalmente, se calcula la aproximación de la integral sumando el producto 
de los pesos y los valores de la función evaluados en las raíces de los 
polinomios de Legendre.

Es importante tener en cuenta que el código proporcionado no está completo 
y faltan algunas funciones, como raiz y simson. Además, los comentarios en 
español están mezclados con comentarios en inglés. Si necesitas el código 
completo y funcional, te recomendaría buscar ejemplos o tutoriales 
en línea que te guíen paso a paso en la implementación de la cuadratura de Gauss utilizando Polinomios de Legendre en MATLAB.

%}

% Método de Newton 
% Declarar que voy a trabajar con la x 
clc; clear all; close all;
syms x;
% Entrada solución aproximada p_0 tolerancia tol; número máximo de
% iteraciones n_0
f = input("Introduza f(x)");
g = diff(f,x);
% ¿Diagrama?
p_0 = input("Aproximación inicial ");

Tol = input("ingrese la Tol=");
N_0 = input("introuza el n_0");

encontro = false; % se declara flaso por defecto
%paso 1
i = 1; % se declara la variable i
% paso 2  
while i <= N_0 && ~(encontro)
    c = eval(subs(f,p_0));
    d = eval(subs(g,p_0));
    % paso 3
    p = p_0 - (c/d);
    % paso 4
    if abs(p-p_0) < Tol
        disp(p) % (el procediemiento fue exitoso)
        encontro = true;
    end
    % paso 5 
    i = i+1;
    %paso 6
    p_0=p;
end
% paso 7 salida




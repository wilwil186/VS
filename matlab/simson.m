clc; % Limpiar la ventana de comandos
clear all; % Limpiar todas las variables del espacio de trabajo
close all; % Cerrar todas las figuras

syms x;

f = input("Introduzca una función f(x)="); % Por ejemplo: exp(-x^2)

n = input("Introduza n o número de particiones: "); 

if ~(mod(n,2)==0)
    n=n+1;
end

a=0; % limite inferior

b=1; % limite superior

h = (b-a)/n;

fa = eval(subs(f,a));
fb = eval(subs(f,b));

x0=a;

 
suma_impares = 0;
suma_pares = 0;

for j = 1:1:n/2
    suma_impares = suma_impares + eval(subs(f,a+2*j*h));
end

for j = 1:1:((n/2)-1)
    suma_pares = suma_pares + eval(subs(f, a+(2*j-1)*h));
end

% Calcular el resultado final utilizando la fórmula de Simpson
resultado = (h / 3) * (fa + 4 * suma_impares + 2 * suma_pares + fb);
disp(resultado); % Mostrar el resultado en la consola


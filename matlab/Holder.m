clc; clear all; close all;

n = input("n = "); % el grado
fprintf("Tome el polinomio de manera creciente ");

% Entrada de los coeficientes del polinomio
for k = 1:1:n+1
    fprintf("Exponente %2i",k-1)
    p(k)=input("");
end
x_0 = input("Ingrese el valor de x_0: ");
y = p(n+1);
z = p(n+1);
for j=n:-1:2
    y = (x_0*y)+p(j);
    z = (x_0*z)+y;
end 
% x = x_0
% h = p(0)

y = x_0*y+p(1);
fprintf("Polinomio = %5f",y);
fprintf("Derivdada del polinomio = %5f",z);


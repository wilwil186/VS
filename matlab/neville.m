% Clase 3 de oct 2023 metodos númericos
% limpiar todo
clc; clear all; close all;

% inicializar datos
x = [0.6,0.7,0.8,1];
y = [-0.1769,0.0137,0.2236,0.6580];

n = length(x); % la longitud de x para el iterador 
c=1.5;
%inicializar primera columna
%{
for k=1:1:n
    Q(k,1)=y(k);
end
%}
Q(:, 1) = y;
% General la matriz traingular inferior 

for j = 2:n
    for i = j:n
        Q(i, j) = ((c - x(i-j+1)) * Q(i, j-1) - (c- x(i)) * Q(i-1, j-1)) / (x(i) - x(i-j+1));
    end
end


valorInterpolado = Q(n, n);

disp(valorInterpolado)
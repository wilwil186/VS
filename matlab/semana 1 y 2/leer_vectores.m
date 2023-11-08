clc; clear all; close all;
% limpirar terminal ,Limpiar variables, cerrar ventandas 

n = input("Introduzca el tamaño del vector n =");

for j = 1:n 
    fprintf('Introduzca el tamaño del vector x(%2i)=',j);
    x(j)= input("");
end
fprintf('El vector es: x=(');

for j=1:n-1
    fprintf('%2i',x(j));
end 
fprintf('%2i). \n', x(n));

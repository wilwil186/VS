% 27 de oct 
%%% por defecto la cosa que limpia
% Limpia el entorno de trabajo y cierra todas las figuras
clc;
clear all;
close all;
% matriz A
fprintf('Por favor introduzca el orde n*m de la matriz A: \n')
n = input("Ingrese el número de filas de la A");
m = input("Ingrese el número de columnas de la A"); 
fprintf('Por favor introduzca el orde n*m de la matriz B: \n')
r = input("Ingrese el número de filas de la A");
h = input("Ingrese el número de columnas de la A"); 
% 
if ~(r==m)
    fprintf('No se puede veci :( \n')
else
    fprintf('si veci vamosa intresar los datos de la matriz')
    for i = 1:1:n % número de filas
        fprintf('> Fila # %2i : \n',i)
        for j=1:1:m
        fprintf(" a(%2d ,%2d) " ,i,j);
        A(i,j)=input("");
        end
    end
    disp(A)
    % matriz B
    fprintf('Por favor introduzca el orde n*m de la matriz A: \n')
    r = input("Ingrese el número de filas de la B");
    h = input("Ingrese el número de columnas de la B"); 
    for i = 1:1:r % número de filas
        for j=1:1:h
        fprintf("a(%i,%j)",i,j);
        b(i,j)=input("Ingrese a(i,j)");
        end
    end
    fprintf('vamos a multiplicar las matrices \n')
    for i=1:1:n % contador de filas
        for i=1:1:n
            c(i,j)=0;
            for k =1:1:m 
                c(i,j)=c(i,j)+a(i,k)*b(k,j);
            end
        end
    end
end
% leer una matriz a_{n*m} y hacer operaciones por filas para halla su forma
% escalonada reducida 


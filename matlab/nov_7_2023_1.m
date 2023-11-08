% Limpia la ventana de comandos, borra todas las variables y cierra todas las figuras
clc; clear all; close all;
% Buscar, si existen filas que tengan lado izquierdo con un único elemento no nulo 
% en caso que si, me interesa la psosición 
A = [[3 -2 3 -4 5 -1 4]; [0 3 -1 -2 0 1 3];[0 0 0 1 0 0 2];[0 0 0 0 1 1 2];[0 0 0 0 0 2 4]];
n=5; m = 7; % 5 filas (n) y 7 columnas (m)
for i = 1:1:n
    fila = i;
    contadorNoNulo(i) = 0;
    for j = 1:1:m-1
        if ~(A(fila,j)==0)
            contadorNoNulo(i) = contadorNoNulo(i)+1;
            Pos = j;
            Fpos = fila
        end
    end
end

% hallar la forma escalonada reducida por filas 

A = [[3 -2 3 -4 5 -1 4]; [0 3 -1 -2 0 1 3];[0 0 0 1 0 0 2];[0 0 0 0 1 1 2];[0 0 0 0 0 2 4]];
n = 5; 
m = 7; % 5 rows (n) and 7 columns (m)

for i = 1:1:n-1
    for j = i+1:1:n
        c = -A(j,i)/A(i,i);
        A(j,:) = A(j,:) + c*A(i,:);
    end
end

disp(A)

% Limpia la ventana de comandos, borra todas las variables y cierra todas las figuras
clc; clear all; close all;

% Definir la matriz A
A = [[0 0 1 2]; [1 1 2 2]; [2 0 0 1]];
n = 3;
m = 4;

% Paso 1: Convertir la matriz A a la forma escalonada
for col = 1:m
    Pos = col;
    encontro = false;
    fprintf("La matriz en el ciclo " + col  + " es:\n")
    disp(A)
    fila = 1;

    % Buscar una fila no nula en la columna actual
    while not(encontro)&&(fila<=n)
        if A(fila,m)==0
            fila = fila + 1;
        else
            norma = 0;
            % Calcular la norma de la fila
            for j = 1:1:m-1
                norma = norma + abs(A(fila,j));
            end
            if norma == 0
                encontro = true;
            else
                fila = fila + 1;
            end 
        end
    end

    % Convertir los elementos de la fila "Pos" para hacer cero el primer elemento de la columna
    if encontro == true 
        for i=Pos+1:1:n
            c = -A(i,1)/A(Pos,1); % el valor que multiplica a la fila Pos
            % Multiplicar la fila Pos por c y sumarla a la fila i
            for j=1:1:m 
                A(i,j)=A(i,j)+c*A(Pos,j);
            end
        end
        disp(A)

        if not(Pos==1)
            % Intercambiar la fila Pos con la primera fila
            for j=1:1:m
                Aux=A(Pos,1);
                A(Pos,j)=A(1,j);
                A(1,j)=Aux;
            end
            disp(A); % la primera columna se obtiene ahora
        end
    end
end

% Verificar si el sistema de ecuaciones tiene solución
if encontro == true
   disp("El sistema no tiene solución")
else
   disp("El sistema tiene solución")

   % Resolución del sistema de ecuaciones mediante sustitución hacia atrás
   for i = 1:n-1
       % Paso 2
       p = find(A(i:n,i), 1) + i - 1;
       if isempty(p) % verifica si la variable p está vacía
           disp("No existe una solución única");
           return;
       end
       
       % Paso 3
       if p ~= i
           A([i p], :) = A([p i], :);
       end

       % Paso 4
       for j = i+1:n
           % Paso 5
           mji = A(j,i) / A(i,i);

           % Paso 6
           A(j,:) = A(j,:) - mji * A(i,:);
       end
   end

   % Paso 7
   if A(n,n) == 0
       disp("No existe una solución única");
       return;
   end

   % Paso 8
   xn = A(n,n+1) / A(n,n);

   % Paso 9
   for i = n-1:-1:1
       xi = A(i,n+1) - sum(A(i,i+1:n) .* (A(i+1:n,n+1)'));
       xi = xi / A(i,i);
       fprintf("x%d = %f\n", i, xi);
   end

   % Paso 10
   fprintf("x%d = %f\n", n, xn);
end

% me de una base o lo que genera el conjunto solución 

% hacer un procediemiento para contar el # de filas linealmnete
% independientes 

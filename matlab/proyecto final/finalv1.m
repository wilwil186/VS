%En primer lugar, su programa debe dar la opción de leer o generar de manera aleatoria una matriz de 
%orden nxm o bien nxn, mostrarla y permitir que se pueda modificar o eliminar algún elemento, 
%fila o columna.
clc; clear all; close all;
%%%%%%%%%%%punto1%%%%%%%%%%%%%%%%%%
% Opción para leer o generar aleatoriamente las matrices
opcion = input('Seleccione una opción:\n 1. Leer matrices\n 2. Generar aleatoriamente matrices\n');

if opcion == 1 % si selecciono insertar matriz
    % Leer matrices desde el usuario
    n = input('Ingrese el número de filas de la matriz A: ');
    m = input('Ingrese el número de columnas de la matriz A: ');

    A = zeros(n, m);

    for i = 1:1:n % número de filas
        fprintf('> Fila # %2i : \n',i)
        for j=1:1:m
        fprintf(" a(%2d ,%2d) " ,i,j);
        A(i,j)=input("");
        end
    end

    r = input('Ingrese el número de filas de la matriz B: ');
    h = input('Ingrese el número de columnas de la matriz B: ');

    B = zeros(r, h);

    for i = 1:1:n % número de filas
        fprintf('> Fila # %2i : \n',i)
        for j=1:1:m
        fprintf(" a(%2d ,%2d) " ,i,j);
        B(i,j)=input("");
        end
    end

elseif opcion == 2
    % Generar matrices aleatorias
    n = input('Ingrese el número de filas de la matriz A: ');
    m = input('Ingrese el número de columnas de la matriz A: ');

    A = randi([1, 10], n, m); % Genera números aleatorios entre 1 y 10

    r = input('Ingrese el número de filas de la matriz B: ');
    h = input('Ingrese el número de columnas de la matriz B: ');

    B = randi([1, 10], r, h); % Genera números aleatorios entre 1 y 10

else
    fprintf('Opción no válida\n');
    return;
end

% Mostrar matrices
disp('Matriz A:');
disp(A);

disp('Matriz B:');
disp(B);
%%%%%%%%%%%punto1%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%% ejemplo de la función escalonar 
% Aplicar la función Escalonar a la matriz A hasta la columna col
col = input('Ingrese la columna hasta la cual desea escalonar: ');
A_escalonada = Escalonar(A, n, m, col);

% Aplicar la función Escalonar a la matriz B hasta la columna col
B_escalonada = Escalonar(B, r, h, col);

% Mostrar matrices escalonadas
disp('Matriz A escalonada:');
disp(A_escalonada);

disp('Matriz B escalonada:');
disp(B_escalonada);
%%%%%%%%%%%%%%%%%%% ejemplo de la función escalonar

%%%%%%%%%%%%%%%%%%%%%%%%%funciones%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%punto2%%%%%%%%%%%%%%%%%%
%Realizar una función B = Escalonar(A,n,m,col) que tenga como entrada la matriz A de orden nxm 
%y realice el proceso de "escalonar" esta matriz hasta la columna col. La salida es la matriz 
%B donde se ha hecho el proceso de escalonar hasta la columna col.

function B = Escalonar(A, n, m, col)
    % Asegurarse de que col no exceda las dimensiones de la matriz
    col = min(col, m - 1);

    % Realizar el escalonamiento de la matriz
    for k = col:-1:1
        % Buscar la última fila no cero en la columna actual
        for fila = n:-1:1
            if A(fila, k) ~= 0
                break;
            end
        end

        % Si se encuentra una fila no cero, realizar operaciones de fila
        if A(fila, k) ~= 0
            % Convertir en ceros los elementos por encima del elemento no cero
            for i = fila - 1:-1:1
                factor = -A(i, k) / A(fila, k);
                for j = 1:m
                    A(i, j) = A(i, j) + factor * A(fila, j);
                end
            end

            % Normalizar la fila con el elemento no cero
            factor = 1 / A(fila, k);
            for j = 1:m
                A(fila, j) = A(fila, j) * factor;
            end
        end
    end

    % Devolver la matriz escalonada
    B = A;
end
%%%%%%%%%%%punto2%%%%%%%%%%%%%%%%%%

%Diseñar una función C = Reducir(A,n,m,col) que tenga como entrada la matriz A de orden nxm y 
%realice las operaciones por filas necesarias hasta la columna col de tal forma que la salida 
%C sea la matriz escalonada reducida hasta la columna col. En esta subrutina se debe utilizar la 
%función Escalonar(A,n,m,col).
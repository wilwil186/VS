clc; clear all; close all;

%%%%%%%%%%%punto1%%%%%%%%%%%%%%%%%%

%En primer lugar, su programa debe dar la opción de leer o generar de manera aleatoria una matriz de 
%orden nxm o bien nxn, mostrarla y permitir que se pueda modificar o eliminar algún elemento, 
%fila o columna.

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

    for i = 1:1:r % número de filas
        fprintf('> Fila # %2i : \n',i)
        for j=1:1:h
        fprintf(" b(%2d ,%2d) " ,i,j);
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


%%%%%%%%%%%%%%%%%%% Ejemplo de la función reducir
% Aplicar la función Reducir a la matriz A hasta la columna col
col = input('Ingrese la columna hasta la cual desea reducir: ');
A_reducida = Reducir(A, n, m, col);

% Aplicar la función Reducir a la matriz B hasta la columna col
B_reducida = Reducir(B, r, h, col);

% Mostrar matrices reducidas
disp('Matriz A reducida:');
disp(A_reducida);

disp('Matriz B reducida:');
disp(B_reducida);
%%%%%%%%%%%%%%%%%%% Ejemplo de la función reducir

%%%%%%%%%%%%%%%%%%% Ejemplo de la función AnalizarSistema
% Llamar a la función AnalizarSistema
[B, tiene_solucion, tiene_infinitas_soluciones] = AnalizarSistema(A, n, m);
%%%%%%%%%%%%%%%%%%% Ejemplo de la función AnalizarSistema
%%%%%%%%%%%%%%%%%%% Ejemplo a la función encontrarBasesEspacioSolu
if tiene_infinitas_soluciones == true
    disp('El sistema tiene infinitas soluciones.');

    % Llamar a la función encontrarBasesEspacioSolucion
    bases = encontrarBasesEspacioSolucion(A);

    % Mostrar las bases del espacio de soluciones
    disp('Bases del espacio de soluciones:\n');
    disp(bases);
else
    disp('El sistema no tiene infinitas soluciones.\n');
end
%%%%%%%%%%%%%%%%%%% Ejemplo a la función encontrarBasesEspacioSolu
%%%%%%%%%%%%%%%%%%% Ejemplo de la función Determinante

%%%%%%%%%%%%%%%%%%%%%%%%%funciones%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%punto2%%%%%%%%%%%%%%%%%%
%Realizar una función B = Escalonar(A,n,m,col) que tenga como entrada la matriz A de orden nxm 
%y realice el proceso de "escalonar" esta matriz hasta la columna col. La salida es la matriz 
%B donde se ha hecho el proceso de escalonar hasta la columna col.

function B = Escalonar(A, n, m, col)
    col = min(col, m);

    for k = 1:col
        % Buscar el primer elemento no cero desde arriba hacia abajo en la columna k
        fila_pivote = 0;
        for fila = k:n
            if A(fila, k) ~= 0
                fila_pivote = fila;
                break;
            end
        end

        % Continuar solo si se encontró un pivote
        if fila_pivote > 0
            % Intercambiar filas si el pivote no está en la fila k
            if fila_pivote ~= k
                temp = A(k, :);
                A(k, :) = A(fila_pivote, :);
                A(fila_pivote, :) = temp;
            end

            % Realizar operaciones de fila para hacer ceros debajo del pivote
            for i = k+1:n
                factor = -A(i, k) / A(k, k);
                A(i, :) = A(i, :) + factor * A(k, :);
            end
        end
    end

    B = A;
end


%%%%%%%%%%%punto2%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%punto3%%%%%%%%%%%%%%%%%%
%Diseñar una función C = Reducir(A,n,m,col) que tenga como entrada la matriz A de orden nxm y 
%realice las operaciones por filas necesarias hasta la columna col de tal forma que la salida 
%C sea la matriz escalonada reducida hasta la columna col. En esta subrutina se debe utilizar la 
%función Escalonar(A,n,m,col).

%%%%%%%%%%%punto3%%%%%%%%%%%%%%%%%%
% Función para reducir la matriz hasta la columna col
function C = Reducir(A, n, m, col)
    % Llamar a la función Escalonar para realizar el escalonamiento
    A_escalonada = Escalonar(A, n, m, col);

    % Reducir la matriz escalonada
    for k = col:-1:1
        % Buscar la primera fila no cero en la columna actual
        fila_pivote = 0;
        for fila = n:-1:1
            if A_escalonada(fila, k) ~= 0
                fila_pivote = fila;
                break;
            end
        end

        % Continuar solo si se encontró un pivote
        if fila_pivote > 0
            % Normalizar la fila del pivote
            A_escalonada(fila_pivote, :) = A_escalonada(fila_pivote, :) / A_escalonada(fila_pivote, k);

            % Hacer ceros los elementos por encima y debajo del pivote
            for i = 1:n
                if i ~= fila_pivote
                    factor = -A_escalonada(i, k);
                    A_escalonada(i, :) = A_escalonada(i, :) + factor * A_escalonada(fila_pivote, :);
                end
            end
        end
    end

    % Hacer que cada elemento de la diagonal principal sea 1
    for i = 1:n
        factor = 1 / A_escalonada(i, i);
        A_escalonada(i, :) = factor * A_escalonada(i, :);
    end

    % Asignar el resultado a la salida
    C = A_escalonada;
end
%%%%%%%%%%%punto3%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%punto4%%%%%%%%%%%%%%%%%%
%Diseñar una función [B,solucion]=AnalizarSistema(A,b,n,m) que tenga como entrada un sistema de n 
%ecuaciones con m incógnitas con matriz de coeficientes A y términos independientes el vector "b", 
%realice las operaciones por filas necesarias e indique si el sistema tiene solución (solucion = true) 
%y guarde el sistema equivalente en la matriz B. AnalizarSistema(A, n, m)
function [B, solucion, tiene_infinitas_soluciones] = AnalizarSistema(A, n, m)
    % Separar la última columna de la matriz A como el vector b
    b = A(:, end);
    A = A(:, 1:end-1);
    m = m-1;
    % Combinar matriz de coeficientes A y términos independientes b
    B = [A, b];
    
    % Inicializar las variables antes del bucle
    solucion = false;
    tiene_infinitas_soluciones = true;

    for col = 1:m
        % Buscar el primer elemento no nulo en la columna
        fila_no_cero = 0;
        for fila = col:n
            if B(fila, col) ~= 0
                fila_no_cero = fila;
                break;
            end
        end

        % Si no hay elementos no nulos en la columna, el sistema no tiene solución
        if fila_no_cero == 0
            solucion = false;
            break;
        end

        % Intercambiar filas si es necesario
        if fila_no_cero ~= col
            B([col, fila_no_cero], :) = B([fila_no_cero, col], :);
        end

        % Hacer ceros por debajo del pivote
        for fila = col+1:n
            factor = -B(fila, col) / B(col, col);
            B(fila, :) = B(fila, :) + factor * B(col, :);
        end
    end

    % Contar el número de variables libres
    num_variables = m - 1; % Restar 1 para excluir la columna de términos independientes
    num_variables_libres = sum(all(B(:, 1:num_variables) == 0, 2));

    % Verificar si el sistema tiene infinitas soluciones
    if num_variables_libres == num_variables
        tiene_infinitas_soluciones = false;
        disp('El sistema no tiene infinitas soluciones')
    end

    % Buscar fila con lado izquierdo cero, y lado derecho número
    encontro = false;
    fila = 1;

    while ~encontro && (fila <= n)
        if B(fila, m) == 0
            fila = fila + 1;
        else
            norma = 0;
            for j = 1:m-1
                norma = norma + abs(B(fila, j));
            end
            if norma == 0
                encontro = true;
            else
                fila = fila + 1;
            end 
        end
    end

    % si no es cero
    if encontro 
        fprintf('El sistema no tiene solución\n');
    else
        fprintf('El sistema tiene solución\n');
        if num_variables_libres == m-1 % solución única, m-1 número de incógnitas
            x(m-1) = B(m-1, m) / B(m-1, m-1);
            for i = m-2:-1:1
                suma = 0;
                for j = i+1:m-1
                    suma = suma + B(i, j) * x(j);
                end
                x(i) = (B(i, m) - suma) / B(i, i);
            end
            disp(x);
        else 
            % Lógica para manejar el caso de infinitas soluciones (cositas)
        end
    end
end


%%%%%%%%%%%punto4%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%punto5%%%%%%%%%%%%%%%%%%
%Diseñar una función x = HallarBase(A,b,n,m) que se utilice en el caso que el sistema de la parte
%4 tenga infinita soluciones y halle como generar todas las soluciones del sistema.
function bases = encontrarBasesEspacioSolucion(A)
    % Extraer la última columna de la matriz A como el vector de términos constantes b
    b = A(:, end);
    A = A(:, 1:end-1);

    % Combinar la matriz de coeficientes A y el vector de términos constantes b
    matriz_ampliada = [A, b];

    % Aplicar eliminación gaussiana para obtener la forma escalonada reducida
    [R, pivote] = rref(matriz_ampliada);

    % Identificar las filas nulas en R, que representan variables libres
    filas_nulas = find(all(R(:, 1:end-1) == 0, 2));

    % Determinar el número de variables y restricciones
    num_variables = size(A, 2);
    num_restricciones = size(A, 1);

    % Calcular el número de variables libres
    num_variables_libres = num_variables - num_restricciones;

    % Inicializar bases con las variables libres
    bases = zeros(num_variables_libres, num_variables);

    % Generar combinaciones lineales para las variables libres
    for i = 1:num_variables_libres
        % Establecer la variable libre actual a 1
        bases(i, pivote(num_restricciones + i)) = 1;

        % Resolver el sistema de ecuaciones
        solution = R(:, end);
        for j = num_variables_libres:-1:1
            solution = R(:, 1:num_variables) * bases(j, :)';
            bases(j, pivote(num_restricciones + i)) = -solution(pivote(num_restricciones + i)) / R(pivote(num_restricciones + i), pivote(num_restricciones + i));
            solution = R(:, end);
        end
    end
end
%%%%%%%%%%%punto5%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%punto6%%%%%%%%%%%%%%%%%%
%Diseñar una función dete = Determinante(A,n) que tenga como entrada una matriz cuadrada A de orden 
%n y calcule, usando operaciones por filas, el determinante de la matriz.
function detA = Determinante(A)
    [n, m] = size(A);

    % Verificar si la matriz es cuadrada
    if n ~= m
        disp("La matriz no es cuadrada. No se puede calcular el determinante.");
        detA = [];
        return;
    end

    % Inicializar matriz extendida
    A_extended = [A eye(n)];

    for col = 1:n
        Pos = col;
        encontro = false;

        % Buscar el primer elemento no nulo en la columna
        while ~(encontro) && (Pos <= n)
            if A_extended(Pos, col) == 0
                Pos = Pos + 1;
            else
                encontro = true;
            end
        end

        % Verificar si se encontró un elemento no nulo en la columna
        if encontro
            % Convertir los elementos debajo del primer elemento en cero
            for i = Pos + 1:n
                c = -A_extended(i, col) / A_extended(Pos, col);

                % Realizar la eliminación gaussiana en la matriz extendida
                for j = col:n * 2
                    A_extended(i, j) = A_extended(i, j) + c * A_extended(Pos, j);
                end
            end

            % Intercambiar la primera fila con la fila que contiene el primer elemento no nulo
            if not(Pos == col)
                for j = col:n * 2
                    Aux = A_extended(Pos, j);
                    A_extended(Pos, j) = A_extended(col, j);
                    A_extended(col, j) = Aux;
                end
            end
        end
    end

    % Calcular el determinante
    detA = 1;
    for i = 1:n
        detA = detA * A_extended(i, i);
    end
end
%%%%%%%%%%%punto6%%%%%%%%%%%%%%%%%%
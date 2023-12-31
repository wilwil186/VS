% Wilson Eduardo Jerez Hernández cod: 20181167034
% Laura Daniela Ardila Ortiz cod: 20201167072
clc;
clear all;
close all;
% Crear una figura y un menú
f = figure('Name', 'Menú Proyecto final');
m = uimenu(f, 'Text', 'Tareas');
% Definir las funciones para cada opción del menú
m0 = uimenu(m, 'Text', 'crear matrices', 'MenuSelectedFcn', @crearMostrarMatrices);
m1 = uimenu(m, 'Text', 'Encontrar Forma Escalonada', 'MenuSelectedFcn', @Escalonar);
m2 = uimenu(m, 'Text', 'Reducir', 'MenuSelectedFcn', @Reducir);
m3 = uimenu(m, 'Text', 'AnalizarSistema', 'MenuSelectedFcn', @AnalizarSistema);
m4 = uimenu(m, 'Text', 'Encontrar Bases Espacio Solución', 'MenuSelectedFcn', @encontrarBasesEspacioSolucion);
m5 = uimenu(m, 'Text', 'Encontrar Determinantes', 'MenuSelectedFcn', @determinante);
m6 = uimenu(m, 'Text', 'Encontrar Inversas', 'MenuSelectedFcn', @Inversa);
m7 = uimenu(m, 'Text', 'Polinomio Característico', 'MenuSelectedFcn', @PolCar);
m8 = uimenu(m, 'Text', 'Encontrar Autovalores', 'MenuSelectedFcn', @mullerMethodHolder);
%%%%%%%%%%%%%%%%%%%%%%%%%FUNCIONES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A = crearMostrarMatricesA(~,~)
    % Opción para leer o generar aleatoriamente las matrices
    opcion = input('Seleccione una opción:\n 1. Leer la matriz\n 2. Generar aleatoriamente la matriz\n');
    if opcion == 1 % si selecciona insertar matriz
        % Leer matrices desde el usuario
        n = input('Ingrese el número de filas de la matriz A: ');
        m = input('Ingrese el número de columnas de la matriz A: ');
        A = zeros(n, m);
        for i = 1:1:n % número de filas
            fprintf('> Fila # %2i : \n', i)
            for j = 1:1:m
                fprintf(" a(%2d ,%2d) ", i, j);
                A(i, j) = input("");
            end
        end
    elseif opcion == 2
        % Generar matrices aleatorias
        n = input('Ingrese el número de filas de la matriz A: ');
        m = input('Ingrese el número de columnas de la matriz A: ');
        A = randi([1, 10], n, m); % Genera números aleatorios entre 1 y 10
    else
        fprintf('Opción no válida\n');
        return;
    end
    % Mostrar matrices
    disp('Matriz A:');
    disp(A);
end
function [A, B] = crearMostrarMatrices(~,~)
    % Opción para leer o generar aleatoriamente las matrices
    opcion = input('Seleccione una opción:\n 1. Leer matrices\n 2. Generar aleatoriamente matrices\n');
    if opcion == 1 % si selecciona insertar matriz
        % Leer matrices desde el usuario
        n = input('Ingrese el número de filas de la matriz A: ');
        m = input('Ingrese el número de columnas de la matriz A: ');
        A = zeros(n, m);
        for i = 1:1:n % número de filas
            fprintf('> Fila # %2i : \n', i)
            for j = 1:1:m
                fprintf(" a(%2d ,%2d) ", i, j);
                A(i, j) = input("");
            end
        end
        r = input('Ingrese el número de filas de la matriz B: ');
        h = input('Ingrese el número de columnas de la matriz B: ');
        B = zeros(r, h);
        for i = 1:1:r % número de filas
            fprintf('> Fila # %2i : \n', i)
            for j = 1:1:h
                fprintf(" a(%2d ,%2d) ", i, j);
                B(i, j) = input("");
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
end
%%%%%%%%%%% comienzo punto 2 %%%%%%%%%%%%%%%%%%
%Realizar una fución B = Escalonar(A,n,m,col) que tenga como entrada la matriz A de orden nxm 
%y realice el proceso de "escalonar" esta matriz hasta la columna col. La salida es la matriz 
%B donde se ha hecho el proceso de escalonar hasta la columna col.
%function B = Escalonar(A, n, m, col)
function A = Escalonar(~,~)
    A = crearMostrarMatricesA();
    [n, m] = size(A);
    col = input('Ingrese la columna hasta la cual desea escalonar: ');
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
    % Mostrar matrices escalonadas
    disp('Matriz A escalonada:');
    disp(A);
end
%%%%%%%%%%% Fin punto 2 %%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Comienzo punto 3 %%%%%%%%%%%%%%%%%%
%Diseñar una función C = Reducir(A,n,m,col) que tenga como entrada la matriz A de orden nxm y 
%realice las operaciones por filas necesarias hasta la columna col de tal forma que la salida 
%C sea la matriz escalonada reducida hasta la columna col. En esta subrutina se debe utilizar la 
%función Escalonar(A,n,m,col).
%%%%%%%%%%%punto3%%%%%%%%%%%%%%%%%%
% Función para reducir la matriz hasta la columna col
    function C = Reducir(~,~)
    % Llamar a la función Escalonar para realizar el escalonamiento
    A_escalonada= Escalonar();
    col = input('Ingrese la columna hasta la cual desea reducir: ');
    [n, m] = size(A_escalonada);
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
    disp('Matriz A reducida:');
    disp(C);
end
%%%%%%%%%%% Fin punto 3 %%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Comienzo punto 4%%%%%%%%%%%%%%%%%%
%Diseñar una función [B,solucion]=AnalizarSistema(A,b,n,m) que tenga como entrada un sistema de n 
%ecuaciones con m incógnitas con matriz de coeficientes A y términos independientes el vector "b", 
%realice las operaciones por filas necesarias e indique si el sistema tiene solución (solucion = true) 
%y guarde el sistema equivalente en la matriz B.
function [B, solucion, tiene_infinitas_soluciones] = AnalizarSistema(~,~)
    A = Reducir();
    [n, m] = size(A);
    % Separar la última columna de la matriz A como el vector b
    b = A(:, end);
    A = A(:, 1:end-1);
    m = m - 1;
    % Combinar matriz de coeficientes A y términos independientes b
    B = [A, b];
    
    % Inicializar las variables antes del bucle
    solucion = true;
    tiene_infinitas_soluciones = false;
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
    % Contar el número de pivotes (variables dependientes)
    num_pivotes = sum(any(B(:, 1:m) ~= 0, 1));
    % Calcular el número de variables libres
    num_variables_libres = m - num_pivotes;
    % Verificar si el sistema tiene infinitas soluciones
    if num_variables_libres > 0
        tiene_infinitas_soluciones = true;
        disp('El sistema tiene infinitas soluciones\n')
    end
    % Buscar fila con lado izquierdo cero, y lado derecho número
    encontro = false;
    fila = 1;
    while ~encontro && (fila <= n)
        if B(fila, m+1) == 0
            fila = fila + 1;
        else
            norma = 0;
            for j = 1:m
                norma = norma + abs(B(fila, j));
            end
            if norma == 0
                encontro = true;
            else
                fila = fila + 1;
            end 
        end
    end
    % Si se encontró una fila inconsistente
    if encontro 
        solucion = false;
        fprintf('El sistema no tiene solución\n');
    else
        fprintf('El sistema tiene solución\n');
        if num_variables_libres == 0 % solución única
            x = zeros(1, m);
            for i = m:-1:1
                suma = B(i, end);
                for j = i+1:m
                    suma = suma - B(i, j) * x(j);
                end
                x(i) = suma / B(i, i);
            end
            disp(x);
        else 
            % Lógica para manejar el caso de infinitas soluciones (cositas)
        end
    end
end
%%%%%%%%%%% Fin punto 4 %%%%%%%%%%%%%%%%%%
%Diseñar una función x = HallarSolucion(A,b,n,m) que se utilice en el caso
%que el sistema de la parte anterior tenga solución única.
%%%%%%%%%%% Comienzo punto 5 %%%%%%%%%%%%%%%%%%
%Diseñar una función x = HallarBase(A,b,n,m) que se utilice en el caso que el sistema de la parte
%4 tenga infinita soluciones y halle como generar todas las soluciones del sistema.
%%%%%%%%%%% Fin punto 5 %%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Comienzo punto 6 %%%%%%%%%%%%%%%%%%
function bases = encontrarBasesEspacioSolucion(~,~)
    [A, solution, tiene_infinitas_soluciones] = AnalizarSistema();
    % Extraer la última columna de la matriz A como el vector de términos constantes b
    b = A(:, end);
    A = A(:, 1:end-1);
    % Combinar la matriz de coeficientes A y el vector de términos constantes b
    matriz_ampliada = [A, b];
    % Aplicar eliminación gaussiana para obtener la forma escalonada reducida
    [R, pivote] = rref(matriz_ampliada);
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
    if tiene_infinitas_soluciones 
        disp('El sistema tiene infinitas soluciones.');
        % Llamar a la función encontrarBasesEspacioSolucion
        bases = encontrarBasesEspacioSolucion(A);
        % Mostrar las bases del espacio de soluciones
        disp('Bases del espacio de soluciones:');
        disp(bases);
    else
        disp('El sistema no tiene infinitas soluciones.');
    end
end
%%%%%%%%%%% Fin punto 6 %%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Comienzo punto 7 %%%%%%%%%%%%%
% Función determinante
% Calcula el determinante de una matriz cuadrada A de tamaño n
function det = determinante(~,~)
    A = crearMostrarMatricesA();
    [n, m] = size(A);
    if n == 1
    % Caso base: si la matriz es 1x1, el determinante es el elemento mismo
    det = A(1,1);
    elseif n == 2
        % Caso para matriz 2x2: calcula el determinante con la fórmula estándar
        det = A(1,1)*A(2,2) - A(1,2)*A(2,1);
    else
        % Para matrices de tamaño mayor a 2x2, usa la expansión por cofactores
        det = 0;
        for j = 1:n
            % Elimina la primera fila y la columna j-ésima para obtener una submatriz
            B = eliminarij(A, n, 1, j);
            % Calcula el determinante de la submatriz y acumula el resultado
            det = det + (-1)^(1+j) * A(1,j) * determinante(B, n-1);
        end
    end
    disp('El determinante de A es:')
    disp(det);
end
function det = determinantef(A, n)
    if n == 1
        % Caso base: si la matriz es 1x1, el determinante es el elemento mismo
        det = A(1,1);
    elseif n == 2
        % Caso para matriz 2x2: calcula el determinante con la fórmula estándar
        det = A(1,1)*A(2,2) - A(1,2)*A(2,1);
    else
        % Para matrices de tamaño mayor a 2x2, usa la expansión por cofactores
        det = 0;
        for j = 1:n
            % Elimina la primera fila y la columna j-ésima para obtener una submatriz
            B = eliminarij(A, n, 1, j);
            % Calcula el determinante de la submatriz y acumula el resultado
            det = det + (-1)^(1+j) * A(1,j) * determinante(B, n-1);
        end
    end
end
% Función eliminarij
% Elimina la fila i y la columna j de la matriz A de tamaño n
function B = eliminarij(A, n, i, j)
    % Elimina la fila i
    for k = i:n-1
        A(k, :) = A(k+1, :);
    end 
    % Elimina la columna j
    for k = j:n-1
        A(:, k) = A(:, k+1);
    end
    % La matriz resultante se asigna a B
    B = A;
end
%%%%%%%%%%% Fin punto 7 %%%%%%%%%%%%%
%%%%%%%%%%% Comienzo punto 8 %%%%%%%%%%%%%
% Definición de la función Inversa
function B = Inversa(~,~)
    A = crearMostrarMatricesA();
    [n, m] = size(A);
    % Verifica si A es una matriz cuadrada de orden n
    if size(A, 1) ~= n || size(A, 2) ~= n
        error('La matriz A debe ser cuadrada de orden n');
    end
    % Verifica si la matriz A es invertible (determinante no cero)
    if determinantef(A, n) == 0
        error('La matriz A no es invertible (determinante cero)');
    end
    % Concatena la matriz A con la matriz identidad de tamaño n
    AI = [A eye(n)];
    % Proceso de eliminación de Gauss-Jordan
    for i = 1:n
        % Normaliza la fila i para que el elemento diagonal sea 1
        AI(i,:) = AI(i,:) / AI(i,i);
        % Elimina los elementos en la columna i de las otras filas
        for j = 1:n
            if i ~= j
                AI(j,:) = AI(j,:) - AI(i,:) * AI(j,i);
            end
        end
    end
    % Extrae la matriz inversa de la parte derecha de AI
    B = AI(:,n+1:end);
    disp('Inversa de la matriz A')
    disp(B)
end
%%%%%%%%%%% Fin punto 8 %%%%%%%%%%%%%
%%%%%%%%%%% Comienzo punto 9 %%%%%%%%%%%%%
function [f, p] = PolCar(~,~)
   A = crearMostrarMatricesA();
   % Verificar si A es una matriz cuadrada
   [n, m] = size(A);
   if n ~= m
       error('La matriz A debe ser cuadrada');
   end
   syms lambda
   % Calcular el polinomio característico como det(A - lambda*I)
   I = eye(n); % Crear matriz identidad de tamaño n
   polinomio = determinantef(A - lambda*I,n);
    % Simplificar el polinomio característico
    f = simplify(polinomio);
    % Expandir el polinomio característico
    f = expand(f);
    % Extraer los coeficientes del polinomio
    coeficientes = sym2poly(f);
    % Invertir el orden de los coeficientes usando un bucle for
    p = zeros(size(coeficientes));
    for i = 1:length(coeficientes)
        p(i) = coeficientes(length(coeficientes) - i + 1);
    end
    disp('polinomio característico')
    disp(p)
end
%%%%%%%%%%% Fin punto 9 %%%%%%%%%%%%%

%%%%%%%%%%% Comienzo punto 10 %%%%%%%%%%%%%
%Utilice el método de Horner y de Müller para hallar todos los ceros del polinomio característico,
% es decir, los autovalores de A (reales y complejos)
% Método de Müller
% p0 = -1;
%function root = mullerMethodHolder(f, x0, Tol, Nmax)
function root = mullerMethodHolder(~,~)
    Tol= input('Tolerancia:'); % 1e-6
    Nmax = input('Maximo de iteraciones:'); %100
    x0 = input('punto inical:'); % 0
    [p, f] = PolCar();
    n = length(f) - 1; % grado del polinomio 
    i = 1;
    p0 =0;
    encontrado = false;
    %newton
    while (i <= Nmax) && ~(encontrado)
        [y, z, q] = Horner(n, f, x0);
        p = p0 - y / z;
        if abs(p - p0) < Tol
            encontrado = true;
        end
        i = i + 1;
        p0 = p;
    end
    %newton
    root = p;
    fprintf('Los autovalores de A:\n');
    disp(root);
end

% Función para evaluar un polinomio mediante el método de Horner
function [y, z, q] = Horner(n, h, x0)
    q(n) = h(n + 1);
    z = h(n + 1);

    for i = n:-1:2
        q(i - 1) = x0 * q(i) + h(i);
        z = x0 * z + q(i - 1);
    end

    y = x0 * q(1) + h(1);
end
% Punto 1a - Quiz Métodos Numéricos y Computación

% perdirle al usuario el valor de p 
p = input('Ingresa el valor de p: ');

% perdirle al usuario el valor de N
N = input('Ingresa un número positivo N: ');

termino = 0; 
i = 1; 
while i <= N
    termino = termino + (1/(i^p));
    i = i +1;
end
% mostrar en pantalla
fprintf('El valor estimado de la serie-p para p = %.2f y N = %d es: %.4f\n', p, N, termino);


% Punto 1b - Quiz Métodos Numéricos y Computación

% Pedir al usuario el valor de p
p = input('Ingresa el valor de p: ');

if p > 1
    % Pedir al usuario que ingrese el valor de tolerancia TOL
    TOL = input('Ingresa el valor de tolerancia (TOL > 0): ');
    
    % Inicializar variables
    pe = 2; % Potencia para la serie
    N = 1;  % Inicializar contador de términos
    i = 1;  % Inicializar contador de iteraciones
    termino = 0; % Inicializar el término actual
    aux = 0;     % Valor auxiliar para comparación

    % Calcular la serie hasta que la diferencia entre términos consecutivos sea menor a la tolerancia
    while abs(termino - aux) < TOL
        aux = termino;
        termino = termino + (1 / (i^pe));
        i = i + 1;
        N = N + 1;
    end
end

% Mostrar el resultado de la aproximación y el valor de N
fprintf('Aproximación de la serie: %.4f\n', termino);
fprintf('Valor de N: %d\n', N);

% Punto 2a - Quiz Métodos Numéricos y Computación

% Necesito el valor de N que es la longitud del vector 
N = input('Ingresa el valor de N: ');

% Crear un vector fila de longitud N
COD = zeros(1, N);

% Este loop es para pedir el código del estudiante en la posición i 
for i = 1:N
    COD(i) = input('Ingresa el código del estudiante: ');
end

% todo esto lo asumo en el diagrama de flujo como que yo mismo 
% escribi el vector, pero añado al usuario para hacer un programa 
% un poco mas funcional 

% Ordenar la lista de códigos en orden descendente usando el método de la burbuja
j = 1;
while j <= N % N = length(COD) 
    for i = 1:N-1 % Cambiado a N-1
        if COD(i) < COD(i+1)
            % Intercambiar elementos para ordenar de mayor a menor
            aux = COD(i);
            COD(i) = COD(i+1); % Aquí estaba COD(i), cambiado a COD(i+1)
            COD(i+1) = aux; % variable auxiliar pues el vaso cod i se cambio en la linea anterior 
        end
    end
    j = j + 1; % en los ciclos while es importante poner una condición que permita la finalización del ciclo 
end

% Mostrar la lista de códigos ordenados de mayor a menor
fprintf('Lista de códigos ordenados de mayor a menor:\n');
disp(COD);



% Punto 2b - Quiz Métodos Numéricos y Computación

% Necesito el valor de N que es la longitud del vector 
N = input('Ingresa el valor de N: ');

% Crear un vector fila de longitud N
COD = zeros(1, N);

% Este loop es para pedir el código del estudiante en la posición i 
for i = 1:N
    COD(i) = input('Ingresa el código del estudiante: ');
end

% todo esto lo asumo en el diagrama de flujo como que yo mismo 
% escribi el vector, pero añado al usuario para hacer un programa 
% un poco mas funcional 
 

% Eliminar datos repetidos (duplicados) del arreglo COD
for i = N:-1:2 % N = length(COD), se debe colocar el ciclo for para que 
    % recorra el vector de manera inversa asi no causar problemas 
    % pues al eleiminarse el dato repetido el tamano del vector dsiminulle 
    % pero i debe aumentar en cada iteración 
    %%%% ERROR
    if COD(i) == COD(i-1)
        COD(i) = []; % Eliminar el dato duplicado
        N = N - 1; % Actualizar la longitud del vector
    end
end
% Mostrar el arreglo COD sin datos repetidos
fprintf('Arreglo COD sin datos repetidos:\n');
disp(COD);

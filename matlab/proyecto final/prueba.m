A = [1 2 3; 2 4 6; 3 6 9];
[n, m] = size(A);


[B, tiene_solucion, tiene_infinitas_soluciones] = AnalizarSistema(A, n, m);



function [B, solucion, tiene_infinitas_soluciones] = AnalizarSistema(A, n, m)
    % Separar la última columna de la matriz A como el vector b
    b = A(:, end);
    A = A(:, 1:end-1);
    m = m-1;
    % Combinar matriz de coeficientes A y términos independientes b
    B = [A, b];

    solucion = true;  % Supongamos inicialmente que hay solución
    tiene_infinitas_soluciones = false;  % Supongamos inicialmente que no hay infinitas soluciones

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
        tiene_infinitas_soluciones = true;
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


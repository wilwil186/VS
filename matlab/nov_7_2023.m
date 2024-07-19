% Buscar, si existen filas que tengan lado izquierdo con un único elemento no nulo 
% en caso que si, me interesa la psosición 
A = [1 2; 3 4];
[detA, autovectores] = calcularPropiedadesMatriz(A);

function [detA, autovectores] = calcularPropiedadesMatriz(A)
    [n, m] = size(A);

    % Inicializar matriz extendida
    A_extended = [A eye(n)];

    for col = 1:m
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
                for j = col:m + n
                    A_extended(i, j) = A_extended(i, j) + c * A_extended(Pos, j);
                end
            end

            % Intercambiar la primera fila con la fila que contiene el primer elemento no nulo
            if not(Pos == col)
                for j = col:m + n
                    Aux = A_extended(Pos, j);
                    A_extended(Pos, j) = A_extended(col, j);
                    A_extended(col, j) = Aux;
                end
            end
        end
    end

    % Verificar si el sistema de ecuaciones tiene solución
    if A_extended(n, m + 1) == 0
        disp("El sistema no tiene solución")
    else
        % Sustitución hacia atrás
        x = zeros(n, 1);
        x(n) = A_extended(n, m + 1) / A_extended(n, n);
        for i = n - 1:-1:1
            sum = 0;
            for j = i + 1:n
                sum = sum + A_extended(i, j) * x(j);
            end
            x(i) = (A_extended(i, m + 1) - sum) / A_extended(i, i);
        end

        % Calcular el determinante
        detA = 1;
        for i = 1:n
            detA = detA * A_extended(i, i);
        end

        % Calcular los autovectores
        B = A_extended(:, 1:n);
        [R, piv] = rref(B);

        autovectores = cell(1, n);

        for i = 1:n
            if R(i, i) == 0
                autovectores{i} = [];
            else
                x = zeros(n, 1);
                x(piv) = R(:, i);
                autovectores{i} = x;
            end
        end
    end
end

function bases = encontrarBasesEspacioSolucion(A, b)
    % Combinar la matriz de coeficientes A y el vector de términos constantes b
    augmented_matrix = [A, b];

    % Aplicar eliminación gaussiana
    [R, piv] = rref(augmented_matrix);

    % Identificar las filas nulas en R, que representan variables libres
    filas_nulas = find(all(R(:, 1:end-1) == 0, 2));

    % Determinar el número de variables libres y restricciones
    num_variables = size(A, 2);
    num_restricciones = size(A, 1);

    % Calcular el número de variables libres
    num_variables_libres = num_variables - num_restricciones;

    % Inicializar bases con las variables libres
    bases = zeros(num_variables_libres, num_variables);

    % Generar combinaciones lineales para las variables libres
    for i = 1:num_variables_libres
        % Establecer la variable libre actual a 1
        bases(i, piv(num_restricciones + i)) = 1;

        % Resolver el sistema de ecuaciones
        solution = R(:, end);
        for j = num_variables_libres:-1:1
            solution = R(:, 1:num_variables) * bases(j, :)';
            bases(j, piv(num_restricciones + i)) = -solution(piv(num_restricciones + i)) / R(piv(num_restricciones + i), piv(num_restricciones + i));
            solution = R(:, end);
        end
    end
end
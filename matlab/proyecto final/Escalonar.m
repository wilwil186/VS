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
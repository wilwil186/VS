% Verificar si las matrices pueden multiplicarse
if m ~= r
    fprintf('No se puede realizar la multiplicación de matrices\n');
else
    % Multiplicar matrices
    C = zeros(n, h);

    for i = 1:n
        for j = 1:h
            for k = 1:m
                C(i, j) = C(i, j) + A(i, k) * B(k, j);
            end
        end
    end

    % Mostrar el resultado de la multiplicación
    disp('Resultado de la multiplicación de matrices:');
    disp(C);
end

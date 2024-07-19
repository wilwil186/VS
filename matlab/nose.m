% Supongamos que tienes un polinomio Q y un factor cuadrático 
% d calculados previamente

[cociente, resto] = DivisionPolinomios(Q, d);

% Ahora puedes trabajar con cociente y resto como lo necesites



function [cociente, resto] = DivisionPolinomios(Q, d)
    % Asegurarse de que los polinomios tengan el mismo grado
    grado_Q = length(Q) - 1;
    grado_d = 2;  % Factor cuadrático

    if grado_Q < grado_d
        error('El grado del polinomio divisor debe ser menor o igual que el grado del polinomio Q.');
    end

    % Inicializar el cociente como un vector de ceros del mismo tamaño que Q
    cociente = zeros(1, grado_Q - grado_d + 1);

    % Realizar la división
    for i = 1:length(cociente)
        cociente(i) = Q(i) / d(1);
        % Actualizar Q para el próximo paso de la división
        Q(i:i+grado_d) = Q(i:i+grado_d) - cociente(i) * d;
    end

    % El vector Q al final será el resto
    resto = Q;
end

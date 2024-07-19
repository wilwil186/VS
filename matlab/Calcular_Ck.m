function c = Calcular_Ck(n, r)
    c = zeros(1, n); % Inicializar el vector de coeficientes
    a = -1; % Límite inferior de la integral
    b = 1; % Límite superior de la integral
    N = 1000; % Número de subintervalos
    h = (b - a) / N; % Ancho de cada subintervalo

    for k = 1:n
        Lagk = @(x) Lagrende(r, n, k, x); % Usar la función Lagrende
        result = Lagk(a) + Lagk(b); % Inicializar el resultado

        for i = 1:N-1
            x_i = a + i * h; % Puntos dentro del subintervalo
            if mod(i, 2) == 0
                result = result + 2 * Lagk(x_i);
            else
                result = result + 4 * Lagk(x_i);
            end
        end

        c(k) = h * (result / 3); % Calcular el coeficiente c(k)
    end
end
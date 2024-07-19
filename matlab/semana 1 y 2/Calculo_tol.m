% Definimos la tolerancia TOL y el número de términos a sumar N
CTOL = 1e-6;
N = 1;

% Inicializamos las variables serie y termino en cero
serie = 0;
termino = 1;

% Mientras el valor absoluto de la diferencia entre s_N+1 y s_N sea mayor que TOL
while abs(termino) > CTOL
    % Calculamos el término k de la serie
    termino = (-1)^(N-1)/N;
    
    % Sumamos el término k a la serie
    serie = serie + termino;
    
    % Incrementamos N
    N = N + 1;
end

% Mostramos el resultado al usuario
fprintf('El valor de la serie es: %f\n', serie);

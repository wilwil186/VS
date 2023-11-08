%ciclo for en matlab 
%ejemplos
%Cree una matriz de Hilbert de orden 10.
s = 10; %variable 10 
H = zeros(s); % matriz cuadrada 10 llena de 0 

for c = 1:s % variable c de 1 hasta s 
    for r = 1:s % variable r de 1 hasta s
        H(r,c) = 1/(r+c-1);
    end
end

% disminuit valores 
% Pase por incrementos de -0.2 y muestre los valores.

for v = 1.0:-0.2:0.0
   disp(v)
end

% Valor aproximado de una serie numérica

N = 10; % Número de términos a sumar
serie = 0; % Inicialización de la variable serie

for k = 1:N
    termino = (-1)^(k-1)/k; % Cálculo del término k
    serie = serie + termino; % Suma del término k a la serie
end

resultado = serie; % Valor de la serie


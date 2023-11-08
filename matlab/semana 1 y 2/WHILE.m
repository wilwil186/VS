% Solicitamos al usuario que ingrese un número entero positivo
num = input('Ingrese un número entero positivo: ');

% Inicializamos las variables contador y suma en cero
contador = 0;
suma = 0;

% Mientras el número sea mayor a cero
while num > 0
    % Obtenemos el último dígito del número
    ultimo_digito = mod(num, 10);
    
    % Si el último dígito es menor a 5, aumentamos el contador
    if ultimo_digito < 5
        contador = contador + 1;
    end
    
    % Sumamos el último dígito a la variable suma
    suma = suma + ultimo_digito;
    
    % Dividimos el número entre 10 para eliminar el último dígito
    num = floor(num / 10);
end

% Mostramos los resultados al usuario
fprintf('El número de dígitos menores que 5 es: %d\n', contador);
fprintf('La suma de los dígitos es: %d\n', suma);



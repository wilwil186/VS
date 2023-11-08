% Punto 6
%{

%}
Q = [1, 2, 3, 4];  % Polinomio de entrada
b = 1;  % Coeficiente b del factor cuadrático
c = 2;  % Coeficiente c del factor cuadrático

[cociente, resto] = dividirPolinomio(Q, b, c);

disp('Cociente:');
disp(cociente);

disp('Resto:');
disp(resto);


function [cociente, resto] = dividirPolinomio(Q, b, c)
    % Obtener el grado del polinomio Q
    gradoQ = length(Q) - 1;
    
    % Crear el polinomio divisor d
    d = [1, b, c];
    
    % Inicializar el cociente y el resto
    cociente = zeros(1, gradoQ - 1);
    resto = Q;
    
    % Realizar la división del polinomio Q por el polinomio divisor d
    while length(resto) >= 3
        % Obtener el coeficiente líder del polinomio resto
        coefLider = resto(end);
        
        % Calcular el cociente parcial
        cocienteParcial = coefLider / d(1);
        
        % Actualizar el cociente
        cociente(end+1) = cocienteParcial;
        
        % Calcular el término que se restará del resto
        terminoResta = cocienteParcial * d;
        
        % Ajustar la longitud de terminoResta y resto
        if length(terminoResta) < length(resto)
            terminoResta = [zeros(1, length(resto) - length(terminoResta)), terminoResta];
        elseif length(terminoResta) > length(resto)
            resto = [resto, zeros(1, length(terminoResta) - length(resto))];
        end
        
        % Actualizar el resto
        resto = resto - terminoResta;
    end
end

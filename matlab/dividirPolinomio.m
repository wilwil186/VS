function [cociente, resto] = dividirPolinomio(Q, d)
    % Inicializar cociente como un vector vacío
    cociente = [];
    
    % Inicializar el cociente como 0 y el resto como Q(x)
    resto = Q;
    
    % Grado del factor cuadrático
    grado_d = length(d) - 1;
    
    % Obtener el coeficiente principal del factor cuadrático
    coef_d = d(1);
    
    % Mientras el grado del resto sea mayor o igual al grado de d
    while length(resto) >= grado_d
        % Obtener el coeficiente principal del resto
        coef_principal = resto(end);
        
        % Calcular el coeficiente del término líder del cociente
        coef_cociente = coef_principal / coef_d; % Dividir por el coeficiente principal de d
        
        % Actualizar el cociente
        cociente = [cociente, coef_cociente];
        
        % Calcular el término líder del factor cuadrático multiplicado por el coeficiente del cociente
        termino_lider_factor = coef_cociente * d;
        
        % Restar el término líder del factor cuadrático del resto
        resto = resto - [zeros(1, length(resto) - length(termino_lider_factor)), termino_lider_factor];
    end
end



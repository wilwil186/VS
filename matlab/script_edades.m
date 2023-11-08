% Definir el número de edades aleatorias a generar
n = 10; % Cambia este valor para generar más o menos edades

% Inicializar un vector para almacenar las edades generadas
edades = zeros(1, n); % vector 0 

% Generar edades aleatorias entre 13 y 50 años
for i = 1:n % for desde 1 hasta n 
    edades(i) = randi([13, 50]); % randfi genera numeros aleatorios
end % fin 

% Ordenar la lista de edades en orden ascendente utilizando el método de la burbuja
for i = 1:n-1 % desde 1 hasta n-1=9, variable muda i
    for j = 1:n-i % desde 1 hasta n-i, variable muda j
        if edades(j) > edades(j+1) % primer ciclo si j es mayor a la edad siguiete entonces: 
            % Intercambiar elementos para ordenar
            temp = edades(j); % variable temp igual a la edad en la posicion j 
            edades(j) = edades(j+1); % edad en j igual a la edad j+1(intercambio)
            edades(j+1) = temp; % edad(j+1)= edad(j)
        end
    end
end
% Eliminar duplicados utilizando bucles anidados
i = 1;
while i <= length(edades) % ciclo while mientras i sea menor o igual a la longitud del vector edades 
    % primer ciclo i = 1
    j = i + 1; % se inicializa la variable j como i+1
    while j <= length(edades) % mientras j sea menor o igual a la longitud de las edades 
        % primer ciclo j = 2
        if edades(i) == edades(j) % si el elemento del vector edad ene le elemento i a la posisción j 
            % entonces: 
            % Eliminar elemento duplicado ajustando el vector
            edades(j) = []; %elimina se le asigna el vector nulo 
        else % sino pues  compare otras vainas xd
            j = j + 1; 
        end % termina el ciclo se repiel while (2), en el primer ciclo se compara el 1=1 con todos los elementos 
        % de el vector 
    end % termina el while (1)
    i = i + 1; % ahora empieza el segundo ciclo del while (1) hasta que se comparan todos 
end % eso es todo amigos!

% Verificar si una cierta edad está en la lista utilizando búsqueda lineal
edad_a_verificar = input('Ingrese la edad que desea verificar: '); % Pedir al usuario que ingrese la edad a verificar
encontrado = false; % ponemos por defecto que no se encuentra 
for i = 1:length(edades) % ciclo for desde 1 hasta la longituddel vector edades 
    if edades(i) == edad_a_verificar % == es para comparar, si pasa esto entonces:
        encontrado = true; % se le asigan ael valor de verdad
        break; % para romperlo xd 
    end % se termina comienza el for again 
end % finis 

% Preguntar si el dato está en la lista y eliminarlo si es necesario
if encontrado % por defecto encontrado = true, quiere decir que si se encuentra la linea de codigo 
    fprintf('La edad %d está en la lista.\n', edad_a_verificar); % %d pone la edad_a_verificar que ingreso el usiario 
    eliminar = input('¿Desea eliminar esta edad de la lista? (1: Sí, 0: No): '); % le pide al usuario que si podemos eliminar esto 
    if eliminar == 1 % 1 es para si , == compara, si pasa esto aplique el ciclo
        i = 1; 
        while i <= length(edades) % si es menor o igual a las edades 
            if edades(i) == edad_a_verificar % comnpara 
                edades(i) = []; % elimina 
            else % sino 
                i = i + 1; % se al i para ir al proximo elemento del vector 
            end % se repite el while
        end %  finish 
        fprintf('La edad %d ha sido eliminada de la lista.\n', edad_a_verificar); % %d pone edad_a_verificar
    end % termina el if (2) comienza again if (1)
else % el sino del if(i) osea si encontrado=false: :´(
    fprintf('La edad %d no está en la lista.\n', edad_a_verificar); % decirle al usuario que no ta 
    agregar = input('¿Desea agregar esta edad a la lista? (1: Sí, 0: No): '); % input esm para eque el usuriio ingrese vainas 
    if agregar == 1 % 1 es si 0 es no, si el susurio dice si se aplica este ciclo:
        i = 1; % se inicializa i en 1 
        while i <= length(edades) && edades(i) < edad_a_verificar % MIENTRAS 
            % i sea menor o iguial a la longitud del vector edades y (&& es un y logico)
            % el elemento i es sea menor a la edad a verificar entonces se
            % aplica el ciclo:
            i = i + 1; % en el primer cilo i = 2
        end % este cilo es para no afectar el orden creado con el ciclo de la burbuja
        edades = [edades(1:i-1), edad_a_verificar, edades(i:end)]; % aqui se hace la insercción
        fprintf('La edad %d ha sido agregada a la lista.\n', edad_a_verificar); % se imprime en pantalla
    end % fin del if 
end % fin del if principal 

% Mostrar la lista final de edades
disp('Lista de edades final:'); % imprime este mensjae en pantalla
disp(edades); % imprime las edades 


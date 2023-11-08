% Métodos iterativos
%punto fijo
sym x;
f = input("Introduzca una función f(x)", 's');
f = eval(['@(x)' f]);

% Entrada
p = ("ingrese valor de la raiz a hallar");
p_0 = input("Aproximación inicial:");
tol = input("Ingrese la tolerancia:");
n_0 = input("Número maximo de iteraciones:");

% paso 1 
i = 1;
%paso 2
while (abs(p-p_0) >= tolera && i <= n_0)   
    
end


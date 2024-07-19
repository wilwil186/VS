% Laura Daniela Ardila Ortiz 20201167072

% Jerez Hernández Wilson Eduardo 20181167034

% Métodos Númericos Y Computación

clc; clear all; close all;

%{
Punto 1: Leer un entero positivo n >1 (no validar) y un vector f de
tamaño n+1 que se corresponda con los coeficientes de un polinomio P(X),
aquí f(1) debe ser el término independiente del polinomio P(x).
%}

% Leer un entero positivo n
n = input('Ingrese un entero positivo n: ');

% Leer un vector f de tamaño n+1
f = zeros(1, n+1);
for i = 1:n+1
    fprintf('Ingrese el coeficiente f(%d): ', i);
    f(i) = input('');
end
% Imprimir el vector f
disp('El vector f es:');
disp(f);

%{
Punto 2: Programar como una función el método de Horner. Las entradas
deben ser el grado del polinomio n, el vector p y el valor x0 donde se
quiere evaluar. Las salidas deben ser y = f(x0), z = f'(x0) y el vector q
de tamaño n que son los coeficientes de dividir P(x) por (x - x0). En
particular q(1) es el término independiente.
%}

% Ingresar n = grado del polinomio, y leer los coeficientes de la función
n = input("Ingrese el grado del polinomio = ");
fprintf("Tome el polinomio de manera decreciente\n");
for k = n+1:-1:1
    fprintf("Exponente %2i: ", k-1);
    p(k) = input("");
end

% Inputs
x0 = input('Ingrese x_0: ');

[y, z, q] = Horner(n, p, x0);

fprintf('P(x0) = \n');
display(y);

fprintf('P''(x0) = \n');
display(z);

fprintf('q(x0) = \n');
display(q);

%{
Punto 3: Programar como función el método de Newton para hallar una raíz
del polinomio P(x). Se debe invocar la función Horner para evaluar f y su
derivada.
%}

% Definir la función f(x) como una expresión simbólica
syms x;

f = [3,-6,11,-6];

% Llamar a la función NewtonRaphson para encontrar una raíz
n = 3;
p0 = 1;     % Aproximación inicial
tol = 1e-6; % Tolerancia
nmax = 100; % Número máximo de iteraciones

[encontro, p] = Newton(f, n, p0, tol, nmax);

% Punto 4
%{
Usar un while, la función Newton y división sucesivas con p0=0, Nmax =1000
y Tol=0.00001 para hallar todas las raíces reales del polinomio P(x).
Muestre esas raíces y el polinomio cociente q resultante de la división
sucesiva. Definir el polinomio P(x) como una expresión simbólica
syms x;
%}

syms x;

P1 = x^6 + x^5 - x^3 -3*x^2-2*x-2;
f2 = [-2,-2,-3,-1,0,1,1];

% Tolerancia y número máximo de iteraciones
tol = 0.00001;
nmax = 1000;
p0=1;

% Inicializar una matriz para almacenar todas las raíces encontradas

hayraiz = true;
k=0;

% Iterar mientras queden raíces por encontrar
while (hayraiz) && (n>0)
    % Llamar a la función NewtonRaphson para encontrar una raíz
    [encontro, p,q] = Newton(f2, n, p0, tol, nmax);

    % Si se encontró una raíz, añadirla a la lista de raíces
    if encontro
        k=k+1;
        r(k) = p;
        f2 = q;
        n=n-1;
        
    else
        hayraiz = false;
    end
end

% Mostrar todas las raíces encontradas
disp('Todas las raíces encontradas:');
disp(r);

%Punto 5
% Construir un factor cuadrático para q usando la raíz compleja encontrada
a = 1;
b = -2 * real(r);
c = abs(r)^2;
factor_cuadratico = [a, b, c];

fprintf('Factor cuadrático para q(x): ');
disp(factor_cuadratico);

% Polinomio original
syms x;
P = -4*x^4 + 3*x^3 - 3*x^2 + 2;

% Factor cuadrático d
b = 0;  % Ajusta el valor de b
c = 0.5;  % Ajusta el valor de c
d = x^2 + b*x + c;

% Calcula el cociente y el resto
[q, r] = quorem(P, d);

% Inicialización de variables para el método de Muller
p0 = -0.5;
p1 = 0;
p2 = 0.5;
tol = 0.00001;
Nmax = 1000;

% Inicialización de variables para almacenar raíces
raices = [];

% Paso 7: Use repetidamente el método de Müller para encontrar todas las raíces complejas
while length(roots(q)) > 0
    % Utiliza el método de Muller para encontrar una raíz compleja
    [encontro, p] = Muller(q, p0, p1, p2, tol, Nmax);
    
    % Agrega la raíz a la lista de raíces
    raices = [raices; p];
    
    % Actualiza el polinomio q
    q = q / (x - p);
    
    % Actualiza las aproximaciones iniciales para el próximo ciclo
    p0 = p1;
    p1 = p2;
    p2 = p;
end

% Paso 8: Muestra las raíces en una tabla
tabla_raices = table(raices, 'VariableNames', {'Raices_Complejas'});
disp(tabla_raices);

% Gráfica del polinomio P(x)
fplot(P, [-2, 2], 'DisplayName', 'P(x)');
hold on;

% Gráfica de las raíces
scatter(double(raices), zeros(size(raices)), 'r', 'filled', 'DisplayName', 'Raices');

title('Gráfica del Polinomio y Raíces Complejas');
xlabel('Eje x');
ylabel('Eje y');
legend('Location', 'northwest');
grid on;
hold off;



% funciones
%Horner

function [y, z, q] = Horner(n, p, x0)
    q = zeros(1, n); % Inicializa el vector q con ceros
    q(n) = p(n+1);
    z = p(n+1);

    for i = n:-1:2 
        q(i-1) = x0 * q(i) + p(i);
        z = x0 * z + q(i-1);
    end
    y = x0 * q(1) + p(1);
end

% Newton

function [encontro,p,q] = Newton (f,n,p0,tol,nmax)

i=0;

[f_p0,g_p0,q] = Horner (n,f,p0); 

encontro = false;

while i <= nmax && ~(encontro)

    p = p0 - (f_p0/g_p0);
    i = i + 1;

    if abs(p - p0) < tol
        fprintf(['El procedimiento es exitoso después de %d iteraciones.' ...
            'Raíz estimada: %.6f\n'], i, p);
        encontro = true;

    else
        fprintf('Iteración %d: Raíz estimada = %.6f\n', i, p);
    end

    p0 = p;
    [f_p0,g_p0,q] = Horner (n,f,p0);

end
end

%Punto 5
%{
Programar como función el método de Müller y
usarlo para hallar una raíz compleja del polinomio q del item anterior. 
Con esta raíz construya un factor cuadrático para q.
%}


% Muller
% Función para el método de Muller
function [encontro, p] = Muller(q, p0, p1, p2, tol, Nmax)
    h1 = p1 - p0;
    h2 = p2 - p1;
    y0 = subs(q, p0);
    y1 = subs(q, p1);
    y2 = subs(q, p2);
    
    s1 = (y1 - y0) / h1;
    s2 = (y2 - y1) / h2;
    d = (s2 - s1) / (h2 + h1);
    
    i = 3;
    encontro = false;
    
    while i <= Nmax && ~encontro
        h1 = p1 - p0;
        h2 = p2 - p1;
        y0 = subs(q, p0);
        y1 = subs(q, p1);
        y2 = subs(q, p2);
        
        s1 = (y1 - y0) / h1;
        s2 = (y2 - y1) / h2;
        d = (s2 - s1) / (h2 + h1);
        
        b = s2 + h2 * d;
        D = sqrt(b^2 - 4 * y2 * d);
        
        if abs(b - D) < abs(b + D)
            E = b + D;
        else
            E = b - D;
        end
        
        h = -2 * y2 / E;
        p = p2 + h;
        
        i = i + 1;
        
        if abs(h) < tol
            encontro = true;
        end
        
        p0 = p1;
        p1 = p2;
        p2 = p;
    end
end

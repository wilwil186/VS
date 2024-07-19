% Wilson Eduardo Jerez Hernández cod: 20181167034
% Laura Daniela Ardila Ortiz cod: 20201167072

% TALLER CUADRATURA GAUSSIANA

% Limpia el entorno de trabajo y cierra todas las figuras
clc;
clear all;
close all;

% Grado del polinomio
n = input("Ingrese el grado del polinomio");
grado=n;

% Paso 1: Generar el polinomio de Legendre

% Función para generar el polinomio de Legendre
L = leg(n);

% Invertir el vector de coeficientes para que esté en el orden correcto
for k = n+1:-1:1
    f(n+2-k) = L(k);
end

% Mostrar los coeficientes del polinomio de Legendre
fprintf('Los coeficientes del polinomio de Legendre son:\n');
disp(f);

% Crear el polinomio en términos de x
syms x;
pol = 0;
for i = 1:n+1 %trasponer el poinomio 
    pol = pol + f(n+2-i) * x^(n-i+1);
end 

% Mostrar el polinomio
fprintf('El polinomio de Legendre de grado %d es:\n p(x) : %s\n', n, char(pol));

% Paso 2: Encontrar las raíces aplicando el método de Newton

% Tolerancia y número máximo de iteraciones
Tol = 1e-5;
N = 1000;

% Inicialización
p0 = -1;
hayraiz = true;
k = 0;

while hayraiz && (n > 0)
    % Aplicar el método de Newton para encontrar una raíz
    [encontro, P, q] = Newton(f, p0, Tol, N, n);
    if encontro
        k = k + 1;
        r(k) = P; % Guardar la raíz encontrada
        f = q; % Actualizar el polinomio
        n = n - 1;
    else
        hayraiz = false;
    end
end

% Mostrar las raíces encontradas
fprintf('Las raíces del polinomio de Legendre son:\n');
disp(r);

% Graficar el polinomio con las soluciones
t = -1:0.01:1;
y = subs(pol, t);
figure;
plot(r, zeros(size(r)), 'o', t, y, 'g-');
grid on;
xlabel('x');
ylabel('p(x)');
title(['Polinomio de Legendre de grado ', num2str(n)]);

% Paso 3 

% Calcular los coeficientes c(k)
c = Calcular_Ck(grado, r);

% Mostrar los coeficientes c(k)
fprintf('Los coeficientes c(k) son:\n');
disp(c); 

% Paso 4

% Imprimir encabezado de la tabla
fprintf(' k    r(k)        c(k)\n');
fprintf('-----------------------\n');

% Imprimir cada fila de la tabla
for k = 1:grado
    fprintf('%2d   %8.4f   %8.4f\n', k, r(k), c(k));
end
% Calcular los pesos para la fórmula de cuadratura de Gauss
w = zeros(1, length(c));
for i = 1:length(c)
    w(i) = 2 / ((1 - r(i)^2) * (polyval(f, r(i))^2));
end

% Paso 5
% Calcular la aproximación de la integral
integral = 0;
for i = 1:length(c)
    integral = integral + w(i) * exp(r(i)) * cos(r(i));
end

fprintf('La aproximación de la integral es: %f\n', integral);



% punto 6

a = input("limite inferior");
b = input("limite superior");

t1 = ((2*x)-a-b)/(b-a);
x1 = (1/2)*(((b-a)*t)+a+b);

c1 = Calcular_Ck1(grado, r,a,b);

w = zeros(1, length(c1));
for i = 1:length(c1)
    w(i) = 2 / ((1 - r(i)^2) * (polyval(f, r(i))^2));
end
integral1=0;
for i = 1:length(c1)
    integral1 = integral1 + w(i) * exp(r(i)) * cos(r(i));
end

fprintf('La aproximación de la integral es: %f\n', integral1);

% Funciones

function p = leg(n)
    p1 = 1;
    p2 = [1, 0];
    if n == 0
        p = p1;
    elseif n == 1
        p = p2;
    else
        for i = 2:n
            p = ((2 * (i - 1) + 1) * [p2, 0] - (i - 1) * [0, 0, p1]) / i;
            p1 = p2;
            p2 = p;
        end
    end
end


% Función para evaluar un polinomio mediante el método de Horner
function [y, z, q] = Horner(n, h, x0)
    q(n) = h(n + 1);
    z = h(n + 1);

    for i = n:-1:2
        q(i - 1) = x0 * q(i) + h(i);
        z = x0 * z + q(i - 1);
    end

    y = x0 * q(1) + h(1);
end

% Función para encontrar una raíz de un polinomio mediante el método de Newton
function [encontro, P, q] = Newton(f, p0, Tol, N, n)
    i = 1;
    while i <= N
        [y, z, q] = Horner(n, f, p0);
        P = p0 - (y / z);
        if abs(P - p0) < Tol
            encontro = true;
        end
        p0 = P;
        i = i + 1;
    end
end

% Función para evaluar un polinomio de Lagrange
function Pa = LagrangeK(n, x, y, a)
    Pa = 0;
    for k = 1:1:n + 1
        L = 1;
        for i = 1:1:n + 1
            if i ~= k
                L = L * (a - x(i)) / (x(k) - x(i));
            end
        end
        Pa = Pa + y(k) * L;
    end
end
% --- Paso 3.1: Crear la función Lagrende
function LagK = Lagrende(r, n, k, x0)
    LagK = 1;
    for j = 1:n
        if j ~= k
            LagK = LagK * (x0 - r(j)) / (r(k) - r(j));
        end
    end
end

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

function c = Calcular_Ck1(n, r,a,b)
    c = zeros(1, n); % Inicializar el vector de coeficientes
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
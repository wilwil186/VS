clear all;
clc;

% Solicitar n al usuario
n = input("Ingrese el valor de n: ");

% Generar n valores aleatorios para x e y
x = randi([1, 100], 1, n);
y = randi([1, 100], 1, n);

% Calcular el promedio de x e y
xl = sum(x) / n;
yl = sum(y) / n;

% Calcular el numerador de A
num = sum(x .* y) - (n * xl * yl);

% Calcular el denominador de A
dem = sum(x .* x) - (n * xl * xl);

% Calcular A y B
A = num / dem;
B = yl - (A * xl);

% Generar la recta de regresión
t = min(x):0.01:max(x);
z = A * t + B;

% Graficar los puntos y la recta de regresión
plot(x, y, 'or');
hold on;
plot(t, z, '-b');
plot(xl, yl, '*g');
grid on;
xlabel('x');
ylabel('y');
title('Regresión Lineal');
legend('Puntos', 'Recta de Regresión', 'Punto promedio');
xlim([min(x)-5, max(x)+5]);
ylim([min(y)-5, max(y)+5]);
hold off;

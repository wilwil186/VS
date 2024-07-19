% Taller sobre regresión linea
% Yazmin Andrea Moreno Perez 20192167083
% Wilson Eduardo Jerez Hernández 20181167034
clc; clear all; close all; % se limpia todo el framework
% Solicitar n
% Generar una lista de puntos aleatorios para x y para y
% Calcular la b
% Calcular la a
% Calcular los puntos generados por la recta
% Paso 1: Solicitar n al usuario
n = input("Ingrese el valor de n: ");
% Generar n valores aleatorios para x e y
x = randi([1, 100], n, 1);
y = randi([1, 100], n, 1);
% calcular las sumas
sum_x=0; % suma de x
sum_y=0; % suma de y 
sum_xy = 0; % la covarianza 
sum_x_cuadrado = 0 ; % x^2
for i=1:n % sumas a "pedal"
    sum_x = sum_x+ x(i);
    sum_y = sum_y+y(i);
    sum_xy = sum_xy+ (x(i)*y(i));
    sum_x_cuadrado = sum_x_cuadrado + (x(i)^2);
end
% Calcular promedios 
prom_x = sum_x/n; % promedios de x
prom_y = sum_y/n; % promedios de y
% Calcular los coeficientes por minimos cuadrados perfectos
a = (sum_xy - (n+1) * prom_x * prom_y) / (sum_x_cuadrado - (n+1) * (prom_x)^2);
% se cacula el a segun el profe de metodos
b = prom_y - a * prom_x; % se calcula el b que tiene la propiedad que pasa por los promedios 
x_r = linspace(min(x),max(x),100); % aqui se crea un dominio 
y_regresion = a * x_r + b;% la recta de regresión

% Graficar los puntos y la recta de regresión
plot(x, y,'dk'); % La grafica de los puntos 
grid on; % vista de cuadricula 
hold on; % para que me permita superponer 
plot(x_r, y_regresion, 'r--'); % la grafica de la recta de regresión 
plot(prom_x,prom_y,'b *'); % graficar el promedio 
xlabel('x'); % la etiqueta en x, caracteristicas
ylabel('y'); % la etiqueta en y, labels
title('Regresión Lineal'); % el titulo xd
legend('Puntos', 'Recta de Regresión','Punto promedio'); % la legenda
xlim([min(x)-5, max(x)+5]); % los limites x de grafico 
ylim([min(y)-5, max(y)+5]); % los limites x de grafico 
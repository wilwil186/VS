x = [1,2,3,4,5,6,7,8];
y = [1,1.5,2,3,4,5,8,10];
n=length(x);
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

% Calcular el coeficiente A
a = (sum_xy - (n+1) * prom_x * prom_y) / (sum_x_cuadrado - (n+1) * (prom_x)^2);

% Calcular la intersección en y (coeficiente B)
b = prom_y - a * prom_x;

% Calcular los puntos generados por la recta de regresión
x_r = linspace(min(x),max(x),100);
y_regresion = a * x_r + b;

% Graficar los puntos y la recta de regresión
plot(x, y, 'o', 'MarkerSize', 8);
hold on;
plot(x_r, y_regresion, 'LineWidth', 2);

% Etiquetas de los ejes y título del gráfico
xlabel('x');
ylabel('y');
title('Regresión Lineal');

% Leyenda
legend('Puntos', 'Recta de Regresión');

% Ajustar los límites de los ejes para que se vea mejor el gráfico
xlim([min(x)-5, max(x)+5]);
ylim([min(y)-5, max(y)+5]);
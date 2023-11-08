% Cálculo de los primeros 20 términos de la secuencia a_n
a = zeros(1,20);
a(1) = -2;
a(2) = 1;
for n = 3:20
    a(n) = -5 * a(n-2) + 7 * a(n-1);
end

% Coordenadas x e y
x = 1:20;
y = a;

% Graficar las coordenadas cartesianas
plot(x, y)
ylim([-2, max(a)])
xlim([0, 20])

% Etiquetas de los ejes
xlabel('n')
ylabel('a_n')

% Título del gráfico
title('Coordenadas cartesianas')

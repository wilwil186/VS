%leemos el n 
n = input("Con este fin, introduzca el valor de n = ");
x = -1:3/n:2;
y = randi([0, 1], 1, n+1);

fprintf('\n - Los datos generados son:\n\n')
fprintf('\t k\t x(k)\t y(k)\n');
for k = 1:n+1
    fprintf('\t %2.0f\t %.2f\t %d\n', k, x(k), y(k));
end

z = -1:0.01:2; % generamos muchos puntos 

w = zeros(size(z)); % inicializamos w

for k = 1:size(z, 2)
    w(k) = evaluar_Pn(n, x, y, z(k));
end

plot(x, y, 'R*', z, w, 'b-')
xlabel('x')
ylabel('y')
title('Interpolación de Lagrange')
legend('Datos', 'Polinomio interpolante')

x_eval = 3; % Punto a evaluar
y_eval = evaluar_Pn(n, x, y, x_eval);
fprintf('f(%.2f) = %.4f\n', x_eval, y_eval);

function Pa = evaluar_Pn(n, x, y, a)
    Pa = 0;

    for k = 1:n+1
        L = 1;
        for i = 1:n+1
            if i ~= k
                L = L * (a - x(i)) / (x(k) - x(i));
            end
        end
        Pa = Pa + y(k) * L;
    end
end


clc; clear all; close all;

syms x;
%------paso 1
n = 4;%leer el grado


x = legendre_p(4); % Assign coefficients to x
xg = -1:0.01:1; % Assign x-values to xg
y = polyval(x, xg); % Pass coefficients and x-values correctly

plot(xg, y, 'r'); % añadimos la grafica
xlabel('x');
ylabel('f(x)');
title('Legendre Polynomial');
grid on; 


% --- paso 2
f = legendre_p(4); % para pasarla por el while de hallar las raices
HayRaiz = true;
k = 0;
while (HayRaiz) && (n > 0) % y logico
    p0 = 0; Tol = 1e-5; Nmax = 1000;
    [encontro, p, q] = Newton(n, f, p0, Tol, Nmax);
    if encontro
        k = k + 1;
        r(k) = p;
        f = q; % Actualiza el polinomio
        n = n - 1;
    else
        HayRaiz = false;
    end
end

disp('Raíces encontradas:');
disp(r);
hold on; %añadir(superponer) 2.3 
for i = 1:length(r)
    plot(r(i), 0, 'b*', 'MarkerSize', 10);
end

% FUNCIONES

% -------------------------------------------------------------------

function p = legendre_p(n) % funciòn paso 1, recursiva
    p1 = 1;
    p2 = [1, 0];
    if n == 0
        p = 1;
    elseif n == 1
        p = p2;
    else
        for i = 2:n
            p = ((2 * (i - 1) + 1) * [p2, 0] - (i - 1) * [0, 0, p1]) / i;
            p1 = p2;
            p2 = p;
        end
    end
    for i = 1:length(p)
        p(i)=p((length(p)+1)-i);
    end
end

function res = legendre_r(n, x) % funciòn paso 2.3 
    if n == 0
        res = ones(1, length(x));
    elseif n == 1
        res = x;
    else
        res = ((2 * (n - 1) + 1) * x .* legendre_r(n - 1, x) - (n - 1) * legendre_r(n - 2, x)) / n;
    end
end



function [y, z, q] = Horner(n, p, x0)
    q(n) = p(n + 1);
    z = p(n + 1);

    for i = n:-1:2
        q(i - 1) = x0 * q(i) + p(i);
        z = x0 * z + q(i - 1);
    end
    y = x0 * q(1) + p(1);
end

function [encontro, p, q] = Newton(n, f, p0, tol, nmax)
    i = 0;

    [f_p0, ~, q] = Horner(n, f, p0);
    encontro = false;

    while i <= nmax && ~encontro
        g_p0 = 0;

        for j = 1:n
            g_p0 = g_p0 + j * q(j);
        end

        p = p0 - (f_p0 / g_p0);
        i = i + 1;

        if abs(p - p0) < tol
            fprintf(['El procedimiento es exitoso después de %d iteraciones.' ...
                'Raíz estimada: %.6f\n'], i, p);
            encontro = true;
        else
            fprintf('Iteración %d: Raíz estimada = %.6f\n', i, p);
        end

        p0 = p;
        [f_p0, ~, q] = Horner(n, f, p0);
    end
end
% Muller
clc; clear all; close all;
% Ejemplo de uso
f = [-4, 3, -3, 0, 2];
x0 = 2;
Tol = 10^(-5);
Nmax = 1000;
% Llamar a la función mullerMethodHolder
root = mullerMethodHolder(f, x0, Tol, Nmax);

fprintf("Raíz encontrada: %5f\n", root);
function root = mullerMethodHolder(f, x0, Tol, Nmax)
    n = length(f) - 1;
    p0 = 0;
    i = 1;
    encontrado = false;

    while (i <= Nmax) && ~(encontrado)
        [y, z, q] = Horner(n, f, x0);
        p = p0 - y / z;
        if abs(p - p0) < Tol
            encontrado = true;
        end
        i = i + 1;
        p0 = p;
    end

    root = p;
end

function [y, z, q] = Horner(n, p, x0)
    q(n) = p(n+1);
    z = p(n+1);
    for i = n:-1:2
        q(i-1) = x0 * q(i) + p(i);
        z = x0 * z + q(i-1);
    end 
    y = x0 * q(1) + p(1);
end


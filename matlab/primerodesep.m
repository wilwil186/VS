% Soluciones de las ecuaciones en una variable 
% Métodos iterativos: 
% Parte III
sym x;
% teorema de la localización de raíces - teorema del valor intermedio 
f = input("Ingrese la función f(x): "); % se pide la funcion
% exp(x-1)-3*x-log(x+1)
a = input("Ingrese el valor del extremo inferior del intervalo: ");
% 0
b = input("Ingrese el valor del extremo superior del intervalo: "); 
% 1
TOL = input("Ingrese la tolerancia para el método de la bisección: ");
% 0.000001
N = input("Ingrese el máximo de iteraciones: "); 
% 1000000c
fa = subs(f, a);
fb = subs(f, b);

if fa*fb > 0
    disp("No se puede aplicar el método de la bisección en este intervalo.")
else 
    disp("Se puede aplicar el método de la bisección.")
    i = 1; % contador de iteraciones +
    encontrado = false;
    while ~encontrado && abs(b-a) >= TOL && i <= N
        p = (a+b)/2;
        fp = subs(f, p);
        if fp == 0
            encontrado = true;
            disp("Se encontró una raíz en el punto p.")
        else
            if fp*fa > 0
                a = p;
            else
                b = p;
            end
            i = i+1;
        end

    end
end 
fprintf("El valor de p es %f\n", p);

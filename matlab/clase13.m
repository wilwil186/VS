% Clase 22 09 2023
% interpolación de polinomios
clc;clear all,close all;

syms t;

y = f(1/2);
x=0:0.01:1;
%x= linspace(0,0.01,1);
for k = 1:1:101
    y(k)=f(k*0.01)
end

plot(x,y,'-r');
xlim([0,1])
ylim([min(y)-0.1,max(y)+0.1])
grid on; grid minor;
hold on;
% Pongamos el eje x
for n = 1:1:10
for k = 1:1:101
    z(k)=p(n,k*0.01)
end
    plot(x,z,'b-');
end

function y = f(x)
    if (0 <= x) && (x <= 1/5)
        y = 0;
    elseif (1/5 < x) && (x <= 2/5)
        y = 5*x - 1;
    elseif (2/5 < x) && (x <= 3/5)
        y = 1;
    elseif (3/5 < x) && (x <= 4/5)
        y = -5*x + 4;
    elseif (4/5 < x) && (x <= 1)
        y = 0;
    else
        y = 0;
    end
end

function z = p(n, x)
    z = 0;
    for k = 0:1:n
        z=z+factorial(n)/(factorial(k)*factorial(n-k))*f(k/n)*x^k*(1-x)^(n-k)
    end
end

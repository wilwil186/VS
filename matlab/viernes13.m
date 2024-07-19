% Viernes 13 de cot del 2023
clc;clear all,close all;
syms x
% Entrada f(x)
n = 100 ;
h = 1/ n^2;

f = input("Introduzca una función f(x)=");

t=0:0.01:5;
y = subs(f,t);

% Graficar la función
%{
plot(t, y);
xlabel('x');
ylabel('f(x)');
title('Gráfica de la función f(x)');
%}
for n = 1:1:length(t)
    z(n) = derivada(f,t(n),0.1);
end
plot(t,z,'r-');
grid on;
hold on;
xlabel('x');
ylabel('df');
title('Gráfica de la función df');
 %axis([0.9- 5.1 eval(min(y))-0.1 eval(min)])

function z= derivada(f,x0,h)
    z=(eval(subs(f,x0+h))-eval(subs(f,x0)))/h;
end


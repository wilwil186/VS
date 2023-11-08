% funcion Holder 
clc; clear all; close all;

n= 4;
f =[-4,3,-3,0,2];
x0=2;
Tol = 10^(-5);
Nmax = 1000;
p0 =0;
i=1;
encontrado= false;

while (i <= Nmax) && ~(encontrado)
    [y,z,q]=Horner(n,f,x0);
    p =p0-y/z;
    if abs(p-p0)<Tol
        encontrado = true;
    end
    i = i+1;
    p0=p;
end

function[y,z,q] = Horner(n,p,x0);
% y = p(n+1);
q(n)=p(n+1);
z = p(n+1);
for i=n:-1:2
    %y = (x_0*y)+p(j);
    q(i-1)=x0*q(i)+p(i);
    z = x0*z+q(i-1);
end 
y = x0*q(1)+p(1);
end

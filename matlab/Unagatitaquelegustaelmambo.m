clc;
clear all;
close all;

Bin1 = randi([0,1],8,1);
Bin2 = randi([0,1],8,1);
disp(Bin1);
disp(Bin2);

llevo=0;
dig = zeros(8, 1); 
for k=8:-1:1
    suma = Bin1(k) + Bin2(k) + llevo;
    if suma >= 2
        dig(k+1) = suma-2;
        llevo = 1;
    else
        dig(k+1) = suma;
        llevo = 0;
    end
end

dig(1)=llevo;
disp(dig);

% conventir binario a decimal 
decimal = 0;
L = length(Bin1);

for i = 1:L
    decimal = decimal + Bin1(i) * 2^(L-i);
end

fprintf('el valor de la suma')
disp(decimal)
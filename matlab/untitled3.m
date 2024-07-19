clc;clear all;close all;

% conventir binario a decimal 
binario = '1011';
decimal = 0;
L = length(binario);

for i = 1:L
    bit = str2double(binario(i));
    decimal = decimal + bit * 2^(L-i);
end

disp(decimal);

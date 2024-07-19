% Limpiar la pantalla, las variables y las figuras
clc;
clear all;
close all;

% Hacer un programa que lea números como cadenas de caracteres (string),
% valide si son números reales decimales o binarios y luego realice las
% conversiones de decimal a binario y de binario a decimal.

% Leer el número como cadena de caracteres (string)
num_str = input('Ingrese un número: ', 's');

% Validar si es real decimal o binario
Verificar = isnan(str2double(num_str));

bin = 1; % Variable para indicar si es binario o no

if Verificar == 1
    fprintf('No es un número real \n');
else
    n = length(num_str);
    Pos = 1;
    while ~(num_str(Pos) == '.') && (Pos <= n)
        Pos = Pos + 1;
    end
    
    if(Pos > n)
        fprintf('El número es entero\n');
    else
        fprintf('El punto fraccionario está en la posición pos = %2i\n', Pos);
    end
    
    % Calcular la parte entera del número
    Xe = "";
    for k = 1:1:Pos-1
        Xe = Xe + num_str(k);
    end
    fprintf('\nLa parte entera del número es: %s\n', Xe);

    % Validar si es binario o decimal
    Verificar = all(ismember(num_str, '+-01'));
    
    if Verificar == 1
        fprintf('Tenemos un número binario\n');
        bin = 1; % Si bin es 1, entonces es binario
    else
        fprintf('Tenemos un número no binario\n');
        bin = 0;
    end
end

% Convertir de decimal a binario o viceversa
if bin == 1 % Si es binario, convertir a decimal
    decimal = bin2dec(num_str);
    fprintf('El valor en decimal es: %d\n', decimal);
else % Si no es binario, convertir a binario
    decimal = str2double(num_str);
    binario = dec2bin(decimal);
    fprintf('El valor en binario es: %s\n', binario);
end




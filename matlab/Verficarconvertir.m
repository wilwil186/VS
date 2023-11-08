clc;
clear all;
close all;
% hacer un programa que lean números como cadenas de caracteres (string),
% validen si son números reales decimales o binarios y luego hagan las 
% conversiones de decimal a binario y de binario a decimal.

% leer el número como cadena de caracteres (string)
num_str = input('Ingrese un número: ', 's');
% validar si es real decimal o binario 

Verificar = isnan(str2double(num_str)); % pregunatarle al profe 
bin=1; % es falso hasta que se demeustrte lo contrario 
if Verificar == 1
    fprintf('No es un número real \n')
else 

    %habemus real, ¿es Binarioo es decimal?
    Verificar= all(ismember(num_str,'+-0.1')); % no se 
    if Verificar == 1
        fprintf('tenemos un número Binario\n')
        bin = 1; % si bin es 1 entonces es binario
    else
        fprintf('tenemos un número no binario \n ')
        bin = 0;
    end 
end

% hacer conversiones 
if bin == 1
    % es binario por tanto hay que hacer la conversion a decimal
    num_bin = num_str;
    num_dec = 0;
    for j = length(num_bin):-1:1
        num_dec = num_dec + str2double(num_bin(j)) * 2^(length(num_bin)-j);
    end
    fprintf('El equivalente en decimal es %d.\n', num_dec);
else
    % es decimal se hace la conversión a binario 
    k=0; 
    while num_str>0
        k = k+1; % esta k es para ir colocando elemento en el vector resto  
        resto(k) = mod(num_str,2); % esto es el resto de un núumero al divirlo por 2
        num_str=(num_str-resto(k))/2; % algotirmo de la divisón para convertir 
    end
    fprintf('El equivalente en binario es \n BIN = ')
    for j = k:-1:1
        fprintf('%1i',resto(j));
    end
    fprintf('\n')
end

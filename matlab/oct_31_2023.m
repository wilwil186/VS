clc;
clear all;
close all;

A = [[0 0 1 2]; [1 1 2 2]; [2 0 0 1]];
n = 3;
m = 4;

for col = 1:1:m
    Pos = col;
    encontro = false;
    disp(A)
    
    % Check if there is a 0 in the first column
    while ~(encontro) && (Pos <= n)
        if A(Pos, 1) == 0
            Pos = Pos + 1;
        else
            encontro = true;
        end
    end

    % Convert the elements of the row "Pos" to make the first column zero
    if encontro == true 
        for i=Pos+1:1:n
            c = -A(i,1)/A(Pos,1); % the value that multiplies row Pos
            % multiply row Pos by c and add it to row i
            for j=1:1:m 
                A(i,j)=A(i,j)+c*A(Pos,j);
            end
        end
        disp(A)
        
        % Swap the first row with the row containing the non-zero element
        if not(Pos==1)
            for j=1:1:m
                Aux=A(Pos,1);
                A(Pos,j)=A(1,j);
                A(1,j)=Aux;
            end
            disp(A); % the first column is now obtained
        end
    end
end

% ver si tenemos solucion ~=
% esapcio fila y espacio columna 
% sustitucion hacia atras
% calcular determinante y autovectores 


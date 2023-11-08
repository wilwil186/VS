function [encontro,p] = Newton(f,n,p0,tol,nmax)

i=0;

[f_p0,g_p0,q] = Horner (n,f,p0); 

encontro = false;

while i <= nmax && ~(encontro)

    p = p0 - (f_p0/g_p0);
    i = i + 1;

    if abs(p - p0) < tol
        fprintf(['El procedimiento es exitoso después de %d iteraciones.' ...
            'Raíz estimada: %.6f\n'], i, p);
        encontro = true;

    else
        fprintf('Iteración %d: Raíz estimada = %.6f\n', i, p);
    end

    p0 = p;
    [f_p0,g_p0,q] = Horner (n,f,p0);
end

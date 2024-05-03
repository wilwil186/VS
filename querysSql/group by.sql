SELECT * FROM Proveedores; 

SELECT * FROM Productos;
SELECT COUNT(ID) AS NUM_PROVEEDORES FROM Proveedores;

SELECT * FROM Productos;
SELECT 
	count(nombre) as num_productos, 
    count(distinct nombre) num_productos_distintos
FROM Productos;

DESCRIBE Productos;

SELECT 
	FECHA AS dia, 
    sum(importe) as importe
FROM Compras
GROUP BY FECHA 
ORDER BY FECHA DESC;
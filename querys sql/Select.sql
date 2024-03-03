-- SELECT
USE bd_compras;
SHOW TABLES IN bd_compras;
SELECT * FROM Productos;
DESCRIBE Productos;

SELECT 
	id, 
    nombre, 
    precio,
    talla, 
    color, 
    tipo
FROM Productos WHERE tipo='Mujer deportiva';    

SELECT * FROM Productos WHERE tipo='Mujer deportiva' or tipo='Hombre deportiva';  

SELECT * FROM Productos WHERE tipo like '%ombre%';
SELECT * FROM Compras;
SELECT * FROM Compras WHERE FECHA BETWEEN '2023-11-15' and '2024-02-29';
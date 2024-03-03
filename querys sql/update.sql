/*update*/
USE bd_compras; -- Defines cual es el servidor que vas a usar 
SELECT * FROM Proveedores; -- puedes ver la tabla
DESCRIBE Productos; -- Describir los datos de una tabla

UPDATE Proveedores
SET telefono = '5587321190'
WHERE id = 2;

SELECT * FROM Productos;

UPDATE Productos SET precio = precio * 1.1 WHERE 1=1;
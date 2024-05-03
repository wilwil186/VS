/*TRUNCATE*/

SHOW TABLES IN bd_compras;
SELECT * FROM Compras;
TRUNCATE TABLE Compras;

TRUNCATE TABLE Proveedores;

TRUNCATE TABLE Productos;

ALTER TABLE Compras
DROP FOREIGN KEY fk_proveedor; 

ALTER TABLE Compras
DROP FOREIGN KEY fk_producto; 
USE bd_compras;
SHOW TABLES IN bd_compras;
SELECT * FROM Proveedores; -- normal 
SELECT * FROM Proveedores ORDER BY nombre ASC;

SELECT * FROM Compras ;
SELECT * FROM Compras ORDER BY fecha DESC;
SELECT * FROM Compras ORDER BY fecha ASC;

SELECT * FROM Productos;
SELECT * FROM Productos ORDER BY nombre ASC;

SELECT * FROM Productos ORDER BY tipo ASC, precio DESC;

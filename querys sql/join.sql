/*Joins*/ 
USE bd_compras;
SHOW TABLES IN bd_compras;
SELECT * FROM Compras;
SELECT * FROM Proveedores;
SELECT * FROM Productos;
SELECT 
* 
FROM Compras C 
LEFT JOIN Proveedores PV ON C.PROVEEDOR_ID=PV.ID
LEFT JOIN Productos PD ON C.PRODUCTO_ID=PD.ID;

SELECT 
* 
FROM Compras C 
JOIN Proveedores PV ON C.PROVEEDOR_ID=PV.ID
JOIN Productos PD ON C.PRODUCTO_ID=PD.ID;

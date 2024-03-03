-- Pongamos todo a prueba 
USE bd_compras; -- USA EL SERVIDO 
SHOW TABLES IN bd_compras; -- MUESTRA LAS TBALAS DEL SERVIDOR
-- AQUÍ SOLO SE HACE UN EJEMPLO 
SELECT * FROM Compras C
LEFT JOIN Proveedores PV ON C.Proveedor_ID=PV.ID
LEFT JOIN Productos PD ON C.Producto_ID=PD.ID; -- une el conjunto principal más la intersección 
-- VER A QUE PROOVEDOOR COMPRAMOS MAS ARTICULOS.
SELECT 
	PV.nombre, 
    sum(unidades) unidades
FROM Compras C
LEFT JOIN Proveedores PV ON C.Proveedor_ID=PV.ID
LEFT JOIN Productos PD ON C.Producto_ID=PD.ID
GROUP BY PV.nombre
ORDER BY unidades DESC;
-- MEDIR EL IMPORTE DEL PRODUCTO 
SELECT 
	PD.nombre, 
    sum(importe) importe
FROM Compras C
LEFT JOIN Proveedores PV ON C.Proveedor_ID=PV.ID
LEFT JOIN Productos PD ON C.Producto_ID=PD.ID
GROUP BY PD.nombre
ORDER BY importe DESC;
-- coste promedio 
SELECT 
	PD.nombre, 
    sum(importe) importe, 
    sum(unidades) unidades,
    sum(importe)/sum(unidades) costo_prom
FROM Compras C
LEFT JOIN Proveedores PV ON C.Proveedor_ID=PV.ID
LEFT JOIN Productos PD ON C.Producto_ID=PD.ID
GROUP BY PD.nombre
ORDER BY importe DESC;

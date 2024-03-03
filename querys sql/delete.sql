USE bd_compras; -- Usa el servidor bd_compras
SHOW TABLES IN bd_compras; -- muestra las tablas en bd_compras
SELECT * FROM Proveedores; -- para ver los contenidos de la tabla, * selecciona todos los campos
DELETE FROM Proveedores WHERE id=3; -- Eliminar por el id
INSERT INTO Proveedores (
	nombre, 
    telefono, 
    dirección
)
VALUES
    ('Ricardo',5565907865,'Insurgentes Sur 282, CP 11550, CDMX');
SELECT * FROM Productos;
DESCRIBE Productos;
INSERT INTO Productos (
	id,
	nombre,
    precio,
    talla, 
    Color, 
    tipo
)
VALUES
    (10,'Falda',14,'Mediana','Negra','Mujer Casual');
DELETE FROM Productos WHERE id=5; -- Eliminar por el id
DELETE FROM Proveedores WHERE nombre='Ricardo'; -- Eliminar por el nombre

SELECT * FROM Productos;

DELETE FROM Productos WHERE nombre='shorts';
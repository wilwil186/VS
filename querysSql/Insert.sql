/*INSERT*/

USE bd_compras;

SELECT * FROM Proveedores;

Describe Proveedores;

INSERT INTO Proveedores (
	nombre, 
    telefono, 
    dirección
)
VALUES
	('Paola',5513907865,'Insurgentes Sur 282, CP 06100, CDMX'),
    ('Carlos',5528907865,'Av. universidades 424, CP 03020, CDMX'),
    ('Ricardo',5565907865,'Insurgentes Sur 282, CP 11550, CDMX'),
    ('María',5589907865,'Insurgentes Sur 282, CP 03100, CDMX'),
    ('Raul',5543907865,'Insurgentes Sur 282, CP 03660, CDMX');

SELECT * FROM Productos;

describe Productos;

INSERT INTO Productos (
	nombre,
    precio, 
    talla, 
    Color,
    tipo
)
VALUES
	('Playera',20,'Mediana','Blanca','Unisex deportiva'), 
    ('Playera',20,'Grande','Roja','Unisex deportiva'), 
    ('Pants',30,'Chico','Gris','Mujer deportiva'),
	('Playera', 20, 'Chica', 'Azul', 'Unisex deportiva'),
    ('Playera', 20, 'Mediana', 'Negra', 'Unisex deportiva'),
    ('Playera', 20, 'Grande', 'Verde', 'Unisex deportiva'),
    ('Pants', 30, 'Mediano', 'Negro', 'Hombre deportiva'),
    ('Pants', 30, 'Grande', 'Azul', 'Hombre deportiva'),
    ('Pants', 30, 'Extra-Grande', 'Gris', 'Hombre deportiva'),
    ('Shorts', 25, 'Mediano', 'Azul', 'Unisex deportiva');

SELECT * FROM Compras;

describe Compras;

INSERT INTO Compras (
	fecha, 
    unidades,
    importe, 
    proveedor_id,
    producto_id
)
VALUES
	('1965-10-06',6,60,1,6),
	('2023-05-15', 8, 80, 2, 7),
    ('2023-06-20', 5, 50, 3, 8),
    ('2023-08-30', 3, 30, 4, 10),
    ('2023-09-05', 6, 60, 2, 9),
    ('2023-10-10', 7, 70, 3, 5),
    ('2023-11-15', 4, 40, 1, 4),
    ('2023-12-20', 9, 90, 4, 3),
    ('2024-01-25', 2, 20, 2, 2),
    ('2024-02-29', 5, 50, 3, 1);

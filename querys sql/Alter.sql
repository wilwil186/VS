/*ALTER*/

DESCRIBE Productos;

ALTER TABLE Productos 
ADD talla varchar(15),
ADD Color varchar(15),
ADD tipo varchar(20);

DESCRIBE Proveedores;

ALTER TABLE Proveedores
DROP ciudad;

ALTER TABLE Proveedores
MODIFY telefono varchar(10) null;

ALTER TABLE Proveedores
DROP CONSTRAINT telefono;

ALTER TABLE Proveedores
DROP dirección;

ALTER TABLE Proveedores
ADD dirección varchar(100);
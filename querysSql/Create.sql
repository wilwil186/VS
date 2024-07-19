/*CREATE*/

USE bd_compras;

CREATE TABLE Proveedores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL, 
    telefono VARCHAR(10) NOT NULL UNIQUE,
    ciudad VARCHAR(20),
    dirección FLOAT
);

CREATE TABLE Productos(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(20) NOT NULL, 
    precio FLOAT
);

CREATE TABLE Compras(
	num_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    unidades INT, 
    importe FLOAT, 
    proveedor_id INT, 
    producto_id INT, 
    CONSTRAINT fk_proveedor FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id) ON DELETE NO ACTION,
	CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES Productos(id) ON DELETE NO ACTION
);



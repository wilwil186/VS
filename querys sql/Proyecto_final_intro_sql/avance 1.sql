USE sales_bd; -- Es para una el schema
-- Avance 1 del proyecto final 
-- paso 1. crear tablas 
CREATE TABLE Users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL, 
    gender VARCHAR(2), 
    zip_code VARCHAR(5) NOT NULL,
    address FLOAT NOT NULL,
    state VARCHAR(50) NOT NULL, 
    city VARCHAR(20) NOT NULL,
    phone VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Products(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    description VARCHAR(300) NOT NULL,  
    type VARCHAR(200) NOT NULL,
    price_usd FLOAT
);

CREATE TABLE Ventas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    units INT, 
    amount FLOAT, 
    user_id INT, 
    product_id INT, 
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE NO ACTION,
	CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE NO ACTION
);
-- ver que quedaron creadas
SHOW TABLES IN sales_bd;
DESCRIBE Products;
DESCRIBE Users;
DESCRIBE Ventas;
-- Eliminar el campo name
ALTER TABLE Users
DROP name;
-- crear campos first_name y last_name
ALTER TABLE Users
ADD first_name VARCHAR(20) NOT NULL,
ADD last_name VARCHAR(20) NOT NULL;
-- Eliminar la tabla ventas pues debe estar todo en ingles
DROP TABLE Ventas;
-- Crear la tabla que lo va a remplazar
CREATE TABLE Sales(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    units INT, 
    amount FLOAT, 
    user_id INT, 
    product_id INT, 
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE NO ACTION,
	CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE NO ACTION
);

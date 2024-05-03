-- ¿Cuantos productos tiene tu catalogo?
USE sales_bd;
SELECT * FROM  Products;
SELECT 
	count(name) as num_products, 
    count(distinct name) num_products_distint
FROM Products;

SELECT * FROM  Products;
SELECT 
	type,
	count(id) num_products
FROM Products
GROUP BY type
ORDER BY num_products desc;
-- ¿Cuantos productos tiene tu catalogo? por tipo

USE sales_bd;

SELECT 
    type,
    COUNT(*) as num_products
FROM Products
GROUP BY type
Order BY num_products ASC;
/*
¿Cual es el product_id, product name y el price del articulo mas caro y del más barato?, ver diaparidad de los precios. 
¿Que tienes más registrados en tu plataforma hombres o mujeres ? para añadir mas productos del agrado del genero predominante 
Top 5 de los estados donde tienes menos usiarios regristrados, para poder hacer campaña de marketin en estos estados
La fecha minima, para saber cuando empece
¿Cual es el dia de mayores ingresos ?
listar los nombres de los productos, empezando por el que mas unidades ha vendido 
mostrar los datos del usuario con mayor amount
*/

-- Top 5 
SELECT 
	state, 
    count(id) as num_users 
FROM Users
GROUP BY state
ORDER BY num_users asc
limit 5;
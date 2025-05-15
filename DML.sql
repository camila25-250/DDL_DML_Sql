/*Consultas sobre una tabla*/
#1
SELECT nombre FROM producto;
#2
SELECT nombre,precio FROM producto;
#3
SELECT * FROM producto;
#4
SELECT nombre, precio, precio * 0.8946 AS precio_EUR FROM producto;
#5
SELECT Nombre as Nombre_de_Producto , Precio as Dolares , Precio * 0.8946 as Euro FROM Producto;
#6
SELECT UPPER(nombre) as Nombres_en_Mayuscula,precio FROM producto;
#7
SELECT LOWER(nombre) as Nombres_en_Minuscula, precio FROM producto;
#8
SELECT nombre, UPPER(LEFT(nombre, 2)) as Nombres_Mayus FROM fabricante;
#9
SELECT nombre,ROUND(precio) as Precio_Redondeado FROM producto;
#10
SELECT nombre,TRUNCATE(precio, 0) as Precio_Truncado FROM producto;
#11
SELECT f.codigo FROM fabricante as f
JOIN producto as p on f.codigo = p.codigo_fabricante;
#12
SELECT DISTINCT f.codigo FROM fabricante as f
JOIN producto as p on f.codigo = p.codigo_fabricante;
#13
SELECT nombre FROM fabricante
ORDER BY nombre ASC;
#14
SELECT nombre FROM fabricante
ORDER BY nombre DESC;
#15
SELECT nombre,precio FROM producto
ORDER BY nombre ASC;
SELECT nombre,precio FROM producto
ORDER BY precio DESC;
#16
SELECT * FROM fabricante LIMIT 5;
#17
SELECT * FROM fabricante LIMIT 3 OFFSET 3;
#18
SELECT nombre,precio FROM producto 
ORDER BY precio asc limit 1;
#19
SELECT nombre,precio FROM producto 
ORDER BY precio desc limit 1;
#20
SELECT p.nombre,p.codigo_fabricante FROM producto as p
JOIN fabricante as f on p.codigo_fabricante=f.codigo where p.codigo_fabricante=2;
#21
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 <= 120;
#22
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 >= 400;
#23
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 < 400;
#24
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 >= 80 AND precio * 0.8946 <= 300;
#25
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 BETWEEN 60 AND 200;
#26
SELECT codigo_fabricante, nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 < 200 and codigo_fabricante = 6;
#27
SELECT codigo_fabricante,nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
#28
SELECT codigo_fabricante,nombre FROM producto WHERE codigo_fabricante IN (1,3,5);
#29
SELECT nombre, precio * 100 AS Centimos FROM producto WHERE precio * 100;
#30
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';
#31
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';
#32
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';
#33
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;
#34
SELECT nombre FROM producto WHERE nombre LIKE '%portatil%';
#35
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 < 215 and  nombre LIKE '%monitor%';
#36
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 >= 180 
ORDER BY precio * 0.8946 desc;
SELECT nombre, precio * 0.8946 AS precio_euros FROM producto WHERE precio * 0.8946 >= 180 
ORDER BY nombre asc;
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

/*-----------------------------------------------------------------------------------------------------------------*/
/*Consultas multitabla(COMPOSICION INTERNA)*/
#1
SELECT p.nombre, p.precio, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante;
#2
SELECT  f.nombre, p.nombre, p.precio FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante ORDER BY f.nombre ASC;
#3
SELECT p.codigo , p.nombre as nombre_producto, f.codigo, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante;
#4
SELECT p.nombre, p.precio, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante ORDER BY precio asc limit 1;
#5
SELECT p.nombre, p.precio, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante ORDER BY precio desc limit 1;
#6
SELECT f.nombre as nombre_fabricante, p.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre ="Lenovo";
#7
SELECT f.nombre as nombre_fabricante, p.nombre, p.precio * 0.8946 as precio_euros FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre ="Crucial" and precio * 0.8946 > 200;
#8
SELECT p.nombre, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre = "Asus" OR f.nombre ="Hewlett-Packard" OR f.nombre = "Seagate";
#9
SELECT p.nombre, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre IN ("Asus","Hewlett-Packard","Seagate");
#10
SELECT p.nombre, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE F.nombre LIKE '%e';
#11
SELECT p.nombre, f.nombre as nombre_fabricante FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE F.nombre LIKE '%w%';
#12
SELECT f.nombre as nombre_fabricante, p.nombre, p.precio * 0.8946 as precio_euros FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE precio * 0.8946 >= 180 ORDER BY precio ASC;


SELECT f.nombre as nombre_fabricante, p.nombre, p.precio * 0.8946 as precio_euros FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE precio * 0.8946 >= 180 ORDER BY precio DESC;
#13
SELECT p.codigo_fabricante, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante;

/*-----------------------------------------------------------------------------------------------------------------*/
/*Consultas multitabla (COMPOSICION EXTERNA)*/
#1
SELECT f.nombre as nombre_fabricante , p.nombre FROM fabricante as f
LEFT JOIN producto as p on f.codigo = p.codigo_fabricante ORDER BY f.nombre;
#2
SELECT f.nombre as fabricante FROM fabricante as f
LEFT JOIN producto as p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is null;
#3


/*-----------------------------------------------------------------------------------------------------------------*/
/*Consultas Resumen*/
#1
SELECT  count(*)  FROM producto;
#2
SELECT  count(*)  FROM fabricante;
#3
SELECT count(DISTINCT codigo_fabricante)  FROM producto;
#4
SELECT AVG(precio) FROM producto;
#5
SELECT precio  FROM producto 
ORDER BY precio asc limit 1;
#6
SELECT precio  FROM producto 
ORDER BY precio desc limit 1;
#7
SELECT nombre, precio FROM producto 
ORDER BY precio asc limit 1;
#8
SELECT nombre, precio FROM producto 
ORDER BY precio desc limit 1;
#9
SELECT SUM(precio)  FROM producto;
#10
SELECT COUNT(p.codigo) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';
#11
SELECT AVG(p.precio)  FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';
#12
SELECT p.precio  FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Asus'
ORDER BY precio asc limit 1;
#13
SELECT p.precio FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus'
ORDER BY precio desc limit 1;
#14
SELECT SUM(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';
#15
SELECT p.precio FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Crucial'
ORDER BY precio desc limit 1;

SELECT p.precio FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Crucial'
ORDER BY precio asc limit 1;

SELECT AVG(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Crucial';

SELECT count(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial'
/*Consultas sobre una tabla*/
#1
SELECT nombre FROM producto;
#2
SELECT nombre,precio FROM producto;
#3
SELECT * FROM producto;
#4
SELECT nombre, precio, precio * 0.8946 FROM producto;
#5
SELECT Nombre as nombre_de_producto, precio as dolares, precio * 0.8946 as euro FROM producto;
#6
SELECT UPPER(nombre),precio FROM producto;
#7
SELECT LOWER(nombre), precio FROM producto;
#8
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;
#9
SELECT nombre,ROUND(precio) FROM producto;
#10
SELECT nombre,TRUNCATE(precio, 0) FROM producto;
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
ORDER BY precio ASC limit 1;
#19
SELECT nombre,precio FROM producto 
ORDER BY precio DESC limit 1;
#20
SELECT p.nombre,p.codigo_fabricante FROM producto as p
JOIN fabricante as f on p.codigo_fabricante=f.codigo WHERE p.codigo_fabricante=2;
#21
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 <= 120;
#22
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 >= 400;
#23
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 < 400;
#24
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 >= 80 AND precio * 0.8946 <= 300;
#25
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 BETWEEN 60 AND 200;
#26
SELECT codigo_fabricante, nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 < 200 and codigo_fabricante = 6;
#27
SELECT codigo_fabricante,nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
#28
SELECT codigo_fabricante,nombre FROM producto WHERE codigo_fabricante IN (1,3,5);
#29
SELECT nombre, precio * 100 as Centimos FROM producto WHERE precio * 100;
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
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 < 215 and nombre LIKE '%monitor%';
#36
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 >= 180 
ORDER BY precio * 0.8946 DESC;
SELECT nombre, precio * 0.8946 FROM producto WHERE precio * 0.8946 >= 180 
ORDER BY nombre ASC;

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
SELECT p.nombre, p.precio, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante ORDER BY precio ASC limit 1;
#5
SELECT p.nombre, p.precio, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante ORDER BY precio DESC limit 1;
#6
SELECT f.nombre, p.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre ="Lenovo";
#7
SELECT f.nombre, p.nombre, p.precio * 0.8946 FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre ="Crucial" and precio * 0.8946 > 200;
#8
SELECT p.nombre, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre = "Asus" OR f.nombre ="Hewlett-Packard" OR f.nombre = "Seagate";
#9
SELECT p.nombre, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE f.nombre IN ("Asus","Hewlett-Packard","Seagate");
#10
SELECT p.nombre, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE F.nombre LIKE '%e';
#11
SELECT p.nombre, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE F.nombre LIKE '%w%';
#12
SELECT f.nombre, p.nombre, p.precio * 0.8946 FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE precio * 0.8946 >= 180 ORDER BY precio DESC;

SELECT f.nombre, p.nombre, p.precio * 0.8946 FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante WHERE precio * 0.8946 >= 180 ORDER BY f.nombre ASC;
#13
SELECT p.codigo_fabricante, f.nombre FROM producto as p
JOIN fabricante as f on f.codigo = p.codigo_fabricante;

/*-----------------------------------------------------------------------------------------------------------------*/
/*Consultas multitabla (COMPOSICION EXTERNA)*/
#1
SELECT f.nombre, p.nombre FROM fabricante as f
LEFT JOIN producto as p on f.codigo = p.codigo_fabricante ORDER BY f.nombre;
#2
SELECT f.nombre FROM fabricante as f
LEFT JOIN producto as p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is null;
#3
/*R: No, pueden existir productos que no esten relacionados con un fabricante por que en la tabla producto esta el campo "codigo_fabricante", 
que es una llave foránea que hace referencia al campo "codigo" de la tabla fabricante y en la relacion de estas dos tablas se establece que un 
fabricante puede tener muchos productos pero un producto debe tener un solo fabricante, por lo tanto cada producto debe de tener un fabricante 
ya existente.*/

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
SELECT nombre, MIN(precio) FROM producto 
ORDER BY precio;
#8
SELECT nombre, MAX(precio) FROM producto 
ORDER BY precio ;
#9
SELECT SUM(precio)  FROM producto;
#10
SELECT COUNT(p.codigo) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';
#11
SELECT AVG(p.precio)  FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';
#12
SELECT MIN(p.precio)  FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Asus'
ORDER BY precio ;
#13
SELECT MAX(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus'
ORDER BY precio;
#14
SELECT SUM(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';
#15
SELECT MAX(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Crucial'
ORDER BY precio;

SELECT MIN(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Crucial'
ORDER BY precio;

SELECT AVG(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre ='Crucial';

SELECT COUNT(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial';
#16
SELECT COUNT(p.codigo), f.nombre  FROM fabricante as f
LEFT JOIN producto as p on p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY count(p.codigo) DESC; 
#17
SELECT f.nombre, MAX(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY f.nombre;

SELECT f.nombre, MIN(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY f.nombre;

SELECT f.nombre, AVG(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY f.nombre;
#18
SELECT f.codigo, MAX(p.precio * 0.8946), MIN(p.precio * 0.8946) , AVG(p.precio * 0.8946), COUNT(p.codigo) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.codigo HAVING AVG(p.precio * 0.8946 )> 200 ORDER BY f.codigo;
#19
SELECT f.nombre, MAX(p.precio * 0.8946), MIN(p.precio * 0.8946) , AVG(p.precio * 0.8946), COUNT(p.codigo) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre HAVING AVG(p.precio * 0.8946 )> 200 ORDER BY f.nombre;
#20
SELECT COUNT(precio* 0.8946) FROM producto WHERE precio * 0.8946>= 180;
#21
SELECT f.nombre, COUNT(precio* 0.8946) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo  WHERE precio * 0.8946>= 180 GROUP BY f.nombre;
#22
SELECT f.codigo, AVG(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.codigo;
#23
SELECT f.nombre, AVG(p.precio) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre;
#24
SELECT f.nombre, AVG(p.precio * 0.8946) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre HAVING AVG(p.precio * 0.8946 )>= 150 ORDER BY f.nombre;
#25
SELECT f.nombre FROM fabricante as f
JOIN producto as p  on p.codigo_fabricante = f.codigo GROUP BY f.nombre HAVING COUNT(p.codigo)>=2;
#26
SELECT f.nombre, COUNT(precio* 0.8946) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo WHERE precio * 0.8946>= 220 GROUP BY f.nombre DESC;
#27
SELECT f.nombre, COUNT(CASE WHEN precio* 0.8946>= 220 THEN 1 END) as total FROM producto as p
RIGHT JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY total DESC;
#28
SELECT f.nombre, COUNT(precio* 0.8946) FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY p.precio HAVING SUM(precio) >700;
#29
SELECT p.nombre, MAX(p.precio), f.nombre FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY f.nombre ASC;

/*-----------------------------------------------------------------------------------------------------------------*/
/*Subconsultas(En La Claúsula WHERE)*/

/*Con operadores básicos de comparación*/
#1
SELECT p.nombre FROM producto as p
WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante as f WHERE f.nombre = 'Lenovo');
#2
SELECT * FROM producto as p
WHERE p.precio = (SELECT MAX(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo AND f.nombre='Lenovo');
#3
SELECT p.nombre FROM producto as p
WHERE p.precio =(SELECT MAX(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo AND f.nombre ='Lenovo');
#4
SELECT p.nombre FROM producto as p
WHERE p.precio =(SELECT MIN(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo AND f.nombre ='Hewlett-Packard');
#5
SELECT p.nombre FROM producto as p
WHERE p.precio >= (SELECT MAX(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo AND f.nombre='Lenovo');
#6
SELECT p.nombre FROM producto as p
WHERE p.precio > (SELECT AVG(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo AND f.nombre='Asus');
#6


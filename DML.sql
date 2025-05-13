/*Consultas sobre una tabla*/
SELECT Nombre FROM Producto;
SELECT Nombre,Precio FROM Producto;
SELECT * FROM Producto;
SELECT Nombre, Precio, Precio * 0.8946 AS Precio_EUR FROM Producto;
SELECT Nombre as Nombre_de_Producto , Precio as Dolares , Precio * 0.8946 as Euro FROM Producto;
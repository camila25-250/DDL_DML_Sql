DROP DATABASE IF EXISTS Tienda;
CREATE DATABASE Tienda;
USE Tienda;

Create table producto(
codigo int(10) primary key auto_increment,
nombre varchar(100),
precio Double,
codigo_fabricante int(10)
);

Create table fabricante(
codigo int(10) Primary key auto_increment,
nombre varchar(100)
);

/*Foreign Key*/
ALTER TABLE producto
ADD CONSTRAINT FK_codigo_fabricant
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo); 
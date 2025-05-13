CREATE DEFINER=`root`@`localhost` PROCEDURE `producto`(
IN Nom varchar(100),
IN Prec Double,
IN Cod_Fa int(10)
)
BEGIN
INSERT INTO producto (nombre,precio,codigo_fabricante)
VALUES (Nom,Prec,Cod_Fa);
END
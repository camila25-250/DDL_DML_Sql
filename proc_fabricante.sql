CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricante`(
IN nom VARCHAR(100)
)
BEGIN
INSERT INTO fabricante(nombre)
VALUES (nom);
END
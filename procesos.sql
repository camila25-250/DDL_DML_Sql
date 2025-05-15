USE `tienda`;
DROP procedure IF EXISTS `fabricante`;

USE `tienda`;
DROP procedure IF EXISTS `tienda`.`fabricante`;
;

DELIMITER $$
USE `tienda`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fabricante`(
IN nomb VARCHAR(100)
)
BEGIN
INSERT INTO fabricante(nombre)
VALUES (nomb);
END$$

DELIMITER ;
;
/*-------------------------------------------------------------------------------*/
USE `tienda`;
DROP procedure IF EXISTS `producto`;

USE `tienda`;
DROP procedure IF EXISTS `tienda`.`producto`;
;

DELIMITER $$
USE `tienda`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `producto`(
IN Nomb varchar(100),
IN Prec Double,
IN Cod_Fa int(10)
)
BEGIN
INSERT INTO producto (nombre,precio,codigo_fabricante)
VALUES (Nomb,Prec,Cod_Fa);
END$$

DELIMITER ;
;
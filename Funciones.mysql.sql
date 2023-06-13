/* Crea una función que calcule el promedio de precios de los productos.*/

DELIMITER //

CREATE FUNCTION obtener_promedio_precios()
RETURNS DECIMAL(8,2) DETERMINISTIC READS SQL DATA
BEGIN
 DECLARE promedio_precios DECIMAL(8,2);
 SELECT AVG(precio) INTO promedio_precios FROM producto;
 RETURN promedio_precios;

END//
 
 DELIMITER ;
 
 /*Utiliza la función para obtener el promedio de precios de todos los productos.*/
 
 SELECT obtener_promedio_precios();

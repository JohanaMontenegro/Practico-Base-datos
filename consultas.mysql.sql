/*Realiza una consulta utilizando SELECT JOIN para obtener la información de los
productos comprados por cada cliente*/

SELECT cl.nombre,p.*
FROM cliente cl
INNER JOIN compras cm ON cl.id_cliente = cm.id_cliente
INNER JOIN producto p ON p.id_producto = cm.id_producto;

/*Crea una VIEW que muestre los productos con descuento.*/
DROP VIEW productos_con_descuento;
CREATE VIEW productos_con_descuento AS 
SELECT nombre,descuento
FROM producto 
WHERE descuento > 0;
 
 /*Crea un INDEX en la columna "nombre" de la tabla "Productos" para mejorar la
velocidad de las consultas.*/

 CREATE INDEX `nombre_producto` ON `producto` (`nombre` ASC) VISIBLE;
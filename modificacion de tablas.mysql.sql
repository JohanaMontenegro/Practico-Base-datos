/*Agrega una columna `descuento` a la tabla `Producto` */

ALTER TABLE producto
DROP COLUMN descuento;

ALTER TABLE producto
ADD COLUMN descuento VARCHAR(10);

UPDATE producto
SET descuento = '30%';

/*Modifica el tipo de datos de la columna "precio" en la tabla "Productos"*/

ALTER TABLE producto
MODIFY COLUMN precio FLOAT;

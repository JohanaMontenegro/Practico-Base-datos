/*Agrega una columna `descuento` a la tabla `Producto` */

ALTER TABLE producto
ADD COLUMN descuento DECIMAL(8,2) default 0;

UPDATE producto
SET descuento =precio * 0.3
WHERE precio > 1498;

/*Modifica el tipo de datos de la columna "precio" en la tabla "Productos"*/

ALTER TABLE producto
MODIFY COLUMN precio BIGINT;

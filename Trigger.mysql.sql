
/*Crea un TRIGGER que actualice el stock de un producto después de realizar una 
orden de compra.*/

DELIMITER //
DROP TRIGGER actualizacion_de_stock;
CREATE TRIGGER actualizacion_de_stock
AFTER INSERT ON compras
FOR EACH ROW
BEGIN
    UPDATE producto
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END; 

SET @id_compra = (SELECT MAX(id_compra) +1 FROM compras);
INSERT INTO compras (id_compra, id_cliente,id_producto, cantidad, fecha)
VALUES (@id_compra,6, 99, 7, '2023-06-08');


SELECT stock FROM producto WHERE id_producto= 99;


/*Crea un TRIGGER que actualice el stock de un producto después de realizar una 
orden de compra.*/
DROP TRIGGER IF EXISTS actualizacion_de_stock;
DELIMITER //

CREATE TRIGGER actualizacion_de_stock
AFTER INSERT ON compras
FOR EACH ROW
BEGIN
    UPDATE producto
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END; 


INSERT INTO compras ( id_cliente,id_producto, cantidad, fecha)
VALUES (6, 99, 7, '2023-06-08');


SELECT stock FROM producto WHERE id_producto= 99;

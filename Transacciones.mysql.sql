/*Crea una transacción que inserte un nuevo cliente y una nueva orden de compra al
mismo tiempo.*/

DELIMITER //
 DROP PROCEDURE nueva_orden_de_compra;

CREATE PROCEDURE nueva_orden_de_compra(IN nombre_cliente VARCHAR(45),IN correo_electronico VARCHAR(45),IN direccion VARCHAR(45),IN nombre_producto VARCHAR(45),cantidad INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    SHOW ERRORS;
        ROLLBACK;
    END;
    
    START TRANSACTION;
    SET @id_cliente =(SELECT MAX(id_cliente) + 1 FROM cliente);
    INSERT INTO cliente(id_cliente,nombre,correo_electronico,direccion) VALUES
    (@id_cliente,nombre,correo_electronico,direccion);
    
	SELECT id_producto into @id_producto FROM producto WHERE nombre = nombre_producto;
    SELECT @id_producto;
    SET @id_compra =(SELECT MAX(id_compra) + 1 FROM compras);
    INSERT INTO compras(id_compra,id_producto,id_cliente,cantidad,fecha) VALUES
    (@id_compra,@id_producto,@id_cliente,cantidad,CURDATE());
    
    COMMIT;
    SELECT 'Tansaccion completada';
    END//
    
     DELIMITER ;
     
     CALL nueva_orden_de_compra('Mariana Sanchez','marianasanchez84@gmail.com','Avenida San martin 2469','Sudadera con capucha',5);
     
    
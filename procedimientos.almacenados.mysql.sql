/*Crea un STORE PROCEDURE que calcule el total de ventas para un cliente dado.*/

DELIMITER //

CREATE PROCEDURE total_de_ventas(IN cliente_id INT, OUT total_ventas INT)
BEGIN 
SELECT COUNT(*) INTO total_ventas
FROM compras
WHERE id_cliente = cliente_id;
END //

DELIMITER ;

/*Utiliza el STORE PROCEDURE para obtener el total de ventas de un cliente.*/

CALL total_de_ventas(11,@resultado);
SELECT @resultado;
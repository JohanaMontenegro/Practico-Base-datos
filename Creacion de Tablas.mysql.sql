/* crear el esquema si es que no existe y darle uso*/

DROP SCHEMA IF EXISTS tienda_kids;

CREATE SCHEMA IF NOT EXISTS `tienda_kids`;
USE  `tienda_kids`;

/*creamos la tabla cliente*/
DROP TABLE IF EXISTS CLIENTE;

CREATE TABLE IF NOT EXISTS `CLIENTE`(
`id_cliente` INT AUTO_INCREMENT NOT NULL,
`nombre` VARCHAR(45) NOT NULL,
`correo_electronico` VARCHAR(45) NOT NULL,
`direccion` VARCHAR(45) NOT NULL,
PRIMARY KEY(`id_cliente`))
ENGINE= InnoDB;

/*crear la tabla productos*/
DROP TABLE IF EXISTS PRODUCTO;

CREATE TABLE IF NOT EXISTS `PRODUCTO`(
`id_producto` INT AUTO_INCREMENT NOT NULL,
`nombre`VARCHAR(45) NOT NULL,
`precio` INT NOT NULL,
`stock` INT NOT NULL,
PRIMARY KEY(`id_producto`))
ENGINE= InnoDB;

/*crear la tabla compras*/

DROP TABLE IF EXISTS COMPRAS;
CREATE TABLE IF NOT EXISTS `COMPRAS`(
`id_compra` INT AUTO_INCREMENT NOT NULL,
`id_producto` INT NOT NULL,
`id_cliente` INT NOT NULL,
`cantidad` INT NOT NULL,
`fecha` DATE NOT NULL,
PRIMARY KEY(`id_compra`),
  CONSTRAINT `fk_COMPRAS_PRODUCTO1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `PRODUCTO` (`id_producto`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_COMPRAS_CLIENTE1` 
    FOREIGN KEY (`id_cliente`)
    REFERENCES `CLIENTE` (`id_cliente`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
    
ENGINE = InnoDB;

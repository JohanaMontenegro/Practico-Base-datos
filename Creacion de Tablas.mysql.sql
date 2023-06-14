/* crear el esquema si es que no existe y darle uso*/

CREATE SCHEMA IF NOT EXISTS `tienda_kids`;
USE  `tienda_kids`;

/*creamos la tabla cliente*/
CREATE TABLE IF NOT EXISTS `CLIENTE`(
`id_cliente` INT NOT NULL,
`nombre` VARCHAR(45) NOT NULL,
`correo_electronico` VARCHAR(45) NOT NULL,
`direccion` VARCHAR(45) NOT NULL,
PRIMARY KEY(`id_cliente`))
ENGINE= InnoDB;

/*crear la tabla productos*/

CREATE TABLE IF NOT EXISTS `PRODUCTO`(
`id_producto` INT NOT NULL,
`nombre`VARCHAR(45) NOT NULL,
`precio` INT NOT NULL,
`stock` INT NOT NULL,
PRIMARY KEY(`id_producto`))
ENGINE= InnoDB;

/*crear la tabla compras*/

CREATE TABLE IF NOT EXISTS `COMPRAS`(

`id_compra` INT NOT NULL,
`id_producto` INT NOT NULL,
`id_cliente` INT NOT NULL,
`cantidad` INT NOT NULL,
`fecha` DATE NOT NULL,
PRIMARY KEY(`id_compra`,`id_producto`,`id_cliente`),
  CONSTRAINT `fk_COMPRAS_PRODUCTO1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `PRODUCTO` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRAS_CLIENTE1` 
    FOREIGN KEY (`id_cliente`)
    REFERENCES `CLIENTE` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



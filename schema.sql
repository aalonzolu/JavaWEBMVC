CREATE DATABASE  IF NOT EXISTS `inventario` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inventario`;

-- MySQL Workbench Synchronization
-- Generated: 2017-05-24 21:49
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Lexo Alonzo

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `inventario`.`bodega` (
  `codigo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion_bodega` VARCHAR(45) NOT NULL,
  `telefono_bodega` VARCHAR(8) NOT NULL,
  `producto_id_producto` INT(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_bodega_producto1_idx` (`producto_id_producto` ASC),
  CONSTRAINT `fk_bodega_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `inventario`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `inventario`.`cliente` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nit_cliente` VARCHAR(10) NULL DEFAULT NULL,
  `nombre_cliente` VARCHAR(45) NOT NULL,
  `apellido_cliente` VARCHAR(45) NOT NULL,
  `direccion_cliente` VARCHAR(45) NOT NULL,
  `telefono_cliente` VARCHAR(8) NOT NULL,
  `venta_codigo` INT(11) NOT NULL,
  `venta_id_cliente` DECIMAL(8,0) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_venta1_idx` (`venta_codigo` ASC, `venta_id_cliente` ASC),
  CONSTRAINT `fk_cliente_venta1`
    FOREIGN KEY (`venta_codigo` , `venta_id_cliente`)
    REFERENCES `inventario`.`venta` (`codigo` , `id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `inventario`.`venta` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `correlativo` VARCHAR(5) NOT NULL,
  `id_producto` INT(11) NOT NULL,
  `id_bodega` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `precio_venta` DECIMAL(8,0) NOT NULL,
  `precio_compra` DECIMAL(8,0) NOT NULL,
  `id_cliente` DECIMAL(8,0) NOT NULL,
  `descuento` DECIMAL(8,0) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `id_usuario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`, `id_cliente`),
  INDEX `rel3` (`id_bodega` ASC),
  INDEX `rel2` (`id_producto` ASC),
  CONSTRAINT `rel2`
    FOREIGN KEY (`id_producto`)
    REFERENCES `inventario`.`producto` (`id_producto`)
    ON UPDATE CASCADE,
  CONSTRAINT `rel3`
    FOREIGN KEY (`id_bodega`)
    REFERENCES `inventario`.`bodega` (`codigo`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `inventario`.`producto` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` VARCHAR(45) NULL DEFAULT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `precio_venta` DECIMAL(8,0) NOT NULL,
  `precio_compra` DECIMAL(8,0) NOT NULL,
  `id_proveedor` INT(11) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT 0,
  `id_bodega` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `inventario`.`proveedor` (
  `nit` INT(11) NOT NULL,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `direccion_proveedor` VARCHAR(45) NOT NULL,
  `telefono_proveedor` VARCHAR(45) NOT NULL,
  `producto_id_producto` INT(11) NOT NULL,
  PRIMARY KEY (`nit`),
  INDEX `fk_proveedor_producto1_idx` (`producto_id_producto` ASC),
  CONSTRAINT `fk_proveedor_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `inventario`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `inventario`.`user` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `venta_codigo` INT(11) NOT NULL,
  `venta_id_cliente` DECIMAL(8,0) NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_user_venta1_idx` (`venta_codigo` ASC, `venta_id_cliente` ASC),
  CONSTRAINT `fk_user_venta1`
    FOREIGN KEY (`venta_codigo` , `venta_id_cliente`)
    REFERENCES `inventario`.`venta` (`codigo` , `id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

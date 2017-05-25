CREATE DATABASE  IF NOT EXISTS `inventario` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inventario`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: DBproyecto
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BODEGA`
--

DROP TABLE IF EXISTS `BODEGA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BODEGA` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion_bodega` varchar(45) NOT NULL,
  `telefono_bodega` varchar(8) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BODEGA`
--

LOCK TABLES `BODEGA` WRITE;
/*!40000 ALTER TABLE `BODEGA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BODEGA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BODEGA_PRODUCTO`
--

DROP TABLE IF EXISTS `BODEGA_PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BODEGA_PRODUCTO` (
  `codigo_bodega` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad_productos` int(11) NOT NULL,
  PRIMARY KEY (`codigo_bodega`,`codigo_producto`),
  KEY `relbod-producto` (`codigo_producto`),
  CONSTRAINT `rel1` FOREIGN KEY (`codigo_bodega`) REFERENCES `BODEGA` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `relbod-producto` FOREIGN KEY (`codigo_producto`) REFERENCES `PRODUCTO` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BODEGA_PRODUCTO`
--

LOCK TABLES `BODEGA_PRODUCTO` WRITE;
/*!40000 ALTER TABLE `BODEGA_PRODUCTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `BODEGA_PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTE` (
  `nit_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `apellido_cliente` varchar(45) NOT NULL,
  `direccion_cliente` varchar(45) NOT NULL,
  `telefono_cliente` varchar(8) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`nit_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DETALLE_COMPRA`
--

DROP TABLE IF EXISTS `DETALLE_COMPRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DETALLE_COMPRA` (
  `codigo` int(11) NOT NULL,
  `codigo_encabezado_compra` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `codigo_bodega` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_unitario` decimal(8,0) NOT NULL,
  `iva` decimal(8,0) NOT NULL,
  `valor_total_bruto` decimal(8,0) NOT NULL,
  `descuento` decimal(8,0) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `reldetcompra-enccompra` (`codigo_encabezado_compra`),
  KEY `reldet1` (`codigo_bodega`),
  KEY `reldet2` (`codigo_producto`),
  CONSTRAINT `reldet1` FOREIGN KEY (`codigo_bodega`) REFERENCES `BODEGA` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `reldet2` FOREIGN KEY (`codigo_producto`) REFERENCES `PRODUCTO` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `reldetcompra-enccompra` FOREIGN KEY (`codigo_encabezado_compra`) REFERENCES `ENCABEZADO_COMPRA` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETALLE_COMPRA`
--

LOCK TABLES `DETALLE_COMPRA` WRITE;
/*!40000 ALTER TABLE `DETALLE_COMPRA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DETALLE_COMPRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DETALLE_FACTURA`
--

DROP TABLE IF EXISTS `DETALLE_FACTURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DETALLE_FACTURA` (
  `codigo` int(11) NOT NULL,
  `codigo_encabezado_factura` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `codigo_bodega` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_unitario` decimal(8,0) NOT NULL,
  `iva` decimal(8,0) NOT NULL,
  `valor_tot_bruto` decimal(8,0) NOT NULL,
  `descuento` decimal(8,0) NOT NULL,
  `valor_neto` decimal(8,0) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `relencafactura-reldetfactura` (`codigo_encabezado_factura`),
  KEY `rel3` (`codigo_bodega`),
  KEY `rel2` (`codigo_producto`),
  CONSTRAINT `rel2` FOREIGN KEY (`codigo_producto`) REFERENCES `PRODUCTO` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `rel3` FOREIGN KEY (`codigo_bodega`) REFERENCES `BODEGA` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `relencafactura-reldetfactura` FOREIGN KEY (`codigo_encabezado_factura`) REFERENCES `ENCABEZADO_FACTURA` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETALLE_FACTURA`
--

LOCK TABLES `DETALLE_FACTURA` WRITE;
/*!40000 ALTER TABLE `DETALLE_FACTURA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DETALLE_FACTURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENCABEZADO_COMPRA`
--

DROP TABLE IF EXISTS `ENCABEZADO_COMPRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCABEZADO_COMPRA` (
  `codigo` int(11) NOT NULL,
  `nit_proveedor` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `relcompra-proveedor` (`nit_proveedor`),
  CONSTRAINT `relcompra-proveedor` FOREIGN KEY (`nit_proveedor`) REFERENCES `PROVEEDOR` (`nit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENCABEZADO_COMPRA`
--

LOCK TABLES `ENCABEZADO_COMPRA` WRITE;
/*!40000 ALTER TABLE `ENCABEZADO_COMPRA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENCABEZADO_COMPRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENCABEZADO_FACTURA`
--

DROP TABLE IF EXISTS `ENCABEZADO_FACTURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCABEZADO_FACTURA` (
  `codigo` int(11) NOT NULL,
  `nit_cliente` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `rel-cliente-factura` (`nit_cliente`),
  CONSTRAINT `rel-cliente-factura` FOREIGN KEY (`nit_cliente`) REFERENCES `CLIENTE` (`nit_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENCABEZADO_FACTURA`
--

LOCK TABLES `ENCABEZADO_FACTURA` WRITE;
/*!40000 ALTER TABLE `ENCABEZADO_FACTURA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENCABEZADO_FACTURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `codigo` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `precio_venta` decimal(8,0) NOT NULL,
  `ult_precio_compra` decimal(8,0) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVEEDOR`
--

DROP TABLE IF EXISTS `PROVEEDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVEEDOR` (
  `nit` int(11) NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `direccion_proveedor` varchar(45) NOT NULL,
  `telefono_proveedor` varchar(45) NOT NULL,
  PRIMARY KEY (`nit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVEEDOR`
--

LOCK TABLES `PROVEEDOR` WRITE;
/*!40000 ALTER TABLE `PROVEEDOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROVEEDOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRASLADO`
--

DROP TABLE IF EXISTS `TRASLADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRASLADO` (
  `codigo` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `bodega_entra` int(11) NOT NULL,
  `bodega_sale` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `reltraslado-producto` (`codigo_producto`),
  KEY `relbodega-entra` (`bodega_entra`),
  KEY `relbodega-sale` (`bodega_sale`),
  CONSTRAINT `relbodega-entra` FOREIGN KEY (`bodega_entra`) REFERENCES `BODEGA` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `relbodega-sale` FOREIGN KEY (`bodega_sale`) REFERENCES `BODEGA` (`codigo`),
  CONSTRAINT `reltraslado-producto` FOREIGN KEY (`codigo_producto`) REFERENCES `PRODUCTO` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRASLADO`
--

LOCK TABLES `TRASLADO` WRITE;
/*!40000 ALTER TABLE `TRASLADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRASLADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'DBproyecto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-24  0:01:06

-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: empresas
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `genero` int DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(25) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Wualter','Hernandez','292987865',NULL,'87878738','usuario12@hotmail.com','2020-02-01'),(2,'Pedro','Lopez','298787878',1,'34432323','usuario12@hotmail.com','2020-02-01'),(3,'Juana','perez','343432333',NULL,'34545445','usuario12@hotmail.com','2020-02-01'),(4,'Lulu','sosa','343423233',NULL,'54654534','usuario12@hotmail.com','2020-02-01'),(5,'maria','pepe','876473838',NULL,'45456756','usuario12@hotmail.com','2020-02-01'),(6,'juan','lola','474673676',NULL,'34768767','usuario12@hotmail.com','2020-02-01'),(8,'Wualter','Hernandez','5464564',1,'87878738','usuario12@hotmail.com','2023-10-26'),(9,'Pedro','Lopez','3243242',1,'34432323','usuario12@hotmail.com','2023-10-28');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idcompras` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int DEFAULT NULL,
  `idproveedor` int DEFAULT NULL,
  `fecha_order` date DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idcompras`),
  KEY `proveedor_idx` (`idproveedor`),
  CONSTRAINT `proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,101,1,'2020-03-01','2021-01-05 12:12:12'),(2,102,2,'2020-03-01','2021-01-05 12:12:12'),(3,103,3,'2020-03-01','2021-01-05 12:12:12'),(4,104,4,'2020-03-01','2021-01-05 12:12:12'),(5,105,5,'2020-03-01','2021-01-05 12:12:12');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `idcompras_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idcompras` int DEFAULT NULL,
  `idproductos` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_costo_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idcompras_detalle`),
  KEY `compras_idx` (`idcompras`),
  KEY `productos_idx` (`idproductos`),
  CONSTRAINT `compras` FOREIGN KEY (`idcompras`) REFERENCES `compras` (`idcompras`),
  CONSTRAINT `idproductos` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,1,1,6,25.00),(2,2,2,7,25.00),(3,3,3,7,25.00),(4,4,4,7,25.00),(5,5,5,7,25.00);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `DPI` varchar(15) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `idpuesto` smallint DEFAULT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `puestos_idx` (`idpuesto`),
  CONSTRAINT `id_puesto` FOREIGN KEY (`idpuesto`) REFERENCES `puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Wualter','lopez','Guatemal','27878787','5894949494343',NULL,'1999-01-01',1,'2020-01-01','2021-01-01 12:12:12'),(2,'Pedro','sandoval','san marcos','27878787','5894949494343',NULL,'1999-01-01',2,'2020-01-01','2021-01-01 12:12:01'),(3,'Juan','perez','Guatemala','27878787','5894949494343',NULL,'1999-01-01',3,'2020-01-01','2021-01-01 12:12:01'),(4,'Maria','xujul','Guatemala','27878787','5894949494343',NULL,'1999-01-01',4,'2020-01-01','2021-01-01 12:12:01'),(5,'Mora','silvestre','Guatemala','27878787','5894949494343',NULL,'1999-01-01',5,'2020-01-01','2021-01-01 12:12:01');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idmarcas` smallint NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmarcas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'LOLA'),(2,'LULU'),(3,'PEPE'),(4,'PAPE'),(5,'LITO');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `idmarca` smallint DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(30) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `marcas_idx` (`idmarca`),
  CONSTRAINT `marcas` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarcas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'cinchos',1,'unidad',NULL,10.00,20.00,5,'2020-02-02 10:10:10'),(2,'pantalones',2,'unidad',NULL,10.00,20.00,5,'2020-02-02 12:12:12'),(3,'zapatos',3,'pares',NULL,10.00,20.00,5,'2020-02-02 10:10:10'),(4,'CAMISA',4,'unidad',NULL,10.00,20.00,5,'2020-02-02 10:10:10'),(5,'tenis',5,'unidad',NULL,10.00,20.00,5,'2020-02-02 10:10:10');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedores` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'celasa','203020121','Guatemala','29093898'),(2,'comex','378987654','san marcos','37878389'),(3,'cerse','378989893','Guatemala','56748345'),(4,'laurel','309876543','izabal','34323232}'),(5,'maxi','376552333','Guatemal','98765456');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'GERENTE'),(2,'PROGRAMADOR'),(3,'SUPERVISOR'),(4,'VENTAS'),(5,'ANALISTA'),(6,'vendedor');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_detalle` (
  `idventa_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idventa` int DEFAULT NULL,
  `idproducto` int DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idventa_detalle`),
  KEY `venta_idx` (`idventa`),
  KEY `productos_idx` (`idproducto`),
  CONSTRAINT `productos` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`),
  CONSTRAINT `venta` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
INSERT INTO `venta_detalle` VALUES (1,1,1,'10',25.00),(2,2,2,'10',25.00),(3,3,3,'10',30.00),(4,4,4,'10',25.00),(5,5,5,'10',30.00);
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventas` int NOT NULL AUTO_INCREMENT,
  `nofactura` int DEFAULT NULL,
  `serie` varchar(1) DEFAULT NULL,
  `fechafactura` date DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `idempleado` int DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idventas`),
  KEY `clientes_idx` (`idcliente`),
  KEY `empleados_idx` (`idempleado`),
  CONSTRAINT `clientes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  CONSTRAINT `empleados` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,101,'A','2020-02-02',1,1,'2022-01-01 10:10:10'),(2,102,'B','2021-02-02',2,2,'2022-01-01 10:10:10'),(3,103,'C','2021-02-02',3,3,'2022-01-01 10:10:10'),(4,104,'D','2021-02-02',4,4,'2022-01-01 10:10:10'),(5,105,'E','2021-02-02',5,5,'2022-01-01 10:10:10');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 15:53:20

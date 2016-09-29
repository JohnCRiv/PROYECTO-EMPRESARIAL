CREATE DATABASE  IF NOT EXISTS `panderonico` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `panderonico`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: panderonico
-- ------------------------------------------------------
-- Server version	5.5.9

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
-- Table structure for table `cdp`
--

DROP TABLE IF EXISTS `cdp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp` (
  `idCPD` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idObligacion` int(11) DEFAULT NULL,
  `fechaCDP` date NOT NULL,
  `montoCDP` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idCPD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp`
--

LOCK TABLES `cdp` WRITE;
/*!40000 ALTER TABLE `cdp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdp` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger cdp_insert before insert on `panderonico`.`cdp`
for each row 
begin
  set @auto_id := ( SELECT AUTO_INCREMENT 
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE TABLE_NAME='cdp' AND TABLE_SCHEMA=DATABASE() );	
  set new.codigo = concat( 'CP2016-', LPAD( @auto_id, 6, 0 ) );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `idSocio` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `referencia` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idUbigeo` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccionmodificacion`
--

DROP TABLE IF EXISTS `direccionmodificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccionmodificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsolicitud` int(11) NOT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8 NOT NULL,
  `referencia` varchar(45) CHARACTER SET utf8 NOT NULL,
  `idUbigeo` int(11) NOT NULL,
  `estado` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccionmodificacion`
--

LOCK TABLES `direccionmodificacion` WRITE;
/*!40000 ALTER TABLE `direccionmodificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccionmodificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enlace`
--

DROP TABLE IF EXISTS `enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enlace` (
  `idEnlace` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `ruta` varchar(45) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEnlace`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enlace`
--

LOCK TABLES `enlace` WRITE;
/*!40000 ALTER TABLE `enlace` DISABLE KEYS */;
INSERT INTO `enlace` VALUES (1,'Usuarios','listarUsuario','md-account-circle'),(2,'Establecimientos','listarEstablecimiento','md-home'),(3,'Socios','listarSocio','md-person'),(4,'Grupos','listarGrupo','md-group'),(5,'Obligaciones','listarObligacion','md-event'),(6,'Pagos','listarPago','md-attach-money'),(7,'Solic. Modif. Socio','listarSolicitudes','md-person'),(8,'Reportes','listarReportes','md-report');
/*!40000 ALTER TABLE `enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimiento`
--

DROP TABLE IF EXISTS `establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimiento` (
  `idEstablecimiento` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idUbigeo` int(11) NOT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `referencia` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `encargado` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `foto` longblob,
  `fechaRegistro` datetime NOT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idEstablecimiento`),
  KEY `idUbigeo_idx` (`idUbigeo`),
  CONSTRAINT `idUbigeo` FOREIGN KEY (`idUbigeo`) REFERENCES `ubigeo` (`idUbigeo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimiento`
--

LOCK TABLES `establecimiento` WRITE;
/*!40000 ALTER TABLE `establecimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `establecimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger establecimiento_insert before insert on `panderonico`.`Establecimiento`
for each row 
begin
  set @auto_id := ( SELECT AUTO_INCREMENT 
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE TABLE_NAME='establecimiento' AND TABLE_SCHEMA=DATABASE() );	
  set new.codigo = concat( 'EST-', LPAD( @auto_id, 4, 0 ) );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `familiar`
--

DROP TABLE IF EXISTS `familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familiar` (
  `idFamiliar` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idSocio` int(11) NOT NULL,
  PRIMARY KEY (`idFamiliar`),
  KEY `idSocio_idx` (`idSocio`),
  CONSTRAINT `idSocio` FOREIGN KEY (`idSocio`) REFERENCES `socio` (`idSocio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiar`
--

LOCK TABLES `familiar` WRITE;
/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiarmodificacion`
--

DROP TABLE IF EXISTS `familiarmodificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familiarmodificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsolicitud` int(11) DEFAULT NULL,
  `tipo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `nombres` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apellidos` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiarmodificacion`
--

LOCK TABLES `familiarmodificacion` WRITE;
/*!40000 ALTER TABLE `familiarmodificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiarmodificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcionGrupo` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoGrupo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger grupo_insert before insert on `panderonico`.`grupo`
for each row 
begin
  set @auto_id := ( SELECT AUTO_INCREMENT 
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE TABLE_NAME='grupo' AND TABLE_SCHEMA=DATABASE() );	
  set new.codigo = concat( 'GRUP-', LPAD( @auto_id, 4, 0 ) );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupodetalle`
--

DROP TABLE IF EXISTS `grupodetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupodetalle` (
  `idGrupoDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idSocio` int(11) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `fechaInscripcion` datetime NOT NULL,
  PRIMARY KEY (`idGrupoDetalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupodetalle`
--

LOCK TABLES `grupodetalle` WRITE;
/*!40000 ALTER TABLE `grupodetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupodetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obligacion`
--

DROP TABLE IF EXISTS `obligacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obligacion` (
  `idObligacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idGrupoDetalle` int(11) DEFAULT NULL,
  `tipoObligacion` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `motivoPago` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `estadoObligacion` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idObligacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obligacion`
--

LOCK TABLES `obligacion` WRITE;
/*!40000 ALTER TABLE `obligacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `obligacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger obligacion_insert before insert on `panderonico`.`obligacion`
for each row 
begin
  set @auto_id := ( SELECT AUTO_INCREMENT 
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE TABLE_NAME='obligacion' AND TABLE_SCHEMA=DATABASE() );	
  set new.codigo = concat( 'OB2016-', LPAD( @auto_id, 6, 0 ) );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Recepcionista'),(3,'Cajero');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_enlace`
--

DROP TABLE IF EXISTS `rol_enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_enlace` (
  `idRol` int(11) NOT NULL,
  `idEnlace` int(11) NOT NULL,
  PRIMARY KEY (`idRol`,`idEnlace`),
  KEY `fk_enlace_idx` (`idEnlace`),
  CONSTRAINT `fk_enlace` FOREIGN KEY (`idEnlace`) REFERENCES `enlace` (`idEnlace`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_enlace`
--

LOCK TABLES `rol_enlace` WRITE;
/*!40000 ALTER TABLE `rol_enlace` DISABLE KEYS */;
INSERT INTO `rol_enlace` VALUES (1,1),(1,2),(1,3),(2,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6),(1,7),(1,8);
/*!40000 ALTER TABLE `rol_enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socio` (
  `idSocio` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipoDocumento` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `numeroDocumento` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `genero` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idEstablecimiento` int(11) DEFAULT NULL,
  `fotoDigital` mediumtext COLLATE utf8_unicode_ci,
  `firmaDigital` mediumtext COLLATE utf8_unicode_ci,
  `huella` longblob,
  `estadoSocio` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contrasena` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger socio_insert before insert on `panderonico`.`socio`
for each row 
begin
  set @auto_id := ( SELECT AUTO_INCREMENT 
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE TABLE_NAME='socio' AND TABLE_SCHEMA=DATABASE() );	
  set new.codigo = concat( 'SOC-', LPAD( @auto_id, 4, 0 ) );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `solicitudmodificacion`
--

DROP TABLE IF EXISTS `solicitudmodificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudmodificacion` (
  `idsolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `idSocio` int(11) NOT NULL,
  `motivo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idsolicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudmodificacion`
--

LOCK TABLES `solicitudmodificacion` WRITE;
/*!40000 ALTER TABLE `solicitudmodificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudmodificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `idTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `idSocio` int(11) NOT NULL,
  `tipo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `numeroTelefonico` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idTelefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonomodificacion`
--

DROP TABLE IF EXISTS `telefonomodificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonomodificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsolicitud` int(11) NOT NULL,
  `tipo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `numeroTelefonico` varchar(45) CHARACTER SET utf8 NOT NULL,
  `estado` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonomodificacion`
--

LOCK TABLES `telefonomodificacion` WRITE;
/*!40000 ALTER TABLE `telefonomodificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonomodificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'DNI'),(2,'Carné de Extranjería'),(3,'Pasaporte');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubigeo`
--

DROP TABLE IF EXISTS `ubigeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubigeo` (
  `idUbigeo` int(11) NOT NULL AUTO_INCREMENT,
  `codDepartamento` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `codProvincia` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `codDistrito` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `departamento` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `provincia` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `distrito` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idUbigeo`)
) ENGINE=InnoDB AUTO_INCREMENT=1834 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubigeo`
--

LOCK TABLES `ubigeo` WRITE;
/*!40000 ALTER TABLE `ubigeo` DISABLE KEYS */;
INSERT INTO `ubigeo` VALUES (1,'01','01','01','AMAZONAS','CHACHAPOYAS','CHACHAPOYAS'),(2,'01','01','02','AMAZONAS','CHACHAPOYAS','ASUNCION'),(3,'01','01','03','AMAZONAS','CHACHAPOYAS','BALSAS'),(4,'01','01','04','AMAZONAS','CHACHAPOYAS','CHETO'),(5,'01','01','05','AMAZONAS','CHACHAPOYAS','CHILIQUIN'),(6,'01','01','06','AMAZONAS','CHACHAPOYAS','CHUQUIBAMBA'),(7,'01','01','07','AMAZONAS','CHACHAPOYAS','GRANADA'),(8,'01','01','08','AMAZONAS','CHACHAPOYAS','HUANCAS'),(9,'01','01','09','AMAZONAS','CHACHAPOYAS','LA JALCA'),(10,'01','01','10','AMAZONAS','CHACHAPOYAS','LEIMEBAMBA'),(11,'01','01','11','AMAZONAS','CHACHAPOYAS','LEVANTO'),(12,'01','01','12','AMAZONAS','CHACHAPOYAS','MAGDALENA'),(13,'01','01','13','AMAZONAS','CHACHAPOYAS','MARISCAL CASTILLA'),(14,'01','01','14','AMAZONAS','CHACHAPOYAS','MOLINOPAMPA'),(15,'01','01','15','AMAZONAS','CHACHAPOYAS','MONTEVIDEO'),(16,'01','01','16','AMAZONAS','CHACHAPOYAS','OLLEROS'),(17,'01','01','17','AMAZONAS','CHACHAPOYAS','QUINJALCA'),(18,'01','01','18','AMAZONAS','CHACHAPOYAS','SAN FRANCISCO DE DAGUAS'),(19,'01','01','19','AMAZONAS','CHACHAPOYAS','SAN ISIDRO DE MAINO'),(20,'01','01','20','AMAZONAS','CHACHAPOYAS','SOLOCO'),(21,'01','01','21','AMAZONAS','CHACHAPOYAS','SONCHE'),(22,'01','02','01','AMAZONAS','BAGUA','LA PECA'),(23,'01','02','02','AMAZONAS','BAGUA','ARAMANGO'),(24,'01','02','03','AMAZONAS','BAGUA','COPALLIN'),(25,'01','02','04','AMAZONAS','BAGUA','EL PARCO'),(26,'01','02','05','AMAZONAS','BAGUA','IMAZA'),(27,'01','02','06','AMAZONAS','BAGUA','BAGUA'),(28,'01','03','01','AMAZONAS','BONGARA','JUMBILLA'),(29,'01','03','02','AMAZONAS','BONGARA','CHISQUILLA'),(30,'01','03','03','AMAZONAS','BONGARA','CHURUJA'),(31,'01','03','04','AMAZONAS','BONGARA','COROSHA'),(32,'01','03','05','AMAZONAS','BONGARA','CUISPES'),(33,'01','03','06','AMAZONAS','BONGARA','FLORIDA'),(34,'01','03','07','AMAZONAS','BONGARA','JAZAN'),(35,'01','03','08','AMAZONAS','BONGARA','RECTA'),(36,'01','03','09','AMAZONAS','BONGARA','SAN CARLOS'),(37,'01','03','10','AMAZONAS','BONGARA','SHIPASBAMBA'),(38,'01','03','11','AMAZONAS','BONGARA','VALERA'),(39,'01','03','12','AMAZONAS','BONGARA','YAMBRASBAMBA'),(40,'01','04','01','AMAZONAS','CONDORCANQUI','NIEVA'),(41,'01','04','02','AMAZONAS','CONDORCANQUI','EL CENEPA'),(42,'01','04','03','AMAZONAS','CONDORCANQUI','RIO SANTIAGO'),(43,'01','05','01','AMAZONAS','LUYA','LAMUD'),(44,'01','05','02','AMAZONAS','LUYA','CAMPORREDONDO'),(45,'01','05','03','AMAZONAS','LUYA','COCABAMBA'),(46,'01','05','04','AMAZONAS','LUYA','COLCAMAR'),(47,'01','05','05','AMAZONAS','LUYA','CONILA'),(48,'01','05','06','AMAZONAS','LUYA','INGUILPATA'),(49,'01','05','07','AMAZONAS','LUYA','LONGUITA'),(50,'01','05','08','AMAZONAS','LUYA','LONYA CHICO'),(51,'01','05','09','AMAZONAS','LUYA','LUYA'),(52,'01','05','10','AMAZONAS','LUYA','LUYA VIEJO'),(53,'01','05','11','AMAZONAS','LUYA','MARIA'),(54,'01','05','12','AMAZONAS','LUYA','OCALLI'),(55,'01','05','13','AMAZONAS','LUYA','OCUMAL'),(56,'01','05','14','AMAZONAS','LUYA','PISUQUIA'),(57,'01','05','15','AMAZONAS','LUYA','PROVIDENCIA'),(58,'01','05','16','AMAZONAS','LUYA','SAN CRISTOBAL'),(59,'01','05','17','AMAZONAS','LUYA','SAN FRANCISCO DEL YESO'),(60,'01','05','18','AMAZONAS','LUYA','SAN JERONIMO'),(61,'01','05','19','AMAZONAS','LUYA','SAN JUAN DE LOPECANCHA'),(62,'01','05','20','AMAZONAS','LUYA','SANTA CATALINA'),(63,'01','05','21','AMAZONAS','LUYA','SANTO TOMAS'),(64,'01','05','22','AMAZONAS','LUYA','TINGO'),(65,'01','05','23','AMAZONAS','LUYA','TRITA'),(66,'01','06','01','AMAZONAS','RODRIGUEZ DE MENDOZA','SAN NICOLAS'),(67,'01','06','02','AMAZONAS','RODRIGUEZ DE MENDOZA','CHIRIMOTO'),(68,'01','06','03','AMAZONAS','RODRIGUEZ DE MENDOZA','COCHAMAL'),(69,'01','06','04','AMAZONAS','RODRIGUEZ DE MENDOZA','HUAMBO'),(70,'01','06','05','AMAZONAS','RODRIGUEZ DE MENDOZA','LIMABAMBA'),(71,'01','06','06','AMAZONAS','RODRIGUEZ DE MENDOZA','LONGAR'),(72,'01','06','07','AMAZONAS','RODRIGUEZ DE MENDOZA','MARISCAL BENAVIDES'),(73,'01','06','08','AMAZONAS','RODRIGUEZ DE MENDOZA','MILPUC'),(74,'01','06','09','AMAZONAS','RODRIGUEZ DE MENDOZA','OMIA'),(75,'01','06','10','AMAZONAS','RODRIGUEZ DE MENDOZA','SANTA ROSA'),(76,'01','06','11','AMAZONAS','RODRIGUEZ DE MENDOZA','TOTORA'),(77,'01','06','12','AMAZONAS','RODRIGUEZ DE MENDOZA','VISTA ALEGRE'),(78,'01','07','01','AMAZONAS','UTCUBAMBA','BAGUA GRANDE'),(79,'01','07','02','AMAZONAS','UTCUBAMBA','CAJARURO'),(80,'01','07','03','AMAZONAS','UTCUBAMBA','CUMBA'),(81,'01','07','04','AMAZONAS','UTCUBAMBA','EL MILAGRO'),(82,'01','07','05','AMAZONAS','UTCUBAMBA','JAMALCA'),(83,'01','07','06','AMAZONAS','UTCUBAMBA','LONYA GRANDE'),(84,'01','07','07','AMAZONAS','UTCUBAMBA','YAMON'),(85,'02','01','01','ANCASH','HUARAZ','HUARAZ'),(86,'02','01','02','ANCASH','HUARAZ','COCHABAMBA'),(87,'02','01','03','ANCASH','HUARAZ','COLCABAMBA'),(88,'02','01','04','ANCASH','HUARAZ','HUANCHAY'),(89,'02','01','05','ANCASH','HUARAZ','INDEPENDENCIA'),(90,'02','01','06','ANCASH','HUARAZ','JANGAS'),(91,'02','01','07','ANCASH','HUARAZ','LA LIBERTAD'),(92,'02','01','08','ANCASH','HUARAZ','OLLEROS'),(93,'02','01','09','ANCASH','HUARAZ','PAMPAS'),(94,'02','01','10','ANCASH','HUARAZ','PARIACOTO'),(95,'02','01','11','ANCASH','HUARAZ','PIRA'),(96,'02','01','12','ANCASH','HUARAZ','TARICA'),(97,'02','02','01','ANCASH','AIJA','AIJA'),(98,'02','02','02','ANCASH','AIJA','CORIS'),(99,'02','02','03','ANCASH','AIJA','HUACLLAN'),(100,'02','02','04','ANCASH','AIJA','LA MERCED'),(101,'02','02','05','ANCASH','AIJA','SUCCHA'),(102,'02','03','01','ANCASH','ANTONIO RAYMONDI','LLAMELLIN'),(103,'02','03','02','ANCASH','ANTONIO RAYMONDI','ACZO'),(104,'02','03','03','ANCASH','ANTONIO RAYMONDI','CHACCHO'),(105,'02','03','04','ANCASH','ANTONIO RAYMONDI','CHINGAS'),(106,'02','03','05','ANCASH','ANTONIO RAYMONDI','MIRGAS'),(107,'02','03','06','ANCASH','ANTONIO RAYMONDI','SAN JUAN DE RONTOY'),(108,'02','04','01','ANCASH','ASUNCION','CHACAS'),(109,'02','04','02','ANCASH','ASUNCION','ACOCHACA'),(110,'02','05','01','ANCASH','BOLOGNESI','CHIQUIAN'),(111,'02','05','02','ANCASH','BOLOGNESI','ABELARDO PARDO LEZAMETA'),(112,'02','05','03','ANCASH','BOLOGNESI','ANTONIO RAYMONDI'),(113,'02','05','04','ANCASH','BOLOGNESI','AQUIA'),(114,'02','05','05','ANCASH','BOLOGNESI','CAJACAY'),(115,'02','05','06','ANCASH','BOLOGNESI','CANIS'),(116,'02','05','07','ANCASH','BOLOGNESI','COLQUIOC'),(117,'02','05','08','ANCASH','BOLOGNESI','HUALLANCA'),(118,'02','05','09','ANCASH','BOLOGNESI','HUASTA'),(119,'02','05','10','ANCASH','BOLOGNESI','HUAYLLACAYAN'),(120,'02','05','11','ANCASH','BOLOGNESI','LA PRIMAVERA'),(121,'02','05','12','ANCASH','BOLOGNESI','MANGAS'),(122,'02','05','13','ANCASH','BOLOGNESI','PACLLON'),(123,'02','05','14','ANCASH','BOLOGNESI','SAN MIGUEL DE CORPANQUI'),(124,'02','05','15','ANCASH','BOLOGNESI','TICLLOS'),(125,'02','06','01','ANCASH','CARHUAZ','CARHUAZ'),(126,'02','06','02','ANCASH','CARHUAZ','ACOPAMPA'),(127,'02','06','03','ANCASH','CARHUAZ','AMASHCA'),(128,'02','06','04','ANCASH','CARHUAZ','ANTA'),(129,'02','06','05','ANCASH','CARHUAZ','ATAQUERO'),(130,'02','06','06','ANCASH','CARHUAZ','MARCARA'),(131,'02','06','07','ANCASH','CARHUAZ','PARIAHUANCA'),(132,'02','06','08','ANCASH','CARHUAZ','SAN MIGUEL DE ACO'),(133,'02','06','09','ANCASH','CARHUAZ','SHILLA'),(134,'02','06','10','ANCASH','CARHUAZ','TINCO'),(135,'02','06','11','ANCASH','CARHUAZ','YUNGAR'),(136,'02','07','01','ANCASH','CARLOS FERMIN FITZCARRALD','SAN LUIS'),(137,'02','07','02','ANCASH','CARLOS FERMIN FITZCARRALD','SAN NICOLAS'),(138,'02','07','03','ANCASH','CARLOS FERMIN FITZCARRALD','YAUYA'),(139,'02','08','01','ANCASH','CASMA','CASMA'),(140,'02','08','02','ANCASH','CASMA','BUENA VISTA ALTA'),(141,'02','08','03','ANCASH','CASMA','COMANDANTE NOEL'),(142,'02','08','04','ANCASH','CASMA','YAUTAN'),(143,'02','09','01','ANCASH','CORONGO','CORONGO'),(144,'02','09','02','ANCASH','CORONGO','ACO'),(145,'02','09','03','ANCASH','CORONGO','BAMBAS'),(146,'02','09','04','ANCASH','CORONGO','CUSCA'),(147,'02','09','05','ANCASH','CORONGO','LA PAMPA'),(148,'02','09','06','ANCASH','CORONGO','YANAC'),(149,'02','09','07','ANCASH','CORONGO','YUPAN'),(150,'02','10','01','ANCASH','HUARI','HUARI'),(151,'02','10','02','ANCASH','HUARI','ANRA'),(152,'02','10','03','ANCASH','HUARI','CAJAY'),(153,'02','10','04','ANCASH','HUARI','CHAVIN DE HUANTAR'),(154,'02','10','05','ANCASH','HUARI','HUACACHI'),(155,'02','10','06','ANCASH','HUARI','HUACCHIS'),(156,'02','10','07','ANCASH','HUARI','HUACHIS'),(157,'02','10','08','ANCASH','HUARI','HUANTAR'),(158,'02','10','09','ANCASH','HUARI','MASIN'),(159,'02','10','10','ANCASH','HUARI','PAUCAS'),(160,'02','10','11','ANCASH','HUARI','PONTO'),(161,'02','10','12','ANCASH','HUARI','RAHUAPAMPA'),(162,'02','10','13','ANCASH','HUARI','RAPAYAN'),(163,'02','10','14','ANCASH','HUARI','SAN MARCOS'),(164,'02','10','15','ANCASH','HUARI','SAN PEDRO DE CHANA'),(165,'02','10','16','ANCASH','HUARI','UCO'),(166,'02','11','01','ANCASH','HUARMEY','HUARMEY'),(167,'02','11','02','ANCASH','HUARMEY','COCHAPETI'),(168,'02','11','03','ANCASH','HUARMEY','CULEBRAS'),(169,'02','11','04','ANCASH','HUARMEY','HUAYAN'),(170,'02','11','05','ANCASH','HUARMEY','MALVAS'),(171,'02','12','01','ANCASH','HUAYLAS','CARAZ'),(172,'02','12','02','ANCASH','HUAYLAS','HUALLANCA'),(173,'02','12','03','ANCASH','HUAYLAS','HUATA'),(174,'02','12','04','ANCASH','HUAYLAS','HUAYLAS'),(175,'02','12','05','ANCASH','HUAYLAS','MATO'),(176,'02','12','06','ANCASH','HUAYLAS','PAMPAROMAS'),(177,'02','12','07','ANCASH','HUAYLAS','PUEBLO LIBRE'),(178,'02','12','08','ANCASH','HUAYLAS','SANTA CRUZ'),(179,'02','12','09','ANCASH','HUAYLAS','SANTO TORIBIO'),(180,'02','12','10','ANCASH','HUAYLAS','YURACMARCA'),(181,'02','13','01','ANCASH','MARISCAL LUZURIAGA','PISCOBAMBA'),(182,'02','13','02','ANCASH','MARISCAL LUZURIAGA','CASCA'),(183,'02','13','03','ANCASH','MARISCAL LUZURIAGA','ELEAZAR GUZMAN BARRON'),(184,'02','13','04','ANCASH','MARISCAL LUZURIAGA','FIDEL OLIVAS ESCUDERO'),(185,'02','13','05','ANCASH','MARISCAL LUZURIAGA','LLAMA'),(186,'02','13','06','ANCASH','MARISCAL LUZURIAGA','LLUMPA'),(187,'02','13','07','ANCASH','MARISCAL LUZURIAGA','LUCMA'),(188,'02','13','08','ANCASH','MARISCAL LUZURIAGA','MUSGA'),(189,'02','14','01','ANCASH','OCROS','OCROS'),(190,'02','14','02','ANCASH','OCROS','ACAS'),(191,'02','14','03','ANCASH','OCROS','CAJAMARQUILLA'),(192,'02','14','04','ANCASH','OCROS','CARHUAPAMPA'),(193,'02','14','05','ANCASH','OCROS','COCHAS'),(194,'02','14','06','ANCASH','OCROS','CONGAS'),(195,'02','14','07','ANCASH','OCROS','LLIPA'),(196,'02','14','08','ANCASH','OCROS','SAN CRISTOBAL DE RAJAN'),(197,'02','14','09','ANCASH','OCROS','SAN PEDRO'),(198,'02','14','10','ANCASH','OCROS','SANTIAGO DE CHILCAS'),(199,'02','15','01','ANCASH','PALLASCA','CABANA'),(200,'02','15','02','ANCASH','PALLASCA','BOLOGNESI'),(201,'02','15','03','ANCASH','PALLASCA','CONCHUCOS'),(202,'02','15','04','ANCASH','PALLASCA','HUACASCHUQUE'),(203,'02','15','05','ANCASH','PALLASCA','HUANDOVAL'),(204,'02','15','06','ANCASH','PALLASCA','LACABAMBA'),(205,'02','15','07','ANCASH','PALLASCA','LLAPO'),(206,'02','15','08','ANCASH','PALLASCA','PALLASCA'),(207,'02','15','09','ANCASH','PALLASCA','PAMPAS'),(208,'02','15','10','ANCASH','PALLASCA','SANTA ROSA'),(209,'02','15','11','ANCASH','PALLASCA','TAUCA'),(210,'02','16','01','ANCASH','POMABAMBA','POMABAMBA'),(211,'02','16','02','ANCASH','POMABAMBA','HUAYLLAN'),(212,'02','16','03','ANCASH','POMABAMBA','PAROBAMBA'),(213,'02','16','04','ANCASH','POMABAMBA','QUINUABAMBA'),(214,'02','17','01','ANCASH','RECUAY','RECUAY'),(215,'02','17','02','ANCASH','RECUAY','CATAC'),(216,'02','17','03','ANCASH','RECUAY','COTAPARACO'),(217,'02','17','04','ANCASH','RECUAY','HUAYLLAPAMPA'),(218,'02','17','05','ANCASH','RECUAY','LLACLLIN'),(219,'02','17','06','ANCASH','RECUAY','MARCA'),(220,'02','17','07','ANCASH','RECUAY','PAMPAS CHICO'),(221,'02','17','08','ANCASH','RECUAY','PARARIN'),(222,'02','17','09','ANCASH','RECUAY','TAPACOCHA'),(223,'02','17','10','ANCASH','RECUAY','TICAPAMPA'),(224,'02','18','01','ANCASH','SANTA','CHIMBOTE'),(225,'02','18','02','ANCASH','SANTA','CACERES DEL PERU'),(226,'02','18','03','ANCASH','SANTA','COISHCO'),(227,'02','18','04','ANCASH','SANTA','MACATE'),(228,'02','18','05','ANCASH','SANTA','MORO'),(229,'02','18','06','ANCASH','SANTA','NEPEÑA'),(230,'02','18','07','ANCASH','SANTA','SAMANCO'),(231,'02','18','08','ANCASH','SANTA','SANTA'),(232,'02','18','09','ANCASH','SANTA','NUEVO CHIMBOTE'),(233,'02','19','01','ANCASH','SIHUAS','SIHUAS'),(234,'02','19','02','ANCASH','SIHUAS','ACOBAMBA'),(235,'02','19','03','ANCASH','SIHUAS','ALFONSO UGARTE'),(236,'02','19','04','ANCASH','SIHUAS','CASHAPAMPA'),(237,'02','19','05','ANCASH','SIHUAS','CHINGALPO'),(238,'02','19','06','ANCASH','SIHUAS','HUAYLLABAMBA'),(239,'02','19','07','ANCASH','SIHUAS','QUICHES'),(240,'02','19','08','ANCASH','SIHUAS','RAGASH'),(241,'02','19','09','ANCASH','SIHUAS','SAN JUAN'),(242,'02','19','10','ANCASH','SIHUAS','SICSIBAMBA'),(243,'02','20','01','ANCASH','YUNGAY','YUNGAY'),(244,'02','20','02','ANCASH','YUNGAY','CASCAPARA'),(245,'02','20','03','ANCASH','YUNGAY','MANCOS'),(246,'02','20','04','ANCASH','YUNGAY','MATACOTO'),(247,'02','20','05','ANCASH','YUNGAY','QUILLO'),(248,'02','20','06','ANCASH','YUNGAY','RANRAHIRCA'),(249,'02','20','07','ANCASH','YUNGAY','SHUPLUY'),(250,'02','20','08','ANCASH','YUNGAY','YANAMA'),(251,'03','01','01','APURIMAC','ABANCAY','ABANCAY'),(252,'03','01','02','APURIMAC','ABANCAY','CHACOCHE'),(253,'03','01','03','APURIMAC','ABANCAY','CIRCA'),(254,'03','01','04','APURIMAC','ABANCAY','CURAHUASI'),(255,'03','01','05','APURIMAC','ABANCAY','HUANIPACA'),(256,'03','01','06','APURIMAC','ABANCAY','LAMBRAMA'),(257,'03','01','07','APURIMAC','ABANCAY','PICHIRHUA'),(258,'03','01','08','APURIMAC','ABANCAY','SAN PEDRO DE CACHORA'),(259,'03','01','09','APURIMAC','ABANCAY','TAMBURCO'),(260,'03','02','01','APURIMAC','ANDAHUAYLAS','ANDAHUAYLAS'),(261,'03','02','02','APURIMAC','ANDAHUAYLAS','ANDARAPA'),(262,'03','02','03','APURIMAC','ANDAHUAYLAS','CHIARA'),(263,'03','02','04','APURIMAC','ANDAHUAYLAS','HUANCARAMA'),(264,'03','02','05','APURIMAC','ANDAHUAYLAS','HUANCARAY'),(265,'03','02','06','APURIMAC','ANDAHUAYLAS','HUAYANA'),(266,'03','02','07','APURIMAC','ANDAHUAYLAS','KISHUARA'),(267,'03','02','08','APURIMAC','ANDAHUAYLAS','PACOBAMBA'),(268,'03','02','09','APURIMAC','ANDAHUAYLAS','PACUCHA'),(269,'03','02','10','APURIMAC','ANDAHUAYLAS','PAMPACHIRI'),(270,'03','02','11','APURIMAC','ANDAHUAYLAS','POMACOCHA'),(271,'03','02','12','APURIMAC','ANDAHUAYLAS','SAN ANTONIO DE CACHI'),(272,'03','02','13','APURIMAC','ANDAHUAYLAS','SAN JERONIMO'),(273,'03','02','14','APURIMAC','ANDAHUAYLAS','SAN MIGUEL DE CHACCRAMPA'),(274,'03','02','15','APURIMAC','ANDAHUAYLAS','SANTA MARIA DE CHICMO'),(275,'03','02','16','APURIMAC','ANDAHUAYLAS','TALAVERA'),(276,'03','02','17','APURIMAC','ANDAHUAYLAS','TUMAY HUARACA'),(277,'03','02','18','APURIMAC','ANDAHUAYLAS','TURPO'),(278,'03','02','19','APURIMAC','ANDAHUAYLAS','KAQUIABAMBA'),(279,'03','03','01','APURIMAC','ANTABAMBA','ANTABAMBA'),(280,'03','03','02','APURIMAC','ANTABAMBA','EL ORO'),(281,'03','03','03','APURIMAC','ANTABAMBA','HUAQUIRCA'),(282,'03','03','04','APURIMAC','ANTABAMBA','JUAN ESPINOZA MEDRANO'),(283,'03','03','05','APURIMAC','ANTABAMBA','OROPESA'),(284,'03','03','06','APURIMAC','ANTABAMBA','PACHACONAS'),(285,'03','03','07','APURIMAC','ANTABAMBA','SABAINO'),(286,'03','04','01','APURIMAC','AYMARAES','CHALHUANCA'),(287,'03','04','02','APURIMAC','AYMARAES','CAPAYA'),(288,'03','04','03','APURIMAC','AYMARAES','CARAYBAMBA'),(289,'03','04','04','APURIMAC','AYMARAES','CHAPIMARCA'),(290,'03','04','05','APURIMAC','AYMARAES','COLCABAMBA'),(291,'03','04','06','APURIMAC','AYMARAES','COTARUSE'),(292,'03','04','07','APURIMAC','AYMARAES','HUAYLLO'),(293,'03','04','08','APURIMAC','AYMARAES','JUSTO APU SAHUARAURA'),(294,'03','04','09','APURIMAC','AYMARAES','LUCRE'),(295,'03','04','10','APURIMAC','AYMARAES','POCOHUANCA'),(296,'03','04','11','APURIMAC','AYMARAES','SAN JUAN DE CHACÑA'),(297,'03','04','12','APURIMAC','AYMARAES','SAÑAYCA'),(298,'03','04','13','APURIMAC','AYMARAES','SORAYA'),(299,'03','04','14','APURIMAC','AYMARAES','TAPAIRIHUA'),(300,'03','04','15','APURIMAC','AYMARAES','TINTAY'),(301,'03','04','16','APURIMAC','AYMARAES','TORAYA'),(302,'03','04','17','APURIMAC','AYMARAES','YANACA'),(303,'03','05','01','APURIMAC','COTABAMBAS','TAMBOBAMBA'),(304,'03','05','02','APURIMAC','COTABAMBAS','COTABAMBAS'),(305,'03','05','03','APURIMAC','COTABAMBAS','COYLLURQUI'),(306,'03','05','04','APURIMAC','COTABAMBAS','HAQUIRA'),(307,'03','05','05','APURIMAC','COTABAMBAS','MARA'),(308,'03','05','06','APURIMAC','COTABAMBAS','CHALLHUAHUACHO'),(309,'03','06','01','APURIMAC','CHINCHEROS','CHINCHEROS'),(310,'03','06','02','APURIMAC','CHINCHEROS','ANCO_HUALLO'),(311,'03','06','03','APURIMAC','CHINCHEROS','COCHARCAS'),(312,'03','06','04','APURIMAC','CHINCHEROS','HUACCANA'),(313,'03','06','05','APURIMAC','CHINCHEROS','OCOBAMBA'),(314,'03','06','06','APURIMAC','CHINCHEROS','ONGOY'),(315,'03','06','07','APURIMAC','CHINCHEROS','URANMARCA'),(316,'03','06','08','APURIMAC','CHINCHEROS','RANRACANCHA'),(317,'03','07','01','APURIMAC','GRAU','CHUQUIBAMBILLA'),(318,'03','07','02','APURIMAC','GRAU','CURPAHUASI'),(319,'03','07','03','APURIMAC','GRAU','GAMARRA'),(320,'03','07','04','APURIMAC','GRAU','HUAYLLATI'),(321,'03','07','05','APURIMAC','GRAU','MAMARA'),(322,'03','07','06','APURIMAC','GRAU','MICAELA BASTIDAS'),(323,'03','07','07','APURIMAC','GRAU','PATAYPAMPA'),(324,'03','07','08','APURIMAC','GRAU','PROGRESO'),(325,'03','07','09','APURIMAC','GRAU','SAN ANTONIO'),(326,'03','07','10','APURIMAC','GRAU','SANTA ROSA'),(327,'03','07','11','APURIMAC','GRAU','TURPAY'),(328,'03','07','12','APURIMAC','GRAU','VILCABAMBA'),(329,'03','07','13','APURIMAC','GRAU','VIRUNDO'),(330,'03','07','14','APURIMAC','GRAU','CURASCO'),(331,'04','01','01','AREQUIPA','AREQUIPA','AREQUIPA'),(332,'04','01','02','AREQUIPA','AREQUIPA','ALTO SELVA ALEGRE'),(333,'04','01','03','AREQUIPA','AREQUIPA','CAYMA'),(334,'04','01','04','AREQUIPA','AREQUIPA','CERRO COLORADO'),(335,'04','01','05','AREQUIPA','AREQUIPA','CHARACATO'),(336,'04','01','06','AREQUIPA','AREQUIPA','CHIGUATA'),(337,'04','01','07','AREQUIPA','AREQUIPA','JACOBO HUNTER'),(338,'04','01','08','AREQUIPA','AREQUIPA','LA JOYA'),(339,'04','01','09','AREQUIPA','AREQUIPA','MARIANO MELGAR'),(340,'04','01','10','AREQUIPA','AREQUIPA','MIRAFLORES'),(341,'04','01','11','AREQUIPA','AREQUIPA','MOLLEBAYA'),(342,'04','01','12','AREQUIPA','AREQUIPA','PAUCARPATA'),(343,'04','01','13','AREQUIPA','AREQUIPA','POCSI'),(344,'04','01','14','AREQUIPA','AREQUIPA','POLOBAYA'),(345,'04','01','15','AREQUIPA','AREQUIPA','QUEQUEÑA'),(346,'04','01','16','AREQUIPA','AREQUIPA','SABANDIA'),(347,'04','01','17','AREQUIPA','AREQUIPA','SACHACA'),(348,'04','01','18','AREQUIPA','AREQUIPA','SAN JUAN DE SIGUAS'),(349,'04','01','19','AREQUIPA','AREQUIPA','SAN JUAN DE TARUCANI'),(350,'04','01','20','AREQUIPA','AREQUIPA','SANTA ISABEL DE SIGUAS'),(351,'04','01','21','AREQUIPA','AREQUIPA','SANTA RITA DE SIGUAS'),(352,'04','01','22','AREQUIPA','AREQUIPA','SOCABAYA'),(353,'04','01','23','AREQUIPA','AREQUIPA','TIABAYA'),(354,'04','01','24','AREQUIPA','AREQUIPA','UCHUMAYO'),(355,'04','01','25','AREQUIPA','AREQUIPA','VITOR'),(356,'04','01','26','AREQUIPA','AREQUIPA','YANAHUARA'),(357,'04','01','27','AREQUIPA','AREQUIPA','YARABAMBA'),(358,'04','01','28','AREQUIPA','AREQUIPA','YURA'),(359,'04','01','29','AREQUIPA','AREQUIPA','JOSE LUIS BUSTAMANTE Y RIVERO'),(360,'04','02','01','AREQUIPA','CAMANA','CAMANA'),(361,'04','02','02','AREQUIPA','CAMANA','JOSE MARIA QUIMPER'),(362,'04','02','03','AREQUIPA','CAMANA','MARIANO NICOLAS VALCARCEL'),(363,'04','02','04','AREQUIPA','CAMANA','MARISCAL CACERES'),(364,'04','02','05','AREQUIPA','CAMANA','NICOLAS DE PIEROLA'),(365,'04','02','06','AREQUIPA','CAMANA','OCOÑA'),(366,'04','02','07','AREQUIPA','CAMANA','QUILCA'),(367,'04','02','08','AREQUIPA','CAMANA','SAMUEL PASTOR'),(368,'04','03','01','AREQUIPA','CARAVELI','CARAVELI'),(369,'04','03','02','AREQUIPA','CARAVELI','ACARI'),(370,'04','03','03','AREQUIPA','CARAVELI','ATICO'),(371,'04','03','04','AREQUIPA','CARAVELI','ATIQUIPA'),(372,'04','03','05','AREQUIPA','CARAVELI','BELLA UNION'),(373,'04','03','06','AREQUIPA','CARAVELI','CAHUACHO'),(374,'04','03','07','AREQUIPA','CARAVELI','CHALA'),(375,'04','03','08','AREQUIPA','CARAVELI','CHAPARRA'),(376,'04','03','09','AREQUIPA','CARAVELI','HUANUHUANU'),(377,'04','03','10','AREQUIPA','CARAVELI','JAQUI'),(378,'04','03','11','AREQUIPA','CARAVELI','LOMAS'),(379,'04','03','12','AREQUIPA','CARAVELI','QUICACHA'),(380,'04','03','13','AREQUIPA','CARAVELI','YAUCA'),(381,'04','04','01','AREQUIPA','CASTILLA','APLAO'),(382,'04','04','02','AREQUIPA','CASTILLA','ANDAGUA'),(383,'04','04','03','AREQUIPA','CASTILLA','AYO'),(384,'04','04','04','AREQUIPA','CASTILLA','CHACHAS'),(385,'04','04','05','AREQUIPA','CASTILLA','CHILCAYMARCA'),(386,'04','04','06','AREQUIPA','CASTILLA','CHOCO'),(387,'04','04','07','AREQUIPA','CASTILLA','HUANCARQUI'),(388,'04','04','08','AREQUIPA','CASTILLA','MACHAGUAY'),(389,'04','04','09','AREQUIPA','CASTILLA','ORCOPAMPA'),(390,'04','04','10','AREQUIPA','CASTILLA','PAMPACOLCA'),(391,'04','04','11','AREQUIPA','CASTILLA','TIPAN'),(392,'04','04','12','AREQUIPA','CASTILLA','UÑON'),(393,'04','04','13','AREQUIPA','CASTILLA','URACA'),(394,'04','04','14','AREQUIPA','CASTILLA','VIRACO'),(395,'04','05','01','AREQUIPA','CAYLLOMA','CHIVAY'),(396,'04','05','02','AREQUIPA','CAYLLOMA','ACHOMA'),(397,'04','05','03','AREQUIPA','CAYLLOMA','CABANACONDE'),(398,'04','05','04','AREQUIPA','CAYLLOMA','CALLALLI'),(399,'04','05','05','AREQUIPA','CAYLLOMA','CAYLLOMA'),(400,'04','05','06','AREQUIPA','CAYLLOMA','COPORAQUE'),(401,'04','05','07','AREQUIPA','CAYLLOMA','HUAMBO'),(402,'04','05','08','AREQUIPA','CAYLLOMA','HUANCA'),(403,'04','05','09','AREQUIPA','CAYLLOMA','ICHUPAMPA'),(404,'04','05','10','AREQUIPA','CAYLLOMA','LARI'),(405,'04','05','11','AREQUIPA','CAYLLOMA','LLUTA'),(406,'04','05','12','AREQUIPA','CAYLLOMA','MACA'),(407,'04','05','13','AREQUIPA','CAYLLOMA','MADRIGAL'),(408,'04','05','14','AREQUIPA','CAYLLOMA','SAN ANTONIO DE CHUCA'),(409,'04','05','15','AREQUIPA','CAYLLOMA','SIBAYO'),(410,'04','05','16','AREQUIPA','CAYLLOMA','TAPAY'),(411,'04','05','17','AREQUIPA','CAYLLOMA','TISCO'),(412,'04','05','18','AREQUIPA','CAYLLOMA','TUTI'),(413,'04','05','19','AREQUIPA','CAYLLOMA','YANQUE'),(414,'04','05','20','AREQUIPA','CAYLLOMA','MAJES'),(415,'04','06','01','AREQUIPA','CONDESUYOS','CHUQUIBAMBA'),(416,'04','06','02','AREQUIPA','CONDESUYOS','ANDARAY'),(417,'04','06','03','AREQUIPA','CONDESUYOS','CAYARANI'),(418,'04','06','04','AREQUIPA','CONDESUYOS','CHICHAS'),(419,'04','06','05','AREQUIPA','CONDESUYOS','IRAY'),(420,'04','06','06','AREQUIPA','CONDESUYOS','RIO GRANDE'),(421,'04','06','07','AREQUIPA','CONDESUYOS','SALAMANCA'),(422,'04','06','08','AREQUIPA','CONDESUYOS','YANAQUIHUA'),(423,'04','07','01','AREQUIPA','ISLAY','MOLLENDO'),(424,'04','07','02','AREQUIPA','ISLAY','COCACHACRA'),(425,'04','07','03','AREQUIPA','ISLAY','DEAN VALDIVIA'),(426,'04','07','04','AREQUIPA','ISLAY','ISLAY'),(427,'04','07','05','AREQUIPA','ISLAY','MEJIA'),(428,'04','07','06','AREQUIPA','ISLAY','PUNTA DE BOMBON'),(429,'04','08','01','AREQUIPA','LA UNION','COTAHUASI'),(430,'04','08','02','AREQUIPA','LA UNION','ALCA'),(431,'04','08','03','AREQUIPA','LA UNION','CHARCANA'),(432,'04','08','04','AREQUIPA','LA UNION','HUAYNACOTAS'),(433,'04','08','05','AREQUIPA','LA UNION','PAMPAMARCA'),(434,'04','08','06','AREQUIPA','LA UNION','PUYCA'),(435,'04','08','07','AREQUIPA','LA UNION','QUECHUALLA'),(436,'04','08','08','AREQUIPA','LA UNION','SAYLA'),(437,'04','08','09','AREQUIPA','LA UNION','TAURIA'),(438,'04','08','10','AREQUIPA','LA UNION','TOMEPAMPA'),(439,'04','08','11','AREQUIPA','LA UNION','TORO'),(440,'05','01','01','AYACUCHO','HUAMANGA','AYACUCHO'),(441,'05','01','02','AYACUCHO','HUAMANGA','ACOCRO'),(442,'05','01','03','AYACUCHO','HUAMANGA','ACOS VINCHOS'),(443,'05','01','04','AYACUCHO','HUAMANGA','CARMEN ALTO'),(444,'05','01','05','AYACUCHO','HUAMANGA','CHIARA'),(445,'05','01','06','AYACUCHO','HUAMANGA','OCROS'),(446,'05','01','07','AYACUCHO','HUAMANGA','PACAYCASA'),(447,'05','01','08','AYACUCHO','HUAMANGA','QUINUA'),(448,'05','01','09','AYACUCHO','HUAMANGA','SAN JOSE DE TICLLAS'),(449,'05','01','10','AYACUCHO','HUAMANGA','SAN JUAN BAUTISTA'),(450,'05','01','11','AYACUCHO','HUAMANGA','SANTIAGO DE PISCHA'),(451,'05','01','12','AYACUCHO','HUAMANGA','SOCOS'),(452,'05','01','13','AYACUCHO','HUAMANGA','TAMBILLO'),(453,'05','01','14','AYACUCHO','HUAMANGA','VINCHOS'),(454,'05','01','15','AYACUCHO','HUAMANGA','JESUS NAZARENO'),(455,'05','02','01','AYACUCHO','CANGALLO','CANGALLO'),(456,'05','02','02','AYACUCHO','CANGALLO','CHUSCHI'),(457,'05','02','03','AYACUCHO','CANGALLO','LOS MOROCHUCOS'),(458,'05','02','04','AYACUCHO','CANGALLO','MARIA PARADO DE BELLIDO'),(459,'05','02','05','AYACUCHO','CANGALLO','PARAS'),(460,'05','02','06','AYACUCHO','CANGALLO','TOTOS'),(461,'05','03','01','AYACUCHO','HUANCA SANCOS','SANCOS'),(462,'05','03','02','AYACUCHO','HUANCA SANCOS','CARAPO'),(463,'05','03','03','AYACUCHO','HUANCA SANCOS','SACSAMARCA'),(464,'05','03','04','AYACUCHO','HUANCA SANCOS','SANTIAGO DE LUCANAMARCA'),(465,'05','04','01','AYACUCHO','HUANTA','HUANTA'),(466,'05','04','02','AYACUCHO','HUANTA','AYAHUANCO'),(467,'05','04','03','AYACUCHO','HUANTA','HUAMANGUILLA'),(468,'05','04','04','AYACUCHO','HUANTA','IGUAIN'),(469,'05','04','05','AYACUCHO','HUANTA','LURICOCHA'),(470,'05','04','06','AYACUCHO','HUANTA','SANTILLANA'),(471,'05','04','07','AYACUCHO','HUANTA','SIVIA'),(472,'05','04','08','AYACUCHO','HUANTA','LLOCHEGUA'),(473,'05','05','01','AYACUCHO','LA MAR','SAN MIGUEL'),(474,'05','05','02','AYACUCHO','LA MAR','ANCO'),(475,'05','05','03','AYACUCHO','LA MAR','AYNA'),(476,'05','05','04','AYACUCHO','LA MAR','CHILCAS'),(477,'05','05','05','AYACUCHO','LA MAR','CHUNGUI'),(478,'05','05','06','AYACUCHO','LA MAR','LUIS CARRANZA'),(479,'05','05','07','AYACUCHO','LA MAR','SANTA ROSA'),(480,'05','05','08','AYACUCHO','LA MAR','TAMBO'),(481,'05','06','01','AYACUCHO','LUCANAS','PUQUIO'),(482,'05','06','02','AYACUCHO','LUCANAS','AUCARA'),(483,'05','06','03','AYACUCHO','LUCANAS','CABANA'),(484,'05','06','04','AYACUCHO','LUCANAS','CARMEN SALCEDO'),(485,'05','06','05','AYACUCHO','LUCANAS','CHAVIÑA'),(486,'05','06','06','AYACUCHO','LUCANAS','CHIPAO'),(487,'05','06','07','AYACUCHO','LUCANAS','HUAC-HUAS'),(488,'05','06','08','AYACUCHO','LUCANAS','LARAMATE'),(489,'05','06','09','AYACUCHO','LUCANAS','LEONCIO PRADO'),(490,'05','06','10','AYACUCHO','LUCANAS','LLAUTA'),(491,'05','06','11','AYACUCHO','LUCANAS','LUCANAS'),(492,'05','06','12','AYACUCHO','LUCANAS','OCAÑA'),(493,'05','06','13','AYACUCHO','LUCANAS','OTOCA'),(494,'05','06','14','AYACUCHO','LUCANAS','SAISA'),(495,'05','06','15','AYACUCHO','LUCANAS','SAN CRISTOBAL'),(496,'05','06','16','AYACUCHO','LUCANAS','SAN JUAN'),(497,'05','06','17','AYACUCHO','LUCANAS','SAN PEDRO'),(498,'05','06','18','AYACUCHO','LUCANAS','SAN PEDRO DE PALCO'),(499,'05','06','19','AYACUCHO','LUCANAS','SANCOS'),(500,'05','06','20','AYACUCHO','LUCANAS','SANTA ANA DE HUAYCAHUACHO'),(501,'05','06','21','AYACUCHO','LUCANAS','SANTA LUCIA'),(502,'05','07','01','AYACUCHO','PARINACOCHAS','CORACORA'),(503,'05','07','02','AYACUCHO','PARINACOCHAS','CHUMPI'),(504,'05','07','03','AYACUCHO','PARINACOCHAS','CORONEL CASTAÑEDA'),(505,'05','07','04','AYACUCHO','PARINACOCHAS','PACAPAUSA'),(506,'05','07','05','AYACUCHO','PARINACOCHAS','PULLO'),(507,'05','07','06','AYACUCHO','PARINACOCHAS','PUYUSCA'),(508,'05','07','07','AYACUCHO','PARINACOCHAS','SAN FRANCISCO DE RAVACAYCO'),(509,'05','07','08','AYACUCHO','PARINACOCHAS','UPAHUACHO'),(510,'05','08','01','AYACUCHO','PAUCAR DEL SARA SARA','PAUSA'),(511,'05','08','02','AYACUCHO','PAUCAR DEL SARA SARA','COLTA'),(512,'05','08','03','AYACUCHO','PAUCAR DEL SARA SARA','CORCULLA'),(513,'05','08','04','AYACUCHO','PAUCAR DEL SARA SARA','LAMPA'),(514,'05','08','05','AYACUCHO','PAUCAR DEL SARA SARA','MARCABAMBA'),(515,'05','08','06','AYACUCHO','PAUCAR DEL SARA SARA','OYOLO'),(516,'05','08','07','AYACUCHO','PAUCAR DEL SARA SARA','PARARCA'),(517,'05','08','08','AYACUCHO','PAUCAR DEL SARA SARA','SAN JAVIER DE ALPABAMBA'),(518,'05','08','09','AYACUCHO','PAUCAR DEL SARA SARA','SAN JOSE DE USHUA'),(519,'05','08','10','AYACUCHO','PAUCAR DEL SARA SARA','SARA SARA'),(520,'05','09','01','AYACUCHO','SUCRE','QUEROBAMBA'),(521,'05','09','02','AYACUCHO','SUCRE','BELEN'),(522,'05','09','03','AYACUCHO','SUCRE','CHALCOS'),(523,'05','09','04','AYACUCHO','SUCRE','CHILCAYOC'),(524,'05','09','05','AYACUCHO','SUCRE','HUACAÑA'),(525,'05','09','06','AYACUCHO','SUCRE','MORCOLLA'),(526,'05','09','07','AYACUCHO','SUCRE','PAICO'),(527,'05','09','08','AYACUCHO','SUCRE','SAN PEDRO DE LARCAY'),(528,'05','09','09','AYACUCHO','SUCRE','SAN SALVADOR DE QUIJE'),(529,'05','09','10','AYACUCHO','SUCRE','SANTIAGO DE PAUCARAY'),(530,'05','09','11','AYACUCHO','SUCRE','SORAS'),(531,'05','10','01','AYACUCHO','VICTOR FAJARDO','HUANCAPI'),(532,'05','10','02','AYACUCHO','VICTOR FAJARDO','ALCAMENCA'),(533,'05','10','03','AYACUCHO','VICTOR FAJARDO','APONGO'),(534,'05','10','04','AYACUCHO','VICTOR FAJARDO','ASQUIPATA'),(535,'05','10','05','AYACUCHO','VICTOR FAFARDO','CANARIA'),(536,'05','10','06','AYACUCHO','VICTOR FAJARDO','CAYARA'),(537,'05','10','07','AYACUCHO','VICTOR FAJARDO','COLCA'),(538,'05','10','08','AYACUCHO','VICTOR FAJARDO','HUAMANQUIQUIA'),(539,'05','10','09','AYACUCHO','VICTOR FAJARDO','HUANCARAYLLA'),(540,'05','10','10','AYACUCHO','VICTOR FAJARDO','HUAYA'),(541,'05','10','11','AYACUCHO','VICTOR FAJARDO','SARHUA'),(542,'05','10','12','AYACUCHO','VICTOR FAJARDO','VILCANCHOS'),(543,'05','11','01','AYACUCHO','VILCAS HUAMAN','VILCAS HUAMAN'),(544,'05','11','02','AYACUCHO','VILCAS HUAMAN','ACCOMARCA'),(545,'05','11','03','AYACUCHO','VILCAS HUAMAN','CARHUANCA'),(546,'05','11','04','AYACUCHO','VILCAS HUAMAN','CONCEPCION'),(547,'05','11','05','AYACUCHO','VILCAS HUAMAN','HUAMBALPA'),(548,'05','11','06','AYACUCHO','VILCAS HUAMAN','INDEPENDENCIA'),(549,'05','11','07','AYACUCHO','VILCAS HUAMAN','SAURAMA'),(550,'05','11','08','AYACUCHO','VILCAS HUAMAN','VISCHONGO'),(551,'06','01','01','CAJAMARCA','CAJAMARCA','CAJAMARCA'),(552,'06','01','02','CAJAMARCA','CAJAMARCA','ASUNCION'),(553,'06','01','03','CAJAMARCA','CAJAMARCA','CHETILLA'),(554,'06','01','04','CAJAMARCA','CAJAMARCA','COSPAN'),(555,'06','01','05','CAJAMARCA','CAJAMARCA','ENCAÑADA'),(556,'06','01','06','CAJAMARCA','CAJAMARCA','JESUS'),(557,'06','01','07','CAJAMARCA','CAJAMARCA','LLACANORA'),(558,'06','01','08','CAJAMARCA','CAJAMARCA','LOS BAÑOS DEL INCA'),(559,'06','01','09','CAJAMARCA','CAJAMARCA','MAGDALENA'),(560,'06','01','10','CAJAMARCA','CAJAMARCA','MATARA'),(561,'06','01','11','CAJAMARCA','CAJAMARCA','NAMORA'),(562,'06','01','12','CAJAMARCA','CAJAMARCA','SAN JUAN'),(563,'06','02','01','CAJAMARCA','CAJABAMBA','CAJABAMBA'),(564,'06','02','02','CAJAMARCA','CAJABAMBA','CACHACHI'),(565,'06','02','03','CAJAMARCA','CAJABAMBA','CONDEBAMBA'),(566,'06','02','04','CAJAMARCA','CAJABAMBA','SITACOCHA'),(567,'06','03','01','CAJAMARCA','CELENDIN','CELENDIN'),(568,'06','03','02','CAJAMARCA','CELENDIN','CHUMUCH'),(569,'06','03','03','CAJAMARCA','CELENDIN','CORTEGANA'),(570,'06','03','04','CAJAMARCA','CELENDIN','HUASMIN'),(571,'06','03','05','CAJAMARCA','CELENDIN','JORGE CHAVEZ'),(572,'06','03','06','CAJAMARCA','CELENDIN','JOSE GALVEZ'),(573,'06','03','07','CAJAMARCA','CELENDIN','MIGUEL IGLESIAS'),(574,'06','03','08','CAJAMARCA','CELENDIN','OXAMARCA'),(575,'06','03','09','CAJAMARCA','CELENDIN','SOROCHUCO'),(576,'06','03','10','CAJAMARCA','CELENDIN','SUCRE'),(577,'06','03','11','CAJAMARCA','CELENDIN','UTCO'),(578,'06','03','12','CAJAMARCA','CELENDIN','LA LIBERTAD DE PALLAN'),(579,'06','04','01','CAJAMARCA','CHOTA','CHOTA'),(580,'06','04','02','CAJAMARCA','CHOTA','ANGUIA'),(581,'06','04','03','CAJAMARCA','CHOTA','CHADIN'),(582,'06','04','04','CAJAMARCA','CHOTA','CHIGUIRIP'),(583,'06','04','05','CAJAMARCA','CHOTA','CHIMBAN'),(584,'06','04','06','CAJAMARCA','CHOTA','CHOROPAMPA'),(585,'06','04','07','CAJAMARCA','CHOTA','COCHABAMBA'),(586,'06','04','08','CAJAMARCA','CHOTA','CONCHAN'),(587,'06','04','09','CAJAMARCA','CHOTA','HUAMBOS'),(588,'06','04','10','CAJAMARCA','CHOTA','LAJAS'),(589,'06','04','11','CAJAMARCA','CHOTA','LLAMA'),(590,'06','04','12','CAJAMARCA','CHOTA','MIRACOSTA'),(591,'06','04','13','CAJAMARCA','CHOTA','PACCHA'),(592,'06','04','14','CAJAMARCA','CHOTA','PION'),(593,'06','04','15','CAJAMARCA','CHOTA','QUEROCOTO'),(594,'06','04','16','CAJAMARCA','CHOTA','SAN JUAN DE LICUPIS'),(595,'06','04','17','CAJAMARCA','CHOTA','TACABAMBA'),(596,'06','04','18','CAJAMARCA','CHOTA','TOCMOCHE'),(597,'06','04','19','CAJAMARCA','CHOTA','CHALAMARCA'),(598,'06','05','01','CAJAMARCA','CONTUMAZA','CONTUMAZA'),(599,'06','05','02','CAJAMARCA','CONTUMAZA','CHILETE'),(600,'06','05','03','CAJAMARCA','CONTUMAZA','CUPISNIQUE'),(601,'06','05','04','CAJAMARCA','CONTUMAZA','GUZMANGO'),(602,'06','05','05','CAJAMARCA','CONTUMAZA','SAN BENITO'),(603,'06','05','06','CAJAMARCA','CONTUMAZA','SANTA CRUZ DE TOLED'),(604,'06','05','07','CAJAMARCA','CONTUMAZA','TANTARICA'),(605,'06','05','08','CAJAMARCA','CONTUMAZA','YONAN'),(606,'06','06','01','CAJAMARCA','CUTERVO','CUTERVO'),(607,'06','06','02','CAJAMARCA','CUTERVO','CALLAYUC'),(608,'06','06','03','CAJAMARCA','CUTERVO','CHOROS'),(609,'06','06','04','CAJAMARCA','CUTERVO','CUJILLO'),(610,'06','06','05','CAJAMARCA','CUTERVO','LA RAMADA'),(611,'06','06','06','CAJAMARCA','CUTERVO','PIMPINGOS'),(612,'06','06','07','CAJAMARCA','CUTERVO','QUEROCOTILLO'),(613,'06','06','08','CAJAMARCA','CUTERVO','SAN ANDRES DE CUTERVO'),(614,'06','06','09','CAJAMARCA','CUTERVO','SAN JUAN DE CUTERVO'),(615,'06','06','10','CAJAMARCA','CUTERVO','SAN LUIS DE LUCMA'),(616,'06','06','11','CAJAMARCA','CUTERVO','SANTA CRUZ'),(617,'06','06','12','CAJAMARCA','CUTERVO','SANTO DOMINGO DE LA CAPILLA'),(618,'06','06','13','CAJAMARCA','CUTERVO','SANTO TOMAS'),(619,'06','06','14','CAJAMARCA','CUTERVO','SOCOTA'),(620,'06','06','15','CAJAMARCA','CUTERVO','TORIBIO CASANOVA'),(621,'06','07','01','CAJAMARCA','HUALGAYOC','BAMBAMARCA'),(622,'06','07','02','CAJAMARCA','HUALGAYOC','CHUGUR'),(623,'06','07','03','CAJAMARCA','HUALGAYOC','HUALGAYOC'),(624,'06','08','01','CAJAMARCA','JAEN','JAEN'),(625,'06','08','02','CAJAMARCA','JAEN','BELLAVISTA'),(626,'06','08','03','CAJAMARCA','JAEN','CHONTALI'),(627,'06','08','04','CAJAMARCA','JAEN','COLASAY'),(628,'06','08','05','CAJAMARCA','JAEN','HUABAL'),(629,'06','08','06','CAJAMARCA','JAEN','LAS PIRIAS'),(630,'06','08','07','CAJAMARCA','JAEN','POMAHUACA'),(631,'06','08','08','CAJAMARCA','JAEN','PUCARA'),(632,'06','08','09','CAJAMARCA','JAEN','SALLIQUE'),(633,'06','08','10','CAJAMARCA','JAEN','SAN FELIPE'),(634,'06','08','11','CAJAMARCA','JAEN','SAN JOSE DEL ALTO'),(635,'06','08','12','CAJAMARCA','JAEN','SANTA ROSA'),(636,'06','09','01','CAJAMARCA','SAN IGNACIO','SAN IGNACIO'),(637,'06','09','02','CAJAMARCA','SAN IGNACIO','CHIRINOS'),(638,'06','09','03','CAJAMARCA','SAN IGNACIO','HUARANGO'),(639,'06','09','04','CAJAMARCA','SAN IGNACIO','LA COIPA'),(640,'06','09','05','CAJAMARCA','SAN IGNACIO','NAMBALLE'),(641,'06','09','06','CAJAMARCA','SAN IGNACIO','SAN JOSE DE LOURDES'),(642,'06','09','07','CAJAMARCA','SAN IGNACIO','TABACONAS'),(643,'06','10','01','CAJAMARCA','SAN MARCOS','PEDRO GALVEZ'),(644,'06','10','02','CAJAMARCA','SAN MARCOS','CHANCAY'),(645,'06','10','03','CAJAMARCA','SAN MARCOS','EDUARDO VILLANUEVA'),(646,'06','10','04','CAJAMARCA','SAN MARCOS','GREGORIO PITA'),(647,'06','10','05','CAJAMARCA','SAN MARCOS','ICHOCAN'),(648,'06','10','06','CAJAMARCA','SAN MARCOS','JOSE MANUEL QUIROZ'),(649,'06','10','07','CAJAMARCA','SAN MARCOS','JOSE SABOGAL'),(650,'06','11','01','CAJAMARCA','SAN MIGUEL','SAN MIGUEL'),(651,'06','11','02','CAJAMARCA','SAN MIGUEL','BOLIVAR'),(652,'06','11','03','CAJAMARCA','SAN MIGUEL','CALQUIS'),(653,'06','11','04','CAJAMARCA','SAN MIGUEL','CATILLUC'),(654,'06','11','05','CAJAMARCA','SAN MIGUEL','EL PRADO'),(655,'06','11','06','CAJAMARCA','SAN MIGUEL','LA FLORIDA'),(656,'06','11','07','CAJAMARCA','SAN MIGUEL','LLAPA'),(657,'06','11','08','CAJAMARCA','SAN MIGUEL','NANCHOC'),(658,'06','11','09','CAJAMARCA','SAN MIGUEL','NIEPOS'),(659,'06','11','10','CAJAMARCA','SAN MIGUEL','SAN GREGORIO'),(660,'06','11','11','CAJAMARCA','SAN MIGUEL','SAN SILVESTRE DE COCHAN'),(661,'06','11','12','CAJAMARCA','SAN MIGUEL','TONGOD'),(662,'06','11','13','CAJAMARCA','SAN MIGUEL','UNION AGUA BLANCA'),(663,'06','12','01','CAJAMARCA','SAN PABLO','SAN PABLO'),(664,'06','12','02','CAJAMARCA','SAN PABLO','SAN BERNARDINO'),(665,'06','12','03','CAJAMARCA','SAN PABLO','SAN LUIS'),(666,'06','12','04','CAJAMARCA','SAN PABLO','TUMBADEN'),(667,'06','13','01','CAJAMARCA','SANTA CRUZ','SANTA CRUZ'),(668,'06','13','02','CAJAMARCA','SANTA CRUZ','ANDABAMBA'),(669,'06','13','03','CAJAMARCA','SANTA CRUZ','CATACHE'),(670,'06','13','04','CAJAMARCA','SANTA CRUZ','CHANCAYBAÑOS'),(671,'06','13','05','CAJAMARCA','SANTA CRUZ','LA ESPERANZA'),(672,'06','13','06','CAJAMARCA','SANTA CRUZ','NINABAMBA'),(673,'06','13','07','CAJAMARCA','SANTA CRUZ','PULAN'),(674,'06','13','08','CAJAMARCA','SANTA CRUZ','SAUCEPAMPA'),(675,'06','13','09','CAJAMARCA','SANTA CRUZ','SEXI'),(676,'06','13','10','CAJAMARCA','SANTA CRUZ','UTICYACU'),(677,'06','13','11','CAJAMARCA','SANTA CRUZ','YAUYUCAN'),(678,'07','01','01','CALLAO','CALLAO','CALLAO'),(679,'07','01','02','CALLAO','CALLAO','BELLAVISTA'),(680,'07','01','03','CALLAO','CALLAO','CARMEN DE LA LEGUA REYNOSO'),(681,'07','01','04','CALLAO','CALLAO','LA PERLA'),(682,'07','01','05','CALLAO','CALLAO','LA PUNTA'),(683,'07','01','06','CALLAO','CALLAO','VENTANILLA'),(684,'08','01','01','CUSCO','CUSCO','CUSCO'),(685,'08','01','02','CUSCO','CUSCO','CCORCA'),(686,'08','01','03','CUSCO','CUSCO','POROY'),(687,'08','01','04','CUSCO','CUSCO','SAN JERONIMO'),(688,'08','01','05','CUSCO','CUSCO','SAN SEBASTIAN'),(689,'08','01','06','CUSCO','CUSCO','SANTIAGO'),(690,'08','01','07','CUSCO','CUSCO','SAYLLA'),(691,'08','01','08','CUSCO','CUSCO','WANCHAQ'),(692,'08','02','01','CUSCO','ACOMAYO','ACOMAYO'),(693,'08','02','02','CUSCO','ACOMAYO','ACOPIA'),(694,'08','02','03','CUSCO','ACOMAYO','ACOS'),(695,'08','02','04','CUSCO','ACOMAYO','MOSOC LLACTA'),(696,'08','02','05','CUSCO','ACOMAYO','POMACANCHI'),(697,'08','02','06','CUSCO','ACOMAYO','RONDOCAN'),(698,'08','02','07','CUSCO','ACOMAYO','SANGARARA'),(699,'08','03','01','CUSCO','ANTA','ANTA'),(700,'08','03','02','CUSCO','ANTA','ANCAHUASI'),(701,'08','03','03','CUSCO','ANTA','CACHIMAYO'),(702,'08','03','04','CUSCO','ANTA','CHINCHAYPUJIO'),(703,'08','03','05','CUSCO','ANTA','HUAROCONDO'),(704,'08','03','06','CUSCO','ANTA','LIMATAMBO'),(705,'08','03','07','CUSCO','ANTA','MOLLEPATA'),(706,'08','03','08','CUSCO','ANTA','PUCYURA'),(707,'08','03','09','CUSCO','ANTA','ZURITE'),(708,'08','04','01','CUSCO','CALCA','CALCA'),(709,'08','04','02','CUSCO','CALCA','COYA'),(710,'08','04','03','CUSCO','CALCA','LAMAY'),(711,'08','04','04','CUSCO','CALCA','LARES'),(712,'08','04','05','CUSCO','CALCA','PISAC'),(713,'08','04','06','CUSCO','CALCA','SAN SALVADOR'),(714,'08','04','07','CUSCO','CALCA','TARAY'),(715,'08','04','08','CUSCO','CALCA','YANATILE'),(716,'08','05','01','CUSCO','CANAS','YANAOCA'),(717,'08','05','02','CUSCO','CANAS','CHECCA'),(718,'08','05','03','CUSCO','CANAS','KUNTURKANKI'),(719,'08','05','04','CUSCO','CANAS','LANGUI'),(720,'08','05','05','CUSCO','CANAS','LAYO'),(721,'08','05','06','CUSCO','CANAS','PAMPAMARCA'),(722,'08','05','07','CUSCO','CANAS','QUEHUE'),(723,'08','05','08','CUSCO','CANAS','TUPAC AMARU'),(724,'08','06','01','CUSCO','CANCHIS','SICUANI'),(725,'08','06','02','CUSCO','CANCHIS','CHECACUPE'),(726,'08','06','03','CUSCO','CANCHIS','COMBAPATA'),(727,'08','06','04','CUSCO','CANCHIS','MARANGANI'),(728,'08','06','05','CUSCO','CANCHIS','PITUMARCA'),(729,'08','06','06','CUSCO','CANCHIS','SAN PABLO'),(730,'08','06','07','CUSCO','CANCHIS','SAN PEDRO'),(731,'08','06','08','CUSCO','CANCHIS','TINTA'),(732,'08','07','01','CUSCO','CHUMBIVILCAS','SANTO TOMAS'),(733,'08','07','02','CUSCO','CHUMBIVILCAS','CAPACMARCA'),(734,'08','07','03','CUSCO','CHUMBIVILCAS','CHAMACA'),(735,'08','07','04','CUSCO','CHUMBIVILCAS','COLQUEMARCA'),(736,'08','07','05','CUSCO','CHUMBIVILCAS','LIVITACA'),(737,'08','07','06','CUSCO','CHUMBIVILCAS','LLUSCO'),(738,'08','07','07','CUSCO','CHUMBIVILCAS','QUIÑOTA'),(739,'08','07','08','CUSCO','CHUMBIVILCAS','VELILLE'),(740,'08','08','01','CUSCO','ESPINAR','ESPINAR'),(741,'08','08','02','CUSCO','ESPINAR','CONDOROMA'),(742,'08','08','03','CUSCO','ESPINAR','COPORAQUE'),(743,'08','08','04','CUSCO','ESPINAR','OCORURO'),(744,'08','08','05','CUSCO','ESPINAR','PALLPATA'),(745,'08','08','06','CUSCO','ESPINAR','PICHIGUA'),(746,'08','08','07','CUSCO','ESPINAR','SUYCKUTAMBO'),(747,'08','08','08','CUSCO','ESPINAR','ALTO PICHIGUA'),(748,'08','09','01','CUSCO','LA CONVENCION','SANTA ANA'),(749,'08','09','02','CUSCO','LA CONVENCION','ECHARATE'),(750,'08','09','03','CUSCO','LA CONVENCION','HUAYOPATA'),(751,'08','09','04','CUSCO','LA CONVENCION','MARANURA'),(752,'08','09','05','CUSCO','LA CONVENCION','OCOBAMBA'),(753,'08','09','06','CUSCO','LA CONVENCION','QUELLOUNO'),(754,'08','09','07','CUSCO','LA CONVENCION','KIMBIRI'),(755,'08','09','08','CUSCO','LA CONVENCION','SANTA TERESA'),(756,'08','09','09','CUSCO','LA CONVENCION','VILCABAMBA'),(757,'08','09','10','CUSCO','LA CONVENCION','PICHARI'),(758,'08','10','01','CUSCO','PARURO','PARURO'),(759,'08','10','02','CUSCO','PARURO','ACCHA'),(760,'08','10','03','CUSCO','PARURO','CCAPI'),(761,'08','10','04','CUSCO','PARURO','COLCHA'),(762,'08','10','05','CUSCO','PARURO','HUANOQUITE'),(763,'08','10','06','CUSCO','PARURO','OMACHA'),(764,'08','10','07','CUSCO','PARURO','PACCARITAMBO'),(765,'08','10','08','CUSCO','PARURO','PILLPINTO'),(766,'08','10','09','CUSCO','PARURO','YAURISQUE'),(767,'08','11','01','CUSCO','PAUCARTAMBO','PAUCARTAMBO'),(768,'08','11','02','CUSCO','PAUCARTAMBO','CAICAY'),(769,'08','11','03','CUSCO','PAUCARTAMBO','CHALLABAMBA'),(770,'08','11','04','CUSCO','PAUCARTAMBO','COLQUEPATA'),(771,'08','11','05','CUSCO','PAUCARTAMBO','HUANCARANI'),(772,'08','11','06','CUSCO','PAUCARTAMBO','KOSÑIPATA'),(773,'08','12','01','CUSCO','QUISPICANCHI','URCOS'),(774,'08','12','02','CUSCO','QUISPICANCHI','ANDAHUAYLILLAS'),(775,'08','12','03','CUSCO','QUISPICANCHI','CAMANTI'),(776,'08','12','04','CUSCO','QUISPICANCHI','CCARHUAYO'),(777,'08','12','05','CUSCO','QUISPICANCHI','CCATCA'),(778,'08','12','06','CUSCO','QUISPICANCHI','CUSIPATA'),(779,'08','12','07','CUSCO','QUISPICANCHI','HUARO'),(780,'08','12','08','CUSCO','QUISPICANCHI','LUCRE'),(781,'08','12','09','CUSCO','QUISPICANCHI','MARCAPATA'),(782,'08','12','10','CUSCO','QUISPICANCHI','OCONGATE'),(783,'08','12','11','CUSCO','QUISPICANCHI','OROPESA'),(784,'08','12','12','CUSCO','QUISPICANCHI','QUIQUIJANA'),(785,'08','13','01','CUSCO','URUBAMBA','URUBAMBA'),(786,'08','13','02','CUSCO','URUBAMBA','CHINCHERO'),(787,'08','13','03','CUSCO','URUBAMBA','HUAYLLABAMBA'),(788,'08','13','04','CUSCO','URUBAMBA','MACHUPICCHU'),(789,'08','13','05','CUSCO','URUBAMBA','MARAS'),(790,'08','13','06','CUSCO','URUBAMBA','OLLANTAYTAMBO'),(791,'08','13','07','CUSCO','URUBAMBA','YUCAY'),(792,'09','01','01','HUANCAVELICA','HUANCAVELICA','HUANCAVELICA'),(793,'09','01','02','HUANCAVELICA','HUANCAVELICA','ACOBAMBILLA'),(794,'09','01','03','HUANCAVELICA','HUANCAVELICA','ACORIA'),(795,'09','01','04','HUANCAVELICA','HUANCAVELICA','CONAYCA'),(796,'09','01','05','HUANCAVELICA','HUANCAVELICA','CUENCA'),(797,'09','01','06','HUANCAVELICA','HUANCAVELICA','HUACHOCOLPA'),(798,'09','01','07','HUANCAVELICA','HUANCAVELICA','HUAYLLAHUARA'),(799,'09','01','08','HUANCAVELICA','HUANCAVELICA','IZCUCHACA'),(800,'09','01','09','HUANCAVELICA','HUANCAVELICA','LARIA'),(801,'09','01','10','HUANCAVELICA','HUANCAVELICA','MANTA'),(802,'09','01','11','HUANCAVELICA','HUANCAVELICA','MARISCAL CACERES'),(803,'09','01','12','HUANCAVELICA','HUANCAVELICA','MOYA'),(804,'09','01','13','HUANCAVELICA','HUANCAVELICA','NUEVO OCCORO'),(805,'09','01','14','HUANCAVELICA','HUANCAVELICA','PALCA'),(806,'09','01','15','HUANCAVELICA','HUANCAVELICA','PILCHACA'),(807,'09','01','16','HUANCAVELICA','HUANCAVELICA','VILCA'),(808,'09','01','17','HUANCAVELICA','HUANCAVELICA','YAULI'),(809,'09','01','18','HUANCAVELICA','HUANCAVELICA','ASCENSION'),(810,'09','01','19','HUANCAVELICA','HUANCAVELICA','HUANDO'),(811,'09','02','01','HUANCAVELICA','ACOBAMBA','ACOBAMBA'),(812,'09','02','02','HUANCAVELICA','ACOBAMBA','ANDABAMBA'),(813,'09','02','03','HUANCAVELICA','ACOBAMBA','ANTA'),(814,'09','02','04','HUANCAVELICA','ACOBAMBA','CAJA'),(815,'09','02','05','HUANCAVELICA','ACOBAMBA','MARCAS'),(816,'09','02','06','HUANCAVELICA','ACOBAMBA','PAUCARA'),(817,'09','02','07','HUANCAVELICA','ACOBAMBA','POMACOCHA'),(818,'09','02','08','HUANCAVELICA','ACOBAMBA','ROSARIO'),(819,'09','03','01','HUANCAVELICA','ANGARAES','LIRCAY'),(820,'09','03','02','HUANCAVELICA','ANGARAES','ANCHONGA'),(821,'09','03','03','HUANCAVELICA','ANGARAES','CALLANMARCA'),(822,'09','03','04','HUANCAVELICA','ANGARAES','CCOCHACCASA'),(823,'09','03','05','HUANCAVELICA','ANGARAES','CHINCHO'),(824,'09','03','06','HUANCAVELICA','ANGARAES','CONGALLA'),(825,'09','03','07','HUANCAVELICA','ANGARAES','HUANCA-HUANCA'),(826,'09','03','08','HUANCAVELICA','ANGARAES','HUAYLLAY GRANDE'),(827,'09','03','09','HUANCAVELICA','ANGARAES','JULCAMARCA'),(828,'09','03','10','HUANCAVELICA','ANGARAES','SAN ANTONIO DE ANTAPARCO'),(829,'09','03','11','HUANCAVELICA','ANGARAES','SANTO TOMAS DE PATA'),(830,'09','03','12','HUANCAVELICA','ANGARAES','SECCLLA'),(831,'09','04','01','HUANCAVELICA','CASTROVIRREYNA','CASTROVIRREYNA'),(832,'09','04','02','HUANCAVELICA','CASTROVIRREYNA','ARMA'),(833,'09','04','03','HUANCAVELICA','CASTROVIRREYNA','AURAHUA'),(834,'09','04','04','HUANCAVELICA','CASTROVIRREYNA','CAPILLAS'),(835,'09','04','05','HUANCAVELICA','CASTROVIRREYNA','CHUPAMARCA'),(836,'09','04','06','HUANCAVELICA','CASTROVIRREYNA','COCAS'),(837,'09','04','07','HUANCAVELICA','CASTROVIRREYNA','HUACHOS'),(838,'09','04','08','HUANCAVELICA','CASTROVIRREYNA','HUAMATAMBO'),(839,'09','04','09','HUANCAVELICA','CASTROVIRREYNA','MOLLEPAMPA'),(840,'09','04','10','HUANCAVELICA','CASTROVIRREYNA','SAN JUAN'),(841,'09','04','11','HUANCAVELICA','CASTROVIRREYNA','SANTA ANA'),(842,'09','04','12','HUANCAVELICA','CASTROVIRREYNA','TANTARA'),(843,'09','04','13','HUANCAVELICA','CASTROVIRREYNA','TICRAPO'),(844,'09','05','01','HUANCAVELICA','CHURCAMPA','CHURCAMPA'),(845,'09','05','02','HUANCAVELICA','CHURCAMPA','ANCO'),(846,'09','05','03','HUANCAVELICA','CHURCAMPA','CHINCHIHUASI'),(847,'09','05','04','HUANCAVELICA','CHURCAMPA','EL CARMEN'),(848,'09','05','05','HUANCAVELICA','CHURCAMPA','LA MERCED'),(849,'09','05','06','HUANCAVELICA','CHURCAMPA','LOCROJA'),(850,'09','05','07','HUANCAVELICA','CHURCAMPA','PAUCARBAMBA'),(851,'09','05','08','HUANCAVELICA','CHURCAMPA','SAN MIGUEL DE MAYOCC'),(852,'09','05','09','HUANCAVELICA','CHURCAMPA','SAN PEDRO DE CORIS'),(853,'09','05','10','HUANCAVELICA','CHURCAMPA','PACHAMARCA'),(854,'09','06','01','HUANCAVELICA','HUAYTARA','HUAYTARA'),(855,'09','06','02','HUANCAVELICA','HUAYTARA','AYAVI'),(856,'09','06','03','HUANCAVELICA','HUAYTARA','CORDOVA'),(857,'09','06','04','HUANCAVELICA','HUAYTARA','HUAYACUNDO ARMA'),(858,'09','06','05','HUANCAVELICA','HUAYTARA','LARAMARCA'),(859,'09','06','06','HUANCAVELICA','HUAYTARA','OCOYO'),(860,'09','06','07','HUANCAVELICA','HUAYTARA','PILPICHACA'),(861,'09','06','08','HUANCAVELICA','HUAYTARA','QUERCO'),(862,'09','06','09','HUANCAVELICA','HUAYTARA','QUITO-ARMA'),(863,'09','06','10','HUANCAVELICA','HUAYTARA','SAN ANTONIO DE CUSICANCHA'),(864,'09','06','11','HUANCAVELICA','HUAYTARA','SAN FRANCISCO DE SANGAYAICO'),(865,'09','06','12','HUANCAVELICA','HUAYTARA','SAN ISIDRO'),(866,'09','06','13','HUANCAVELICA','HUAYTARA','SANTIAGO DE CHOCORVOS'),(867,'09','06','14','HUANCAVELICA','HUAYTARA','SANTIAGO DE QUIRAHUARA'),(868,'09','06','15','HUANCAVELICA','HUAYTARA','SANTO DOMINGO DE CAPILLAS'),(869,'09','06','16','HUANCAVELICA','HUAYTARA','TAMBO'),(870,'09','07','01','HUANCAVELICA','TAYACAJA','PAMPAS'),(871,'09','07','02','HUANCAVELICA','TAYACAJA','ACOSTAMBO'),(872,'09','07','03','HUANCAVELICA','TAYACAJA','ACRAQUIA'),(873,'09','07','04','HUANCAVELICA','TAYACAJA','AHUAYCHA'),(874,'09','07','05','HUANCAVELICA','TAYACAJA','COLCABAMBA'),(875,'09','07','06','HUANCAVELICA','TAYACAJA','DANIEL HERNANDEZ'),(876,'09','07','07','HUANCAVELICA','TAYACAJA','HUACHOCOLPA'),(877,'09','07','09','HUANCAVELICA','TAYACAJA','HUARIBAMBA'),(878,'09','07','10','HUANCAVELICA','TAYACAJA','ÑAHUIMPUQUIO'),(879,'09','07','11','HUANCAVELICA','TAYACAJA','PAZOS'),(880,'09','07','13','HUANCAVELICA','TAYACAJA','QUISHUAR'),(881,'09','07','14','HUANCAVELICA','TAYACAJA','SALCABAMBA'),(882,'09','07','15','HUANCAVELICA','TAYACAJA','SALCAHUASI'),(883,'09','07','16','HUANCAVELICA','TAYACAJA','SAN MARCOS DE ROCCHAC'),(884,'09','07','17','HUANCAVELICA','TAYACAJA','SURCUBAMBA'),(885,'09','07','18','HUANCAVELICA','TAYACAJA','TINTAY PUNCU'),(886,'10','01','01','HUANUCO','HUANUCO','HUANUCO'),(887,'10','01','02','HUANUCO','HUANUCO','AMARILIS'),(888,'10','01','03','HUANUCO','HUANUCO','CHINCHAO'),(889,'10','01','04','HUANUCO','HUANUCO','CHURUBAMBA'),(890,'10','01','05','HUANUCO','HUANUCO','MARGOS'),(891,'10','01','06','HUANUCO','HUANUCO','QUISQUI'),(892,'10','01','07','HUANUCO','HUANUCO','SAN FRANCISCO DE CAYRAN'),(893,'10','01','08','HUANUCO','HUANUCO','SAN PEDRO DE CHAULAN'),(894,'10','01','09','HUANUCO','HUANUCO','SANTA MARIA DEL VALLE'),(895,'10','01','10','HUANUCO','HUANUCO','YARUMAYO'),(896,'10','01','11','HUANUCO','HUANUCO','PILLCO MARCA'),(897,'10','02','01','HUANUCO','AMBO','AMBO'),(898,'10','02','02','HUANUCO','AMBO','CAYNA'),(899,'10','02','03','HUANUCO','AMBO','COLPAS'),(900,'10','02','04','HUANUCO','AMBO','CONCHAMARCA'),(901,'10','02','05','HUANUCO','AMBO','HUACAR'),(902,'10','02','06','HUANUCO','AMBO','SAN FRANCISCO'),(903,'10','02','07','HUANUCO','AMBO','SAN RAFAEL'),(904,'10','02','08','HUANUCO','AMBO','TOMAY KICHWA'),(905,'10','03','01','HUANUCO','DOS DE MAYO','LA UNION'),(906,'10','03','07','HUANUCO','DOS DE MAYO','CHUQUIS'),(907,'10','03','11','HUANUCO','DOS DE MAYO','MARIAS'),(908,'10','03','13','HUANUCO','DOS DE MAYO','PACHAS'),(909,'10','03','16','HUANUCO','DOS DE MAYO','QUIVILLA'),(910,'10','03','17','HUANUCO','DOS DE MAYO','RIPAN'),(911,'10','03','21','HUANUCO','DOS DE MAYO','SHUNQUI'),(912,'10','03','22','HUANUCO','DOS DE MAYO','SILLAPATA'),(913,'10','03','23','HUANUCO','DOS DE MAYO','YANAS'),(914,'10','04','01','HUANUCO','HUACAYBAMBA','HUACAYBAMBA'),(915,'10','04','02','HUANUCO','HUACAYBAMBA','CANCHABAMBA'),(916,'10','04','03','HUANUCO','HUACAYBAMBA','COCHABAMBA'),(917,'10','04','04','HUANUCO','HUACAYBAMBA','PINRA'),(918,'10','05','01','HUANUCO','HUAMALIES','LLATA'),(919,'10','05','02','HUANUCO','HUAMALIES','ARANCAY'),(920,'10','05','03','HUANUCO','HUAMALIES','CHAVIN DE PARIARCA'),(921,'10','05','04','HUANUCO','HUAMALIES','JACAS GRANDE'),(922,'10','05','05','HUANUCO','HUAMALIES','JIRCAN'),(923,'10','05','06','HUANUCO','HUAMALIES','MIRAFLORES'),(924,'10','05','07','HUANUCO','HUAMALIES','MONZON'),(925,'10','05','08','HUANUCO','HUAMALIES','PUNCHAO'),(926,'10','05','09','HUANUCO','HUAMALIES','PUÑOS'),(927,'10','05','10','HUANUCO','HUAMALIES','SINGA'),(928,'10','05','11','HUANUCO','HUAMALIES','TANTAMAYO'),(929,'10','06','01','HUANUCO','LEONCIO PRADO','RUPA-RUPA'),(930,'10','06','02','HUANUCO','LEONCIO PRADO','DANIEL ALOMIAS ROBLES'),(931,'10','06','03','HUANUCO','LEONCIO PRADO','HERMILIO VALDIZAN'),(932,'10','06','04','HUANUCO','LEONCIO PRADO','JOSE CRESPO Y CASTILLO'),(933,'10','06','05','HUANUCO','LEONCIO PRADO','LUYANDO'),(934,'10','06','06','HUANUCO','LEONCIO PRADO','MARIANO DAMASO BERAUN'),(935,'10','07','01','HUANUCO','MARAÑON','HUACRACHUCO'),(936,'10','07','02','HUANUCO','MARAÑON','CHOLON'),(937,'10','07','03','HUANUCO','MARAÑON','SAN BUENAVENTURA'),(938,'10','08','01','HUANUCO','PACHITEA','PANAO'),(939,'10','08','02','HUANUCO','PACHITEA','CHAGLLA'),(940,'10','08','03','HUANUCO','PACHITEA','MOLINO'),(941,'10','08','04','HUANUCO','PACHITEA','UMARI'),(942,'10','09','01','HUANUCO','PUERTO INCA','PUERTO INCA'),(943,'10','09','02','HUANUCO','PUERTO INCA','CODO DEL POZUZO'),(944,'10','09','03','HUANUCO','PUERTO INCA','HONORIA'),(945,'10','09','04','HUANUCO','PUERTO INCA','TOURNAVISTA'),(946,'10','09','05','HUANUCO','PUERTO INCA','YUYAPICHIS'),(947,'10','10','01','HUANUCO','LAURICOCHA','JESUS'),(948,'10','10','02','HUANUCO','LAURICOCHA','BAÑOS'),(949,'10','10','03','HUANUCO','LAURICOCHA','JIVIA'),(950,'10','10','04','HUANUCO','LAURICOCHA','QUEROPALCA'),(951,'10','10','05','HUANUCO','LAURICOCHA','RONDOS'),(952,'10','10','06','HUANUCO','LAURICOCHA','SAN FRANCISCO DE ASIS'),(953,'10','10','07','HUANUCO','LAURICOCHA','SAN MIGUEL DE CAURI'),(954,'10','11','01','HUANUCO','YAROWILCA','CHAVINILLO'),(955,'10','11','02','HUANUCO','YAROWILCA','CAHUAC'),(956,'10','11','03','HUANUCO','YAROWILCA','CHACABAMBA'),(957,'10','11','04','HUANUCO','YAROWILCA','APARICIO POMARES'),(958,'10','11','05','HUANUCO','YAROWILCA','JACAS CHICO'),(959,'10','11','06','HUANUCO','YAROWILCA','OBAS'),(960,'10','11','07','HUANUCO','YAROWILCA','PAMPAMARCA'),(961,'10','11','08','HUANUCO','YAROWILCA','CHORAS'),(962,'11','01','01','ICA','ICA','ICA'),(963,'11','01','02','ICA','ICA','LA TINGUIÑA'),(964,'11','01','03','ICA','ICA','LOS AQUIJES'),(965,'11','01','04','ICA','ICA','OCUCAJE'),(966,'11','01','05','ICA','ICA','PACHACUTEC'),(967,'11','01','06','ICA','ICA','PARCONA'),(968,'11','01','07','ICA','ICA','PUEBLO NUEVO'),(969,'11','01','08','ICA','ICA','SALAS'),(970,'11','01','09','ICA','ICA','SAN JOSE DE LOS MOLINOS'),(971,'11','01','10','ICA','ICA','SAN JUAN BAUTISTA'),(972,'11','01','11','ICA','ICA','SANTIAGO'),(973,'11','01','12','ICA','ICA','SUBTANJALLA'),(974,'11','01','13','ICA','ICA','TATE'),(975,'11','01','14','ICA','ICA','YAUCA DEL ROSARIO'),(976,'11','02','01','ICA','CHINCHA','CHINCHA ALTA'),(977,'11','02','02','ICA','CHINCHA','ALTO LARAN'),(978,'11','02','03','ICA','CHINCHA','CHAVIN'),(979,'11','02','04','ICA','CHINCHA','CHINCHA BAJA'),(980,'11','02','05','ICA','CHINCHA','EL CARMEN'),(981,'11','02','06','ICA','CHINCHA','GROCIO PRADO'),(982,'11','02','07','ICA','CHINCHA','PUEBLO NUEVO'),(983,'11','02','08','ICA','CHINCHA','SAN JUAN DE YANAC'),(984,'11','02','09','ICA','CHINCHA','SAN PEDRO DE HUACARPANA'),(985,'11','02','10','ICA','CHINCHA','SUNAMPE'),(986,'11','02','11','ICA','CHINCHA','TAMBO DE MORA'),(987,'11','03','01','ICA','NAZCA','NAZCA'),(988,'11','03','02','ICA','NAZCA','CHANGUILLO'),(989,'11','03','03','ICA','NAZCA','EL INGENIO'),(990,'11','03','04','ICA','NAZCA','MARCONA'),(991,'11','03','05','ICA','NAZCA','VISTA ALEGRE'),(992,'11','04','01','ICA','PALPA','PALPA'),(993,'11','04','02','ICA','PALPA','LLIPATA'),(994,'11','04','03','ICA','PALPA','RIO GRANDE'),(995,'11','04','04','ICA','PALPA','SANTA CRUZ'),(996,'11','04','05','ICA','PALPA','TIBILLO'),(997,'11','05','01','ICA','PISCO','PISCO'),(998,'11','05','02','ICA','PISCO','HUANCANO'),(999,'11','05','03','ICA','PISCO','HUMAY'),(1000,'11','05','04','ICA','PISCO','INDEPENDENCIA'),(1001,'11','05','05','ICA','PISCO','PARACAS'),(1002,'11','05','06','ICA','PISCO','SAN ANDRES'),(1003,'11','05','07','ICA','PISCO','SAN CLEMENTE'),(1004,'11','05','08','ICA','PISCO','TUPAC AMARU INCA'),(1005,'12','01','01','JUNIN','HUANCAYO','HUANCAYO'),(1006,'12','01','04','JUNIN','HUANCAYO','CARHUACALLANGA'),(1007,'12','01','05','JUNIN','HUANCAYO','CHACAPAMPA'),(1008,'12','01','06','JUNIN','HUANCAYO','CHICCHE'),(1009,'12','01','07','JUNIN','HUANCAYO','CHILCA'),(1010,'12','01','08','JUNIN','HUANCAYO','CHONGOS ALTO'),(1011,'12','01','11','JUNIN','HUANCAYO','CHUPURO'),(1012,'12','01','12','JUNIN','HUANCAYO','COLCA'),(1013,'12','01','13','JUNIN','HUANCAYO','CULLHUAS'),(1014,'12','01','14','JUNIN','HUANCAYO','EL TAMBO'),(1015,'12','01','16','JUNIN','HUANCAYO','HUACRAPUQUIO'),(1016,'12','01','17','JUNIN','HUANCAYO','HUALHUAS'),(1017,'12','01','19','JUNIN','HUANCAYO','HUANCAN'),(1018,'12','01','20','JUNIN','HUANCAYO','HUASICANCHA'),(1019,'12','01','21','JUNIN','HUANCAYO','HUAYUCACHI'),(1020,'12','01','22','JUNIN','HUANCAYO','INGENIO'),(1021,'12','01','24','JUNIN','HUANCAYO','PARIAHUANCA'),(1022,'12','01','25','JUNIN','HUANCAYO','PILCOMAYO'),(1023,'12','01','26','JUNIN','HUANCAYO','PUCARA'),(1024,'12','01','27','JUNIN','HUANCAYO','QUICHUAY'),(1025,'12','01','28','JUNIN','HUANCAYO','QUILCAS'),(1026,'12','01','29','JUNIN','HUANCAYO','SAN AGUSTIN'),(1027,'12','01','30','JUNIN','HUANCAYO','SAN JERONIMO DE TUNAN'),(1028,'12','01','32','JUNIN','HUANCAYO','SAÑO'),(1029,'12','01','33','JUNIN','HUANCAYO','SAPALLANGA'),(1030,'12','01','34','JUNIN','HUANCAYO','SICAYA'),(1031,'12','01','35','JUNIN','HUANCAYO','SANTO DOMINGO DE ACOBAMBA'),(1032,'12','01','36','JUNIN','HUANCAYO','VIQUES'),(1033,'12','02','01','JUNIN','CONCEPCION','CONCEPCION'),(1034,'12','02','02','JUNIN','CONCEPCION','ACO'),(1035,'12','02','03','JUNIN','CONCEPCION','ANDAMARCA'),(1036,'12','02','04','JUNIN','CONCEPCION','CHAMBARA'),(1037,'12','02','05','JUNIN','CONCEPCION','COCHAS'),(1038,'12','02','06','JUNIN','CONCEPCION','COMAS'),(1039,'12','02','07','JUNIN','CONCEPCION','HEROINAS TOLEDO'),(1040,'12','02','08','JUNIN','CONCEPCION','MANZANARES'),(1041,'12','02','09','JUNIN','CONCEPCION','MARISCAL CASTILLA'),(1042,'12','02','10','JUNIN','CONCEPCION','MATAHUASI'),(1043,'12','02','11','JUNIN','CONCEPCION','MITO'),(1044,'12','02','12','JUNIN','CONCEPCION','NUEVE DE JULIO'),(1045,'12','02','13','JUNIN','CONCEPCION','ORCOTUNA'),(1046,'12','02','14','JUNIN','CONCEPCION','SAN JOSE DE QUERO'),(1047,'12','02','15','JUNIN','CONCEPCION','SANTA ROSA DE OCOPA'),(1048,'12','03','01','JUNIN','CHANCHAMAYO','CHANCHAMAYO'),(1049,'12','03','02','JUNIN','CHANCHAMAYO','PERENE'),(1050,'12','03','03','JUNIN','CHANCHAMAYO','PICHANAQUI'),(1051,'12','03','04','JUNIN','CHANCHAMAYO','SAN LUIS DE SHUARO'),(1052,'12','03','05','JUNIN','CHANCHAMAYO','SAN RAMON'),(1053,'12','03','06','JUNIN','CHANCHAMAYO','VITOC'),(1054,'12','04','01','JUNIN','JAUJA','JAUJA'),(1055,'12','04','02','JUNIN','JAUJA','ACOLLA'),(1056,'12','04','03','JUNIN','JAUJA','APATA'),(1057,'12','04','04','JUNIN','JAUJA','ATAURA'),(1058,'12','04','05','JUNIN','JAUJA','CANCHAYLLO'),(1059,'12','04','06','JUNIN','JAUJA','CURICACA'),(1060,'12','04','07','JUNIN','JAUJA','EL MANTARO'),(1061,'12','04','08','JUNIN','JAUJA','HUAMALI'),(1062,'12','04','09','JUNIN','JAUJA','HUARIPAMPA'),(1063,'12','04','10','JUNIN','JAUJA','HUERTAS'),(1064,'12','04','11','JUNIN','JAUJA','JANJAILLO'),(1065,'12','04','12','JUNIN','JAUJA','JULCAN'),(1066,'12','04','13','JUNIN','JAUJA','LEONOR ORDOÑEZ'),(1067,'12','04','14','JUNIN','JAUJA','LLOCLLAPAMPA'),(1068,'12','04','15','JUNIN','JAUJA','MARCO'),(1069,'12','04','16','JUNIN','JAUJA','MASMA'),(1070,'12','04','17','JUNIN','JAUJA','MASMA CHICCHE'),(1071,'12','04','18','JUNIN','JAUJA','MOLINOS'),(1072,'12','04','19','JUNIN','JAUJA','MONOBAMBA'),(1073,'12','04','20','JUNIN','JAUJA','MUQUI'),(1074,'12','04','21','JUNIN','JAUJA','MUQUIYAUYO'),(1075,'12','04','22','JUNIN','JAUJA','PACA'),(1076,'12','04','23','JUNIN','JAUJA','PACCHA'),(1077,'12','04','24','JUNIN','JAUJA','PANCAN'),(1078,'12','04','25','JUNIN','JAUJA','PARCO'),(1079,'12','04','26','JUNIN','JAUJA','POMACANCHA'),(1080,'12','04','27','JUNIN','JAUJA','RICRAN'),(1081,'12','04','28','JUNIN','JAUJA','SAN LORENZO'),(1082,'12','04','29','JUNIN','JAUJA','SAN PEDRO DE CHUNAN'),(1083,'12','04','30','JUNIN','JAUJA','SAUSA'),(1084,'12','04','31','JUNIN','JAUJA','SINCOS'),(1085,'12','04','32','JUNIN','JAUJA','TUNAN MARCA'),(1086,'12','04','33','JUNIN','JAUJA','YAULI'),(1087,'12','04','34','JUNIN','JAUJA','YAUYOS'),(1088,'12','05','01','JUNIN','JUNIN','JUNIN'),(1089,'12','05','02','JUNIN','JUNIN','CARHUAMAYO'),(1090,'12','05','03','JUNIN','JUNIN','ONDORES'),(1091,'12','05','04','JUNIN','JUNIN','ULCUMAYO'),(1092,'12','06','01','JUNIN','SATIPO','SATIPO'),(1093,'12','06','02','JUNIN','SATIPO','COVIRIALI'),(1094,'12','06','03','JUNIN','SATIPO','LLAYLLA'),(1095,'12','06','04','JUNIN','SATIPO','MAZAMARI'),(1096,'12','06','05','JUNIN','SATIPO','PAMPA HERMOSA'),(1097,'12','06','06','JUNIN','SATIPO','PANGOA'),(1098,'12','06','07','JUNIN','SATIPO','RIO NEGRO'),(1099,'12','06','08','JUNIN','SATIPO','RIO TAMBO'),(1100,'12','07','01','JUNIN','TARMA','TARMA'),(1101,'12','07','02','JUNIN','TARMA','ACOBAMBA'),(1102,'12','07','03','JUNIN','TARMA','HUARICOLCA'),(1103,'12','07','04','JUNIN','TARMA','HUASAHUASI'),(1104,'12','07','05','JUNIN','TARMA','LA UNION'),(1105,'12','07','06','JUNIN','TARMA','PALCA'),(1106,'12','07','07','JUNIN','TARMA','PALCAMAYO'),(1107,'12','07','08','JUNIN','TARMA','SAN PEDRO DE CAJAS'),(1108,'12','07','09','JUNIN','TARMA','TAPO'),(1109,'12','08','01','JUNIN','YAULI','LA OROYA'),(1110,'12','08','02','JUNIN','YAULI','CHACAPALPA'),(1111,'12','08','03','JUNIN','YAULI','HUAY-HUAY'),(1112,'12','08','04','JUNIN','YAULI','MARCAPOMACOCHA'),(1113,'12','08','05','JUNIN','YAULI','MOROCOCHA'),(1114,'12','08','06','JUNIN','YAULI','PACCHA'),(1115,'12','08','07','JUNIN','YAULI','SANTA BARBARA DE CARHUACAYAN'),(1116,'12','08','08','JUNIN','YAULI','SANTA ROSA DE SACCO'),(1117,'12','08','09','JUNIN','YAULI','SUITUCANCHA'),(1118,'12','08','10','JUNIN','YAULI','YAULI'),(1119,'12','09','01','JUNIN','CHUPACA','CHUPACA'),(1120,'12','09','02','JUNIN','CHUPACA','AHUAC'),(1121,'12','09','03','JUNIN','CHUPACA','CHONGOS BAJO'),(1122,'12','09','04','JUNIN','CHUPACA','HUACHAC'),(1123,'12','09','05','JUNIN','CHUPACA','HUAMANCACA CHICO'),(1124,'12','09','06','JUNIN','CHUPACA','SAN JUAN DE YSCOS'),(1125,'12','09','07','JUNIN','CHUPACA','SAN JUAN DE JARPA'),(1126,'12','09','08','JUNIN','CHUPACA','TRES DE DICIEMBRE'),(1127,'12','09','09','JUNIN','CHUPACA','YANACANCHA'),(1128,'13','01','01','LA LIBERTAD','TRUJILLO','TRUJILLO'),(1129,'13','01','02','LA LIBERTAD','TRUJILLO','EL PORVENIR'),(1130,'13','01','03','LA LIBERTAD','TRUJILLO','FLORENCIA DE MORA'),(1131,'13','01','04','LA LIBERTAD','TRUJILLO','HUANCHACO'),(1132,'13','01','05','LA LIBERTAD','TRUJILLO','LA ESPERANZA'),(1133,'13','01','06','LA LIBERTAD','TRUJILLO','LAREDO'),(1134,'13','01','07','LA LIBERTAD','TRUJILLO','MOCHE'),(1135,'13','01','08','LA LIBERTAD','TRUJILLO','POROTO'),(1136,'13','01','09','LA LIBERTAD','TRUJILLO','SALAVERRY'),(1137,'13','01','10','LA LIBERTAD','TRUJILLO','SIMBAL'),(1138,'13','01','11','LA LIBERTAD','TRUJILLO','VICTOR LARCO HERRERA'),(1139,'13','02','01','LA LIBERTAD','ASCOPE','ASCOPE'),(1140,'13','02','02','LA LIBERTAD','ASCOPE','CHICAMA'),(1141,'13','02','03','LA LIBERTAD','ASCOPE','CHOCOPE'),(1142,'13','02','04','LA LIBERTAD','ASCOPE','MAGDALENA DE CAO'),(1143,'13','02','05','LA LIBERTAD','ASCOPE','PAIJAN'),(1144,'13','02','06','LA LIBERTAD','ASCOPE','RAZURI'),(1145,'13','02','07','LA LIBERTAD','ASCOPE','SANTIAGO DE CAO'),(1146,'13','02','08','LA LIBERTAD','ASCOPE','CASA GRANDE'),(1147,'13','03','01','LA LIBERTAD','BOLIVAR','BOLIVAR'),(1148,'13','03','02','LA LIBERTAD','BOLIVAR','BAMBAMARCA'),(1149,'13','03','03','LA LIBERTAD','BOLIVAR','CONDORMARCA'),(1150,'13','03','04','LA LIBERTAD','BOLIVAR','LONGOTEA'),(1151,'13','03','05','LA LIBERTAD','BOLIVAR','UCHUMARCA'),(1152,'13','03','06','LA LIBERTAD','BOLIVAR','UCUNCHA'),(1153,'13','04','01','LA LIBERTAD','CHEPEN','CHEPEN'),(1154,'13','04','02','LA LIBERTAD','CHEPEN','PACANGA'),(1155,'13','04','03','LA LIBERTAD','CHEPEN','PUEBLO NUEVO'),(1156,'13','05','01','LA LIBERTAD','JULCAN','JULCAN'),(1157,'13','05','02','LA LIBERTAD','JULCAN','CALAMARCA'),(1158,'13','05','03','LA LIBERTAD','JULCAN','CARABAMBA'),(1159,'13','05','04','LA LIBERTAD','JULCAN','HUASO'),(1160,'13','06','01','LA LIBERTAD','OTUZCO','OTUZCO'),(1161,'13','06','02','LA LIBERTAD','OTUZCO','AGALLPAMPA'),(1162,'13','06','04','LA LIBERTAD','OTUZCO','CHARAT'),(1163,'13','06','05','LA LIBERTAD','OTUZCO','HUARANCHAL'),(1164,'13','06','06','LA LIBERTAD','OTUZCO','LA CUESTA'),(1165,'13','06','08','LA LIBERTAD','OTUZCO','MACHE'),(1166,'13','06','10','LA LIBERTAD','OTUZCO','PARANDAY'),(1167,'13','06','11','LA LIBERTAD','OTUZCO','SALPO'),(1168,'13','06','13','LA LIBERTAD','OTUZCO','SINSICAP'),(1169,'13','06','14','LA LIBERTAD','OTUZCO','USQUIL'),(1170,'13','07','01','LA LIBERTAD','PACASMAYO','SAN PEDRO DE LLOC'),(1171,'13','07','02','LA LIBERTAD','PACASMAYO','GUADALUPE'),(1172,'13','07','03','LA LIBERTAD','PACASMAYO','JEQUETEPEQUE'),(1173,'13','07','04','LA LIBERTAD','PACASMAYO','PACASMAYO'),(1174,'13','07','05','LA LIBERTAD','PACASMAYO','SAN JOSE'),(1175,'13','08','01','LA LIBERTAD','PATAZ','TAYABAMBA'),(1176,'13','08','02','LA LIBERTAD','PATAZ','BULDIBUYO'),(1177,'13','08','03','LA LIBERTAD','PATAZ','CHILLIA'),(1178,'13','08','04','LA LIBERTAD','PATAZ','HUANCASPATA'),(1179,'13','08','05','LA LIBERTAD','PATAZ','HUAYLILLAS'),(1180,'13','08','06','LA LIBERTAD','PATAZ','HUAYO'),(1181,'13','08','07','LA LIBERTAD','PATAZ','ONGON'),(1182,'13','08','08','LA LIBERTAD','PATAZ','PARCOY'),(1183,'13','08','09','LA LIBERTAD','PATAZ','PATAZ'),(1184,'13','08','10','LA LIBERTAD','PATAZ','PIAS'),(1185,'13','08','11','LA LIBERTAD','PATAZ','SANTIAGO DE CHALLAS'),(1186,'13','08','12','LA LIBERTAD','PATAZ','TAURIJA'),(1187,'13','08','13','LA LIBERTAD','PATAZ','URPAY'),(1188,'13','09','01','LA LIBERTAD','SANCHEZ CARRION','HUAMACHUCO'),(1189,'13','09','02','LA LIBERTAD','SANCHEZ CARRION','CHUGAY'),(1190,'13','09','03','LA LIBERTAD','SANCHEZ CARRION','COCHORCO'),(1191,'13','09','04','LA LIBERTAD','SANCHEZ CARRION','CURGOS'),(1192,'13','09','05','LA LIBERTAD','SANCHEZ CARRION','MARCABAL'),(1193,'13','09','06','LA LIBERTAD','SANCHEZ CARRION','SANAGORAN'),(1194,'13','09','07','LA LIBERTAD','SANCHEZ CARRION','SARIN'),(1195,'13','09','08','LA LIBERTAD','SANCHEZ CARRION','SARTIMBAMBA'),(1196,'13','10','01','LA LIBERTAD','SANTIAGO DE CHUCO','SANTIAGO DE CHUCO'),(1197,'13','10','02','LA LIBERTAD','SANTIAGO DE CHUCO','ANGASMARCA'),(1198,'13','10','03','LA LIBERTAD','SANTIAGO DE CHUCO','CACHICADAN'),(1199,'13','10','04','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEBAMBA'),(1200,'13','10','05','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEPATA'),(1201,'13','10','06','LA LIBERTAD','SANTIAGO DE CHUCO','QUIRUVILCA'),(1202,'13','10','07','LA LIBERTAD','SANTIAGO DE CHUCO','SANTA CRUZ DE CHUCA'),(1203,'13','10','08','LA LIBERTAD','SANTIAGO DE CHUCO','SITABAMBA'),(1204,'13','11','01','LA LIBERTAD','GRAN CHIMU','CASCAS'),(1205,'13','11','02','LA LIBERTAD','GRAN CHIMU','LUCMA'),(1206,'13','11','03','LA LIBERTAD','GRAN CHIMU','COMPIN'),(1207,'13','11','04','LA LIBERTAD','GRAN CHIMU','SAYAPULLO'),(1208,'13','12','01','LA LIBERTAD','VIRU','VIRU'),(1209,'13','12','02','LA LIBERTAD','VIRU','CHAO'),(1210,'13','12','03','LA LIBERTAD','VIRU','GUADALUPITO'),(1211,'14','01','01','LAMBAYEQUE','CHICLAYO','CHICLAYO'),(1212,'14','01','02','LAMBAYEQUE','CHICLAYO','CHONGOYAPE'),(1213,'14','01','03','LAMBAYEQUE','CHICLAYO','ETEN'),(1214,'14','01','04','LAMBAYEQUE','CHICLAYO','ETEN PUERTO'),(1215,'14','01','05','LAMBAYEQUE','CHICLAYO','JOSE LEONARDO ORTIZ'),(1216,'14','01','06','LAMBAYEQUE','CHICLAYO','LA VICTORIA'),(1217,'14','01','07','LAMBAYEQUE','CHICLAYO','LAGUNAS'),(1218,'14','01','08','LAMBAYEQUE','CHICLAYO','MONSEFU'),(1219,'14','01','09','LAMBAYEQUE','CHICLAYO','NUEVA ARICA'),(1220,'14','01','10','LAMBAYEQUE','CHICLAYO','OYOTUN'),(1221,'14','01','11','LAMBAYEQUE','CHICLAYO','PICSI'),(1222,'14','01','12','LAMBAYEQUE','CHICLAYO','PIMENTEL'),(1223,'14','01','13','LAMBAYEQUE','CHICLAYO','REQUE'),(1224,'14','01','14','LAMBAYEQUE','CHICLAYO','SANTA ROSA'),(1225,'14','01','15','LAMBAYEQUE','CHICLAYO','SAÑA'),(1226,'14','01','16','LAMBAYEQUE','CHICLAYO','CAYALTI'),(1227,'14','01','17','LAMBAYEQUE','CHICLAYO','PATAPO'),(1228,'14','01','18','LAMBAYEQUE','CHICLAYO','POMALCA'),(1229,'14','01','19','LAMBAYEQUE','CHICLAYO','PUCALA'),(1230,'14','01','20','LAMBAYEQUE','CHICLAYO','TUMAN'),(1231,'14','02','01','LAMBAYEQUE','FERREÑAFE','FERREÑAFE'),(1232,'14','02','02','LAMBAYEQUE','FERREÑAFE','CAÑARIS'),(1233,'14','02','03','LAMBAYEQUE','FERREÑAFE','INCAHUASI'),(1234,'14','02','04','LAMBAYEQUE','FERREÑAFE','MANUEL ANTONIO MESONES MURO'),(1235,'14','02','05','LAMBAYEQUE','FERREÑAFE','PITIPO'),(1236,'14','02','06','LAMBAYEQUE','FERREÑAFE','PUEBLO NUEVO'),(1237,'14','03','01','LAMBAYEQUE','LAMBAYEQUE','LAMBAYEQUE'),(1238,'14','03','02','LAMBAYEQUE','LAMBAYEQUE','CHOCHOPE'),(1239,'14','03','03','LAMBAYEQUE','LAMBAYEQUE','ILLIMO'),(1240,'14','03','04','LAMBAYEQUE','LAMBAYEQUE','JAYANCA'),(1241,'14','03','05','LAMBAYEQUE','LAMBAYEQUE','MOCHUMI'),(1242,'14','03','06','LAMBAYEQUE','LAMBAYEQUE','MORROPE'),(1243,'14','03','07','LAMBAYEQUE','LAMBAYEQUE','MOTUPE'),(1244,'14','03','08','LAMBAYEQUE','LAMBAYEQUE','OLMOS'),(1245,'14','03','09','LAMBAYEQUE','LAMBAYEQUE','PACORA'),(1246,'14','03','10','LAMBAYEQUE','LAMBAYEQUE','SALAS'),(1247,'14','03','11','LAMBAYEQUE','LAMBAYEQUE','SAN JOSE'),(1248,'14','03','12','LAMBAYEQUE','LAMBAYEQUE','TUCUME'),(1249,'15','01','01','LIMA','LIMA','LIMA'),(1250,'15','01','02','LIMA','LIMA','ANCON'),(1251,'15','01','03','LIMA','LIMA','ATE'),(1252,'15','01','04','LIMA','LIMA','BARRANCO'),(1253,'15','01','05','LIMA','LIMA','BREÑA'),(1254,'15','01','06','LIMA','LIMA','CARABAYLLO'),(1255,'15','01','07','LIMA','LIMA','CHACLACAYO'),(1256,'15','01','08','LIMA','LIMA','CHORRILLOS'),(1257,'15','01','09','LIMA','LIMA','CIENEGUILLA'),(1258,'15','01','10','LIMA','LIMA','COMAS'),(1259,'15','01','11','LIMA','LIMA','EL AGUSTINO'),(1260,'15','01','12','LIMA','LIMA','INDEPENDENCIA'),(1261,'15','01','13','LIMA','LIMA','JESUS MARIA'),(1262,'15','01','14','LIMA','LIMA','LA MOLINA'),(1263,'15','01','15','LIMA','LIMA','LA VICTORIA'),(1264,'15','01','16','LIMA','LIMA','LINCE'),(1265,'15','01','17','LIMA','LIMA','LOS OLIVOS'),(1266,'15','01','18','LIMA','LIMA','LURIGANCHO'),(1267,'15','01','19','LIMA','LIMA','LURIN'),(1268,'15','01','20','LIMA','LIMA','MAGDALENA DEL MAR'),(1269,'15','01','21','LIMA','LIMA','MAGDALENA VIEJA'),(1270,'15','01','22','LIMA','LIMA','MIRAFLORES'),(1271,'15','01','23','LIMA','LIMA','PACHACAMAC'),(1272,'15','01','24','LIMA','LIMA','PUCUSANA'),(1273,'15','01','25','LIMA','LIMA','PUENTE PIEDRA'),(1274,'15','01','26','LIMA','LIMA','PUNTA HERMOSA'),(1275,'15','01','27','LIMA','LIMA','PUNTA NEGRA'),(1276,'15','01','28','LIMA','LIMA','RIMAC'),(1277,'15','01','29','LIMA','LIMA','SAN BARTOLO'),(1278,'15','01','30','LIMA','LIMA','SAN BORJA'),(1279,'15','01','31','LIMA','LIMA','SAN ISIDRO'),(1280,'15','01','32','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),(1281,'15','01','33','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),(1282,'15','01','34','LIMA','LIMA','SAN LUIS'),(1283,'15','01','35','LIMA','LIMA','SAN MARTIN DE PORRES'),(1284,'15','01','36','LIMA','LIMA','SAN MIGUEL'),(1285,'15','01','37','LIMA','LIMA','SANTA ANITA'),(1286,'15','01','38','LIMA','LIMA','SANTA MARIA DEL MAR'),(1287,'15','01','39','LIMA','LIMA','SANTA ROSA'),(1288,'15','01','40','LIMA','LIMA','SANTIAGO DE SURCO'),(1289,'15','01','41','LIMA','LIMA','SURQUILLO'),(1290,'15','01','42','LIMA','LIMA','VILLA EL SALVADOR'),(1291,'15','01','43','LIMA','LIMA','VILLA MARIA DEL TRIUNFO'),(1292,'15','02','01','LIMA','BARRANCA','BARRANCA'),(1293,'15','02','02','LIMA','BARRANCA','PARAMONGA'),(1294,'15','02','03','LIMA','BARRANCA','PATIVILCA'),(1295,'15','02','04','LIMA','BARRANCA','SUPE'),(1296,'15','02','05','LIMA','BARRANCA','SUPE PUERTO'),(1297,'15','03','01','LIMA','CAJATAMBO','CAJATAMBO'),(1298,'15','03','02','LIMA','CAJATAMBO','COPA'),(1299,'15','03','03','LIMA','CAJATAMBO','GORGOR'),(1300,'15','03','04','LIMA','CAJATAMBO','HUANCAPON'),(1301,'15','03','05','LIMA','CAJATAMBO','MANAS'),(1302,'15','04','01','LIMA','CANTA','CANTA'),(1303,'15','04','02','LIMA','CANTA','ARAHUAY'),(1304,'15','04','03','LIMA','CANTA','HUAMANTANGA'),(1305,'15','04','04','LIMA','CANTA','HUAROS'),(1306,'15','04','05','LIMA','CANTA','LACHAQUI'),(1307,'15','04','06','LIMA','CANTA','SAN BUENAVENTURA'),(1308,'15','04','07','LIMA','CANTA','SANTA ROSA DE QUIVES'),(1309,'15','05','01','LIMA','CAÑETE','SAN VICENTE DE CAÑETE'),(1310,'15','05','02','LIMA','CAÑETE','ASIA'),(1311,'15','05','03','LIMA','CAÑETE','CALANGO'),(1312,'15','05','04','LIMA','CAÑETE','CERRO AZUL'),(1313,'15','05','05','LIMA','CAÑETE','CHILCA'),(1314,'15','05','06','LIMA','CAÑETE','COAYLLO'),(1315,'15','05','07','LIMA','CAÑETE','IMPERIAL'),(1316,'15','05','08','LIMA','CAÑETE','LUNAHUANA'),(1317,'15','05','09','LIMA','CAÑETE','MALA'),(1318,'15','05','10','LIMA','CAÑETE','NUEVO IMPERIAL'),(1319,'15','05','11','LIMA','CAÑETE','PACARAN'),(1320,'15','05','12','LIMA','CAÑETE','QUILMANA'),(1321,'15','05','13','LIMA','CAÑETE','SAN ANTONIO'),(1322,'15','05','14','LIMA','CAÑETE','SAN LUIS'),(1323,'15','05','15','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),(1324,'15','05','16','LIMA','CAÑETE','ZUÑIGA'),(1325,'15','06','01','LIMA','HUARAL','HUARAL'),(1326,'15','06','02','LIMA','HUARAL','ATAVILLOS ALTO'),(1327,'15','06','03','LIMA','HUARAL','ATAVILLOS BAJO'),(1328,'15','06','04','LIMA','HUARAL','AUCALLAMA'),(1329,'15','06','05','LIMA','HUARAL','CHANCAY'),(1330,'15','06','06','LIMA','HUARAL','IHUARI'),(1331,'15','06','07','LIMA','HUARAL','LAMPIAN'),(1332,'15','06','08','LIMA','HUARAL','PACARAOS'),(1333,'15','06','09','LIMA','HUARAL','SAN MIGUEL DE ACOS'),(1334,'15','06','10','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA'),(1335,'15','06','11','LIMA','HUARAL','SUMBILCA'),(1336,'15','06','12','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE'),(1337,'15','07','01','LIMA','HUAROCHIRI','MATUCANA'),(1338,'15','07','02','LIMA','HUAROCHIRI','ANTIOQUIA'),(1339,'15','07','03','LIMA','HUAROCHIRI','CALLAHUANCA'),(1340,'15','07','04','LIMA','HUAROCHIRI','CARAMPOMA'),(1341,'15','07','05','LIMA','HUAROCHIRI','CHICLA'),(1342,'15','07','06','LIMA','HUAROCHIRI','CUENCA'),(1343,'15','07','07','LIMA','HUAROCHIRI','HUACHUPAMPA'),(1344,'15','07','08','LIMA','HUAROCHIRI','HUANZA'),(1345,'15','07','09','LIMA','HUAROCHIRI','HUAROCHIRI'),(1346,'15','07','10','LIMA','HUAROCHIRI','LAHUAYTAMBO'),(1347,'15','07','11','LIMA','HUAROCHIRI','LANGA'),(1348,'15','07','12','LIMA','HUAROCHIRI','LARAOS'),(1349,'15','07','13','LIMA','HUAROCHIRI','MARIATANA'),(1350,'15','07','14','LIMA','HUAROCHIRI','RICARDO PALMA'),(1351,'15','07','15','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA'),(1352,'15','07','16','LIMA','HUAROCHIRI','SAN ANTONIO'),(1353,'15','07','17','LIMA','HUAROCHIRI','SAN BARTOLOME'),(1354,'15','07','18','LIMA','HUAROCHIRI','SAN DAMIAN'),(1355,'15','07','19','LIMA','HUAROCHIRI','SAN JUAN DE IRIS'),(1356,'15','07','20','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE'),(1357,'15','07','21','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI'),(1358,'15','07','22','LIMA','HUAROCHIRI','SAN MATEO'),(1359,'15','07','23','LIMA','HUAROCHIRI','SAN MATEO DE OTAO'),(1360,'15','07','24','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA'),(1361,'15','07','25','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE'),(1362,'15','07','26','LIMA','HUAROCHIRI','SANGALLAYA'),(1363,'15','07','27','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA'),(1364,'15','07','28','LIMA','HUAROCHIRI','SANTA EULALIA'),(1365,'15','07','29','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA'),(1366,'15','07','30','LIMA','HUAROCHIRI','SANTIAGO DE TUNA'),(1367,'15','07','31','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS'),(1368,'15','07','32','LIMA','HUAROCHIRI','SURCO'),(1369,'15','08','01','LIMA','HUAURA','HUACHO'),(1370,'15','08','02','LIMA','HUAURA','AMBAR'),(1371,'15','08','03','LIMA','HUAURA','CALETA DE CARQUIN'),(1372,'15','08','04','LIMA','HUAURA','CHECRAS'),(1373,'15','08','05','LIMA','HUAURA','HUALMAY'),(1374,'15','08','06','LIMA','HUAURA','HUAURA'),(1375,'15','08','07','LIMA','HUAURA','LEONCIO PRADO'),(1376,'15','08','08','LIMA','HUAURA','PACCHO'),(1377,'15','08','09','LIMA','HUAURA','SANTA LEONOR'),(1378,'15','08','10','LIMA','HUAURA','SANTA MARIA'),(1379,'15','08','11','LIMA','HUAURA','SAYAN'),(1380,'15','08','12','LIMA','HUAURA','VEGUETA'),(1381,'15','09','01','LIMA','OYON','OYON'),(1382,'15','09','02','LIMA','OYON','ANDAJES'),(1383,'15','09','03','LIMA','OYON','CAUJUL'),(1384,'15','09','04','LIMA','OYON','COCHAMARCA'),(1385,'15','09','05','LIMA','OYON','NAVAN'),(1386,'15','09','06','LIMA','OYON','PACHANGARA'),(1387,'15','10','01','LIMA','YAUYOS','YAUYOS'),(1388,'15','10','02','LIMA','YAUYOS','ALIS'),(1389,'15','10','03','LIMA','YAUYOS','AYAUCA'),(1390,'15','10','04','LIMA','YAUYOS','AYAVIRI'),(1391,'15','10','05','LIMA','YAUYOS','AZANGARO'),(1392,'15','10','06','LIMA','YAUYOS','CACRA'),(1393,'15','10','07','LIMA','YAUYOS','CARANIA'),(1394,'15','10','08','LIMA','YAUYOS','CATAHUASI'),(1395,'15','10','09','LIMA','YAUYOS','CHOCOS'),(1396,'15','10','10','LIMA','YAUYOS','COCHAS'),(1397,'15','10','11','LIMA','YAUYOS','COLONIA'),(1398,'15','10','12','LIMA','YAUYOS','HONGOS'),(1399,'15','10','13','LIMA','YAUYOS','HUAMPARA'),(1400,'15','10','14','LIMA','YAUYOS','HUANCAYA'),(1401,'15','10','15','LIMA','YAUYOS','HUANGASCAR'),(1402,'15','10','16','LIMA','YAUYOS','HUANTAN'),(1403,'15','10','17','LIMA','YAUYOS','HUAÑEC'),(1404,'15','10','18','LIMA','YAUYOS','LARAOS'),(1405,'15','10','19','LIMA','YAUYOS','LINCHA'),(1406,'15','10','20','LIMA','YAUYOS','MADEAN'),(1407,'15','10','21','LIMA','YAUYOS','MIRAFLORES'),(1408,'15','10','22','LIMA','YAUYOS','OMAS'),(1409,'15','10','23','LIMA','YAUYOS','PUTINZA'),(1410,'15','10','24','LIMA','YAUYOS','QUINCHES'),(1411,'15','10','25','LIMA','YAUYOS','QUINOCAY'),(1412,'15','10','26','LIMA','YAUYOS','SAN JOAQUIN'),(1413,'15','10','27','LIMA','YAUYOS','SAN PEDRO DE PILAS'),(1414,'15','10','28','LIMA','YAUYOS','TANTA'),(1415,'15','10','29','LIMA','YAUYOS','TAURIPAMPA'),(1416,'15','10','30','LIMA','YAUYOS','TOMAS'),(1417,'15','10','31','LIMA','YAUYOS','TUPE'),(1418,'15','10','32','LIMA','YAUYOS','VIÑAC'),(1419,'15','10','33','LIMA','YAUYOS','VITIS'),(1420,'16','01','01','LORETO','MAYNAS','IQUITOS'),(1421,'16','01','02','LORETO','MAYNAS','ALTO NANAY'),(1422,'16','01','03','LORETO','MAYNAS','FERNANDO LORES'),(1423,'16','01','04','LORETO','MAYNAS','INDIANA'),(1424,'16','01','05','LORETO','MAYNAS','LAS AMAZONAS'),(1425,'16','01','06','LORETO','MAYNAS','MAZAN'),(1426,'16','01','07','LORETO','MAYNAS','NAPO'),(1427,'16','01','08','LORETO','MAYNAS','PUNCHANA'),(1428,'16','01','09','LORETO','MAYNAS','PUTUMAYO'),(1429,'16','01','10','LORETO','MAYNAS','TORRES CAUSANA'),(1430,'16','01','12','LORETO','MAYNAS','BELEN'),(1431,'16','01','13','LORETO','MAYNAS','SAN JUAN BAUTISTA'),(1432,'16','01','14','LORETO','MAYNAS','TENIENTE MANUEL CLAVERO'),(1433,'16','02','01','LORETO','ALTO AMAZONAS','YURIMAGUAS'),(1434,'16','02','02','LORETO','ALTO AMAZONAS','BALSAPUERTO'),(1435,'16','02','05','LORETO','ALTO AMAZONAS','JEBEROS'),(1436,'16','02','06','LORETO','ALTO AMAZONAS','LAGUNAS'),(1437,'16','02','10','LORETO','ALTO AMAZONAS','SANTA CRUZ'),(1438,'16','02','11','LORETO','ALTO AMAZONAS','TENIENTE CESAR LOPEZ ROJAS'),(1439,'16','03','01','LORETO','LORETO','NAUTA'),(1440,'16','03','02','LORETO','LORETO','PARINARI'),(1441,'16','03','03','LORETO','LORETO','TIGRE'),(1442,'16','03','04','LORETO','LORETO','TROMPETEROS'),(1443,'16','03','05','LORETO','LORETO','URARINAS'),(1444,'16','04','01','LORETO','MARISCAL RAMON CASTILLA','RAMON CASTILLA'),(1445,'16','04','02','LORETO','MARISCAL RAMON CASTILLA','PEBAS'),(1446,'16','04','03','LORETO','MARISCAL RAMON CASTILLA','YAVARI'),(1447,'16','04','04','LORETO','MARISCAL RAMON CASTILLA','SAN PABLO'),(1448,'16','05','01','LORETO','REQUENA','REQUENA'),(1449,'16','05','02','LORETO','REQUENA','ALTO TAPICHE'),(1450,'16','05','03','LORETO','REQUENA','CAPELO'),(1451,'16','05','04','LORETO','REQUENA','EMILIO SAN MARTIN'),(1452,'16','05','05','LORETO','REQUENA','MAQUIA'),(1453,'16','05','06','LORETO','REQUENA','PUINAHUA'),(1454,'16','05','07','LORETO','REQUENA','SAQUENA'),(1455,'16','05','08','LORETO','REQUENA','SOPLIN'),(1456,'16','05','09','LORETO','REQUENA','TAPICHE'),(1457,'16','05','10','LORETO','REQUENA','JENARO HERRERA'),(1458,'16','05','11','LORETO','REQUENA','YAQUERANA'),(1459,'16','06','01','LORETO','UCAYALI','CONTAMANA'),(1460,'16','06','02','LORETO','UCAYALI','INAHUAYA'),(1461,'16','06','03','LORETO','UCAYALI','PADRE MARQUEZ'),(1462,'16','06','04','LORETO','UCAYALI','PAMPA HERMOSA'),(1463,'16','06','05','LORETO','UCAYALI','SARAYACU'),(1464,'16','06','06','LORETO','UCAYALI','VARGAS GUERRA'),(1465,'16','07','01','LORETO','DATEM DEL MARAÑON','BARRANCA'),(1466,'16','07','02','LORETO','DATEM DEL MARAÑON','CAHUAPANAS'),(1467,'16','07','03','LORETO','DATEM DEL MARAÑON','MANSERICHE'),(1468,'16','07','04','LORETO','DATEM DEL MARAÑON','MORONA'),(1469,'16','07','05','LORETO','DATEM DEL MARAÑON','PASTAZA'),(1470,'16','07','06','LORETO','DATEM DEL MARAÑON','ANDOAS'),(1471,'17','01','01','MADRE DE DIOS','TAMBOPATA','TAMBOPATA'),(1472,'17','01','02','MADRE DE DIOS','TAMBOPATA','INAMBARI'),(1473,'17','01','03','MADRE DE DIOS','TAMBOPATA','LAS PIEDRAS'),(1474,'17','01','04','MADRE DE DIOS','TAMBOPATA','LABERINTO'),(1475,'17','02','01','MADRE DE DIOS','MANU','MANU'),(1476,'17','02','02','MADRE DE DIOS','MANU','FITZCARRALD'),(1477,'17','02','03','MADRE DE DIOS','MANU','MADRE DE DIOS'),(1478,'17','02','04','MADRE DE DIOS','MANU','HUEPETUHE'),(1479,'17','03','01','MADRE DE DIOS','TAHUAMANU','IÑAPARI'),(1480,'17','03','02','MADRE DE DIOS','TAHUAMANU','IBERIA'),(1481,'17','03','03','MADRE DE DIOS','TAHUAMANU','TAHUAMANU'),(1482,'18','01','01','MOQUEGUA','MARISCAL NIETO','MOQUEGUA'),(1483,'18','01','02','MOQUEGUA','MARISCAL NIETO','CARUMAS'),(1484,'18','01','03','MOQUEGUA','MARISCAL NIETO','CUCHUMBAYA'),(1485,'18','01','04','MOQUEGUA','MARISCAL NIETO','SAMEGUA'),(1486,'18','01','05','MOQUEGUA','MARISCAL NIETO','SAN CRISTOBAL'),(1487,'18','01','06','MOQUEGUA','MARISCAL NIETO','TORATA'),(1488,'18','02','01','MOQUEGUA','GENERAL SANCHEZ CERRO','OMATE'),(1489,'18','02','02','MOQUEGUA','GENERAL SANCHEZ CERRO','CHOJATA'),(1490,'18','02','03','MOQUEGUA','GENERAL SANCHEZ CERRO','COALAQUE'),(1491,'18','02','04','MOQUEGUA','GENERAL SANCHEZ CERRO','ICHUÑA'),(1492,'18','02','05','MOQUEGUA','GENERAL SANCHEZ CERRO','LA CAPILLA'),(1493,'18','02','06','MOQUEGUA','GENERAL SANCHEZ CERRO','LLOQUE'),(1494,'18','02','07','MOQUEGUA','GENERAL SANCHEZ CERRO','MATALAQUE'),(1495,'18','02','08','MOQUEGUA','GENERAL SANCHEZ CERRO','PUQUINA'),(1496,'18','02','09','MOQUEGUA','GENERAL SANCHEZ CERRO','QUINISTAQUILLAS'),(1497,'18','02','10','MOQUEGUA','GENERAL SANCHEZ CERRO','UBINAS'),(1498,'18','02','11','MOQUEGUA','GENERAL SANCHEZ CERRO','YUNGA'),(1499,'18','03','01','MOQUEGUA','ILO','ILO'),(1500,'18','03','02','MOQUEGUA','ILO','EL ALGARROBAL'),(1501,'18','03','03','MOQUEGUA','ILO','PACOCHA'),(1502,'19','01','01','PASCO','PASCO','CHAUPIMARCA'),(1503,'19','01','02','PASCO','PASCO','HUACHON'),(1504,'19','01','03','PASCO','PASCO','HUARIACA'),(1505,'19','01','04','PASCO','PASCO','HUAYLLAY'),(1506,'19','01','05','PASCO','PASCO','NINACACA'),(1507,'19','01','06','PASCO','PASCO','PALLANCHACRA'),(1508,'19','01','07','PASCO','PASCO','PAUCARTAMBO'),(1509,'19','01','08','PASCO','PASCO','SAN FRANCISCO DE ASIS DE YARUSYACAN'),(1510,'19','01','09','PASCO','PASCO','SIMON BOLIVAR'),(1511,'19','01','10','PASCO','PASCO','TICLACAYAN'),(1512,'19','01','11','PASCO','PASCO','TINYAHUARCO'),(1513,'19','01','12','PASCO','PASCO','VICCO'),(1514,'19','01','13','PASCO','PASCO','YANACANCHA'),(1515,'19','02','01','PASCO','DANIEL ALCIDES CARRION','YANAHUANCA'),(1516,'19','02','02','PASCO','DANIEL ALCIDES CARRION','CHACAYAN'),(1517,'19','02','03','PASCO','DANIEL ALCIDES CARRION','GOYLLARISQUIZGA'),(1518,'19','02','04','PASCO','DANIEL ALCIDES CARRION','PAUCAR'),(1519,'19','02','05','PASCO','DANIEL ALCIDES CARRION','SAN PEDRO DE PILLAO'),(1520,'19','02','06','PASCO','DANIEL ALCIDES CARRION','SANTA ANA DE TUSI'),(1521,'19','02','07','PASCO','DANIEL ALCIDES CARRION','TAPUC'),(1522,'19','02','08','PASCO','DANIEL ALCIDES CARRION','VILCABAMBA'),(1523,'19','03','01','PASCO','OXAPAMPA','OXAPAMPA'),(1524,'19','03','02','PASCO','OXAPAMPA','CHONTABAMBA'),(1525,'19','03','03','PASCO','OXAPAMPA','HUANCABAMBA'),(1526,'19','03','04','PASCO','OXAPAMPA','PALCAZU'),(1527,'19','03','05','PASCO','OXAPAMPA','POZUZO'),(1528,'19','03','06','PASCO','OXAPAMPA','PUERTO BERMUDEZ'),(1529,'19','03','07','PASCO','OXAPAMPA','VILLA RICA'),(1530,'20','01','01','PIURA','PIURA','PIURA'),(1531,'20','01','04','PIURA','PIURA','CASTILLA'),(1532,'20','01','05','PIURA','PIURA','CATACAOS'),(1533,'20','01','07','PIURA','PIURA','CURA MORI'),(1534,'20','01','08','PIURA','PIURA','EL TALLAN'),(1535,'20','01','09','PIURA','PIURA','LA ARENA'),(1536,'20','01','10','PIURA','PUIRA','LA UNION'),(1537,'20','01','11','PIURA','PIURA','LAS LOMAS'),(1538,'20','01','14','PIURA','PIURA','TAMBO GRANDE'),(1539,'20','02','01','PIURA','AYABACA','AYABACA'),(1540,'20','02','02','PIURA','AYABACA','FRIAS'),(1541,'20','02','03','PIURA','AYABACA','JILILI'),(1542,'20','02','04','PIURA','AYABACA','LAGUNAS'),(1543,'20','02','05','PIURA','AYABACA','MONTERO'),(1544,'20','02','06','PIURA','AYABACA','PACAIPAMPA'),(1545,'20','02','07','PIURA','AYABACA','PAIMAS'),(1546,'20','02','08','PIURA','AYABACA','SAPILLICA'),(1547,'20','02','09','PIURA','AYABACA','SICCHEZ'),(1548,'20','02','10','PIURA','AYABACA','SUYO'),(1549,'20','03','01','PIURA','HUANCABAMBA','HUANCABAMBA'),(1550,'20','03','02','PIURA','HUANCABAMBA','CANCHAQUE'),(1551,'20','03','03','PIURA','HUANCABAMBA','EL CARMEN DE LA FRONTERA'),(1552,'20','03','04','PIURA','HUANCABAMBA','HUARMACA'),(1553,'20','03','05','PIURA','HUANCABAMBA','LALAQUIZ'),(1554,'20','03','06','PIURA','HUANCABAMBA','SAN MIGUEL DE EL FAIQUE'),(1555,'20','03','07','PIURA','HUANCABAMBA','SONDOR'),(1556,'20','03','08','PIURA','HUANCABAMBA','SONDORILLO'),(1557,'20','04','01','PIURA','MORROPON','CHULUCANAS'),(1558,'20','04','02','PIURA','MORROPON','BUENOS AIRES'),(1559,'20','04','03','PIURA','MORROPON','CHALACO'),(1560,'20','04','04','PIURA','MORROPON','LA MATANZA'),(1561,'20','04','05','PIURA','MORROPON','MORROPON'),(1562,'20','04','06','PIURA','MORROPON','SALITRAL'),(1563,'20','04','07','PIURA','MORROPON','SAN JUAN DE BIGOTE'),(1564,'20','04','08','PIURA','MORROPON','SANTA CATALINA DE MOSSA'),(1565,'20','04','09','PIURA','MORROPON','SANTO DOMINGO'),(1566,'20','04','10','PIURA','MORROPON','YAMANGO'),(1567,'20','05','01','PIURA','PAITA','PAITA'),(1568,'20','05','02','PIURA','PAITA','AMOTAPE'),(1569,'20','05','03','PIURA','PAITA','ARENAL'),(1570,'20','05','04','PIURA','PAITA','COLAN'),(1571,'20','05','05','PIURA','PAITA','LA HUACA'),(1572,'20','05','06','PIURA','PAITA','TAMARINDO'),(1573,'20','05','07','PIURA','PAITA','VICHAYAL'),(1574,'20','06','01','PIURA','SULLANA','SULLANA'),(1575,'20','06','02','PIURA','SULLANA','BELLAVISTA'),(1576,'20','06','03','PIURA','SULLANA','IGNACIO ESCUDERO'),(1577,'20','06','04','PIURA','SULLANA','LANCONES'),(1578,'20','06','05','PIURA','SULLANA','MARCAVELICA'),(1579,'20','06','06','PIURA','SULLANA','MIGUEL CHECA'),(1580,'20','06','07','PIURA','SULLANA','QUERECOTILLO'),(1581,'20','06','08','PIURA','SULLANA','SALITRAL'),(1582,'20','07','01','PIURA','TALARA','PARIÑAS'),(1583,'20','07','02','PIURA','TALARA','EL ALTO'),(1584,'20','07','03','PIURA','TALARA','LA BREA'),(1585,'20','07','04','PIURA','TALARA','LOBITOS'),(1586,'20','07','05','PIURA','TALARA','LOS ORGANOS'),(1587,'20','07','06','PIURA','TALARA','MANCORA'),(1588,'20','08','01','PIURA','SECHURA','SECHURA'),(1589,'20','08','02','PIURA','SECHURA','BELLAVISTA DE LA UNION'),(1590,'20','08','03','PIURA','SECHURA','BERNAL'),(1591,'20','08','04','PIURA','SECHURA','CRISTO NOS VALGA'),(1592,'20','08','05','PIURA','SECHURA','VICE'),(1593,'20','08','06','PIURA','SECHURA','RINCONADA LLICUAR'),(1594,'21','01','01','PUNO','PUNO','PUNO'),(1595,'21','01','02','PUNO','PUNO','ACORA'),(1596,'21','01','03','PUNO','PUNO','AMANTANI'),(1597,'21','01','04','PUNO','PUNO','ATUNCOLLA'),(1598,'21','01','05','PUNO','PUNO','CAPACHICA'),(1599,'21','01','06','PUNO','PUNO','CHUCUITO'),(1600,'21','01','07','PUNO','PUNO','COATA'),(1601,'21','01','08','PUNO','PUNO','HUATA'),(1602,'21','01','09','PUNO','PUNO','MAÑAZO'),(1603,'21','01','10','PUNO','PUNO','PAUCARCOLLA'),(1604,'21','01','11','PUNO','PUNO','PICHACANI'),(1605,'21','01','12','PUNO','PUNO','PLATERIA'),(1606,'21','01','13','PUNO','PUNO','SAN ANTONIO'),(1607,'21','01','14','PUNO','PUNO','TIQUILLACA'),(1608,'21','01','15','PUNO','PUNO','VILQUE'),(1609,'21','02','01','PUNO','AZANGARO','AZANGARO'),(1610,'21','02','02','PUNO','AZANGARO','ACHAYA'),(1611,'21','02','03','PUNO','AZANGARO','ARAPA'),(1612,'21','02','04','PUNO','AZANGARO','ASILLO'),(1613,'21','02','05','PUNO','AZANGARO','CAMINACA'),(1614,'21','02','06','PUNO','AZANGARO','CHUPA'),(1615,'21','02','07','PUNO','AZANGARO','JOSE DOMINGO CHOQUEHUANCA'),(1616,'21','02','08','PUNO','AZANGARO','MUÑANI'),(1617,'21','02','09','PUNO','AZANGARO','POTONI'),(1618,'21','02','10','PUNO','AZANGARO','SAMAN'),(1619,'21','02','11','PUNO','AZANGARO','SAN ANTON'),(1620,'21','02','12','PUNO','AZANGARO','SAN JOSE'),(1621,'21','02','13','PUNO','AZANGARO','SAN JUAN DE SALINAS'),(1622,'21','02','14','PUNO','AZANGARO','SANTIAGO DE PUPUJA'),(1623,'21','02','15','PUNO','AZANGARO','TIRAPATA'),(1624,'21','03','01','PUNO','CARABAYA','MACUSANI'),(1625,'21','03','02','PUNO','CARABAYA','AJOYANI'),(1626,'21','03','03','PUNO','CARABAYA','AYAPATA'),(1627,'21','03','04','PUNO','CARABAYA','COASA'),(1628,'21','03','05','PUNO','CARABAYA','CORANI'),(1629,'21','03','06','PUNO','CARABAYA','CRUCERO'),(1630,'21','03','07','PUNO','CARABAYA','ITUATA'),(1631,'21','03','08','PUNO','CARABAYA','OLLACHEA'),(1632,'21','03','09','PUNO','CARABAYA','SAN GABAN'),(1633,'21','03','10','PUNO','CARABAYA','USICAYOS'),(1634,'21','04','01','PUNO','CHUCUITO','JULI'),(1635,'21','04','02','PUNO','CHUCUITO','DESAGUADERO'),(1636,'21','04','03','PUNO','CHUCUITO','HUACULLANI'),(1637,'21','04','04','PUNO','CHUCUITO','KELLUYO'),(1638,'21','04','05','PUNO','CHUCUITO','PISACOMA'),(1639,'21','04','06','PUNO','CHUCUITO','POMATA'),(1640,'21','04','07','PUNO','CHUCUITO','ZEPITA'),(1641,'21','05','01','PUNO','EL COLLAO','ILAVE'),(1642,'21','05','02','PUNO','EL COLLAO','CAPAZO'),(1643,'21','05','03','PUNO','EL COLLAO','PILCUYO'),(1644,'21','05','04','PUNO','EL COLLAO','SANTA ROSA'),(1645,'21','05','05','PUNO','EL COLLAO','CONDURIRI'),(1646,'21','06','01','PUNO','HUANCANE','HUANCANE'),(1647,'21','06','02','PUNO','HUANCANE','COJATA'),(1648,'21','06','03','PUNO','HUANCANE','HUATASANI'),(1649,'21','06','04','PUNO','HUANCANE','INCHUPALLA'),(1650,'21','06','05','PUNO','HUANCANE','PUSI'),(1651,'21','06','06','PUNO','HUANCANE','ROSASPATA'),(1652,'21','06','07','PUNO','HUANCANE','TARACO'),(1653,'21','06','08','PUNO','HUANCANE','VILQUE CHICO'),(1654,'21','07','01','PUNO','LAMPA','LAMPA'),(1655,'21','07','02','PUNO','LAMPA','CABANILLA'),(1656,'21','07','03','PUNO','LAMPA','CALAPUJA'),(1657,'21','07','04','PUNO','LAMPA','NICASIO'),(1658,'21','07','05','PUNO','LAMPA','OCUVIRI'),(1659,'21','07','06','PUNO','LAMPA','PALCA'),(1660,'21','07','07','PUNO','LAMPA','PARATIA'),(1661,'21','07','08','PUNO','LAMPA','PUCARA'),(1662,'21','07','09','PUNO','LAMPA','SANTA LUCIA'),(1663,'21','07','10','PUNO','LAMPA','VILAVILA'),(1664,'21','08','01','PUNO','MELGAR','AYAVIRI'),(1665,'21','08','02','PUNO','MELGAR','ANTAUTA'),(1666,'21','08','03','PUNO','MELGAR','CUPI'),(1667,'21','08','04','PUNO','MELGAR','LLALLI'),(1668,'21','08','05','PUNO','MELGAR','MACARI'),(1669,'21','08','06','PUNO','MELGAR','NUÑOA'),(1670,'21','08','07','PUNO','MELGAR','ORURILLO'),(1671,'21','08','08','PUNO','MELGAR','SANTA ROSA'),(1672,'21','08','09','PUNO','MELGAR','UMACHIRI'),(1673,'21','09','01','PUNO','MOHO','MOHO'),(1674,'21','09','02','PUNO','MOHO','CONIMA'),(1675,'21','09','03','PUNO','MOHO','HUAYRAPATA'),(1676,'21','09','04','PUNO','MOHO','TILALI'),(1677,'21','10','01','PUNO','SAN ANTONIO DE PUTINA','PUTINA'),(1678,'21','10','02','PUNO','SAN ANTONIO DE PUTINA','ANANEA'),(1679,'21','10','03','PUNO','SAN ANTONIO DE PUTINA','PEDRO VILCA APAZA'),(1680,'21','10','04','PUNO','SAN ANTONIO DE PUTINA','QUILCAPUNCU'),(1681,'21','10','05','PUNO','SAN ANTONIO DE PUTINA','SINA'),(1682,'21','11','01','PUNO','SAN ROMAN','JULIACA'),(1683,'21','11','02','PUNO','SAN ROMAN','CABANA'),(1684,'21','11','03','PUNO','SAN ROMAN','CABANILLAS'),(1685,'21','11','04','PUNO','SAN ROMAN','CARACOTO'),(1686,'21','12','01','PUNO','SANDIA','SANDIA'),(1687,'21','12','02','PUNO','SANDIA','CUYOCUYO'),(1688,'21','12','03','PUNO','SANDIA','LIMBANI'),(1689,'21','12','04','PUNO','SANDIA','PATAMBUCO'),(1690,'21','12','05','PUNO','SANDIA','PHARA'),(1691,'21','12','06','PUNO','SANDIA','QUIACA'),(1692,'21','12','07','PUNO','SANDIA','SAN JUAN DEL ORO'),(1693,'21','12','08','PUNO','SANDIA','YANAHUAYA'),(1694,'21','12','09','PUNO','SANDIA','ALTO INAMBARI'),(1695,'21','12','10','PUNO','SANDIA','SAN PEDRO DE PUTINA PUNCO'),(1696,'21','13','01','PUNO','YUNGUYO','YUNGUYO'),(1697,'21','13','02','PUNO','YUNGUYO','ANAPIA'),(1698,'21','13','03','PUNO','YUNGUYO','COPANI'),(1699,'21','13','04','PUNO','YUNGUYO','CUTURAPI'),(1700,'21','13','05','PUNO','YUNGUYO','OLLARAYA'),(1701,'21','13','06','PUNO','YUNGUYO','TINICACHI'),(1702,'21','13','07','PUNO','YUNGUYO','UNICACHI'),(1703,'22','01','01','SAN MARTIN','MOYOBAMBA','MOYOBAMBA'),(1704,'22','01','02','SAN MARTIN','MOYOBAMBA','CALZADA'),(1705,'22','01','03','SAN MARTIN','MOYOBAMBA','HABANA'),(1706,'22','01','04','SAN MARTIN','MOYOBAMBA','JEPELACIO'),(1707,'22','01','05','SAN MARTIN','MOYOBAMBA','SORITOR'),(1708,'22','01','06','SAN MARTIN','MOYOBAMBA','YANTALO'),(1709,'22','02','01','SAN MARTIN','BELLAVISTA','BELLAVISTA'),(1710,'22','02','02','SAN MARTIN','BELLAVISTA','ALTO BIAVO'),(1711,'22','02','03','SAN MARTIN','BELLAVISTA','BAJO BIAVO'),(1712,'22','02','04','SAN MARTIN','BELLAVISTA','HUALLAGA'),(1713,'22','02','05','SAN MARTIN','BELLAVISTA','SAN PABLO'),(1714,'22','02','06','SAN MARTIN','BELLAVISTA','SAN RAFAEL'),(1715,'22','03','01','SAN MARTIN','EL DORADO','SAN JOSE DE SISA'),(1716,'22','03','02','SAN MARTIN','EL DORADO','AGUA BLANCA'),(1717,'22','03','03','SAN MARTIN','EL DORADO','SAN MARTIN'),(1718,'22','03','04','SAN MARTIN','EL DORADO','SANTA ROSA'),(1719,'22','03','05','SAN MARTIN','EL DORADO','SHATOJA'),(1720,'22','04','01','SAN MARTIN','HUALLAGA','SAPOSOA'),(1721,'22','04','02','SAN MARTIN','HUALLAGA','ALTO SAPOSOA'),(1722,'22','04','03','SAN MARTIN','HUALLAGA','EL ESLABON'),(1723,'22','04','04','SAN MARTIN','HUALLAGA','PISCOYACU'),(1724,'22','04','05','SAN MARTIN','HUALLAGA','SACANCHE'),(1725,'22','04','06','SAN MARTIN','HUALLAGA','TINGO DE SAPOSOA'),(1726,'22','05','01','SAN MARTIN','LAMAS','LAMAS'),(1727,'22','05','02','SAN MARTIN','LAMAS','ALONSO DE ALVARADO'),(1728,'22','05','03','SAN MARTIN','LAMAS','BARRANQUITA'),(1729,'22','05','04','SAN MARTIN','LAMAS','CAYNARACHI'),(1730,'22','05','05','SAN MARTIN','LAMAS','CUÑUMBUQUI'),(1731,'22','05','06','SAN MARTIN','LAMAS','PINTO RECODO'),(1732,'22','05','07','SAN MARTIN','LAMAS','RUMISAPA'),(1733,'22','05','08','SAN MARTIN','LAMAS','SAN ROQUE DE CUMBAZA'),(1734,'22','05','09','SAN MARTIN','LAMAS','SHANAO'),(1735,'22','05','10','SAN MARTIN','LAMAS','TABALOSOS'),(1736,'22','05','11','SAN MARTIN','LAMAS','ZAPATERO'),(1737,'22','06','01','SAN MARTIN','MARISCAL CACERES','JUANJUI'),(1738,'22','06','02','SAN MARTIN','MARISCAL CACERES','CAMPANILLA'),(1739,'22','06','03','SAN MARTIN','MARISCAL CACERES','HUICUNGO'),(1740,'22','06','04','SAN MARTIN','MARISCAL CACERES','PACHIZA'),(1741,'22','06','05','SAN MARTIN','MARISCAL CACERES','PAJARILLO'),(1742,'22','07','01','SAN MARTIN','PICOTA','PICOTA'),(1743,'22','07','02','SAN MARTIN','PICOTA','BUENOS AIRES'),(1744,'22','07','03','SAN MARTIN','PICOTA','CASPISAPA'),(1745,'22','07','04','SAN MARTIN','PICOTA','PILLUANA'),(1746,'22','07','05','SAN MARTIN','PICOTA','PUCACACA'),(1747,'22','07','06','SAN MARTIN','PICOTA','SAN CRISTOBAL'),(1748,'22','07','07','SAN MARTIN','PICOTA','SAN HILARION'),(1749,'22','07','08','SAN MARTIN','PICOTA','SHAMBOYACU'),(1750,'22','07','09','SAN MARTIN','PICOTA','TINGO DE PONASA'),(1751,'22','07','10','SAN MARTIN','PICOTA','TRES UNIDOS'),(1752,'22','08','01','SAN MARTIN','RIOJA','RIOJA'),(1753,'22','08','02','SAN MARTIN','RIOJA','AWAJUN'),(1754,'22','08','03','SAN MARTIN','RIOJA','ELIAS SOPLIN VARGAS'),(1755,'22','08','04','SAN MARTIN','RIOJA','NUEVA CAJAMARCA'),(1756,'22','08','05','SAN MARTIN','RIOJA','PARDO MIGUEL'),(1757,'22','08','06','SAN MARTIN','RIOJA','POSIC'),(1758,'22','08','07','SAN MARTIN','RIOJA','SAN FERNANDO'),(1759,'22','08','08','SAN MARTIN','RIOJA','YORONGOS'),(1760,'22','08','09','SAN MARTIN','RIOJA','YURACYACU'),(1761,'22','09','01','SAN MARTIN','SAN MARTIN','TARAPOTO'),(1762,'22','09','02','SAN MARTIN','SAN MARTIN','ALBERTO LEVEAU'),(1763,'22','09','03','SAN MARTIN','SAN MARTIN','CACATACHI'),(1764,'22','09','04','SAN MARTIN','SAN MARTIN','CHAZUTA'),(1765,'22','09','05','SAN MARTIN','SAN MARTIN','CHIPURANA'),(1766,'22','09','06','SAN MARTIN','SAN MARTIN','EL PORVENIR'),(1767,'22','09','07','SAN MARTIN','SAN MARTIN','HUIMBAYOC'),(1768,'22','09','08','SAN MARTIN','SAN MARTIN','JUAN GUERRA'),(1769,'22','09','09','SAN MARTIN','SAN MARTIN','LA BANDA DE SHILCAYO'),(1770,'22','09','10','SAN MARTIN','SAN MARTIN','MORALES'),(1771,'22','09','11','SAN MARTIN','SAN MARTIN','PAPAPLAYA'),(1772,'22','09','12','SAN MARTIN','SAN MARTIN','SAN ANTONIO'),(1773,'22','09','13','SAN MARTIN','SAN MARTIN','SAUCE'),(1774,'22','09','14','SAN MARTIN','SAN MARTIN','SHAPAJA'),(1775,'22','10','01','SAN MARTIN','TOCACHE','TOCACHE'),(1776,'22','10','02','SAN MARTIN','TOCACHE','NUEVO PROGRESO'),(1777,'22','10','03','SAN MARTIN','TOCACHE','POLVORA'),(1778,'22','10','04','SAN MARTIN','TOCACHE','SHUNTE'),(1779,'22','10','05','SAN MARTIN','TOCACHE','UCHIZA'),(1780,'23','01','01','TACNA','TACNA','TACNA'),(1781,'23','01','02','TACNA','TACNA','ALTO DE LA ALIANZA'),(1782,'23','01','03','TACNA','TACNA','CALANA'),(1783,'23','01','04','TACNA','TACNA','CIUDAD NUEVA'),(1784,'23','01','05','TACNA','TACNA','INCLAN'),(1785,'23','01','06','TACNA','TACNA','PACHIA'),(1786,'23','01','07','TACNA','TACNA','PALCA'),(1787,'23','01','08','TACNA','TACNA','POCOLLAY'),(1788,'23','01','09','TACNA','TACNA','SAMA'),(1789,'23','01','10','TACNA','TACNA','CORONEL GREGORIO ALBARRACIN LANCHIPA'),(1790,'23','02','01','TACNA','CANDARAVE','CANDARAVE'),(1791,'23','02','02','TACNA','CANDARAVE','CAIRANI'),(1792,'23','02','03','TACNA','CANDARAVE','CAMILACA'),(1793,'23','02','04','TACNA','CANDARAVE','CURIBAYA'),(1794,'23','02','05','TACNA','CANDARAVE','HUANUARA'),(1795,'23','02','06','TACNA','CANDARAVE','QUILAHUANI'),(1796,'23','03','01','TACNA','JORGE BASADRE','LOCUMBA'),(1797,'23','03','02','TACNA','JORGE BASADRE','ILABAYA'),(1798,'23','03','03','TACNA','JORGE BASADRE','ITE'),(1799,'23','04','01','TACNA','TARATA','TARATA'),(1800,'23','04','02','TACNA','TARATA','HEROES ALBARRACIN'),(1801,'23','04','03','TACNA','TARATA','ESTIQUE'),(1802,'23','04','04','TACNA','TARATA','ESTIQUE-PAMPA'),(1803,'23','04','05','TACNA','TARATA','SITAJARA'),(1804,'23','04','06','TACNA','TARATA','SUSAPAYA'),(1805,'23','04','07','TACNA','TARATA','TARUCACHI'),(1806,'23','04','08','TACNA','TARATA','TICACO'),(1807,'24','01','01','TUMBES','TUMBES','TUMBES'),(1808,'24','01','02','TUMBES','TUMBES','CORRALES'),(1809,'24','01','03','TUMBES','TUMBES','LA CRUZ'),(1810,'24','01','04','TUMBES','TUMBES','PAMPAS DE HOSPITAL'),(1811,'24','01','05','TUMBES','TUMBES','SAN JACINTO'),(1812,'24','01','06','TUMBES','TUMBES','SAN JUAN DE LA VIRGEN'),(1813,'24','02','01','TUMBES','CONTRALMIRANTE VILLAR','ZORRITOS'),(1814,'24','02','02','TUMBES','CONTRALMIRANTE VILLAR','CASITAS'),(1815,'24','02','03','TUMBES','CONTRALMIRANTE VILLAR','CANOAS DE PUNTA SAL'),(1816,'24','03','01','TUMBES','ZARUMILLA','ZARUMILLA'),(1817,'24','03','02','TUMBES','ZARUMILLA','AGUAS VERDES'),(1818,'24','03','03','TUMBES','ZARUMILLA','MATAPALO'),(1819,'24','03','04','TUMBES','ZARUMILLA','PAPAYAL'),(1820,'25','01','01','UCAYALI','CORONEL PORTILLO','CALLERIA'),(1821,'25','01','02','UCAYALI','CORONEL PORTILLO','CAMPOVERDE'),(1822,'25','01','03','UCAYALI','CORONEL PORTILLO','IPARIA'),(1823,'25','01','04','UCAYALI','CORONEL PORTILLO','MASISEA'),(1824,'25','01','05','UCAYALI','CORONEL PORTILLO','YARINACOCHA'),(1825,'25','01','06','UCAYALI','CORONEL PORTILLO','NUEVA REQUENA'),(1826,'25','02','01','UCAYALI','ATALAYA','RAYMONDI'),(1827,'25','02','02','UCAYALI','ATALAYA','SEPAHUA'),(1828,'25','02','03','UCAYALI','ATALAYA','TAHUANIA'),(1829,'25','02','04','UCAYALI','ATALAYA','YURUA'),(1830,'25','03','01','UCAYALI','PADRE ABAD','PADRE ABAD'),(1831,'25','03','02','UCAYALI','PADRE ABAD','IRAZOLA'),(1832,'25','03','03','UCAYALI','PADRE ABAD','CURIMANA'),(1833,'25','04','01','UCAYALI','PURUS','PURUS');
/*!40000 ALTER TABLE `ubigeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidoPaterno` varchar(45) NOT NULL,
  `apellidoMaterno` varchar(45) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `nroDocumento` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `idRol` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Rol1_idx` (`idRol`),
  KEY `fk_Usuario_Doc_idx` (`idTipoDocumento`),
  CONSTRAINT `fk_Usuario_Doc` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Jhon','Cruzado','Rivera',1,'70311608','admin','123',1,'jhon@gmail.com'),(2,'Nicolas','Hidalgo','Correa',1,'72817281','recep','123',2,'nico@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'panderonico'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-07 10:38:27

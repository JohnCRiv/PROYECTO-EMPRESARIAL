CREATE DATABASE  IF NOT EXISTS `aulavirtual`;
USE `aulavirtual`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: aulavirtual
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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `idalumno` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidopaterno` varchar(45) NOT NULL,
  `apellidomaterno` varchar(45) NOT NULL,
  `numerodocumento` varchar(45) NOT NULL,
  `fechanacimiento` date NOT NULL,
  PRIMARY KEY (`idalumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES ('ALU-12345678','Alumno','Alumno','Alumno','12345678','2016-01-14');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_curso`
--

DROP TABLE IF EXISTS `alumno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_curso` (
  `idalumno` varchar(45) NOT NULL,
  `idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idalumno`,`idcurso`),
  KEY `fk_alumno_curso_curso_idx` (`idcurso`),
  KEY `fk_alumno_curso_alumno1_idx` (`idalumno`),
  CONSTRAINT `fk_alumno_curso_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_curso_curso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_curso`
--

LOCK TABLES `alumno_curso` WRITE;
/*!40000 ALTER TABLE `alumno_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_examen`
--

DROP TABLE IF EXISTS `alumno_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_examen` (
  `idalumno` varchar(45) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idalumno`,`idcurso`,`idexamen`),
  KEY `fk_alumno_examen_alumno_curso1_idx` (`idalumno`,`idcurso`),
  KEY `fk_alumno_examen_examen1_idx` (`idexamen`),
  CONSTRAINT `fk_alumno_examen_alumno_curso1` FOREIGN KEY (`idalumno`, `idcurso`) REFERENCES `alumno_curso` (`idalumno`, `idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_examen_examen1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_examen`
--

LOCK TABLES `alumno_examen` WRITE;
/*!40000 ALTER TABLE `alumno_examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_respuesta`
--

DROP TABLE IF EXISTS `alumno_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_respuesta` (
  `idalumno` varchar(45) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL,
  `texto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idalumno`,`idcurso`,`idexamen`,`idpregunta`,`idopcion`),
  KEY `fk_alumno_respuesta_alumno_examen1_idx` (`idalumno`,`idcurso`,`idexamen`),
  KEY `fk_alumno_respuesta_pregunta1_idx` (`idpregunta`),
  CONSTRAINT `fk_alumno_respuesta_alumno_examen1` FOREIGN KEY (`idalumno`, `idcurso`, `idexamen`) REFERENCES `alumno_examen` (`idalumno`, `idcurso`, `idexamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_respuesta_pregunta1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_respuesta`
--

LOCK TABLES `alumno_respuesta` WRITE;
/*!40000 ALTER TABLE `alumno_respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `creditos` int(11) NOT NULL,
  `horasteoria` int(11) NOT NULL,
  `horaslaboratorio` int(11) NOT NULL,
  `horastotal` int(11) NOT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Introducción a la Algoritmia',6,2,4,6),(2,'Matematica I',3,2,0,2),(3,'Algoritmos y Estructura de Datos',6,2,4,6),(4,'Ética Profesional',2,2,0,2),(5,'Matematica II',4,2,0,2),(6,'Proyecto Empresarial',6,0,4,4),(7,'Proyecto de Investigación e Innovación Tecnológica',6,0,4,4),(8,'Administración I',4,3,0,3),(9,'Inglés I',6,4,0,4),(10,'Ingles II',6,4,0,4);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_examen`
--

DROP TABLE IF EXISTS `curso_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_examen` (
  `idcurso` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  PRIMARY KEY (`idcurso`,`idexamen`),
  KEY `fk_curso_examen_curso1_idx` (`idcurso`),
  KEY `fk_curso_examen_examen1_idx` (`idexamen`),
  CONSTRAINT `fk_curso_examen_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_examen_examen1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_examen`
--

LOCK TABLES `curso_examen` WRITE;
/*!40000 ALTER TABLE `curso_examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_pregunta`
--

DROP TABLE IF EXISTS `curso_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_pregunta` (
  `idcurso` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  PRIMARY KEY (`idcurso`,`idpregunta`),
  KEY `fk_curso_pregunta_curso1_idx` (`idcurso`),
  KEY `fk_curso_pregunta_pregunta1_idx` (`idpregunta`),
  CONSTRAINT `fk_curso_pregunta_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_pregunta_pregunta1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_pregunta`
--

LOCK TABLES `curso_pregunta` WRITE;
/*!40000 ALTER TABLE `curso_pregunta` DISABLE KEYS */;
INSERT INTO `curso_pregunta` VALUES (3,8),(3,9),(3,10),(6,1),(6,2),(6,3),(6,4),(6,5),(8,6),(8,7);
/*!40000 ALTER TABLE `curso_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidopaterno` varchar(45) NOT NULL,
  `apellidomaterno` varchar(45) NOT NULL,
  `numerodocumento` varchar(45) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `idsede` int(11) NOT NULL,
  PRIMARY KEY (`iddocente`,`idsede`),
  KEY `fk_docente_sede1_idx` (`idsede`),
  CONSTRAINT `fk_docente_sede1` FOREIGN KEY (`idsede`) REFERENCES `sede` (`idsede`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (11,'Docente','Docente','Docente','87654321','2016-11-23',1);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_curso`
--

DROP TABLE IF EXISTS `docente_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente_curso` (
  `iddocente` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  PRIMARY KEY (`iddocente`,`idcurso`),
  KEY `fk_docente_has_curso_curso1_idx` (`idcurso`),
  KEY `fk_docente_has_curso_docente1_idx` (`iddocente`),
  CONSTRAINT `fk_docente_has_curso_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_has_curso_docente1` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_curso`
--

LOCK TABLES `docente_curso` WRITE;
/*!40000 ALTER TABLE `docente_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enlace`
--

DROP TABLE IF EXISTS `enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enlace` (
  `idenlace` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `ruta` varchar(45) NOT NULL,
  `icono` varchar(45) NOT NULL,
  PRIMARY KEY (`idenlace`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enlace`
--

LOCK TABLES `enlace` WRITE;
/*!40000 ALTER TABLE `enlace` DISABLE KEYS */;
INSERT INTO `enlace` VALUES (1,'Sedes','Sede','home'),(2,'Docentes','Docente','pencil'),(3,'Cursos','Curso','book'),(4,'Alumnos','Alumno','education'),(5,'Enlaces','Enlace','link'),(6,'Roles','Rol','tag'),(7,'Usuarios','Usuario','user'),(8,'Mis Cursos (Docente)','CursosDocente','book'),(9,'Mis Cursos (Alumno)','CursosAlumno','book');
/*!40000 ALTER TABLE `enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen` (
  `idexamen` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`idexamen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen_pregunta`
--

DROP TABLE IF EXISTS `examen_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen_pregunta` (
  `idcurso` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL,
  PRIMARY KEY (`idcurso`,`idexamen`,`idpregunta`),
  KEY `fk_examen_pregunta_curso_examen1_idx` (`idcurso`,`idexamen`),
  KEY `fk_examen_pregunta_pregunta1_idx` (`idpregunta`),
  CONSTRAINT `fk_examen_pregunta_curso_examen1` FOREIGN KEY (`idcurso`, `idexamen`) REFERENCES `curso_examen` (`idcurso`, `idexamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examen_pregunta_pregunta1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen_pregunta`
--

LOCK TABLES `examen_pregunta` WRITE;
/*!40000 ALTER TABLE `examen_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`idpregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'¿Quién descubrió América?'),(2,'¿Si 1 + 1 = 2 y 2 + 2 = 4 , Cuál es la masa del sol?'),(3,'¿En que año se inventó la bicicleta?'),(4,'Si ayer fue martes y pasado mañana es jueves ¿Que día es hoy?'),(5,'Si tengo 3 manzanas y me como 1 ¿Cuántas manzanas quedan?'),(6,'¿ De qué color era el caballo blanco de Alfonso Ugarte ?'),(7,'¿ Donde vivía el chavo ?'),(8,'¿ Cuántos años tiene chabelo ?'),(9,'¿ En que año se extinguieron los dinosaurios ?'),(10,'¿ Cuantos años lleva Alianza Lima sin campeonar ?');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta_opcion`
--

DROP TABLE IF EXISTS `pregunta_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta_opcion` (
  `idcurso` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `estexto` varchar(45) NOT NULL,
  `esrespuesta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idopcion`,`idpregunta`,`idcurso`),
  KEY `fk_pregunta_opcion_curso_pregunta1_idx` (`idcurso`,`idpregunta`),
  CONSTRAINT `fk_pregunta_opcion_curso_pregunta1` FOREIGN KEY (`idcurso`, `idpregunta`) REFERENCES `curso_pregunta` (`idcurso`, `idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_opcion`
--

LOCK TABLES `pregunta_opcion` WRITE;
/*!40000 ALTER TABLE `pregunta_opcion` DISABLE KEYS */;
INSERT INTO `pregunta_opcion` VALUES (6,1,1,'Elver Galarza','N','N'),(6,2,1,'Incalculable','N','N'),(6,3,1,'1789','N','N'),(6,4,1,'Un día de Miércoles','N','S'),(6,5,1,'Quedan 2','N','S'),(8,6,1,'Negro','N','N'),(8,7,1,'En el 5','N','N'),(3,8,1,'Indeterminado','N','N'),(3,9,1,'65 000 000 a.c (aprox)','N','S'),(3,10,1,'Jacinto lo sabe','N','N'),(6,1,2,'Cristobal Colon','N','S'),(6,2,2,'Infinito','N','N'),(6,3,2,'1889','N','N'),(6,4,2,'Perdí la noción del tiempo','N','N'),(6,5,2,'Ninguna me comí todas','N','N'),(8,6,2,'Blanco','N','S'),(8,7,2,'En el 9','N','N'),(3,8,2,'67','N','S'),(3,9,2,'La respuesta está en tu corazón <3','N','N'),(3,10,2,'10 años','N','S'),(6,1,3,'Aguilar','N','N'),(6,2,3,'La Nasa lo sabe','N','S'),(6,3,3,'1817','N','S'),(6,4,3,'Jueves de pavita','N','N'),(6,5,3,'No c, weno zi c peo no t wa dezir','N','N'),(8,6,3,'Negro tirando pa\' blanco','N','N'),(8,7,3,'En el 8','N','S'),(3,8,3,'Solo dios lo sabe','N','N'),(3,9,3,'Mi abuelita lo sabe','N','N'),(3,10,3,'Se viene el quino','N','N');
/*!40000 ALTER TABLE `pregunta_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (20,'Administrador'),(21,'Alumno'),(22,'Docente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolenlace`
--

DROP TABLE IF EXISTS `rolenlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolenlace` (
  `idrol` int(11) NOT NULL,
  `idenlace` int(11) NOT NULL,
  PRIMARY KEY (`idrol`,`idenlace`),
  KEY `fk_rol_has_enlace_enlace1_idx` (`idenlace`),
  KEY `fk_rol_has_enlace_rol1_idx` (`idrol`),
  CONSTRAINT `fk_rol_has_enlace_enlace1` FOREIGN KEY (`idenlace`) REFERENCES `enlace` (`idenlace`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_enlace_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolenlace`
--

LOCK TABLES `rolenlace` WRITE;
/*!40000 ALTER TABLE `rolenlace` DISABLE KEYS */;
INSERT INTO `rolenlace` VALUES (20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(22,8),(21,9);
/*!40000 ALTER TABLE `rolenlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `idsede` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `representante` varchar(45) NOT NULL,
  `fechainaguracion` date NOT NULL,
  PRIMARY KEY (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Sede Miraflores','Av. Diez Canseco','281-2717','Representante 1','1996-01-08'),(2,'Sede Independencia','Av. Izaguirre','416-1717','Representante 2','1996-01-09'),(3,'Sede San Miguel','Av. San Miguel','271-2312','Representante 3','2016-01-16');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidopaterno` varchar(45) NOT NULL,
  `apellidomaterno` varchar(45) NOT NULL,
  `numerodocumento` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idrol`),
  KEY `fk_usuario_rol1_idx` (`idrol`),
  CONSTRAINT `fk_usuario_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Jhon Angel','Cruzado','Rivera','70311608','admin','123',20),(3,'Alumno','Alumno','Alumno','12345678','12345678','123',21),(4,'Docente','Docente','Docente','87654321','87654321','123',22);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27 21:38:03

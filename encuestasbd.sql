-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: encuastas
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
-- Table structure for table `aplicacionencuesta`
--

DROP TABLE IF EXISTS `aplicacionencuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicacionencuesta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `IdEncuesta` int NOT NULL,
  `FechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdEncuesta` (`IdEncuesta`),
  CONSTRAINT `aplicacionencuesta_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `aplicacionencuesta_ibfk_2` FOREIGN KEY (`IdEncuesta`) REFERENCES `encuesta` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacionencuesta`
--

LOCK TABLES `aplicacionencuesta` WRITE;
/*!40000 ALTER TABLE `aplicacionencuesta` DISABLE KEYS */;
INSERT INTO `aplicacionencuesta` VALUES (1,1,1,'2025-06-16 07:55:11','2026-06-16 07:55:11');
/*!40000 ALTER TABLE `aplicacionencuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallerespuesta`
--

DROP TABLE IF EXISTS `detallerespuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallerespuesta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdRespuesta` int NOT NULL,
  `IdPregunta` int NOT NULL,
  `Valor` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdRespuesta` (`IdRespuesta`),
  KEY `IdPregunta` (`IdPregunta`),
  CONSTRAINT `detallerespuesta_ibfk_1` FOREIGN KEY (`IdRespuesta`) REFERENCES `respuesta` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `detallerespuesta_ibfk_2` FOREIGN KEY (`IdPregunta`) REFERENCES `pregunta` (`Id`),
  CONSTRAINT `detallerespuesta_chk_1` CHECK ((`Valor` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallerespuesta`
--

LOCK TABLES `detallerespuesta` WRITE;
/*!40000 ALTER TABLE `detallerespuesta` DISABLE KEYS */;
INSERT INTO `detallerespuesta` VALUES (1,1,1,5);
/*!40000 ALTER TABLE `detallerespuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdUsuario` int NOT NULL,
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'dfdf',1,'2025-06-15 02:17:04'),(2,'hola',1,'2025-06-15 04:11:30'),(3,'ds',1,'2025-06-15 21:35:48');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Texto` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdEncuesta` int NOT NULL,
  `Orden` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdEncuesta` (`IdEncuesta`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`IdEncuesta`) REFERENCES `encuesta` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `pregunta_chk_1` CHECK ((`Orden` between 1 and 10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'fd',1,1),(2,'?',2,1),(3,'f',3,1),(4,'f',3,2),(5,'ff',3,3);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdAplicacion` int NOT NULL,
  `NumControlAlumno` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NombreAlumno` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `IdAplicacion` (`IdAplicacion`),
  CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`IdAplicacion`) REFERENCES `aplicacionencuesta` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,1,'dd222222','karla','2025-06-16 07:55:11');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numControl` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contraseña` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `numControl` (`numControl`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','00000001','admin');
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

-- Dump completed on 2025-06-16 11:09:31

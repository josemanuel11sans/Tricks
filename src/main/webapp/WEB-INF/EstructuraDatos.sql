CREATE DATABASE  IF NOT EXISTS `tricks` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tricks`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tricks
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
                               `id_asistencia` int NOT NULL,
                               `fecha` date DEFAULT NULL,
                               `presente` varchar(10) DEFAULT NULL,
                               `aspirante_folio_aspirante` varchar(10) DEFAULT NULL,
                               PRIMARY KEY (`id_asistencia`),
                               KEY `aspirante_folio_aspirante` (`aspirante_folio_aspirante`),
                               CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`aspirante_folio_aspirante`) REFERENCES `aspirantes` (`folio_aspirante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` VALUES (1,'2024-06-01','Sí','AA1'),(2,'2024-06-01','No','AA2'),(3,'2024-06-01','Sí','AA3'),(4,'2024-06-02','Sí','AE1'),(5,'2024-06-02','Sí','AE2'),(6,'2024-06-02','No','AE3'),(7,'2024-06-03','Sí','AF1'),(8,'2024-06-03','Sí','AF2'),(9,'2024-06-03','No','AF3'),(10,'2024-06-04','Sí','AJ1'),(11,'2024-06-04','No','AJ2'),(12,'2024-06-04','Sí','AJ3'),(13,'2024-06-05','Sí','AK1'),(14,'2024-06-05','No','AK2'),(15,'2024-06-05','Sí','AK3'),(16,'2024-06-06','Sí','AO1'),(17,'2024-06-06','Sí','AO2'),(18,'2024-06-06','No','AO3'),(19,'2024-06-07','Sí','AP1'),(20,'2024-06-07','Sí','AP2'),(21,'2024-06-07','No','AP3'),(22,'2024-06-08','Sí','AT1'),(23,'2024-06-08','Sí','AT2'),(24,'2024-06-08','No','AT3'),(25,'2024-06-09','Sí','AU1'),(26,'2024-06-09','Sí','AU2'),(27,'2024-06-09','No','AU3'),(28,'2024-06-10','Sí','AY1'),(29,'2024-06-10','Sí','AY2'),(30,'2024-06-10','No','AY3'),(31,'2024-06-11','Sí','AZ1'),(32,'2024-06-11','Sí','AZ2'),(33,'2024-06-11','No','AZ3'),(34,'2024-06-12','Sí','B1'),(35,'2024-06-12','Sí','B2'),(36,'2024-06-12','No','B3'),(37,'2024-06-13','Sí','F1'),(38,'2024-06-13','Sí','F2'),(39,'2024-06-13','No','F3'),(40,'2024-06-14','Sí','G1'),(41,'2024-06-14','Sí','G2'),(42,'2024-06-14','No','G3'),(43,'2024-06-15','Sí','K1'),(44,'2024-06-15','Sí','K2'),(45,'2024-06-15','No','K3'),(46,'2024-06-16','Sí','L1'),(47,'2024-06-16','Sí','L2'),(48,'2024-06-16','No','L3'),(49,'2024-06-17','Sí','P1'),(50,'2024-06-17','Sí','P2'),(51,'2024-06-17','No','P3'),(52,'2024-06-18','Sí','Q1'),(53,'2024-06-18','Sí','Q2'),(54,'2024-06-18','No','Q3'),(55,'2024-06-19','Sí','U1'),(56,'2024-06-19','Sí','U2'),(57,'2024-06-19','No','U3'),(58,'2024-06-20','Sí','V1'),(59,'2024-06-20','Sí','V2'),(60,'2024-06-20','No','V3'),(61,'2024-06-21','Sí','Z1'),(62,'2024-06-21','Sí','Z2'),(63,'2024-06-21','No','Z3');
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirantes`
--

DROP TABLE IF EXISTS `aspirantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspirantes` (
                              `folio_aspirante` varchar(10) NOT NULL,
                              `nombre` varchar(50) DEFAULT NULL,
                              `apellido` varchar(50) DEFAULT NULL,
                              `curp` varchar(25) DEFAULT NULL,
                              `estado` int DEFAULT NULL,
                              `fecha_nac` datetime DEFAULT NULL,
                              `grupos_id_grupo` int DEFAULT NULL,
                              `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (`folio_aspirante`),
                              KEY `grupos_id_grupo` (`grupos_id_grupo`),
                              CONSTRAINT `aspirantes_ibfk_2` FOREIGN KEY (`grupos_id_grupo`) REFERENCES `grupos` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirantes`
--

LOCK TABLES `aspirantes` WRITE;
/*!40000 ALTER TABLE `aspirantes` DISABLE KEYS */;
INSERT INTO `aspirantes` VALUES ('A1','Juan','Pérez','PERJ920521HDFRRN07',1,'1992-05-21 00:00:00',1,'2024-07-13 00:42:27'),('A2','María','Gómez','GOMM871015MDFRRN09',2,'1987-10-15 00:00:00',1,'2024-07-13 00:42:27'),('A3','Carlos','Martínez','MARC900702GTMRTL08',1,'1990-07-02 00:00:00',1,'2024-07-13 00:42:27'),('AA1','Mariano','Gómez','GOMM920420MDFRMN07',1,'1992-04-20 00:00:00',27,'2024-07-13 00:42:27'),('AA2','Cecilia','Ramírez','RAMC900701GTMCLS08',1,'1990-07-01 00:00:00',27,'2024-07-13 00:42:27'),('AA3','Arturo','Martínez','MARA950212HDFRTR03',1,'1995-02-12 00:00:00',27,'2024-07-13 00:42:27'),('AE1','Juan','González','GONJ920521HDFRLL07',1,'1992-05-21 00:00:00',31,'2024-07-13 00:42:27'),('AE2','Ana','Martínez','MARA871015MDFRRA09',1,'1987-10-15 00:00:00',31,'2024-07-13 00:42:27'),('AE3','Pedro','Hernández','HERP900702GTMPTR08',1,'1990-07-02 00:00:00',31,'2024-07-13 00:42:27'),('AF1','María','López','LOPM880320MDFRLR01',1,'1988-03-20 00:00:00',32,'2024-07-13 00:42:27'),('AF2','Jorge','Castro','CASJ910505MDFRTR04',1,'1991-05-05 00:00:00',32,'2024-07-13 00:42:27'),('AF3','Sofía','Gómez','GOMS950215GTMSFN02',1,'1995-02-15 00:00:00',32,'2024-07-13 00:42:27'),('AJ1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',36,'2024-07-13 00:42:27'),('AJ2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',36,'2024-07-13 00:42:27'),('AJ3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',36,'2024-07-13 00:42:27'),('AK1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',37,'2024-07-13 00:42:27'),('AK2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',37,'2024-07-13 00:42:27'),('AK3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',37,'2024-07-13 00:42:27'),('AO1','Diana','López','LOPD910510MDFRDN01',1,'1991-05-10 00:00:00',41,'2024-07-13 00:42:27'),('AO2','Javier','Castro','CAJJ900803GTMVCR04',1,'1990-08-03 00:00:00',41,'2024-07-13 00:42:27'),('AO3','Adriana','Sánchez','SANA950705HDFRAD09',1,'1995-07-05 00:00:00',41,'2024-07-13 00:42:27'),('AP1','Mariano','Gómez','GOMM920420MDFRMN07',1,'1992-04-20 00:00:00',42,'2024-07-13 00:42:27'),('AP2','Cecilia','Ramírez','RAMC900701GTMCLS08',1,'1990-07-01 00:00:00',42,'2024-07-13 00:42:27'),('AP3','Arturo','Martínez','MARA950212HDFRTR03',1,'1995-02-12 00:00:00',42,'2024-07-13 00:42:27'),('AT1','Juan','González','GONJ920521HDFRLL07',1,'1992-05-21 00:00:00',46,'2024-07-13 00:42:27'),('AT2','Ana','Martínez','MARA871015MDFRRA09',1,'1987-10-15 00:00:00',46,'2024-07-13 00:42:27'),('AT3','Pedro','Hernández','HERP900702GTMPTR08',1,'1990-07-02 00:00:00',46,'2024-07-13 00:42:27'),('AU1','María','López','LOPM880320MDFRLR01',1,'1988-03-20 00:00:00',47,'2024-07-13 00:42:27'),('AU2','Jorge','Castro','CASJ910505MDFRTR04',1,'1991-05-05 00:00:00',47,'2024-07-13 00:42:27'),('AU3','Sofía','Gómez','GOMS950215GTMSFN02',1,'1995-02-15 00:00:00',47,'2024-07-13 00:42:27'),('AY1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',51,'2024-07-13 00:42:27'),('AY2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',51,'2024-07-13 00:42:27'),('AY3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',51,'2024-07-13 00:42:27'),('AZ1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',52,'2024-07-13 00:42:27'),('AZ2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',52,'2024-07-13 00:42:27'),('AZ3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',52,'2024-07-13 00:42:27'),('B1','Laura','García','GARL880320MDFCLR01',1,'1988-03-20 00:00:00',2,'2024-07-13 00:42:27'),('B2','Pedro','López','LOPP910505MDFPTR04',1,'1991-05-05 00:00:00',2,'2024-07-13 00:42:27'),('B3','Ana','Hernández','HERA950215GTMNNA02',1,'1995-02-15 00:00:00',2,'2024-07-13 00:42:27'),('F1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',6,'2024-07-13 00:42:27'),('F2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',6,'2024-07-13 00:42:27'),('F3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',6,'2024-07-13 00:42:27'),('G1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',7,'2024-07-13 00:42:27'),('G2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',7,'2024-07-13 00:42:27'),('G3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',7,'2024-07-13 00:42:27'),('K1','Diana','López','LOPD910510MDFRDN01',1,'1991-05-10 00:00:00',11,'2024-07-13 00:42:27'),('K2','Javier','Castro','CAJJ900803GTMVCR04',1,'1990-08-03 00:00:00',11,'2024-07-13 00:42:27'),('K3','Adriana','Sánchez','SANA950705HDFRAD09',1,'1995-07-05 00:00:00',11,'2024-07-13 00:42:27'),('L1','Mariano','Gómez','GOMM920420MDFRMN07',1,'1992-04-20 00:00:00',12,'2024-07-13 00:42:27'),('L2','Cecilia','Ramírez','RAMC900701GTMCLS08',1,'1990-07-01 00:00:00',12,'2024-07-13 00:42:27'),('L3','Arturo','Martínez','MARA950212HDFRTR03',1,'1995-02-12 00:00:00',12,'2024-07-13 00:42:27'),('P1','Juan','González','GONJ920521HDFRLL07',1,'1992-05-21 00:00:00',16,'2024-07-13 00:42:27'),('P2','Ana','Martínez','MARA871015MDFRRA09',1,'1987-10-15 00:00:00',16,'2024-07-13 00:42:27'),('P3','Pedro','Hernández','HERP900702GTMPTR08',1,'1990-07-02 00:00:00',16,'2024-07-13 00:42:27'),('Q1','María','López','LOPM880320MDFRLR01',1,'1988-03-20 00:00:00',17,'2024-07-13 00:42:27'),('Q2','Jorge','Castro','CASJ910505MDFRTR04',1,'1991-05-05 00:00:00',17,'2024-07-13 00:42:27'),('Q3','Sofía','Gómez','GOMS950215GTMSFN02',1,'1995-02-15 00:00:00',17,'2024-07-13 00:42:27'),('U1','Martha','Jiménez','JIMM910425GTMJMR03',1,'1991-04-25 00:00:00',21,'2024-07-13 00:42:27'),('U2','Martín','Pérez','PERM900701HDFRRT08',1,'1990-07-01 00:00:00',21,'2024-07-13 00:42:27'),('U3','Fernanda','Gutiérrez','GUTF960212MDFRNN02',1,'1996-02-12 00:00:00',21,'2024-07-13 00:42:27'),('V1','Diego','Castro','CAST930510MDFRST01',1,'1993-05-10 00:00:00',22,'2024-07-13 00:42:27'),('V2','Alejandra','Ruiz','RUIA900803GTMRLD04',1,'1990-08-03 00:00:00',22,'2024-07-13 00:42:27'),('V3','Roberta','Mendoza','MENR950705HDFRZB09',1,'1995-07-05 00:00:00',22,'2024-07-13 00:42:27'),('Z1','Diana','López','LOPD910510MDFRDN01',1,'1991-05-10 00:00:00',26,'2024-07-13 00:42:27'),('Z2','Javier','Castro','CAJJ900803GTMVCR04',1,'1990-08-03 00:00:00',26,'2024-07-13 00:42:27'),('Z3','Adriana','Sánchez','SANA950705HDFRAD09',1,'1995-07-05 00:00:00',26,'2024-07-13 00:42:27');
/*!40000 ALTER TABLE `aspirantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
                                  `id_calificacion` int NOT NULL,
                                  `calificacion` float DEFAULT NULL,
                                  `aspirante_folio_aspirante` varchar(10) DEFAULT NULL,
                                  PRIMARY KEY (`id_calificacion`),
                                  KEY `aspirante_folio_aspirante` (`aspirante_folio_aspirante`),
                                  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`aspirante_folio_aspirante`) REFERENCES `aspirantes` (`folio_aspirante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,8.5,'A1'),(2,7.2,'A2'),(3,9,'A3'),(4,6.8,'AA1'),(5,8.9,'AA2'),(6,7.5,'AA3'),(7,9.2,'AE1'),(8,6.5,'AE2'),(9,8,'AE3'),(10,8.7,'AF1'),(11,7,'AF2'),(12,9.5,'AF3'),(13,8.1,'AJ1'),(14,7.8,'AJ2'),(15,9.3,'AJ3'),(16,8.4,'AK1'),(17,7.3,'AK2'),(18,9.8,'AK3'),(19,8.9,'AO1'),(20,7.2,'AO2'),(21,9.1,'AO3'),(22,8.6,'AP1'),(23,7.5,'AP2'),(24,9.4,'AP3'),(25,8.2,'AT1'),(26,7.7,'AT2'),(27,9.7,'AT3'),(28,8.3,'AU1'),(29,7.9,'AU2'),(30,9.2,'AU3'),(31,8.8,'AY1'),(32,7.1,'AY2'),(33,9.6,'AY3'),(34,8,'AZ1'),(35,7.6,'AZ2'),(36,9.5,'AZ3'),(37,8.5,'B1'),(38,7.4,'B2'),(39,9,'B3'),(40,8.1,'F1'),(41,7.2,'F2'),(42,9.3,'F3'),(43,8.2,'G1'),(44,7.8,'G2'),(45,9.1,'G3'),(46,8.3,'K1'),(47,7.7,'K2'),(48,9.4,'K3'),(49,8.4,'L1'),(50,7.5,'L2'),(51,9.2,'L3'),(52,8.5,'P1'),(53,7.4,'P2'),(54,9,'P3'),(55,8.6,'Q1'),(56,7.9,'Q2'),(57,9.3,'Q3'),(58,8.7,'U1'),(59,7.6,'U2'),(60,9.5,'U3'),(61,8.8,'V1'),(62,7.3,'V2'),(63,9.7,'V3'),(64,8.9,'Z1'),(65,7.2,'Z2'),(66,9.8,'Z3');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
                            `id_carrera` int NOT NULL AUTO_INCREMENT,
                            `nombre_carrera` varchar(100) DEFAULT NULL,
                            `divisiones_academicas_id_division` int DEFAULT NULL,
                            `estado` int DEFAULT '1',
                            `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY (`id_carrera`),
                            KEY `divisiones_academicas_id_division` (`divisiones_academicas_id_division`),
                            KEY `estado_id_estado` (`estado`),
                            CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`divisiones_academicas_id_division`) REFERENCES `divisiones_academicas` (`id_division`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Gestión del Capital Humano',14,1,'2024-07-13 00:42:38'),(2,'Mercadotecnia',14,1,'2024-07-13 00:42:38'),(4,'Procesos Productivos',13,1,'2024-07-13 00:42:38'),(5,'Automatización',13,1,'2024-07-13 00:42:38'),(6,'Mantenimiento Industrial',13,1,'2024-07-13 00:42:38'),(7,'Nanotecnología',13,1,'2024-07-13 00:42:38'),(8,'Gestión del Bienestar',15,1,'2024-07-13 00:42:38'),(9,'Diseño y Animación Digital',12,1,'2024-07-13 00:42:38'),(10,'Diseño y Moda Industrial en Producción',12,1,'2024-07-13 00:42:38'),(11,'Desarrollo de Software Multiplataforma',12,1,'2024-07-13 00:42:38'),(12,'Infraestructura de Redes Digitales',12,1,'2024-07-13 00:42:38');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
                          `id_curso` int NOT NULL,
                          `nombre` varchar(45) DEFAULT NULL,
                          `id_docente` int DEFAULT NULL,
                          `estado` int DEFAULT NULL,
                          `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (`id_curso`),
                          KEY `estado_id_estado` (`estado`),
                          KEY `id_docente` (`id_docente`),
                          CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`),
                          CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisiones_academicas`
--

DROP TABLE IF EXISTS `divisiones_academicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisiones_academicas` (
                                         `id_division` int NOT NULL AUTO_INCREMENT,
                                         `nombre_division` varchar(61) DEFAULT NULL,
                                         `coordinador_division` varchar(45) DEFAULT NULL,
                                         `siglas` varchar(45) DEFAULT NULL,
                                         `estado` int DEFAULT '1',
                                         `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                         PRIMARY KEY (`id_division`),
                                         KEY `estado_id_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisiones_academicas`
--

LOCK TABLES `divisiones_academicas` WRITE;
/*!40000 ALTER TABLE `divisiones_academicas` DISABLE KEYS */;
INSERT INTO `divisiones_academicas` VALUES (12,'División Académica de Tecnologías de la Información y Diseño','Dra. Martha Fabiola Wences Díaz','DATID',2,'2024-07-13 00:44:32'),(13,'División Académica de Mecánica Industrial','M. en C. Jaime Vázquez Colín','DAMI',1,'2024-07-13 00:44:32'),(14,'División Académica Económica-Administrativa','M.C.C.I. Jonathan Espinoza Mendoza','DACEA',1,'2024-07-13 00:44:32'),(15,'División Académica de Terapia Física','M.M.F. y R. Dennice Jaqueline García Mendoza','DATEFI',1,'2024-07-13 00:44:32');
/*!40000 ALTER TABLE `divisiones_academicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
                          `id_grupo` int NOT NULL AUTO_INCREMENT,
                          `nombre_grupo` varchar(100) DEFAULT NULL,
                          `carreras_id_carrera` int DEFAULT NULL,
                          `estado` int DEFAULT NULL,
                          `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                          `id_usuario` int DEFAULT NULL,
                          PRIMARY KEY (`id_grupo`),
                          KEY `estado_id_estado` (`estado`),
                          KEY `usuario_id_usuario_idx` (`id_usuario`),
                          CONSTRAINT `usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'A-GCH',1,1,'2024-07-13 00:42:59',123),(2,'B-GCH',1,1,'2024-07-13 00:42:59',123),(6,'A-M',2,1,'2024-07-13 00:42:59',123),(7,'B-M',2,1,'2024-07-13 00:42:59',123),(11,'A-PP',4,1,'2024-07-13 00:42:59',321312332),(12,'B-PP',4,1,'2024-07-13 00:42:59',321312332),(16,'A-A',5,1,'2024-07-13 00:42:59',321312332),(17,'B-A',5,1,'2024-07-13 00:42:59',321312332),(21,'A-MI',6,1,'2024-07-13 00:42:59',NULL),(22,'B-MI',6,1,'2024-07-13 00:42:59',NULL),(26,'A-N',7,1,'2024-07-13 00:42:59',NULL),(27,'B-N',7,1,'2024-07-13 00:42:59',NULL),(31,'A-GB',8,1,'2024-07-13 00:42:59',NULL),(32,'B-GB',8,1,'2024-07-13 00:42:59',NULL),(36,'A-DAD',9,1,'2024-07-13 00:42:59',NULL),(37,'B-DAD',9,1,'2024-07-13 00:42:59',NULL),(41,'A-DMIP',10,1,'2024-07-13 00:42:59',126),(42,'B-DMIP',10,1,'2024-07-13 00:42:59',126),(46,'A-DSM',11,1,'2024-07-13 00:42:59',126),(47,'B-DSM',11,1,'2024-07-13 00:42:59',126),(51,'A-IRD',12,1,'2024-07-13 00:42:59',NULL),(52,'B-IRD',12,1,'2024-07-13 00:42:59',NULL);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
                             `id_historial` int NOT NULL AUTO_INCREMENT,
                             `descripcion` varchar(100) DEFAULT NULL,
                             `usuarios_id_usuario` int DEFAULT NULL,
                             `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id_historial`),
                             KEY `usuarios_id_usuario` (`usuarios_id_usuario`),
                             CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,'Se registró el docente Lalo',123,'2024-07-21 00:00:00'),(2,'Se registró el docente Jose ',123,'2024-07-22 00:00:00'),(3,'Se actualizó el estado del aspirante con folio A1 a activo',123,'2024-08-02 00:00:00');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrogrupos`
--

DROP TABLE IF EXISTS `registrogrupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrogrupos` (
                                  `id_registro` int NOT NULL AUTO_INCREMENT,
                                  `grupos_id_grupo` int NOT NULL,
                                  `divisiones_academicas_id_division` int NOT NULL,
                                  `carreras_id_carrera` int NOT NULL,
                                  `usuarios_id_usuario` int NOT NULL,
                                  PRIMARY KEY (`id_registro`),
                                  KEY `fk_registrogrupos_grupos1_idx` (`grupos_id_grupo`),
                                  KEY `fk_registrogrupos_divisiones_academicas1_idx` (`divisiones_academicas_id_division`),
                                  KEY `fk_registrogrupos_carreras1_idx` (`carreras_id_carrera`),
                                  KEY `fk_registrogrupos_usuarios1_idx` (`usuarios_id_usuario`),
                                  CONSTRAINT `fk_registrogrupos_carreras1` FOREIGN KEY (`carreras_id_carrera`) REFERENCES `carreras` (`id_carrera`),
                                  CONSTRAINT `fk_registrogrupos_divisiones_academicas1` FOREIGN KEY (`divisiones_academicas_id_division`) REFERENCES `divisiones_academicas` (`id_division`),
                                  CONSTRAINT `fk_registrogrupos_grupos1` FOREIGN KEY (`grupos_id_grupo`) REFERENCES `grupos` (`id_grupo`),
                                  CONSTRAINT `fk_registrogrupos_usuarios1` FOREIGN KEY (`usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrogrupos`
--

LOCK TABLES `registrogrupos` WRITE;
/*!40000 ALTER TABLE `registrogrupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrogrupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
                            `id_usuario` int NOT NULL,
                            `nombre` varchar(50) DEFAULT NULL,
                            `apellido` varchar(50) DEFAULT NULL,
                            `mail` varchar(50) DEFAULT NULL,
                            `contrasena` varchar(255) DEFAULT NULL,
                            `estado` int DEFAULT NULL,
                            `rol` int DEFAULT NULL,
                            `grupos_id_grupo` int DEFAULT NULL,
                            `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                            `carrera_id_carrera` int DEFAULT NULL,
                            PRIMARY KEY (`id_usuario`),
                            KEY `usuarios_ibfk_3_idx` (`carrera_id_carrera`),
                            CONSTRAINT `id_carrera` FOREIGN KEY (`carrera_id_carrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (123,'Jose','Saldaña','ejemplo1@gmial.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',1,1,NULL,'2024-07-13 00:41:42',1),(124,'Orlanddo','ruiz','ejemplo2@gmial.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',1,1,NULL,'2024-07-13 00:41:42',2),(125,'pepe','sanchez','ejemplo3@gmial.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',2,1,NULL,'2024-07-13 00:41:42',8),(126,'Mauro2','Bahena','ejemplo4@gmial.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1,2,22,'2024-07-13 00:41:42',11),(127,'Sebastian','Sota','ejemplo5@gmial.com','233e1cded61ace811d7a930947b06acb18cda1dc7b67e215941e1830fdec3b7c',1,2,NULL,'2024-07-13 00:41:42',11),(128,'Carlos','Hernandez','carlos.hernandez@example.com','0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e',1,1,NULL,'2024-07-13 00:41:42',10),(129,'Laura','Martinez','laura.martinez@example.com','6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4',2,2,26,'2024-07-13 00:41:42',12),(130,'Miguel','Lopez','miguel.lopez@example.com','5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764',1,2,NULL,'2024-07-13 00:41:42',12),(131,'Ana','Gomez','ana.gomez@example.com','b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b',2,1,NULL,'2024-07-13 00:41:42',10),(132,'Luis','Perez','luis.perez@example.com','8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023',1,2,22,'2024-07-13 00:41:42',1),(133,'Isabel','Diaz','isabel.diaz@example.com','598a1a400c1dfdf36974e69d7e1bc98593f2e15015eed8e9b7e47a83b31693d5',2,2,NULL,'2024-07-13 00:41:42',1),(134,'David','Ramirez','david.ramirez@example.com','5860836e8f13fc9837539a597d4086bfc0299e54ad92148d54538b5c3feefb7c',1,1,NULL,'2024-07-13 00:41:42',11),(135,'Sofia','Torres','sofia.torres@example.com','57f3ebab63f156fd8f776ba645a55d96360a15eeffc8b0e4afe4c05fa88219aa',2,2,26,'2024-07-13 00:41:42',2),(136,'Andres','Sanchez','andres.sanchez@example.com','9323dd6786ebcbf3ac87357cc78ba1abfda6cf5e55cd01097b90d4a286cac90e',1,2,NULL,'2024-07-13 00:41:42',2),(137,'Maria','Ortiz','maria.ortiz@example.com','aa4a9ea03fcac15b5fc63c949ac34e7b0fd17906716ac3b8e58c599cdc5a52f0',2,1,NULL,'2024-07-13 00:41:42',11),(138,'Jorge','Morales','jorge.morales@example.com','53d453b0c08b6b38ae91515dc88d25fbecdd1d6001f022419629df844f8ba433',1,2,22,'2024-07-13 00:41:42',12),(139,'Natalia','Mendoza','natalia.mendoza@example.com','b3d17ebbe4f2b75d27b6309cfaae1487b667301a73951e7d523a039cd2dfe110',2,2,NULL,'2024-07-13 00:41:42',12),(140,'Pablo','Vargas','pablo.vargas@example.com','48caafb68583936afd0d78a7bfd7046d2492fad94f3c485915f74bb60128620d',1,1,NULL,'2024-07-13 00:41:42',4),(141,'Lucia','Rojas','lucia.rojas@example.com','c6863e1db9b396ed31a36988639513a1c73a065fab83681f4b77adb648fac3d6',2,2,NULL,'2024-07-13 00:41:42',4),(142,'Enrique','Cruz','enrique.cruz@example.com','c63c2d34ebe84032ad47b87af194fedd17dacf8222b2ea7f4ebfee3dd6db2dfb',1,2,NULL,'2024-07-13 00:41:42',4),(143,'Valeria','Herrera','valeria.herrera@example.com','17a3379984b560dc311bb921b7a46b28aa5cb495667382f887a44a7fdbca7a7a',2,1,NULL,'2024-07-13 00:41:42',5),(144,'Adrian','Ibañez','adrian.ibanez@example.com','69bfb918de05145fba9dcee9688dfb23f6115845885e48fa39945eebb99d8527',1,2,22,'2024-07-13 00:41:42',5),(145,'Laura','Garcia','laura.garcia@example.com','d2042d75a67922194c045da2600e1c92ff6d87e8fb6e0208606665f2d1dfa892',2,2,NULL,'2024-07-13 00:41:42',5),(146,'Roberto','Castro','roberto.castro@example.com','5790ac3d0b8ae8afc72c2c6fb97654f2b73651c328de0a3b74854ade562dd17a',1,1,NULL,'2024-07-13 00:41:42',7),(147,'Carolina','Silva','carolina.silva@example.com','7535d8f2d8c35d958995610f971287288ab5e8c82a3c4fdc2b6fb5d757a5b9f8',2,2,NULL,'2024-07-13 00:41:42',6),(199,'Roberto','Bahena','ro@gmial.com','a4f27f84d7ec58cc4c0caca7d46f98c240f9fbf2951636c1d1b766c27547e12e',1,2,NULL,'2024-07-21 17:35:52',6),(1999,'Roberto','Ruiz','bhbh3@gmial.com','f969fdbe811d8a66010d6f8973246763147a2a0914afc8087839e29b563a5af0',1,2,NULL,'2024-07-21 17:39:25',7),(2007,'Lalo','Ruiz','ruizo@gmial.com','163f86a55db0f4c22963002b04f5a8707954ca431f07258c0bf9a432258ab358',1,2,NULL,'2024-07-21 17:46:01',7),(6666,'Roberto','Santos','ro@gmial.com','049a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5',1,2,NULL,'2024-07-21 17:34:06',8),(123455,'Jose ','Santos','fdsfdsfds@gmial.com','2aee6d2709a30a20bbb3e99607d2936a8172c3c45be61c9c7e662adc0c5c6e53',1,2,NULL,'2024-07-22 23:10:39',8),(322323,'Orladn','Ruiiz','fdsd@gmial.com','74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b',2,2,NULL,'2024-07-20 14:42:48',9),(321312332,'geze','sanchez','hola@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1,2,32,'2024-07-13 00:41:42',9);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-11 19:42:14

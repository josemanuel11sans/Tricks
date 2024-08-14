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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-13 23:23:37

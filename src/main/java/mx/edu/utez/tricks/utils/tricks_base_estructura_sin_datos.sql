-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tricks
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tricks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tricks` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tricks` ;

-- -----------------------------------------------------
-- Table `tricks`.`grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`grupos` (
  `id_grupo` INT NOT NULL AUTO_INCREMENT,
  `nombre_grupo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_grupo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`tipousuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`tipousuario` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `tpoUsuarioRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `contrasena` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_nacimiento` DATETIME NULL DEFAULT NULL,
  `id_estado` INT NULL DEFAULT NULL,
  `id_rol` INT NULL DEFAULT NULL,
  `asistencias_id_asistencia` INT NULL DEFAULT NULL,
  `grupos_id_grupo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `id_estado` (`id_estado` ASC) VISIBLE,
  INDEX `id_rol` (`id_rol` ASC) VISIBLE,
  INDEX `fk_usuarios_grupos1_idx` (`grupos_id_grupo` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_grupos1`
    FOREIGN KEY (`grupos_id_grupo`)
    REFERENCES `tricks`.`grupos` (`id_grupo`),
  CONSTRAINT `usuarios_ibfk_1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `tricks`.`estado` (`id_estado`),
  CONSTRAINT `usuarios_ibfk_2`
    FOREIGN KEY (`id_rol`)
    REFERENCES `tricks`.`tipousuario` (`id_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`asistencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`asistencias` (
  `id_asistencia` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL DEFAULT NULL,
  `presente` VARCHAR(10) NULL DEFAULT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  INDEX `fk_asistencias_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_asistencias_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `tricks`.`usuarios` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`calificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`calificaciones` (
  `id_calificacion` INT NOT NULL AUTO_INCREMENT,
  `calificacion` FLOAT NULL DEFAULT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_calificacion`),
  INDEX `fk_calificaciones_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_calificaciones_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `tricks`.`usuarios` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`divisiones_academicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`divisiones_academicas` (
  `id_division` INT NOT NULL AUTO_INCREMENT,
  `nombre_division` VARCHAR(50) NOT NULL,
  `coordinador_division` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_division`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`carreras` (
  `id_carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre_carrera` VARCHAR(100) NOT NULL,
  `divisiones_academicas_id_division` INT NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_carrera`),
  INDEX `fk_carreras_divisiones_academicas1_idx` (`divisiones_academicas_id_division` ASC) VISIBLE,
  INDEX `fk_carreras_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_divisiones_academicas1`
    FOREIGN KEY (`divisiones_academicas_id_division`)
    REFERENCES `tricks`.`divisiones_academicas` (`id_division`),
  CONSTRAINT `fk_carreras_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `tricks`.`usuarios` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tricks`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tricks`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `id_docente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  INDEX `id_docente` (`id_docente` ASC) VISIBLE,
  CONSTRAINT `cursos_ibfk_1`
    FOREIGN KEY (`id_docente`)
    REFERENCES `tricks`.`usuarios` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

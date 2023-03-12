-- MySQL Script generated by MySQL Workbench
-- Fri Feb 24 17:19:30 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DBSys
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBSys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBSys` DEFAULT CHARACTER SET utf8 ;
USE `DBSys` ;

-- -----------------------------------------------------
-- Table `DBSys`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBSys`.`Carrera` (
  `idCarrera` INT NOT NULL,
  `carrera` VARCHAR(45) NULL,
  `abreviatura` VARCHAR(45) NULL,
  PRIMARY KEY (`idCarrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBSys`.`Tutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBSys`.`Tutor` (
  `idTutor` INT NOT NULL,
  `nombreTutor` VARCHAR(45) NULL,
  `denominacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idTutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBSys`.`Dependencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBSys`.`Dependencias` (
  `idDependencias` INT NOT NULL,
  `nombreDep` VARCHAR(45) NULL,
  `correoDep` VARCHAR(150) NULL,
  `telefonoDep` BIGINT(20) NULL,
  `jefe` VARCHAR(45) NULL,
  `sector` VARCHAR(45) NULL,
  `denominacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idDependencias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBSys`.`Formatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBSys`.`Formatos` (
  `idFormatos` INT NOT NULL,
  `fecRegistro` DATE NULL,
  `hora` TIME NULL,
  `ss` VARCHAR(45) NULL,
  `fecInicio` DATE NULL,
  `fecTermino` DATE NULL,
  `carta` VARCHAR(45) NULL,
  `primerInf` VARCHAR(45) NULL,
  `segundoInf` VARCHAR(45) NULL,
  `tercerInf` VARCHAR(45) NULL,
  `finalInf` VARCHAR(45) NULL,
  `terminacion` VARCHAR(45) NULL,
  `evaluacion` VARCHAR(45) NULL,
  `solicitud` VARCHAR(45) NULL,
  `observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`idFormatos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBSys`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBSys`.`Alumnos` (
  `cuenta` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `telefono` BIGINT(20) NULL,
  `idCarrera` INT NOT NULL,
  `idTutor` INT NOT NULL,
  `idDependencias` INT NOT NULL,
  `idFormatos` INT NOT NULL,
  PRIMARY KEY (`cuenta`),
  CONSTRAINT `fk_Alumnos_Carrera`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `DBSys`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_Tutor1`
    FOREIGN KEY (`idTutor`)
    REFERENCES `DBSys`.`Tutor` (`idTutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_Dependencias1`
    FOREIGN KEY (`idDependencias`)
    REFERENCES `DBSys`.`Dependencias` (`idDependencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_Formatos1`
    FOREIGN KEY (`idFormatos`)
    REFERENCES `DBSys`.`Formatos` (`idFormatos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBSys`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBSys`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `nombreUsu` VARCHAR(100) NULL,
  `paternoUsu` VARCHAR(100) NULL,
  `maternoUsu` VARCHAR(100) NULL,
  `correoUsu` VARCHAR(100) NULL,
  `contrasenaUsu` VARCHAR(100) NULL,
  `rol` VARCHAR(50) NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

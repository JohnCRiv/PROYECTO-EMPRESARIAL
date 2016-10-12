-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aulavirtual
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `aulavirtual` ;

-- -----------------------------------------------------
-- Schema aulavirtual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aulavirtual` DEFAULT CHARACTER SET latin1 ;
USE `aulavirtual` ;

-- -----------------------------------------------------
-- Table `curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `curso` ;

CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `creditos` INT NOT NULL,
  `horasteoria` INT NOT NULL,
  `horaslaboratorio` INT NOT NULL,
  `horastotal` INT NOT NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alumno` ;

CREATE TABLE IF NOT EXISTS `alumno` (
  `idalumno` VARCHAR(45) NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidopaterno` VARCHAR(45) NOT NULL,
  `apellidomaterno` VARCHAR(45) NOT NULL,
  `numerodocumento` VARCHAR(45) NOT NULL,
  `fechanacimiento` DATE NOT NULL,
  PRIMARY KEY (`idalumno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alumno_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alumno_curso` ;

CREATE TABLE IF NOT EXISTS `alumno_curso` (
  `idalumno` VARCHAR(45) NOT NULL,
  `idcurso` INT NOT NULL,
  INDEX `fk_alumno_curso_curso_idx` (`idcurso` ASC),
  INDEX `fk_alumno_curso_alumno1_idx` (`idalumno` ASC),
  PRIMARY KEY (`idalumno`, `idcurso`),
  CONSTRAINT `fk_alumno_curso_curso`
    FOREIGN KEY (`idcurso`)
    REFERENCES `curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_curso_alumno1`
    FOREIGN KEY (`idalumno`)
    REFERENCES `alumno` (`idalumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `examen` ;

CREATE TABLE IF NOT EXISTS `examen` (
  `idexamen` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `duracion` INT NOT NULL,
  `fechainicio` DATE NOT NULL,
  `fechafin` DATE NULL,
  PRIMARY KEY (`idexamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `curso_examen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `curso_examen` ;

CREATE TABLE IF NOT EXISTS `curso_examen` (
  `idcurso` INT NOT NULL,
  `idexamen` INT NOT NULL,
  INDEX `fk_curso_examen_curso1_idx` (`idcurso` ASC),
  PRIMARY KEY (`idcurso`, `idexamen`),
  INDEX `fk_curso_examen_examen1_idx` (`idexamen` ASC),
  CONSTRAINT `fk_curso_examen_curso1`
    FOREIGN KEY (`idcurso`)
    REFERENCES `curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_examen_examen1`
    FOREIGN KEY (`idexamen`)
    REFERENCES `examen` (`idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pregunta` ;

CREATE TABLE IF NOT EXISTS `pregunta` (
  `idpregunta` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idpregunta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `curso_pregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `curso_pregunta` ;

CREATE TABLE IF NOT EXISTS `curso_pregunta` (
  `idcurso` INT NOT NULL,
  `idpregunta` INT NOT NULL,
  INDEX `fk_curso_pregunta_curso1_idx` (`idcurso` ASC),
  PRIMARY KEY (`idcurso`, `idpregunta`),
  INDEX `fk_curso_pregunta_pregunta1_idx` (`idpregunta` ASC),
  CONSTRAINT `fk_curso_pregunta_curso1`
    FOREIGN KEY (`idcurso`)
    REFERENCES `curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_pregunta_pregunta1`
    FOREIGN KEY (`idpregunta`)
    REFERENCES `pregunta` (`idpregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pregunta_opcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pregunta_opcion` ;

CREATE TABLE IF NOT EXISTS `pregunta_opcion` (
  `idcurso` INT NOT NULL,
  `idpregunta` INT NOT NULL,
  `idopcion` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `estexto` VARCHAR(45) NOT NULL,
  `esrespuesta` VARCHAR(45) NULL,
  INDEX `fk_pregunta_opcion_curso_pregunta1_idx` (`idcurso` ASC, `idpregunta` ASC),
  PRIMARY KEY (`idopcion`, `idpregunta`, `idcurso`),
  CONSTRAINT `fk_pregunta_opcion_curso_pregunta1`
    FOREIGN KEY (`idcurso` , `idpregunta`)
    REFERENCES `curso_pregunta` (`idcurso` , `idpregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen_pregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `examen_pregunta` ;

CREATE TABLE IF NOT EXISTS `examen_pregunta` (
  `idcurso` INT NOT NULL,
  `idexamen` INT NOT NULL,
  `idpregunta` INT NOT NULL,
  INDEX `fk_examen_pregunta_curso_examen1_idx` (`idcurso` ASC, `idexamen` ASC),
  INDEX `fk_examen_pregunta_pregunta1_idx` (`idpregunta` ASC),
  PRIMARY KEY (`idcurso`, `idexamen`, `idpregunta`),
  CONSTRAINT `fk_examen_pregunta_curso_examen1`
    FOREIGN KEY (`idcurso` , `idexamen`)
    REFERENCES `curso_examen` (`idcurso` , `idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_examen_pregunta_pregunta1`
    FOREIGN KEY (`idpregunta`)
    REFERENCES `pregunta` (`idpregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alumno_examen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alumno_examen` ;

CREATE TABLE IF NOT EXISTS `alumno_examen` (
  `idalumno` VARCHAR(45) NOT NULL,
  `idcurso` INT NOT NULL,
  `idexamen` INT NOT NULL,
  `fecha` DATE NOT NULL,
  INDEX `fk_alumno_examen_alumno_curso1_idx` (`idalumno` ASC, `idcurso` ASC),
  INDEX `fk_alumno_examen_examen1_idx` (`idexamen` ASC),
  PRIMARY KEY (`idalumno`, `idcurso`, `idexamen`),
  CONSTRAINT `fk_alumno_examen_alumno_curso1`
    FOREIGN KEY (`idalumno` , `idcurso`)
    REFERENCES `alumno_curso` (`idalumno` , `idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_examen_examen1`
    FOREIGN KEY (`idexamen`)
    REFERENCES `examen` (`idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alumno_respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alumno_respuesta` ;

CREATE TABLE IF NOT EXISTS `alumno_respuesta` (
  `idalumno` VARCHAR(45) NOT NULL,
  `idcurso` INT NOT NULL,
  `idexamen` INT NOT NULL,
  `idpregunta` INT NOT NULL,
  `idopcion` INT NOT NULL,
  `texto` VARCHAR(500) NULL,
  INDEX `fk_alumno_respuesta_alumno_examen1_idx` (`idalumno` ASC, `idcurso` ASC, `idexamen` ASC),
  INDEX `fk_alumno_respuesta_pregunta1_idx` (`idpregunta` ASC),
  PRIMARY KEY (`idalumno`, `idcurso`, `idexamen`, `idpregunta`, `idopcion`),
  CONSTRAINT `fk_alumno_respuesta_alumno_examen1`
    FOREIGN KEY (`idalumno` , `idcurso` , `idexamen`)
    REFERENCES `alumno_examen` (`idalumno` , `idcurso` , `idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_respuesta_pregunta1`
    FOREIGN KEY (`idpregunta`)
    REFERENCES `pregunta` (`idpregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rol` ;

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidopaterno` VARCHAR(45) NOT NULL,
  `apellidomaterno` VARCHAR(45) NOT NULL,
  `numerodocumento` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `idrol` INT NOT NULL,
  PRIMARY KEY (`idusuario`, `idrol`),
  INDEX `fk_usuario_rol1_idx` (`idrol` ASC),
  CONSTRAINT `fk_usuario_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enlace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enlace` ;

CREATE TABLE IF NOT EXISTS `enlace` (
  `idenlace` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `ruta` VARCHAR(45) NOT NULL,
  `icono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idenlace`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rolenlace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rolenlace` ;

CREATE TABLE IF NOT EXISTS `rolenlace` (
  `idrol` INT NOT NULL,
  `idenlace` INT NOT NULL,
  PRIMARY KEY (`idrol`, `idenlace`),
  INDEX `fk_rol_has_enlace_enlace1_idx` (`idenlace` ASC),
  INDEX `fk_rol_has_enlace_rol1_idx` (`idrol` ASC),
  CONSTRAINT `fk_rol_has_enlace_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_enlace_enlace1`
    FOREIGN KEY (`idenlace`)
    REFERENCES `enlace` (`idenlace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sede` ;

CREATE TABLE IF NOT EXISTS `sede` (
  `idsede` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `representante` VARCHAR(45) NOT NULL,
  `fechainaguracion` DATE NOT NULL,
  PRIMARY KEY (`idsede`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `docente` ;

CREATE TABLE IF NOT EXISTS `docente` (
  `iddocente` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidopaterno` VARCHAR(45) NOT NULL,
  `apellidomaterno` VARCHAR(45) NOT NULL,
  `numerodocumento` VARCHAR(45) NOT NULL,
  `fechanacimiento` DATE NOT NULL,
  `idsede` INT NOT NULL,
  PRIMARY KEY (`iddocente`, `idsede`),
  INDEX `fk_docente_sede1_idx` (`idsede` ASC),
  CONSTRAINT `fk_docente_sede1`
    FOREIGN KEY (`idsede`)
    REFERENCES `sede` (`idsede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docente_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `docente_curso` ;

CREATE TABLE IF NOT EXISTS `docente_curso` (
  `iddocente` INT NOT NULL,
  `idcurso` INT NOT NULL,
  PRIMARY KEY (`iddocente`, `idcurso`),
  INDEX `fk_docente_has_curso_curso1_idx` (`idcurso` ASC),
  INDEX `fk_docente_has_curso_docente1_idx` (`iddocente` ASC),
  CONSTRAINT `fk_docente_has_curso_docente1`
    FOREIGN KEY (`iddocente`)
    REFERENCES `docente` (`iddocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_has_curso_curso1`
    FOREIGN KEY (`idcurso`)
    REFERENCES `curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

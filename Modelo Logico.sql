-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `DisciplinaID` INT NOT NULL AUTO_INCREMENT,
  `Disciplina_Curso` VARCHAR(250) NULL,
  PRIMARY KEY (`DisciplinaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alunos` (
  `AlunoID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Sobrenome` VARCHAR(100) NULL,
  `RA` VARCHAR(50) NULL,
  `Email` VARCHAR(200) NULL,
  `Cursos_DisciplinaID` INT NOT NULL,
  PRIMARY KEY (`AlunoID`, `Cursos_DisciplinaID`),
  INDEX `fk_Alunos_Cursos_idx` (`Cursos_DisciplinaID` ASC),
  CONSTRAINT `fk_Alunos_Cursos`
    FOREIGN KEY (`Cursos_DisciplinaID`)
    REFERENCES `mydb`.`Cursos` (`DisciplinaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
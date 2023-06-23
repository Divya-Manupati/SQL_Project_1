-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employee` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `employee` ;

-- -----------------------------------------------------
-- Table `employee`.`emp_record_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee`.`emp_record_table` (
  `EMP_ID` TEXT NOT NULL,
  `FIRST_NAME` TEXT NOT NULL,
  `LAST_NAME` TEXT NOT NULL,
  `GENDER` TEXT NOT NULL,
  `ROLE` TEXT NOT NULL,
  `DEPT` TEXT NOT NULL,
  `EXP` INT NOT NULL,
  `COUNTRY` TEXT NOT NULL,
  `CONTINENT` TEXT NOT NULL,
  `SALARY` INT NOT NULL,
  `EMP_RATING` INT NOT NULL,
  `MANAGER_ID` TEXT NOT NULL,
  `PROJ_ID` TEXT NOT NULL,
  `emp_record_tablecol` VARCHAR(45) NOT NULL,
  `emp_record_tablecol1` VARCHAR(45) NOT NULL,
  `data_science_team_EMP_ID` TEXT NOT NULL,
  `data_science_team_emp_record_table_EMP_ID` TEXT NOT NULL,
  `data_science_team_proj_table_PROJECT_ID` TEXT NOT NULL,
  `data_science_team_proj_table_emp_record_table_EMP_ID` TEXT NOT NULL,
  PRIMARY KEY (`EMP_ID`),
  INDEX `fk_emp_record_table_data_science_team1_idx` (`data_science_team_EMP_ID` ASC, `data_science_team_emp_record_table_EMP_ID` ASC, `data_science_team_proj_table_PROJECT_ID` ASC, `data_science_team_proj_table_emp_record_table_EMP_ID` ASC) VISIBLE,
  CONSTRAINT `fk_emp_record_table_data_science_team1`
    FOREIGN KEY (`data_science_team_EMP_ID` , `data_science_team_emp_record_table_EMP_ID` , `data_science_team_proj_table_PROJECT_ID` , `data_science_team_proj_table_emp_record_table_EMP_ID`)
    REFERENCES `employee`.`data_science_team` (`EMP_ID` , `emp_record_table_EMP_ID` , `proj_table_PROJECT_ID` , `proj_table_emp_record_table_EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employee`.`proj_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee`.`proj_table` (
  `PROJECT_ID` TEXT NOT NULL,
  `PROJ_NAME` TEXT NOT NULL,
  `DOMAIN` TEXT NOT NULL,
  `START _DATE` TEXT NOT NULL,
  `CLOSURE_DATE` TEXT NOT NULL,
  `DEV_QTR` TEXT NOT NULL,
  `STATUS` TEXT NOT NULL,
  `proj_tablecol` VARCHAR(45) NOT NULL,
  `proj_tablecol1` VARCHAR(45) NOT NULL,
  `emp_record_table_EMP_ID` TEXT NOT NULL,
  `emp_record_table_EMP_ID1` TEXT NOT NULL,
  `emp_record_table_EMP_ID2` TEXT NOT NULL,
  PRIMARY KEY (`PROJECT_ID`, `emp_record_table_EMP_ID`),
  INDEX `fk_proj_table_emp_record_table_idx` (`emp_record_table_EMP_ID` ASC) VISIBLE,
  INDEX `fk_proj_table_emp_record_table1_idx` (`emp_record_table_EMP_ID1` ASC) VISIBLE,
  INDEX `fk_proj_table_emp_record_table2_idx` (`emp_record_table_EMP_ID2` ASC) VISIBLE,
  CONSTRAINT `fk_proj_table_emp_record_table`
    FOREIGN KEY (`emp_record_table_EMP_ID`)
    REFERENCES `employee`.`emp_record_table` (`EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proj_table_emp_record_table1`
    FOREIGN KEY (`emp_record_table_EMP_ID1`)
    REFERENCES `employee`.`emp_record_table` (`EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proj_table_emp_record_table2`
    FOREIGN KEY (`emp_record_table_EMP_ID2`)
    REFERENCES `employee`.`emp_record_table` (`EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employee`.`data_science_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee`.`data_science_team` (
  `EMP_ID` TEXT NOT NULL,
  `FIRST_NAME` TEXT NOT NULL,
  `LAST_NAME` TEXT NOT NULL,
  `GENDER` TEXT NOT NULL,
  `ROLE` TEXT NOT NULL,
  `DEPT` TEXT NOT NULL,
  `EXP` INT NOT NULL,
  `COUNTRY` TEXT NOT NULL,
  `CONTINENT` TEXT NOT NULL,
  `data_science_teamcol` VARCHAR(45) NOT NULL,
  `emp_record_table_EMP_ID` TEXT NOT NULL,
  `proj_table_PROJECT_ID` TEXT NOT NULL,
  `proj_table_emp_record_table_EMP_ID` TEXT NOT NULL,
  `proj_table_PROJECT_ID1` TEXT NOT NULL,
  `proj_table_emp_record_table_EMP_ID1` TEXT NOT NULL,
  PRIMARY KEY (`EMP_ID`, `emp_record_table_EMP_ID`, `proj_table_PROJECT_ID`, `proj_table_emp_record_table_EMP_ID`),
  INDEX `fk_data_science_team_emp_record_table1_idx` (`emp_record_table_EMP_ID` ASC) VISIBLE,
  INDEX `fk_data_science_team_proj_table1_idx` (`proj_table_PROJECT_ID` ASC, `proj_table_emp_record_table_EMP_ID` ASC) VISIBLE,
  INDEX `fk_data_science_team_proj_table2_idx` (`proj_table_PROJECT_ID1` ASC, `proj_table_emp_record_table_EMP_ID1` ASC) VISIBLE,
  CONSTRAINT `fk_data_science_team_emp_record_table1`
    FOREIGN KEY (`emp_record_table_EMP_ID`)
    REFERENCES `employee`.`emp_record_table` (`EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_science_team_proj_table1`
    FOREIGN KEY (`proj_table_PROJECT_ID` , `proj_table_emp_record_table_EMP_ID`)
    REFERENCES `employee`.`proj_table` (`PROJECT_ID` , `emp_record_table_EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_science_team_proj_table2`
    FOREIGN KEY (`proj_table_PROJECT_ID1` , `proj_table_emp_record_table_EMP_ID1`)
    REFERENCES `employee`.`proj_table` (`PROJECT_ID` , `emp_record_table_EMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book` (
  `book_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Author` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `Publishing_house` VARCHAR(45) NOT NULL,
  `Volume_number` INT NOT NULL,
  `Language` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`book_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Location` (
  `location_ID` INT NOT NULL AUTO_INCREMENT,
  `shelf_num` INT NOT NULL,
  PRIMARY KEY (`location_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`in_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`in_stock` (
  `instock_ID` INT NOT NULL,
  `Availability` INT NOT NULL,
  PRIMARY KEY (`instock_ID`),
  CONSTRAINT `book`
    FOREIGN KEY (`instock_ID`)
    REFERENCES `library`.`book` (`book_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Location`
    FOREIGN KEY (`instock_ID`)
    REFERENCES `library`.`Location` (`location_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

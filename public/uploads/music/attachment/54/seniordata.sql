SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL,
  `created_by` VARCHAR(45) NULL,
  `updated_at` DATETIME NULL,
  `updated_by` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `avatar` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Residences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Residences` (
  `residence_id` INT NOT NULL AUTO_INCREMENT,
  `updated_at` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_by` VARCHAR(45) NULL,
  `created_by` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `amenities` VARCHAR(45) NULL,
  `nursing_home_activities_nursing_home_activity_id` INT NOT NULL,
  `minimum_age` INT NULL,
  `type` VARCHAR(45) NULL,
  `min_price` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `occupancy_rate` VARCHAR(45) NULL,
  `certificate` VARCHAR(45) NULL,
  `max_price` VARCHAR(45) NULL,
  PRIMARY KEY (`residence_id`, `nursing_home_activities_nursing_home_activity_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`States`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`States` (
  `state_id` INT NOT NULL,
  `state_name` VARCHAR(45) NULL,
  `state_abbreviation` VARCHAR(45) NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zip_Codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zip_Codes` (
  `zip_code_id` INT NOT NULL,
  `zip_code_number` INT NULL,
  `States_state_id` INT NOT NULL,
  PRIMARY KEY (`zip_code_id`, `States_state_id`),
  INDEX `fk_Zip_Codes_States1_idx` (`States_state_id` ASC),
  CONSTRAINT `fk_Zip_Codes_States1`
    FOREIGN KEY (`States_state_id`)
    REFERENCES `mydb`.`States` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zip_Code_Suffixes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zip_Code_Suffixes` (
  `zip_code_suffix_id` INT NOT NULL,
  `zip_code_suffix_number` INT NULL,
  `Zip_Codes_zip_code_id` INT NOT NULL,
  `Zip_Codes_States_state_id` INT NOT NULL,
  PRIMARY KEY (`zip_code_suffix_id`, `Zip_Codes_zip_code_id`, `Zip_Codes_States_state_id`),
  INDEX `fk_Zip_Code_Suffixes_Zip_Codes1_idx` (`Zip_Codes_zip_code_id` ASC, `Zip_Codes_States_state_id` ASC),
  CONSTRAINT `fk_Zip_Code_Suffixes_Zip_Codes1`
    FOREIGN KEY (`Zip_Codes_zip_code_id` , `Zip_Codes_States_state_id`)
    REFERENCES `mydb`.`Zip_Codes` (`zip_code_id` , `States_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Counties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Counties` (
  `county_id` INT NOT NULL,
  `county_name` VARCHAR(45) NULL,
  `States_state_id` INT NOT NULL,
  PRIMARY KEY (`county_id`, `States_state_id`),
  INDEX `fk_Counties_States1_idx` (`States_state_id` ASC),
  CONSTRAINT `fk_Counties_States1`
    FOREIGN KEY (`States_state_id`)
    REFERENCES `mydb`.`States` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cities` (
  `city_id` INT NOT NULL,
  `city_name` VARCHAR(45) NULL,
  `Counties_county_id` INT NOT NULL,
  `Counties_States_state_id` INT NOT NULL,
  PRIMARY KEY (`city_id`, `Counties_county_id`, `Counties_States_state_id`),
  INDEX `fk_Cities_Counties1_idx` (`Counties_county_id` ASC, `Counties_States_state_id` ASC),
  CONSTRAINT `fk_Cities_Counties1`
    FOREIGN KEY (`Counties_county_id` , `Counties_States_state_id`)
    REFERENCES `mydb`.`Counties` (`county_id` , `States_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Addresses` (
  `address_id` INT NOT NULL,
  `street_number` VARCHAR(45) NULL,
  `street_name` VARCHAR(45) NULL,
  `suite_number` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `county_province` VARCHAR(45) NULL,
  `zip_or_postcode` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `other_address_details` VARCHAR(45) NULL,
  `nursing_homes_nursing_home_id` INT NOT NULL,
  `nursing_homes_nursing_home_activities_nursing_home_activity_id` INT NOT NULL,
  `States_state_id` INT NOT NULL,
  `Addressescol` VARCHAR(45) NULL,
  `Zip_Code_Suffixes_zip_code_suffix_id` INT NOT NULL,
  `Zip_Code_Suffixes_Zip_Codes_zip_code_id` INT NOT NULL,
  `Zip_Code_Suffixes_Zip_Codes_States_state_id` INT NOT NULL,
  `States_state_id1` INT NOT NULL,
  `Zip_Code_Suffixes_zip_code_suffix_id1` INT NOT NULL,
  `Zip_Code_Suffixes_Zip_Codes_zip_code_id1` INT NOT NULL,
  `Zip_Code_Suffixes_Zip_Codes_States_state_id1` INT NOT NULL,
  `States_state_id2` INT NOT NULL,
  `Counties_county_id` INT NOT NULL,
  `Counties_States_state_id` INT NOT NULL,
  `Cities_city_id` INT NOT NULL,
  `Cities_Counties_county_id` INT NOT NULL,
  `Cities_Counties_States_state_id` INT NOT NULL,
  `Zip_Codes_zip_code_id1` INT NOT NULL,
  `Zip_Codes_States_state_id1` INT NOT NULL,
  PRIMARY KEY (`nursing_homes_nursing_home_id`, `nursing_homes_nursing_home_activities_nursing_home_activity_id`, `States_state_id`, `Zip_Code_Suffixes_zip_code_suffix_id`, `Zip_Code_Suffixes_Zip_Codes_zip_code_id`, `Zip_Code_Suffixes_Zip_Codes_States_state_id`, `States_state_id1`, `Zip_Code_Suffixes_zip_code_suffix_id1`, `Zip_Code_Suffixes_Zip_Codes_zip_code_id1`, `Zip_Code_Suffixes_Zip_Codes_States_state_id1`, `States_state_id2`, `Counties_county_id`, `Counties_States_state_id`, `Cities_city_id`, `Cities_Counties_county_id`, `Cities_Counties_States_state_id`, `Zip_Codes_zip_code_id1`, `Zip_Codes_States_state_id1`),
  INDEX `fk_Addresses_Zip_Code_Suffixes1_idx` (`Zip_Code_Suffixes_zip_code_suffix_id1` ASC, `Zip_Code_Suffixes_Zip_Codes_zip_code_id1` ASC, `Zip_Code_Suffixes_Zip_Codes_States_state_id1` ASC),
  INDEX `fk_Addresses_States1_idx` (`States_state_id2` ASC),
  INDEX `fk_Addresses_Counties1_idx` (`Counties_county_id` ASC, `Counties_States_state_id` ASC),
  INDEX `fk_Addresses_Cities1_idx` (`Cities_city_id` ASC, `Cities_Counties_county_id` ASC, `Cities_Counties_States_state_id` ASC),
  INDEX `fk_Addresses_Zip_Codes2_idx` (`Zip_Codes_zip_code_id1` ASC, `Zip_Codes_States_state_id1` ASC),
  CONSTRAINT `fk_Addresses_nursing_homes1`
    FOREIGN KEY (`nursing_homes_nursing_home_id` , `nursing_homes_nursing_home_activities_nursing_home_activity_id`)
    REFERENCES `mydb`.`Residences` (`residence_id` , `nursing_home_activities_nursing_home_activity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_Zip_Code_Suffixes1`
    FOREIGN KEY (`Zip_Code_Suffixes_zip_code_suffix_id1` , `Zip_Code_Suffixes_Zip_Codes_zip_code_id1` , `Zip_Code_Suffixes_Zip_Codes_States_state_id1`)
    REFERENCES `mydb`.`Zip_Code_Suffixes` (`zip_code_suffix_id` , `Zip_Codes_zip_code_id` , `Zip_Codes_States_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_States1`
    FOREIGN KEY (`States_state_id2`)
    REFERENCES `mydb`.`States` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_Counties1`
    FOREIGN KEY (`Counties_county_id` , `Counties_States_state_id`)
    REFERENCES `mydb`.`Counties` (`county_id` , `States_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_Cities1`
    FOREIGN KEY (`Cities_city_id` , `Cities_Counties_county_id` , `Cities_Counties_States_state_id`)
    REFERENCES `mydb`.`Cities` (`city_id` , `Counties_county_id` , `Counties_States_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_Zip_Codes2`
    FOREIGN KEY (`Zip_Codes_zip_code_id1` , `Zip_Codes_States_state_id1`)
    REFERENCES `mydb`.`Zip_Codes` (`zip_code_id` , `States_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Amenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Amenities` (
  `amenity_id` INT NOT NULL,
  `amenity_name` VARCHAR(45) NULL,
  `amenity_description` VARCHAR(45) NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  `updated_by` VARCHAR(45) NULL,
  `created_by` VARCHAR(45) NULL,
  PRIMARY KEY (`amenity_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Services` (
  `service_id` INT NOT NULL,
  `service_name` VARCHAR(45) NULL,
  `service_description` VARCHAR(45) NULL,
  `created_by` VARCHAR(45) NULL,
  `updated_by` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Residences_has_Amenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Residences_has_Amenities` (
  `Residences_residence_id` INT NOT NULL,
  `Residences_nursing_home_activities_nursing_home_activity_id` INT NOT NULL,
  `Amenities_amenity_id` INT NOT NULL,
  PRIMARY KEY (`Residences_residence_id`, `Residences_nursing_home_activities_nursing_home_activity_id`, `Amenities_amenity_id`),
  INDEX `fk_Residences_has_Amenities_Amenities1_idx` (`Amenities_amenity_id` ASC),
  INDEX `fk_Residences_has_Amenities_Residences1_idx` (`Residences_residence_id` ASC, `Residences_nursing_home_activities_nursing_home_activity_id` ASC),
  CONSTRAINT `fk_Residences_has_Amenities_Residences1`
    FOREIGN KEY (`Residences_residence_id` , `Residences_nursing_home_activities_nursing_home_activity_id`)
    REFERENCES `mydb`.`Residences` (`residence_id` , `nursing_home_activities_nursing_home_activity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Residences_has_Amenities_Amenities1`
    FOREIGN KEY (`Amenities_amenity_id`)
    REFERENCES `mydb`.`Amenities` (`amenity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Services_has_Residences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Services_has_Residences` (
  `Services_service_id` INT NOT NULL,
  `Residences_residence_id` INT NOT NULL,
  `Residences_nursing_home_activities_nursing_home_activity_id` INT NOT NULL,
  PRIMARY KEY (`Services_service_id`, `Residences_residence_id`, `Residences_nursing_home_activities_nursing_home_activity_id`),
  INDEX `fk_Services_has_Residences_Residences1_idx` (`Residences_residence_id` ASC, `Residences_nursing_home_activities_nursing_home_activity_id` ASC),
  INDEX `fk_Services_has_Residences_Services1_idx` (`Services_service_id` ASC),
  CONSTRAINT `fk_Services_has_Residences_Services1`
    FOREIGN KEY (`Services_service_id`)
    REFERENCES `mydb`.`Services` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Services_has_Residences_Residences1`
    FOREIGN KEY (`Residences_residence_id` , `Residences_nursing_home_activities_nursing_home_activity_id`)
    REFERENCES `mydb`.`Residences` (`residence_id` , `nursing_home_activities_nursing_home_activity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

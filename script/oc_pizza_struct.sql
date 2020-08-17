-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oc_pizza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oc_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oc_pizza` DEFAULT CHARACTER SET utf8 ;
USE `oc_pizza` ;

-- -----------------------------------------------------
-- Table `oc_pizza`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`contact` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(10) NULL,
  `street_number` VARCHAR(4) NULL,
  `street_name` VARCHAR(60) NULL,
  `address_complement` VARCHAR(90) NULL,
  `postal_code` VARCHAR(5) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `status_UNIQUE` (`user_status` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(5) NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_user_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_user_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `oc_pizza`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` INT UNSIGNED NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_contact1_idx` (`contact_id` ASC),
  INDEX `fk_customer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_customer_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `oc_pizza`.`contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `oc_pizza`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`restaurant` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  `contact_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_restaurant_contact1_idx` (`contact_id` ASC),
  CONSTRAINT `fk_restaurant_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `oc_pizza`.`contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `role_UNIQUE` (`role` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`employee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` INT UNSIGNED NOT NULL,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_employee_user1_idx` (`user_id` ASC),
  INDEX `fk_employee_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_employee_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_pizza`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `oc_pizza`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `oc_pizza`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `order_state_UNIQUE` (`order_state` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`order` (
  `number` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `paid_online` TINYINT(1) NOT NULL DEFAULT 0,
  `delivery` TINYINT(1) NOT NULL DEFAULT 0,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  `customer_id` INT UNSIGNED NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`number`),
  INDEX `fk_order_customer1_idx` (`customer_id` ASC),
  INDEX `fk_order_state1_idx` (`state_id` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `oc_pizza`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `oc_pizza`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`pizza` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `unit_price_ht` DECIMAL(5,2) NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` TINYINT UNSIGNED NOT NULL,
  `unit_price_ht` DECIMAL(5,2) NOT NULL,
  `rateVAT100` DECIMAL(4,2) NOT NULL DEFAULT 10,
  `order_number` INT UNSIGNED NOT NULL,
  `pizza_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_order1_idx` (`order_number` ASC),
  INDEX `fk_item_pizza1_idx` (`pizza_id` ASC),
  CONSTRAINT `fk_item_order1`
    FOREIGN KEY (`order_number`)
    REFERENCES `oc_pizza`.`order` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `oc_pizza`.`pizza` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`ingredient` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`reminder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`reminder` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  `pizza_id` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_reminder_pizza1_idx` (`pizza_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_reminder_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `oc_pizza`.`pizza` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`payment_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`payment_type` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`bill` (
  `order_number` INT UNSIGNED NOT NULL,
  `payment_type` VARCHAR(15) NOT NULL,
  `total_ht` DECIMAL(5,2) NOT NULL,
  `total_vat` DECIMAL(5,2) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT NOW(),
  `restaurant_id` INT UNSIGNED NOT NULL,
  `payment_id` INT NOT NULL,
  PRIMARY KEY (`order_number`),
  INDEX `fk_bill_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_bill_payment1_idx` (`payment_id` ASC),
  CONSTRAINT `fk_bill_order1`
    FOREIGN KEY (`order_number`)
    REFERENCES `oc_pizza`.`order` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_pizza`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `oc_pizza`.`payment_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`pizza_ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`pizza_ingredient` (
  `pizza_id` INT UNSIGNED NOT NULL,
  `ingredient_id` INT UNSIGNED NOT NULL,
  `quantity` TINYINT NOT NULL,
  PRIMARY KEY (`pizza_id`, `ingredient_id`),
  INDEX `fk_pizza_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_pizza_has_ingredient_pizza1_idx` (`pizza_id` ASC),
  CONSTRAINT `fk_pizza_has_ingredient_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `oc_pizza`.`pizza` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_pizza`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`stock` (
  `ingredient_id` INT UNSIGNED NOT NULL,
  `restaurant_id` INT UNSIGNED NOT NULL,
  `quantity` TINYINT NOT NULL,
  PRIMARY KEY (`ingredient_id`, `restaurant_id`),
  INDEX `fk_ingredient_has_restaurant_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_ingredient_has_restaurant_ingredient1_idx` (`ingredient_id` ASC),
  CONSTRAINT `fk_ingredient_has_restaurant_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_pizza`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredient_has_restaurant_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_pizza`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Database oc_pizza
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `oc_pizza` DEFAULT CHARACTER SET utf8 ;
USE `oc_pizza` ;


-- -----------------------------------------------------
-- Table `oc_contact`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_contact` (
  `contact_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(10) NULL,
  `street_number` VARCHAR(4) NULL,
  `street_name` VARCHAR(60) NULL,
  `address_complement` VARCHAR(90) NULL,
  `postal_code` VARCHAR(5) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_user_status`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_user_status` (
  `user_status_id` INT NOT NULL AUTO_INCREMENT,
  `user_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_status_id`),
  UNIQUE INDEX `status_UNIQUE` (`user_status` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_user`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `status_id` INT NOT NULL,
  `title` VARCHAR(5) NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_user_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_user_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `oc_pizza`.`oc_user_status` (`user_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_customer`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` INT UNSIGNED NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_contact1_idx` (`contact_id` ASC),
  INDEX `fk_customer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_customer_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `oc_pizza`.`oc_contact` (`contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `oc_pizza`.`oc_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_restaurant` (
  `restaurant_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`restaurant_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_restaurant_contact1_idx` (`contact_id` ASC),
  CONSTRAINT `fk_restaurant_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `oc_pizza`.`oc_contact` (`contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_role`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_UNIQUE` (`role` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_employee`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_employee` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` INT UNSIGNED NOT NULL,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_employee_user1_idx` (`user_id` ASC),
  INDEX `fk_employee_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_employee_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_pizza`.`oc_restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `oc_pizza`.`oc_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `oc_pizza`.`oc_role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_order_state`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_order_state` (
  `order_state_id` INT NOT NULL AUTO_INCREMENT,
  `order_state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_state_id`),
  UNIQUE INDEX `order_state_UNIQUE` (`order_state` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_order`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_order` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `order_state_id` INT NOT NULL,
  `paid_online` TINYINT(1) NOT NULL DEFAULT 0,
  `delivery` TINYINT(1) NOT NULL DEFAULT 0,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer1_idx` (`customer_id` ASC),
  INDEX `fk_order_state1_idx` (`order_state_id` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `oc_pizza`.`oc_customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_state1`
    FOREIGN KEY (`order_state_id`)
    REFERENCES `oc_pizza`.`oc_order_state` (`order_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_pizza` (
  `pizza_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `unit_price_ht` DECIMAL(5,2) NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`pizza_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_item`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_item` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `pizza_id` INT UNSIGNED NOT NULL,
  `quantity` TINYINT UNSIGNED NOT NULL,
  `rate_vat100` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_item_order1_idx` (`order_id` ASC),
  INDEX `fk_item_pizza1_idx` (`pizza_id` ASC),
  CONSTRAINT `fk_item_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `oc_pizza`.`oc_order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `oc_pizza`.`oc_pizza` (`pizza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_ingredient`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_ingredient` (
  `ingredient_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_reminder`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_reminder` (
  `reminder_id` INT NOT NULL AUTO_INCREMENT,
  `pizza_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `added_date` DATETIME NOT NULL DEFAULT NOW(),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_reminder_pizza1_idx` (`pizza_id` ASC),
  PRIMARY KEY (`reminder_id`),
  CONSTRAINT `fk_reminder_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `oc_pizza`.`oc_pizza` (`pizza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_payment_type`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_payment_type` (
  `payment_type_id` INT NOT NULL AUTO_INCREMENT,
  `payment_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`payment_type_id`),
  UNIQUE INDEX `type_UNIQUE` (`payment_type` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_bill`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_bill` (
  `order_id` INT UNSIGNED NOT NULL,
  `payment_type_id` INT NOT NULL DEFAULT 4,
  `restaurant_id` INT UNSIGNED NOT NULL,
  `rate_vat100` DECIMAL(4,2) NOT NULL DEFAULT 10,
  `date` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`order_id`),
  INDEX `fk_bill_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_bill_payment1_idx` (`payment_type_id` ASC),
  CONSTRAINT `fk_bill_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `oc_pizza`.`oc_order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_pizza`.`oc_restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_payment1`
    FOREIGN KEY (`payment_type_id`)
    REFERENCES `oc_pizza`.`oc_payment_type` (`payment_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza_ingredient`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_pizza_ingredient` (
  `pizza_id` INT UNSIGNED NOT NULL,
  `ingredient_id` INT UNSIGNED NOT NULL,
  `quantity` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`pizza_id`, `ingredient_id`),
  INDEX `fk_pizza_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_pizza_has_ingredient_pizza1_idx` (`pizza_id` ASC),
  CONSTRAINT `fk_pizza_has_ingredient_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `oc_pizza`.`oc_pizza` (`pizza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_pizza`.`oc_ingredient` (`ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_stock`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `oc_pizza`.`oc_stock` (
  `ingredient_id` INT UNSIGNED NOT NULL,
  `restaurant_id` INT UNSIGNED NOT NULL,
  `quantity` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ingredient_id`, `restaurant_id`),
  INDEX `fk_ingredient_has_restaurant_restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_ingredient_has_restaurant_ingredient1_idx` (`ingredient_id` ASC),
  CONSTRAINT `fk_ingredient_has_restaurant_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_pizza`.`oc_ingredient` (`ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredient_has_restaurant_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_pizza`.`oc_restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

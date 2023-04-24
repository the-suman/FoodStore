-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema foodstoredb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema foodstoredb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `foodstoredb` DEFAULT CHARACTER SET utf8 ;
USE `foodstoredb` ;

-- -----------------------------------------------------
-- Table `foodstoredb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`address` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`address` (
  `addressId` VARCHAR(36) NOT NULL,
  `addressLine1` VARCHAR(100) NOT NULL,
  `addressLine2` VARCHAR(100) NULL,
  `pincode` INT NOT NULL,
  `district` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`addressId`));


-- -----------------------------------------------------
-- Table `foodstoredb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`User` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`User` (
  `userId` VARCHAR(36) NOT NULL,
  `addressId` VARCHAR(36) NULL,
  `fName` VARCHAR(25) NOT NULL,
  `lName` VARCHAR(25) NULL,
  `mob` BIGINT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`userId`),
  INDEX `User_address_idx` (`addressId` ASC) VISIBLE,
  CONSTRAINT `User_address`
    FOREIGN KEY (`addressId`)
    REFERENCES `foodstoredb`.`address` (`addressId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `foodstoredb`.`User_Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`User_Roles` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`User_Roles` (
  `userId` VARCHAR(36) NOT NULL,
  `role` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`userId`, `role`),
  CONSTRAINT `UserRoles_UserId`
    FOREIGN KEY (`userId`)
    REFERENCES `foodstoredb`.`User` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `foodstoredb`.`store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`store` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`store` (
  `storeId` VARCHAR(36) NOT NULL,
  `addressId` VARCHAR(36) NULL,
  `adminId` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`storeId`),
  INDEX `store_admin_idx` (`adminId` ASC) VISIBLE,
  INDEX `store_address_idx` (`addressId` ASC) VISIBLE,
  CONSTRAINT `store_admin`
    FOREIGN KEY (`adminId`)
    REFERENCES `foodstoredb`.`User` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `store_address`
    FOREIGN KEY (`addressId`)
    REFERENCES `foodstoredb`.`address` (`addressId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `foodstoredb`.`Item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`Item` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`Item` (
  `itemId` VARCHAR(36) NOT NULL,
  `storeId` VARCHAR(36) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  `price` DECIMAL(6,2) NULL,
  `qty` INT NULL,
  PRIMARY KEY (`itemId`),
  INDEX `items_store_idx` (`storeId` ASC) VISIBLE,
  CONSTRAINT `items_store`
    FOREIGN KEY (`storeId`)
    REFERENCES `foodstoredb`.`store` (`storeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `foodstoredb`.`Cart_Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`Cart_Items` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`Cart_Items` (
  `userId` VARCHAR(36) NOT NULL,
  `itemId` VARCHAR(36) NOT NULL,
  `qty` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`userId`),
  INDEX `item_cart_idx` (`itemId` ASC) VISIBLE,
  CONSTRAINT `user_cart`
    FOREIGN KEY (`userId`)
    REFERENCES `foodstoredb`.`User` (`userId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `item_cart`
    FOREIGN KEY (`itemId`)
    REFERENCES `foodstoredb`.`Item` (`itemId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `foodstoredb`.`paymentdetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`paymentdetails` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`paymentdetails` (
  `paymentId` VARCHAR(36) NOT NULL,
  `type` VARCHAR(30) NOT NULL,
  `UPI` VARCHAR(45) NULL,
  `cardNumber` VARCHAR(45) NULL,
  `amount` DECIMAL(8,2) NULL,
  `DATE` DATE NULL,
  `TIME` TIMESTAMP NULL,
  PRIMARY KEY (`paymentId`));


-- -----------------------------------------------------
-- Table `foodstoredb`.`OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`OrderDetails` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`OrderDetails` (
  `orderId` VARCHAR(36) NOT NULL,
  `userId` VARCHAR(45) NOT NULL,
  `paymentId` VARCHAR(45) NOT NULL,
  `totalDiscount` DECIMAL(6,2) NULL,
  `totalAmount` DECIMAL(6,2) NULL,
  `orderStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`orderId`),
  INDEX `User_Transaction_idx` (`userId` ASC) VISIBLE,
  INDEX `Trans_Payment_idx` (`paymentId` ASC) VISIBLE,
  CONSTRAINT `User_Transaction`
    FOREIGN KEY (`userId`)
    REFERENCES `foodstoredb`.`User` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Trans_Payment`
    FOREIGN KEY (`paymentId`)
    REFERENCES `foodstoredb`.`paymentdetails` (`paymentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `foodstoredb`.`Order_Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `foodstoredb`.`Order_Items` ;

CREATE TABLE IF NOT EXISTS `foodstoredb`.`Order_Items` (
  `orderId` VARCHAR(36) NOT NULL,
  `itemId` VARCHAR(36) NOT NULL,
  `qty` INT NOT NULL DEFAULT 1,
  `unitPrice` DECIMAL(6,2) NOT NULL,
  `discount` DECIMAL(6,2) NULL DEFAULT 0,
  PRIMARY KEY (`orderId`, `itemId`),
  INDEX `order_items_idx` (`itemId` ASC) VISIBLE,
  CONSTRAINT `orderdetails`
    FOREIGN KEY (`orderId`)
    REFERENCES `foodstoredb`.`OrderDetails` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_items`
    FOREIGN KEY (`itemId`)
    REFERENCES `foodstoredb`.`Item` (`itemId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `foodstoredb`.`address`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`address` (`addressId`, `addressLine1`, `addressLine2`, `pincode`, `district`, `state`, `country`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522141', 'Abc Lane', 'KP Road', 800001, 'KOLKATA', 'WEST BENGAL', 'INDIA');
INSERT INTO `foodstoredb`.`address` (`addressId`, `addressLine1`, `addressLine2`, `pincode`, `district`, `state`, `country`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522142', 'GB ROAD', 'HC VERMA COLONY', 876789, 'PATNA', 'BIHAR', 'INDIA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`User` (`userId`, `addressId`, `fName`, `lName`, `mob`, `email`, `password`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522151', 'ec5007fb-ba15-4f43-add4-76edc7522141', 'Guest', 'User', 6787654354, 'guest@gmail.com', 'guest');
INSERT INTO `foodstoredb`.`User` (`userId`, `addressId`, `fName`, `lName`, `mob`, `email`, `password`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522152', 'ec5007fb-ba15-4f43-add4-76edc7522142', 'Admin', 'User', 9876545678, 'admin@gmail.com', 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`User_Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`User_Roles` (`userId`, `role`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522151', 'CUSTOMER');
INSERT INTO `foodstoredb`.`User_Roles` (`userId`, `role`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522152', 'ADMIN');

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`store`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`store` (`storeId`, `addressId`, `adminId`, `name`, `description`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522132', 'ec5007fb-ba15-4f43-add4-76edc7522142', 'ec5007fb-ba15-4f43-add4-76edc7522152', 'Bitter Foods', 'Drinks and waverages collections availaab, popular for sweets and drinks');

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`Item`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`Item` (`itemId`, `storeId`, `name`, `type`, `description`, `price`, `qty`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522121', 'ec5007fb-ba15-4f43-add4-76edc7522132', 'ROAST CHICKEN', 'CONTINENTAL', 'roasted chicken handi', 354, 45);
INSERT INTO `foodstoredb`.`Item` (`itemId`, `storeId`, `name`, `type`, `description`, `price`, `qty`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522122', 'ec5007fb-ba15-4f43-add4-76edc7522132', 'BRIYANI', 'CONTINENTAL', 'Kolkata famous briyani', 123, 23);
INSERT INTO `foodstoredb`.`Item` (`itemId`, `storeId`, `name`, `type`, `description`, `price`, `qty`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522123', 'ec5007fb-ba15-4f43-add4-76edc7522132', 'MUTTER PANEER', 'ASIAN', 'Chola Kulcha, Mutter paneer', 89, 12);
INSERT INTO `foodstoredb`.`Item` (`itemId`, `storeId`, `name`, `type`, `description`, `price`, `qty`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522124', 'ec5007fb-ba15-4f43-add4-76edc7522132', 'CHAUMIN', 'FASTFOOD', 'Chaumin With Sauced and colored', 367, 24);

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`Cart_Items`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`Cart_Items` (`userId`, `itemId`, `qty`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522151', 'ec5007fb-ba15-4f43-add4-76edc7522121', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`paymentdetails`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`paymentdetails` (`paymentId`, `type`, `UPI`, `cardNumber`, `amount`, `DATE`, `TIME`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522161', 'UPI', '56789987654@PAYTM', '', 317, NULL, NULL);
INSERT INTO `foodstoredb`.`paymentdetails` (`paymentId`, `type`, `UPI`, `cardNumber`, `amount`, `DATE`, `TIME`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522162', 'CREDIT_CARD', '', 'XXXXXXX123', 312, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`OrderDetails`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`OrderDetails` (`orderId`, `userId`, `paymentId`, `totalDiscount`, `totalAmount`, `orderStatus`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522111', 'ec5007fb-ba15-4f43-add4-76edc7522151', 'ec5007fb-ba15-4f43-add4-76edc7522161', 0, 317, 'SUCCESS');
INSERT INTO `foodstoredb`.`OrderDetails` (`orderId`, `userId`, `paymentId`, `totalDiscount`, `totalAmount`, `orderStatus`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522112', 'ec5007fb-ba15-4f43-add4-76edc7522151', 'ec5007fb-ba15-4f43-add4-76edc7522162', 0, 234, 'FAILURE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `foodstoredb`.`Order_Items`
-- -----------------------------------------------------
START TRANSACTION;
USE `foodstoredb`;
INSERT INTO `foodstoredb`.`Order_Items` (`orderId`, `itemId`, `qty`, `unitPrice`, `discount`) VALUES ('ec5007fb-ba15-4f43-add4-76edc7522111', 'ec5007fb-ba15-4f43-add4-76edc7522121', 3, 317, 0);

COMMIT;


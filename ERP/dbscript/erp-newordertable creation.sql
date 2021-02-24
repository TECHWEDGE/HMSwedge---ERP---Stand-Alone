CREATE TABLE `erpho`.`orders` (
  `autoid` INT NOT NULL AUTO_INCREMENT,
  `orderid` VARCHAR(255) NULL,
  `orderDate` DATETIME NULL,
  `delivery` VARCHAR(255) NULL,
  `author` VARCHAR(255) NULL,
  `count` INT NULL,
  PRIMARY KEY (`autoid`));
  
ALTER TABLE `erpho`.`orders` 
ADD COLUMN `supplierid` INT NULL AFTER `count`;  

ALTER TABLE `erpho`.`orders` 
ADD COLUMN `branchid` INT NULL AFTER `supplierid`;

CREATE TABLE `erpho`.`orderdetails` (
  `autoid` INT NOT NULL AUTO_INCREMENT,
  `pid` INT NULL,
  `unit` VARCHAR(255) NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`autoid`));
  
ALTER TABLE `erpho`.`orderdetails` 
ADD COLUMN `orderautoid` INT NULL AFTER `quantity`,
ADD INDEX `orderautoid_idx` (`orderautoid` ASC) VISIBLE;
;
ALTER TABLE `erpho`.`orderdetails` 
ADD CONSTRAINT `orderautoid`
  FOREIGN KEY (`orderautoid`)
  REFERENCES `erpho`.`orders` (`autoid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `erpho`.`sale` (
  `autoid` INT NOT NULL AUTO_INCREMENT,
  `invoice` VARCHAR(255) NULL,
  `invoicedate` DATE NULL,
  `cdiscount` FLOAT NULL,
  `cid` INT NULL,
  `branchid` INT NULL,
  `fileno` VARCHAR(255) NULL,
  `titems` INT NULL,
  `subt` DOUBLE NULL,
  `tax` FLOAT NULL,
  `discount` FLOAT NULL,
  `gtotal` DOUBLE NULL,
  PRIMARY KEY (`autoid`));
  
CREATE TABLE `erpho`.`saledetails` (
  `autoid` INT NOT NULL AUTO_INCREMENT,
  `pid` INT NULL,
  `batch` VARCHAR(255) NULL,
  `expirydate` DATE NULL,
  `unit` INT NULL,
  `unitprice` FLOAT NULL,
  `quantity` INT NULL,
  `stock` INT NULL,
  `total` DOUBLE NULL,
  `spack` VARCHAR(255) NULL,
  `spsize` INT NULL,
  `sudesc` VARCHAR(255) NULL,
  PRIMARY KEY (`autoid`));

ALTER TABLE `erpho`.`saledetails` 
ADD COLUMN `salesautoid` INT NOT NULL AFTER `sudesc`;

ALTER TABLE `erpho`.`saledetails` 
CHANGE COLUMN `unit` `quantitysold` INT NULL DEFAULT NULL ,
CHANGE COLUMN `quantity` `totalquantity` INT NULL DEFAULT NULL ;

ALTER TABLE `erpho`.`sale` 
ADD COLUMN `createdby` VARCHAR(255) NULL AFTER `gtotal`;

ALTER TABLE `erpho`.`sale` 
ADD COLUMN `isPatient` VARCHAR(45) NULL DEFAULT 'false' ;
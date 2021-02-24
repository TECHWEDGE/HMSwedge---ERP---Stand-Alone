CREATE TABLE `erpho`.`purchases` (
  `autoid` INT NOT NULL AUTO_INCREMENT,
  `allocationid` VARCHAR(255) NULL,
  `receiveddate` DATETIME NULL,
  `supplierid` INT NULL,
  `supplierinvoice` VARCHAR(255) NULL,
  `grandtotal` DOUBLE NULL,
  PRIMARY KEY (`autoid`));

CREATE TABLE `erpho`.`purchasedetails` (
  `autoid` INT NOT NULL AUTO_INCREMENT,
  `pid` INT NULL,
  `batch` VARCHAR(255) NULL,
  `packdesc` VARCHAR(45) NULL,
  `packsize` INT NULL,
  `singleunitdesc` VARCHAR(255) NULL,
  `purchaseqty` INT NULL,
  `totalpurchaseprice` DOUBLE NULL,
  `unitcp` FLOAT NULL,
  `stocknumber` INT NULL,
  `stockvaluepurchase` DOUBLE NULL,
  `purchasesid` INT NOT NULL,
  PRIMARY KEY (`autoid`));

ALTER TABLE `erpho`.`purchases` 
ADD COLUMN `branchid` INT NOT NULL AFTER `grandtotal`;

ALTER TABLE `erpho`.`purchasedetails` 
ADD COLUMN `expirydate` DATE NULL AFTER `purchasesid`;

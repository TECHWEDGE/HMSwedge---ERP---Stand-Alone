ALTER TABLE `erpho`.`dproductstock` 
DROP COLUMN `category`,
DROP COLUMN `name`,
DROP COLUMN `code`,
CHANGE COLUMN `batch` `batch` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `currentstock` `currentstock` INT NULL DEFAULT NULL ,
CHANGE COLUMN `expdate` `expdate` DATE NULL DEFAULT NULL ,
CHANGE COLUMN `mpsize` `mpsize` INT NULL DEFAULT NULL ,
CHANGE COLUMN `cp` `cp` FLOAT NULL DEFAULT NULL ,
CHANGE COLUMN `prqty` `prqty` INT NULL DEFAULT NULL ,
CHANGE COLUMN `stkpr` `stkpr` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `markup` `markup` FLOAT NULL DEFAULT NULL ,
CHANGE COLUMN `sp` `sp` FLOAT NULL DEFAULT NULL ,
CHANGE COLUMN `spsize` `spsize` INT NULL DEFAULT NULL ,
CHANGE COLUMN `stksp` `stksp` FLOAT NULL DEFAULT NULL ,
CHANGE COLUMN `sellqty` `sellqty` INT NULL DEFAULT NULL ,
CHANGE COLUMN `sunits` `sunits` INT NULL DEFAULT NULL ,
CHANGE COLUMN `tprice` `tprice` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `prprice` `prprice` DOUBLE NULL DEFAULT NULL ;

ALTER TABLE `erpho`.`dproductstock` 
CHANGE COLUMN `markup` `markup` FLOAT NULL DEFAULT 70 ,
CHANGE COLUMN `sp` `sp` FLOAT NULL DEFAULT 0 ,
CHANGE COLUMN `spdesc` `spdesc` VARCHAR(255) NULL DEFAULT 'NA' ,
CHANGE COLUMN `spsize` `spsize` INT NULL DEFAULT 0 ,
CHANGE COLUMN `stksp` `stksp` FLOAT NULL DEFAULT 0 ,
CHANGE COLUMN `sellqty` `sellqty` INT NULL DEFAULT 0 ,
CHANGE COLUMN `sunits` `sunits` INT NULL DEFAULT 0 ,
CHANGE COLUMN `prprice` `prprice` DOUBLE NULL DEFAULT 0.00 ;

ALTER TABLE `erpho`.`dproductstock` 
ADD COLUMN `autoid` INT NOT NULL AUTO_INCREMENT AFTER `active`,
ADD PRIMARY KEY (`autoid`);
;

ALTER TABLE `erpho`.`dproductstock` 
DROP INDEX `name_UNIQUE` ;
;

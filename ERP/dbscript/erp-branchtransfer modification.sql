ALTER TABLE `erpho`.`transferdetails` 
CHANGE COLUMN `expdate` `expdate` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `stkstrans` `stkstrans` INT NULL DEFAULT NULL ,
CHANGE COLUMN `cp` `cp` FLOAT NULL DEFAULT NULL ,
CHANGE COLUMN `sp` `sp` FLOAT NULL DEFAULT NULL ;

ALTER TABLE `erpho`.`branchtransfer` 
ADD PRIMARY KEY (`btid`),
DROP INDEX `btid_UNIQUE` ;
;


ALTER TABLE `erpho`.`branchtransfer` 
CHANGE COLUMN `datetime` `datetime` DATETIME NULL DEFAULT NULL ;

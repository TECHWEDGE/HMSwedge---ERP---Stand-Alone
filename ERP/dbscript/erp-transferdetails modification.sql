ALTER TABLE `erpho`.`transferdetails` 
ADD COLUMN `id` INT NULL AFTER `sp`,
ADD COLUMN `fid` INT NULL AFTER `id`,
ADD COLUMN `lastcreated` DATETIME NULL AFTER `fid`;
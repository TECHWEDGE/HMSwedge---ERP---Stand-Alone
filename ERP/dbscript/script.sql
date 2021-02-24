ALTER TABLE `erpho`.`manufacture` 
CHANGE COLUMN `mid` `mid` INT(11) NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`mid`);
;

ALTER TABLE `erpho`.`supply` 
CHANGE COLUMN `sid` `sid` INT(11) NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`sid`);
;


ALTER TABLE `erpho`.`customer` 
ADD COLUMN `cid` INT(11) NOT NULL AUTO_INCREMENT AFTER `datetime`,
ADD PRIMARY KEY (`cid`);
;

ALTER TABLE `erpho`.`dcustomer` 
ADD COLUMN `cid` VARCHAR(45) NOT NULL AFTER `address2`,
ADD PRIMARY KEY (`cid`);
;

ALTER TABLE `erpho`.`product` 
ADD PRIMARY KEY (`pid`);
;

USE `erpho`;
DROP procedure IF EXISTS `Transfer_Stocks`;

DELIMITER $$
USE `erpho`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Transfer_Stocks`(
in stksArr json,
out result Integer
)
begin
declare paramautoid int;
declare parampid int;
declare parambatch Varchar(255);
declare paramcurrentstock int;
declare paramexpdate Date;
declare parammpack Varchar(255);
declare parammpsize int;
declare paramcp float;
declare paramprqty int;
declare paramsudesc Varchar(255);
declare paramstkpr double;
declare parammarkup float;
declare paramsp float;
declare paramspdesc Varchar(255);
declare paramspsize int;
declare paramstksp float;
declare paramsellqty float;
declare paramsunits int;
declare paramtprice double;
declare paramprprice double;
declare paramid int;
declare paramstatus Varchar(255);
declare paramfid int;
declare paramquantity int;
declare i int default 0;

 while i < json_length(stksArr) do
  set parampid = (select json_extract(stksArr, concat('$[',i,'].pid')));
  set parambatch = (select json_unquote(json_extract(stksArr, concat('$[',i,'].batch'))));
  set paramcurrentstock = (select json_extract(stksArr, concat('$[',i,'].currentstock')));
  set paramexpdate = (select json_extract(stksArr, concat('$[',i,'].expirydate')));
  set parammpack = (select json_unquote(json_extract(stksArr, concat('$[',i,'].mpack'))));
  set parammpsize = (select json_extract(stksArr, concat('$[',i,'].mpsize')));
  set paramcp = (select json_extract(stksArr, concat('$[',i,'].cp')));
  set paramprqty = (select json_extract(stksArr, concat('$[',i,'].purchaseqty')));
  set paramsudesc = (select json_unquote(json_extract(stksArr, concat('$[',i,'].sudesc'))));
  set parammarkup = (select json_extract(stksArr, concat('$[',i,'].markup')));
  set paramsp = (select json_extract(stksArr, concat('$[',i,'].sp')));
  set paramspdesc = (select json_unquote(json_extract(stksArr, concat('$[',i,'].spdesc'))));
  set paramspsize = (select json_extract(stksArr, concat('$[',i,'].spsize')));
  set paramstksp = (select json_extract(stksArr, concat('$[',i,'].stksp')));
  set paramsellqty = (select json_extract(stksArr, concat('$[',i,'].sellqty')));
  set paramsunits = (select json_extract(stksArr, concat('$[',i,'].sunits')));
  set paramtprice = (select json_extract(stksArr, concat('$[',i,'].totalprice')));
  set paramprprice = (select json_extract(stksArr, concat('$[',i,'].purchaseprice')));
  set paramid = (select json_extract(stksArr, concat('$[',i,'].branchid')));
  set paramstatus = (select json_unquote(json_extract(stksArr, concat('$[',i,'].status'))));
  set paramfid = (select json_extract(stksArr, concat('$[',i,'].fromBranchId')));
  set paramquantity = (select json_extract(stksArr, concat('$[',i,'].quantity')));
  set paramstkpr = (select json_extract(stksArr, concat('$[',i,'].stockprice')));
if paramfid = paramid then
 begin
    set paramautoid  = (select autoid from dproductstock where batch = parambatch and id = paramid and pid = parampid);
		   if paramautoid is not null || paramautoid > 0 then
               begin
               update dproductstock set expdate = paramexpdate, mpsize = parammpsize, cp = paramcp, prqty = paramprqty,
               prprice = paramprprice, currentstock = currentstock + paramquantity, sudesc = paramsudesc, stkpr = paramstkpr,
               markup = parammarkup, sp = paramsp, spdesc = paramspdesc, spsize = paramspsize, stksp = paramstksp,
               sellqty = paramsellqty, sunits = paramsunits, tprice = paramtprice, id = paramid, pid = parampid where autoid = paramautoid;	
               end;
		   else
               begin
               insert into dproductstock(batch,expdate,mpack,mpsize,cp,prqty,prprice,currentstock,sudesc,stkpr,markup,sp,spdesc,spsize,stksp,sellqty,sunits,tprice,id,pid)
			   values(parambatch,paramexpdate,parammpack,parammpsize,paramcp,paramprqty,paramprprice,paramquantity,paramsudesc,paramstkpr,parammarkup,paramsp,paramspdesc,paramspsize,paramstksp,paramsellqty,paramsunits,paramtprice,paramid,parampid);
	           end;
          end if;
 end;
else
 begin
   set paramautoid =  (select autoid FROM  productstock where batch = parambatch and id = paramfid and pid = parampid);
		   if paramautoid is not null || paramautoid > 0 then
			  begin
              update productstock set expdate = paramexpdate, mpsize=parammpsize, cp=paramcp, prqty= paramprqty, prprice=paramprprice, currentstock=currentstock + paramquantity, sudesc=paramsudesc, stkpr=paramstkpr, markup=parammarkup, sp=paramsp, spdesc=paramspdesc,
              spsize=paramspsize,stksp=paramstksp,sellqty=paramsellqty,sunits=paramsunits,tprice=paramtprice where autoid = paramautoid;
              end;
           else
              begin 
              insert into productstock (batch,expdate,mpack,mpsize,cp,prqty,prprice,currentstock,sudesc,stkpr,markup,sp,spdesc,spsize,stksp,sellqty,sunits,tprice,id,pid)
              values(parambatch,paramexpdate,parammpack,parammpsize,paramcp,paramprqty,paramprprice,paramquantity,paramsudesc,paramstkpr,parammarkup,paramsp,paramspdesc,paramspsize,paramstksp,
              paramsellqty,paramsunits,paramtprice,paramfid,parampid);
              end;
           end if;
 end;
end if;
             begin
             insert into transferdetails(pid,batch,expdate,stkstrans,cp,sp,id,fid,lastcreated)
			 values(parampid,parambatch,paramexpdate,paramquantity,paramcp,paramsp,paramid,paramfid,now());
			 SELECT ROW_COUNT() into result;
             update productstock set currentstock = currentstock - paramquantity where id = paramid and pid = parampid and batch = parambatch;
			 end;
set i = i + 1;
end while;

end$$

DELIMITER ;


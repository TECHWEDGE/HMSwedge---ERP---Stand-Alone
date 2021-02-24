<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	
  	   <div class="table-responsive">   
  <table class="table table-striped table-bordered table-hover table-condensed " id="myTable">
    <thead class="thead">
    <tr style="display:flex">
	
		<th style="width:53px">Status</th>
        <th style="width:101px">Product Code</th>
        <th style="width:162px">Product Name</th>
        <th style="width:110px">Batch</th>
        
        <th style="width:164px">ExpiryDate</th>
        <th style="width:59px"> Manu- facture Pack Desc</th>
        <th style="width:76px">Manuf- acturing Pack Size</th>
        <th style="width:74px">UnitCP</th>
        <th style="width:76px">Purchase Qty</th>
        <th style="width:84px">Total Purchase Price</th>
        <th style="width:71px">Stock Number</th>
        <th style="width:88px">Single Unit Desc</th>
        <th style="width:101px">StockValue at CP</th>
        
        <th style="width:71px">Markup</th>
        <th style="width:71px">Selling Price</th>
        <th style="width:71px">Selling Pack Desc</th>
        <th style="width:71px">Selling Pack Size</th>
        <th style="width:82px">Stock Value at SP</th>
        <th style="width:69px">Selling Qty</th>
        <th style="width:72px">Total Single Units</th>
        <th style="width:72px">Total Price</th>
        <th></th>
      </tr>
    </thead>
    <tbody class="tbody" style="display:block">
    <c:forEach var="ps" varStatus="productStks"  items="${model.list.productStockList}">
     <tr>
    <!--  <input name="status2" form="form2" type="hidden"> -->
     	<td><input type="checkbox" <c:if test="${ps.status == 'on'}">checked="checked"</c:if> class="status" name="productStockList[${productStks.index}].status" id="${ps.autoid}" style="width:41px" form="form2" onchange="statuschange(this)" value="${ps.status}"><input name="productStockList[${productStks.index}].autoid" form="form2" type="hidden" value="${ps.autoid}"></td>
        <td style="width:"><input type="text" style="width:90px"  readonly="readonly" name="productStockList[${productStks.index}].code" id="code" form="form2" class="form-control input-sm ft" value="${ps.code}"></td>
        <td style="width:"><input type="text" style="width:151px" readonly="readonly" name="productStockList[${productStks.index}].name" form="form2" id="name" class="form-control input-sm ft" value="${ps.name}"><input type='hidden' name='productStockList[${productStks.index}].pid' id='pid' form="form2" value="${ps.pid}"></td>
        <td style="width:"><input type="text" style="width:100px" readonly="readonly" name="productStockList[${productStks.index}].batch" form="form2" id="batch" class="form-control input-sm ft" value="${ps.batch}"></td>
        <td style="width:"><input type="date" maxlength="2999-12-31" name="productStockList[${productStks.index}].expirydate" onfocusout="setmin(this)" form="form2" id="expDate"  class="form-control input-sm ft" value="${ps.expirydate}"></td>
        <td style="width:"><input type="text" style="width:48px" name="productStockList[${productStks.index}].mpack" form="form2" id="mpack" class="form-control input-sm ft" value="${ps.mpack}"></td>
        <td style="width:"><input type="number" min='1' style="width:65px" name="productStockList[${productStks.index}].mpsize" form="form2" id="mpsize" onkeypress='return onlyNos(event,this);' class="form-control input-sm ft" value="${ps.mpsize}"></td>
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].cp" style="width:63px" form="form2" id="cp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.cp}"></td>
        <td style="width:"><input type="number" min='1' style="width:64px"  name="productStockList[${productStks.index}].purchaseqty" form="form2" id="prqty" onkeypress='return onlyNos(event,this);' class="form-control input-sm ft" value="${ps.purchaseqty}"></td>
        <td style="width:"><input readonly type="number" style="width:73px"  name="productStockList[${productStks.index}].purchaseprice" form="form2" id="prprice" class="form-control input-sm ft" value="${ps.purchaseprice}"></td>  
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].currentstock" style="width:60px"  form="form2" id="quantity" class="form-control input-sm ft" onkeypress='return onlyNos(event,this);' value="${ps.currentstock}"></td>
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].sudesc" form="form2"  style="width:77px" id="sudesc" class="form-control input-sm ft" value="${ps.sudesc}"></td>
        <td style="width:"><input readonly type="number" name="productStockList[${productStks.index}].stockprice" style="width:90px"  form="form2" id="stkpr" class="form-control input-sm ft" value="${ps.stockprice}"></td>
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].markup" style="width:60px"  form="form2" id="markup" class="form-control input-sm ft" value="${ps.markup}"></td>
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].sp" style="width:60px"  form="form2" id="sp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.sp}"></td>
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].spdesc"  style="width:60px" form="form2" id="spdesc" class="form-control input-sm ft" value="${ps.spdesc}"></td> 
        <td style="width:"><input type="text" name="productStockList[${productStks.index}].spsize" style="width:60px"  form="form2" id="spsize" min='0' onkeypress='return onlyNos(event,this);' class="form-control input-sm ft" value="${ps.spsize}"></td> 
        <td style="width:"><input type="text" style="width:71px"  onkeypress='return onlyNos1(event,this);' name="productStockList[${productStks.index}].stksp" form="form2" id="stksp"  class="form-control input-sm ft" value="${ps.stksp}"></td> 
        <td style="width:"><input type="number" style="width:60px"  min='0' name="productStockList[${productStks.index}].sellqty" onkeypress='return onlyNos(event,this);' form="form2" id="sellqty" class="form-control input-sm ft" value="${ps.sellqty}"></td> 
        <td style="width:"><input type="text"  style="width:60px"  onkeypress='return onlyNos1(event,this);' name="productStockList[${productStks.index}].sunits" form="form2" id="sunits" class="form-control input-sm ft" value="${ps.sunits}"></td> 
        <td style="width:"><input type="text"  style="width:60px"  onkeypress='return onlyNos1(event,this);' name="productStockList[${productStks.index}].totalprice" form="form2" id="tprice" class="form-control input-sm ft" value="${ps.totalprice}"></td> 
     
    
      </tr>
          <script>
         // validDate()
        </script>
      </c:forEach>
    </tbody>
  </table>
  <c:if test="${empty myObject.featuresList}">
  <div>
  <p style="color:red;text-align:center">No records available. Please change 'Expiry Date' and 'To Date' to view records</p>
  </div>
  </c:if>
</div>



</body>
</html>
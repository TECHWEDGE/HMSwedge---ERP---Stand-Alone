<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<div class="table-responsive">   
  <table class="table table-striped table-bordered table-hover table-condensed " style="" id="myTable">
    <thead style="display: block;">
    <tr>
        
        <th style="width:100px">Product Code</th>
        <th style="width:100px">Product Name</th>
        <th style="width:102px">Batch</th>
        
        <th style="width:103px">ExpiryDate</th>
        <th style="width:100px"> Manufacture Pack Desc</th>
        <th style="width:102px">Manufa- cturing Pack Size</th>
        <th style="width:102px">UnitCP</th>
        <th style="width:102px">Stock Number</th> 
        <th style="width:102px">Selling Price</th>
        <th style="width:102px">Selling Pack Desc</th>
        <th style="width:">Selling Pack Size</th>
      
        <th></th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:choose>
    
    <c:when test="${empty model.list.productStockList}">
     <script>
     alert("No records found")
     </script>
    </c:when>
    <c:otherwise>
    <c:forEach var="ps" varStatus="productStks" items="${model.list.productStockList}">
     <tr>
        <td><input name="productStockList[${productStks.index}].autoid" form="form2" type="hidden" value="${ps.autoid}"><input type="text" readonly="readonly" name="productStockList[${productStks.index}].code" id="code" form="form2" class="form-control input-sm ft" value="${ps.code}"></td>
        <td><input type="text" readonly="readonly" name="productStockList[${productStks.index}].name" form="form2" id="name" class="form-control input-sm ft" value="${ps.name}"><input type='hidden' name='productStockList[${productStks.index}].pid' id='pid' form="form2" value="${ps.pid}"></td>
        <td><input type="text" readonly="readonly" name="productStockList[${productStks.index}].batch" form="form2" id="batch" class="form-control input-sm ft" value="${ps.batch}"></td>
        <td><input type="text" readonly maxlength="2999-12-31" name="productStockList[${productStks.index}].expirydate" onfocusout="setmin(this)" form="form2" id="expdate"  class="form-control input-sm ft" value="${ps.expirydate}"></td>
        <td><input type="text" readonly name="productStockList[${productStks.index}].mpack" form="form2" id="mpack" class="form-control input-sm ft" value="${ps.mpack}"></td>
        <td><input type="text" readonly form="form2" name="productStockList[${productStks.index}].mpsize" id="mpsize" class="form-control input-sm ft" value="${ps.mpsize}"></td>
        <td><input type="text"  name="productStockList[${productStks.index}].cp" form="form2" id="cp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.cp}"></td>
        <td><input type="text" readonly name="productStockList[${productStks.index}].currentstock" form="form2" id="quantity" class="form-control input-sm ft" value="${ps.currentstock}"></td>
        <td><input type="text" name="productStockList[${productStks.index}].sp"form="form2" id="sp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.sp}"></td>
        <td><input type="text" name="productStockList[${productStks.index}].spdesc" form="form2" id="spdesc" class="form-control input-sm ft" value="${ps.spdesc}"></td>
        <td><input type="text" name="productStockList[${productStks.index}].spsize" form="form2" class="form-control input-sm ft" id="spsize" value="${ps.spsize}"><input type="hidden" name="productStockList[${productStks.index}].purchaseqty" form="form2" id="prqty" value="${ps.purchaseqty}"><input type="hidden" name="productStockList[${productStks.index}].purchaseprice" form="form2" id="prprice" value="${ps.purchaseprice}"><input type="hidden" name="productStockList[${productStks.index}].sudesc" form="form2" id="sudesc" value="${ps.sudesc}"><input type="hidden" name="productStockList[${productStks.index}].stockprice" form="form2" id="stkpr" value="${ps.stockprice}"><input type="hidden" name="productStockList[${productStks.index}].markup" form="form2" id="markup" value="${ps.markup}"><input type="hidden" name="productStockList[${productStks.index}].stksp" form="form2" id="stksp" value="${ps.stksp}"><input type="hidden" name="productStockList[${productStks.index}].sellqty" form="form2" id="sellqty" value="${ps.sellqty}"><input type="hidden"  onkeypress='return onlyNos1(event,this);' name="productStockList[${productStks.index}].sunits" form="form2" id="sunits" class="form-control input-sm ft" value="${ps.sunits}"><input type="hidden" name="productStockList[${productStks.index}].totalprice" form="form2" id="tprice" value="${ps.totalprice}"></td>
        
      </tr>
          <script>
         // validDate()
        </script>
      </c:forEach>
      </c:otherwise>
      </c:choose>
     
 
  
    </tbody>
  </table>
  </div>
</body>
</html>
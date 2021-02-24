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
<table class="table table-striped table-bordered table-hover table-condensed" id="myTable">
    <thead style="display:block">
    <tr>
        <th style="width:60px">Select</th>
        <th style="width:116px">Product Code</th>
        <th style="width:113px">Product Name</th>
        <th style="width:125px">Batch</th>
        <th style="width:119px">Expiry Date</th>
        <th style="width:94px">Single Unit Current Stock</th>
        <th style="width:110px">Manufa- cturing Pack Size</th>
        <th style="width:107px">Unit CP</th>
        <th style="width:116px">Unit SP</th>
        <th style="width:78px">Qty to Transfer in Single Units</th>
        <th style="width:186px">Branch to Transfer</th>
        <th style="width:50px">Stock at Branch</th>
      </tr>
    </thead>
    <tbody class="tbody" style="display: block;height: 300px;overflow-y: auto;">
     <c:forEach var="ps" varStatus="productStks"  items="${model.list.productStockList}">
      <tr>
      <td style="width:61px;"><input type="checkbox" class="text-center" name="productStockList[${productStks.index}].status" id="check" form="form2"><input name="productStockList[${productStks.index}].autoid" form="form2" type="hidden" value="${ps.autoid}"> </td>
        <td><input type="text" readonly="readonly" name="productStockList[${productStks.index}].code" id="code"  class="form-control input-sm ft" value="${ps.code}"></td>
        <td><input type="text" readonly="readonly" name="productStockList[${productStks.index}].name"  id="name" class="form-control input-sm ft" value="${ps.name}"><input type='hidden' name='productStockList[${productStks.index}].pid' id='pid' form="form2" value="${ps.pid}"></td>
        <td><input type="text" readonly="readonly" name="productStockList[${productStks.index}].batch" form="form2" id="batch" class="form-control input-sm ft" value="${ps.batch}"></td>
        <td style="width: 95px;"><fmt:formatDate value="${ps.expirydate}" type='date' pattern="dd-MM-yyyy"/><input  type="hidden" name="productStockList[${productStks.index}].expirydate" form="form2" id="expdate"  class="form-control input-sm ft" value="<fmt:formatDate value="${ps.expirydate}" type='date' pattern='yyyy-MM-dd'/>"></td>
        <td><input type="text" readonly name="productStockList[${productStks.index}].currentstock" form="form2" id="quantity" class="form-control input-sm ft" value="${ps.currentstock}"></td>
        <td style="width: 91px;"><input type="text" readonly form="form2" name="productStockList[${productStks.index}].mpsize" id="mpsize" class="form-control input-sm ft" value="${ps.mpsize}"></td>
        <td style="width: 91px;"><input type="text" readonly name="productStockList[${productStks.index}].cp" form="form2" id="cp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.cp}"></td>
        <td style="width: 91px;"><input type="text" readonly name="productStockList[${productStks.index}].sp" form="form2" id="sp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.sp}"></td>
        <td style="width:78px"><input type="hidden" name="productStockList[${productStks.index}].purchaseqty" form="form2" id="prqty" value="${ps.purchaseqty}"><input type="hidden" name="productStockList[${productStks.index}].purchaseprice" form="form2" id="prprice" value="${ps.purchaseprice}"><input type="hidden" name="productStockList[${productStks.index}].sudesc" form="form2" id="sudesc" value="${ps.sudesc}"><input type="hidden" name="productStockList[${productStks.index}].stockprice" form="form2" id="stkpr" value="${ps.stockprice}"><input type="hidden" name="productStockList[${productStks.index}].markup" form="form2" id="markup" value="${ps.markup}"><input type="hidden" name="productStockList[${productStks.index}].spdesc" form="form2" id="spdesc" class="form-control input-sm ft" value="${ps.spdesc}"><input type="hidden" name="productStockList[${productStks.index}].spsize" form="form2" id="spsize" value="${ps.spsize}"><input type="hidden" name="productStockList[${productStks.index}].stksp" form="form2" id="stksp" value="${ps.stksp}"><input type="hidden" name="productStockList[${productStks.index}].sellqty" form="form2" id="sellqty" value="${ps.sellqty}"><input type="hidden"  onkeypress='return onlyNos1(event,this);' name="productStockList[${productStks.index}].sunits" form="form2" id="sunits" class="form-control input-sm ft" value="${ps.sunits}"><input type="hidden" name="productStockList[${productStks.index}].totalprice" form="form2" id="tprice" value="${ps.totalprice}"><input type="number" min = "1" name="productStockList[${productStks.index}].quantity" form="form2" id="stkstrans" value="0" class="form-control input-sm" ><input type="hidden" readonly name="productStockList[${productStks.index}].mpack" form="form2" id="mpack" class="form-control input-sm ft" value="${ps.mpack}"></td>
        <td><select class="form-control list" id="fid" name="productStockList[${productStks.index}].fromBranchId" form="form2" onchange="getStks(this,this.options[this.selectedIndex],${ps.pid})" required>
        <c:forEach var="b"  items="${model.list2}">
        <option value="${b.id}">${b.name}</option>
        </c:forEach>
        	</select></td>
        <td style="width: 52px;">${ps.totalPrdStks}</td>
        
      </tr>
          </c:forEach>
    </tbody>
  </table>
  
</body>
</html>
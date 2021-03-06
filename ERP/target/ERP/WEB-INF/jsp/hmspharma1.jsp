<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HMS Wedge</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/google.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/tile.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>


</head>
<script>

$(".modal-wide").on("show.bs.modal", function() {
	  var height = $(window).height() - 200;
	  $(this).find(".modal-body").css("max-height", height);
	});
function openMenu(evt, menuName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(menuName).style.display = "block";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();	
document.getElementById("defaultOpen1").click();

function dftOpen() {
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();	
	
}
function verify(form){
	alert("changes made Successfully!");
	document.getElementById(form).submit();
}
function run(){
	
	document.getElementById("defaultOpen1").click();
}

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
function taxUpdate(){
	document.getElementById("form2").submit();
}

function getDate(){
	 document.getElementById('spStdate').valueAsDate = new Date();
	 document.getElementById('spendate').valueAsDate = new Date();
	
}
function addrow(){
	var row = 1;
	var m = moment().format("DD-MM-YYYY");
	
    for(var x=0; x<row; x++) {
    	
    	var rowsAdd = document.getElementById('myTable1').insertRow();
     
        
        var newCell = rowsAdd.insertCell();
       
        newCell.innerHTML="<tr><td><span class ='item1'><input type ='text' class='form-control'style='width: 100px;' name='spType' id='spType' form ='form2' required></span></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><select id = 'spDtype' name= 'spDtype'><option>Percent</option><option>Amount</option></select></td></tr>";


        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><span class ='item1'><input type ='text' class='form-control' style='width: 100px;' name='spStdate' id='spStdate' value='"+m+"'form ='form2' required></td></tr>";
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><span class ='item1'><input type ='text' class='form-control' style='width: 100px;' name='spendate' id='spendate' value='"+m+"' form ='form2' required></td></tr>";
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><span class ='item1'><input type ='checkbox' name='spact' id='spact' form ='form2' required></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><i class='glyphicon glyphicon-trash' style='font-size:20px' onclick='deleteRow(this)'></i></td></tr>";

          
}
    

}
function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
}
</script>


<style>
body{
	background: #eee;
}
.wrapper {
	width : 1350px;
	background : #eee;
	height: 700px;
	font-family: 'Open Sans', 'Droid Sans';
}
input[type="button"]{
 font-family: "Verdana","sans-serif";
}
/* #well{
	background : #009999;
	
} */
.buttonimg{
    width:auto;
    height:auto;
}
.button2{
float : right;
}

.rightspace{
margin-right:30px;
margin-top: 2px;
}
.left{
margin-left:10px;
}

.item1 input{
	border : 0;
	background-color:#eee;
}

label {
	display: inline-block; 
	width: 210px; 
	text-align: center;
	
}
.modal.modal-wide .modal-dialog {
  width: 90%;
}
.modal-wide .modal-body {
  overflow-y: auto;
}

/* irrelevant styling */
body { }
body .p2 { 
  max-width: 400px; 
  margin: 20px auto; 
}
#tallModal .modal-body .p2 { margin-bottom: 900px }

fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
            float : left;
}

    legend.scheduler-border {
        font-size: 1.2em !important;
        font-weight: bold !important;
        text-align: left !important;
        width:auto;
        padding:0 10px;
        border-bottom:none;
    }
    
    fieldset.scheduler-border1 {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
            float : right;
}
#btn1{float : left;}




figure {
    display: inline-block;
}
.ip
{
white-space: normal;
}

</style>
<script>

function myconfirm()
{
 var r = confirm("Do you want to Logout?");
 if(r== true)
 {
 window.location="/ERP/logout";
 }
 else
 {
   return false;
 }
}

function checkhome2(user){
	$('#brnli').text(" You are logged into " + window.localStorage.getItem("myInfon"));
	if(user == "[ROLE_DISPSALESMANAGER]"){
	
		$('.ds').hide();
		$('#psap').hide();
		$('#sl').hide();
		
	}

}


</script>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />')">
<div class = "wrapper">

<br>
<font color="#228B22" class="left" >Welcome ${pageContext.request.userPrincipal.name}. <span id="brnli"></span></font>
 <i class='fa fa-sign-out button2 rightspace' title="Log Out" style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<div class="well well-lg" id="well"> 
	<%-- <center><h3><img src="<c:url value='resources/icons/cms logo.png'/>"class="cmslogo"><font color="white">CMS Wedge</font></h3></center> --%>
	<div class="row">
	<%-- <div class="col-sm-4">
	<img src="<c:url value='resources/icons/cms logo.png'/>"class="cmslogo">
	<p style="color:white">CMS Wedge</p>
	</div>
	<div class="col-sm-8" style="line-height: 17px; margin-top: 7px;">
	<p class="cmstext">Clinical Management System</p>
	<p style="margin-left: 33px;color: #80e4ef;">"Manage your hospital from anywhere anytime"</p>
	</div> --%>
	
	<center style="margin-top: -18px;"><h4><font color="white">Pharmacy</font></h4></center>
</div>
</div>

<div class="container">

  <ul class="nav nav-pills nav-justified">
    <li class="active"><a  data-toggle="pill"  href="#masters">Masters</a></li>
    <li id="sl"><a  data-toggle="pill" href="#os">Sales</a></li>
   <!--   <li><a  data-toggle="pill" href="#co">Configuration</a></li>
    <li><a  data-toggle="pill"  href="#re">Reports</a></li> -->
    <li id="psap"><a  data-toggle="pill"  href="#ps">Product Stocks and Pricing</a></li>
     <li><a  data-toggle="pill"  href="#dsp">Dispensary</a></li>
  </ul>
  
  <div class="tab-content">
  <div id="masters" class="tab-pane fade in active">
    <div class="row text-center">
 <br><br>
<!-- 
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Manufacture.png'/>"/><br><br>
      <figcaption><input type="button"onclick="location.href='/ERP/manufactureho.html';" value="Manufacturers"></figcaption>
      </figure>
    </div>
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Supplier.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/supplierho.html';" value="Suppliers"></figcaption>
      </figure>
    </div>
   -->   
    <div class="col-xs-2 ds">
      <figure>
       <img src="<c:url value='/Images/Customer.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/customerho.html';" value="Customers"></figcaption>
      </figure>
    </div>
    
    
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Product.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/productho.html';" value="Products"></figcaption>
      </figure>
    </div>
    
 </div>
  </div>
  <div id="os" class="tab-pane fade">
   <div class="row text-center">
 <br><br>
  <!--  
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Order.png'/>"/><br><br>
      <figcaption><input type="button"onclick="location.href='/ERP/orderho.html';" value="Order & Reorder"></figcaption>
      </figure>
    </div>
    
    
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Purchase.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/purchaseho.html';" value="Purchase Entry"></figcaption>
      </figure>
    </div>
  -->   
    <div class="col-xs-2 ds">
      <figure>
       <img src="<c:url value='/Images/Sale.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/saleho.html';" value="Sales"></figcaption>
      </figure>
    </div>
    
   
    <!--  
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Distribute.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/distribute.html';" value="Distribute"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Return.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/return.html';" value="Return products"></figcaption>
      </figure>
    </div>
    -->
 </div>
  </div>
  <!--  
  <div id="co" class="tab-pane fade">
<div class="row text-center">
 <br><br>
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModal" value="Manufacture Type"></figcaption>
      </figure>
    </div>
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModal" value="Supplier Type"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModal" value="Customer Type"></figcaption>
      </figure>
    </div>
    
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModalPc" value="Product Categories"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModalBs" value="Base Units"></figcaption>
      </figure>
    </div>
    
      <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModal" value="Supplier Quotes"></figcaption>
      </figure>
    </div>
    
 </div>
 <div class="row text-center">
 <br><br>
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModalTax" value="Tax"></figcaption>
      </figure>
    </div>
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModalDiscount" value="Discounts"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Configuration.png'/>"/><br><br>
      <figcaption><input type="button" data-toggle="modal" data-target="#myModalPackage" value="Packaging"></figcaption>
      </figure>
    </div>
    
    
    
 </div>
  </div>
<div id="re" class="tab-pane fade">
    <h3>Reports</h3>
    <p>Some content in menu 2.</p>
  </div>
  
  -->
  <div id="ps" class="tab-pane fade">
     <div class="row text-center">
 <br><br>
 <!--  
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Product price.png'/>"/><br><br>
      <figcaption><input type="button"onclick="location.href='/ERP/propriceho.html';" value="Product Pricing"></figcaption>
      </figure>
    </div>
   --> 
  <div class="col-xs-2 ds">
      <figure>
       <img src="<c:url value='/Images/Product stock.png'/>"/><br><br>
      <figcaption><input type="button" class="ip" onclick="location.href='/ERP/stopriceho.html';" value="Product Stocks and Pricing"></figcaption>
      </figure>
    </div>
    
    
 
 </div>

</div>

<div id="dsp" class="tab-pane fade">
   <div class="row text-center">
 <br><br>
  
      
       <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/dispsal.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/ERP/dsaleho.html';" value="Dispensary Sales"></figcaption>
      </figure>
    </div>
    
       <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/dispstks.png'/>"/><br><br>
      <figcaption><input type="button" class="ip" onclick="location.href='/ERP/dstopriceho.html';" value="Dispensary Product Stocks and Pricing"></figcaption>
      </figure>
    </div>
 </div>
  </div>
</div>
<div class="container">

  <!-- Trigger the modal with a button -->
  

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="header">Type</h4>
        </div>
      
        <div class="modal-body">
         <table class="table table-striped table-bordered table-hover table-condensed" style="width: 500px;"id="myTable" >
    <thead>
      <tr>
      <th>Type</th>
      <th>Description</th>
      </tr>
      </thead>
      </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="modal fade" id="myModalPc" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="header">Product Categories</h4>
        </div>
      
        <div class="modal-body">
         <table class="table table-striped table-bordered table-hover table-condensed" style="width: 500px;"id="myTable" >
    <thead>
      <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Is Active</th>
       </tr>
      </thead>
      </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="modal fade" id="myModalBs" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="header">Base Units</h4>
        </div>
      
        <div class="modal-body">
         <table class="table table-striped table-bordered table-hover table-condensed" style="width: 500px;"id="myTable" >
    <thead>
      <tr>
      <th>Name</th>
      <th>Description</th>
      </tr>
      </thead>
      </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="modal fade" id="myModalPackage" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="header">Packaging</h4>
        </div>
      
        <div class="modal-body">
         <table class="table table-striped table-bordered table-hover table-condensed" style="width: 500px;"id="myTable" >
    <thead>
      <tr>
      <th>Name</th>
      <th>SubPackage</th>
      <th>Quantity</th>
      <th>Total Base Units</th>
      </tr>
      </thead>
      </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="modal fade" id="myModalTax" role="dialog">
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="header">Type</h4>
        </div>
         <form  id="form1" action="activeTax.html" method="post">
        <div class="modal-body">
         <table class="table table-striped table-bordered table-hover table-condensed" style="width: 500px;"id="myTable" >
    <thead>
      <tr>
      <th>Tax</th>
      <th>Percentage</th>
      <th>Description</th>
      <th>Active</th>
      </tr>
      </thead>
  
      <tr>
      <td><span class ="item1"><input type ="text" class="form-control" style="width: 50px;" name="taxName" id="tax"  form ="form1" value="vat" readonly="readonly"></span></td>
      <td><input type ="text" class="form-control" style="width: 50px;" name="percentage" id="percentage"  form ="form1" value="0" ></span></td>
      <td>vat</td>
      <td><span class ="item1"><select name="active" id="tax" form ="form1" required>
       <option value="on">Yes</option>
       <option value="off">No</option>
      </select>
      </span></td>
      </tr>
      
      
      
     <tr>
      
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 50px;" name="taxName" id="tax" form ="form1" value="gst" readonly="readonly"></span></td>
      <td><input type ="text" class="form-control" style="width: 50px;" name="percentage" id="percentage"  form ="form1" value="0" ></span></td>
      <td>gst</td>
       <td><span class ="item1"><select name="active" id="tax" form ="form1" required>
       <option value="on">Yes</option>
       <option value="off">No</option>
      </select>
      </span></td>
   
      </tr>
      </table>
     
        </div>
        
        <div class="modal-footer">
        <input type="submit" class="btn btn-primary" form ="form1" onclick="verify('form1')" value="Update">
        <input type="reset" class="btn btn-primary" value="Refresh">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
  
  <div class="modal modal-wide fade" id="myModalDiscount" role="dialog">
    <div class="modal-dialog">
   
    <form id="form2" method="post" action="spdiscount.html"></form>
    <form id="form3" method="post" action="custdiscount.html"></form>
    <form id="form1a" method="post" action="savesp.html"></form>
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="header">Discounts</h4>
          <br>
        </div>
        
        <br>
         <form  class="form-inline">
        
           <div class="form-group">
    <label class="sr-only" for="code">Discount Code</label>
   <div class="input-group">
    <div class="input-group-addon">Discount Code</div>
       <input type="text" class="form-control" style="width: 130px;" form="form1a" id="spType" name="spType" required>
       </div>
  </div>
  
   <div class="form-group">
  <div class="input-group">
  <div class="input-group-addon">Discount type</div>
  <div class="row-fluid">
      <select class="selectpicker form-control selectWidth" data-dropup-auto="false" data-show-subtext="true" data-live-search="true" style="width: 100px;" name = "spDtype" id ="spDtype" form ="form1a" required>
       <option value="percent">Percent</option>
 <option value="amount">Amount</option>
 
      </select>
      </div>
      
      </div>
      </div>
      
      <div class="form-group">
    <label class="sr-only" for="code">discount value</label>
   <div class="input-group">
    <div class="input-group-addon">Value</div>
       <input type="text" class="form-control" style="width: 130px;" form="form1a" id="spDvalue" name="spDvalue" required>
       </div>
  </div>
   
     <div class="form-group">
    <label class="sr-only" for="code">start date</label>
   <div class="input-group">
    <div class="input-group-addon">Start Date</div>
       <input type="date" class="form-control" style="width: 150px;" form="form1a" id="spStdate" name="spStdate" required>
       </div>
  </div>
      
         <div class="form-group">
    <label class="sr-only" for="code">Endate</label>
   <div class="input-group">
    <div class="input-group-addon">End date</div>
       <input type="date" class="form-control" style="width: 150px;" form="form1a" id="spendate" name="spendate" required>
       </div>
       <input type="button" class="btn btn-info" onclick = "verify('form1a')" value= "Add" form="form1a">
       <script>
          
       </script>
  </div>
  <br>
  
  <br>
  <br>
  
  
  
  <br>
  <br>
 </form>
        <div class="modal-body">
        <fieldset class="scheduler-border">
      
    <legend class="scheduler-border">Special Discounts</legend>
         <table class="table table-striped table-bordered table-hover table-condensed" style="width: 400px;"id="myTable1" >
    <thead>
      <tr>
      <th>Discount Code</th>
      <th>Discount Type</th>
      <th>Value</th>
      <th>Start Date</th>
      <th>End Date</th>
      <th>Active</th>
      <th>Delete</th>
      </tr>
      </thead>
      <tr>
      
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spType" id="spType" form ="form2" required></span></td>
      <td><span class ="item1"><select style="width: 100px;" name="spDtype" id="spDtype"  form ="form2" required>
      <option>amount</option>
      <option>percent</option>
      </select></span></td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spDvalue" id="spDvalue"  form ="form2" required></span></td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spStdate" id="spStdate"  form ="form2" required></span></td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spendate" id="spendate"  form ="form2" required></span></td>
       
      <td><span class ="item1"><select name="spact" id="spact" value= "1" form ="form2" required>
       <option value="on">Yes</option>
       <option value="off">No</option>
      </select>
      </span></td>
      <td><i class='glyphicon glyphicon-trash' style='font-size:20px' onclick='deleteRow(this)'></i></td>
      </tr>
      
      <tr>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spType" id="spType"  form ="form2" required></span></td>
     <td><span class ="item1"><select style="width: 100px;" name="spDtype" id="spDtype"  form ="form2" required>
      <option>amount</option>
      <option>percent</option>
      </select></span></td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spDvalue" id="spDvalue"  form ="form2" required></span></td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spStdate" id="spStdate" form ="form2" required></span></td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="spendate" id="spendate"  form ="form2" required></span></td>
       
     <td><span class ="item1"><select name="spact" id="spact" value= "1" form ="form2" required>
       <option value="on">Yes</option>
       <option value="off">No</option>
      </select>
      </span></td>
      <td><i class='glyphicon glyphicon-trash' style='font-size:20px' onclick='deleteRow(this)'></i></td>
      </tr>
      
   
  </table>
   <!-- <i class="glyphicon glyphicon-plus" style="font-size:20px" onclick="addrow()"></i> -->
  </fieldset>
   <fieldset class="scheduler-border1">
   <legend class="scheduler-border">Customer Discounts</legend>
   <table class="table table-striped table-bordered table-hover table-condensed" style="width: 400px;"id="myTable" >
    <thead>
      <tr>
      <th>Type</th>
      <th>Category</th>
      <th>Value</th>
      
      </tr>
      </thead>
      <tr>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="custType" id="cdisctyname" value="New" form ="form3"></span></td>
      <td>
      <select form ="form3" style="width: 100px;"name="discType" id="discType">
       
       <option>Percent</option>
       <option>Amount</option>
      </select>
      </td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 50px;" name="discvalue" id="discvalue" value="0" form ="form3"  ></span></td>
      
      </tr>
      <tr>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 100px;" name="custType" id="cdisctyname" form ="form3" value="Retail" readonly="readonly"></span></td>
       <td>
      <select form ="form3" style="width: 100px;" name="discType" id="discType">
       
       <option>Percent</option>
       <option>Amount</option>
      </select>
      </td>
      <td><span class ="item1"><input type ="text" class="form-control"style="width: 50px;" name="discvalue" id="discvalue" value="0" form ="form3"  ></span></td>
   
      </tr>
      
      
  </table>
  
   </fieldset>
  </div>
        
        <div class="modal-footer">
          <input type="button" id ="btn1" form="form2" class="btn btn-info" onclick ="verify('form2')" value="update">
          <input type="button" id="btn2"class="btn btn-info" form="form3" onclick ="verify('form3')" value="update">
          <input type="reset" class="btn btn-info" value="refresh">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
        
        </div>
        </form>
      </div>
      </div>
     
    </div>
  </div>
</div>
<div class="row" style="padding-top: 0px;margin: 0px; background: #eee;">
 <span style="float:right;margin-right: 52px;">v 1.9</span>
 </div>
</body>
</html> 
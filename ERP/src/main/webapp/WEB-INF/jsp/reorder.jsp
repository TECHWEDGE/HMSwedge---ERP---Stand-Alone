<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HMS Wedge</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/addstocks.css" />' type='text/css' media='all' />

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/navbar.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/verifychange.js"></script>
<script type="text/javascript">
function checkid(str){
	
	
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "In-";
	  
		var str3 = id;
		var res = str1.concat(str3);
	
       
		document.getElementById("invid").innerHTML = res;
		document.getElementById("invidh").value = res;
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "In-";
		  
		
		var res = str1.concat(ida);
		
		document.getElementById("invid").innerHTML = res;
		document.getElementById("invidh").value = res;
	//	alert(res1);
	}
}
function checkhome(user){
	$('#brnli').text("Logged into :" + window.localStorage.getItem("myInfon"));
	if(user.includes("dbfdesk")){
		 var url = "/ERP/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else{
		 var url = "/ERP/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
}

function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}

function copy(pid){

	var strSplit = pid.split(',');

	$('select[name=pname]').val(strSplit[1]);
	   $('#pname').selectpicker('refresh');
	   
	   $('select[name=pid]').val(strSplit[0]);
	   $('#pid').selectpicker('refresh');

	   $('#pid').prop('disabled',true)
		$('#pname').prop('disabled',true)	   

   document.getElementById("ptype").value = strSplit[2];
  
   document.getElementById("quantity").value =strSplit[3];
  
   document.getElementById("pack").value = strSplit[4];
   
   document.getElementById("up").value = strSplit[5];
   
   document.getElementById("total").value = strSplit[6];
  
  document.getElementById("reorder").value = strSplit[7];
  
  document.getElementById("expdate").value = strSplit[8];
  
  document.getElementById("pc").value = strSplit[9];
  
  document.getElementById("invid").innerHTML = strSplit[10];
  document.getElementById("invidh").value = strSplit[10];

  
  $('select[name=id]').val(strSplit[11]);
  $('#branch').selectpicker('refresh');
  
  document.getElementById("csc").innerHTML = "EDIT STOCKS";
  
   $('#myModal').modal('show');
}

function clos(){
	window.location.reload();
}

function caluclate(){
	
	var quant = document.getElementById("quantity").value;
	var up = document.getElementById("up").value;
	
	var res = Number (quant) * Number(up);
    document.getElementById("total").value = res;
}

function validdate(id){
	
	var va	='Valid? '+ !!document.getElementById(id).value;

	if(va == 'Valid? false'){
		alert("invalid date")
		return false;
	}
	else{
		return true;
	}
	}
	
function check(){
	
	if($('#pid').val() == "select"){
		alert("Please select product code")
		return false;
	}
	else if($('#pname').val() == "select"){
		alert("Please select product name")
		return false;	
	}
	else{
		$('#pid').prop('disabled',false)
		$('#pname').prop('disabled',false)
		return true;
	}
	
}
$(document).ready(function(){
$('#quantity,#up').on('change keyup', function() {
	 
	  var sanitized = $(this).val().replace(/[^0-9]/g, '-');
	  $(this).val(sanitized);
	});
	
$( function() {
	
	$("#fromdate").change(function(){
	      var startDate = document.getElementById("fromdate").value;
		var endDate = document.getElementById("todate").value;
	    
			if(endDate == "")
				{
				}
			else if (startDate >= endDate) {
		          alert("From date should not be greater than "+moment(endDate).format("DD-MM-YYYY"));
		          document.getElementById("fromdate").value = "";
		     }
	});

	$("#todate").focusout(function () {
    	var startDate = document.getElementById("fromdate").value;
   		var endDate = document.getElementById("todate").value;
   		
   		if (endDate <= startDate ) {
        alert("To date should be greater than "+moment(startDate).format("DD-MM-YYYY"));
        document.getElementById("todate").value = "";
    	}
	});
});

});

function report(val)
{
	var srch=$('#myInp2').val();
	var fromdate=$('#fromdate').val();
	var todate=$('#todate').val();
	var limit=$('#limit').val();
	
	if(fromdate == "" || todate == "" || limit=="")
	{
		alert("Please fill out all the fields")
		$(val).attr("href","javascript:;")
		unsaved = false;
	} 
	else if(limit <= 0)
	{
	alert("No of Records should be greater than 0")
	}
	 else
		{	
		 $('.tab1').hide();
		/*  $(val).attr("href","/ERP/reorder?fdate="+fromdate+"&edate="+todate+"&limit="+limit+"&srch="+srch+"") */
		
		 $(val).attr("href","/ERP/reorder?limit="+limit+"&srch="+srch+"")
		unsaved = false;
		return true;
		} 
}

</script>
<style type="text/css">

.h4,h4{
  font-size:20px;
  font-family: 'Lucida Bright';
  }
  
  .input-group{
  position: relative;
  float: right;
  top: 5px;
  
  }



  .panel-info>.panel-heading {
  
  font-family: 'Lucida Bright', 'sans-serif';
  color: #ffffff;
  text-align: center;
  
  
  }
  
  .panel-info {
    margin-top: -11px;

}

 .panelhead,th{

color:white;
}

.panel-footer {

  font-family: 'Lucida Bright', 'sans-serif';
  color: #000000;
  padding:20px;

}

.btn-info {


    position: relative;
    left: 45%;
    bottom: 67px;
    background-color: orange;
    display: inline-block;
    padding: 7px 18px;
    
    margin-bottom:0px;
    
    font-family: 'tahoma';
    font-size: 11px;
    
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    }
    
       @media print {
  .btn-info {
    visibility: hidden;
  }
}
  

.btn-warning{
position :relative;
top:11px;
right:0px;
display: inline-block;
    padding: 8px 8px;
    padding-right: 8px;
    margin-bottom: 25px;
    margin-right:2px;
    font-family: 'tahoma';
    font-size: 11px;
    
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    }
    
    
    
    @media print {
  .btn-warning {
    visibility: hidden;
  }
}
   
    
    .table-responsive{
    width: 96%;
  font-family: 'Tahoma', 'sans-serif';

  margin-bottom:15px;
  
  overflow-X:auto;
  overflow-Y:auto;
      margin-right: 32px;
      margin-top: 10px;
}


#myTable th {
 background-color: rgb(102, 158, 226);
    
border:solid 2px #ddd;
}

.tbody{
color: black;
}

#bouton-contact{
margin-top: -18px;
    
}

#close{
margin-top: -6px;
}



.navbar-default .navbar-nav>li>a {
color: #2F4F4F;

}

#cd{
text-align: center;
    padding-right: 60px;
    font-size: 40px;
font-family: 'Times New Roman', 'sans-serif';
}

.button1{
position: relative;
float:left;
top:0px;
}
.button2{
position:relative;
float:right;
}

#go{
margin-top: 26px;
}

#brnli{
color: white;
}

#dd{

      margin-right: 85px;
}


.wrapper {
height: 600px;
    	    padding-top: 1px;
    margin-top: 35px;
}



.navbar>.container-fluid .navbar-brand {
    color: white;
}
.ctc{
    margin-top: 115px;
}
.navbar-default .navbar-nav>li>a{
	color:white;
	    background-color: #2b3786;
}
.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover {
    color: #555;
    background-color: #e7e7e7;
}
.navbar-default{
    background-color: #2b3786;
    border-color: #2b3786;
}
.navbar-default .navbar-nav>.active>a{
	color:white;
	    background-color: #0d9ada54;
}
@media(max-width:640px){
.navbar-default .navbar-nav .open .dropdown-menu>li>a {
    color: white;
}
}


@media (max-width:640px){



#close{
    margin-top: -8px;
}


.row{
    margin-top: 15px;
}


.table-responsive{
width: 100%;
}

#dd {
    font-size: 24px;
    margin-right: -22px;

}


.button1{
    margin-top: -4px;
    margin-right: -120px;
    margin-left: -11px;
}

#bouton-contact{
margin-top: -19px;
    margin-right: -13px;
}


#csc{
font-size: 22px;
    margin-left: 37px;
}



}



.navbar-right{
    float: right!important;
    margin-right: 0px;
    color: black;
    padding-top: 12px;
    font-size: 14px;
}
.fontp
{
font-size: 15px;
} 
.row {
   margin-top: 18px;
    margin-right: 0px;
    margin-left: 0px;
}

</style>
</head>
<body onload="checkhome('<c:out value="${pageContext.request.userPrincipal.name}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
     <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Check Reorder Level</a>
    </div> 
    <div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav">
	      <li class=""><a id="ho" href="">Home</a></li>
	      <li class="dropdown navhover" id="back">
    			<a class="dropdown-toggle" data-toggle="dropdown">Inventory
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li> <a href="/ERP/hospital.html">Hospital Inventory</a></li>
        <li> <a href="/ERP/addstocks.html">Add Stocks </a></li>
       <li><a href="/ERP/getStocks.html"> Issue Stocks</a></li>
       <li><a href="/ERP/retstocks.html"> Return Stocks</a></li>
     
        </ul>
      </li>
	    </ul> 
	    <ul class="nav navbar-nav navbar-right">
		    <li id = "brnli"></li>
		</ul>
	</div>
  </div>
</nav>

  <center>
</center>
  <form id="form" action="" method="">  
  
    
	  	  <h1>
	 
<font size="5" id = "dd">Stocks Master </font><span class="button2"><!-- <i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search Item In Table"  style="width:150px"/></span> -->
	</h1>

	 <div class="row">
	    
	    <div class="col-xs-6 col-lg-offset-4 col-lg-2">
	    <p class="text-lef fontp">Search</p>
	    <div class="form-group ">
		<input type="text" id="myInp2" class="form-control input-sm button2" placeholder="Search by Product Name or Id"  style="width:152px"/></span>
		</div>
		</div>
		
	    	<!-- <div class="col-xs-6 col-lg-2">
	    	<p class="text-lef fontp">From Date</p>
       			<div class="form-group ">
     				<input type="date" name="fromdate" id="fromdate"  class="form-control input-sm"  required />
      			</div>
	    	</div>
	    	<div class="col-xs-5 col-lg-2">
	    	<p class="text-left fontp">To Date</p>
       			<div class="form-group">
    				 <input type="date" name="todate" id="todate"  class="form-control input-sm"  required />
     			</div>
     		</div> -->
     		<div class="col-xs-5 col-lg-2">
           <p class="text-left fontp">No of Records</p>
         		<div class="form-group">
      				<input type="number" name="limit" id="limit"  class="form-control input-sm"  required />
      			</div>
      		</div>
      		<div class="col-xs-2">
           		<a href="#" class="btn btn-warning go" id ="go" onclick="return report(this);" >Go</a>
      		</div>
	    </div> 	  
	
	
	
	    <div class="container">
	    	<div class="table-responsive">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed"  id="myTable">
    <thead>
      <tr>
        <th style="width:100px;">Product ID</th>
        <th style="width:300px;">Product Name</th>
        <th style="width:200px;">Product Type</th>
         <th style="width:140px;">Expiry Date</th>
        <th style="width:100px;">Quantity</th>
        <th style="width:120px;">Reorder Level</th>
         <!-- <th style="width:20px;"></th> -->
        
     
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr class="tab1">
    <td style="width:100px;" ><a href="#"  onclick="copy('${p1.pid},${p1.pname},${p1.ptype},${p1.quantity},${p1.pack},${p1.up},${p1.total},${p1.reorder},${p1.expdate},${p1.pc},${p1.invid},${p1.id}')">${p1.pid}</a></td>
    <td style="width:300px;">${p1.pname}</td>
    <td style="width:200px;">${p1.ptype}</td>
    <td style="width:140px;"><fmt:parseDate value="${p1.expdate}" pattern="yyyy-MM-dd" var="myDate"/><fmt:formatDate value="${myDate}" type='date' pattern="dd-MM-yyyy"/></td>
     <td style="width:100px;">${p1.quantity}</td>
    <td style="width:120px;">${p1.reorder}</td>
     </tr>
    </c:forEach>
    
    <c:forEach var="p"  items="${model.list2a}">
    <tr class="tab2">
    <td style="width:100px;" ><a href="#"  onclick="copy('${p.pid},${p.pname},${p.ptype},${p.quantity},${p.pack},${p.up},${p.total},${p.reorder},${p.expdate},${p.pc},${p.invid},${p.id}')">${p.pid}</a></td>
    <td style="width:300px;">${p.pname}</td>
    <td style="width:200px;">${p.ptype}</td>
    <td style="width:140px;"><fmt:parseDate value="${p.expdate}" pattern="yyyy-MM-dd" var="myDate"/><fmt:formatDate value="${myDate}" type='date' pattern="dd-MM-yyyy"/></td>
     <td style="width:100px;">${p.quantity}</td>
    <td style="width:120px;">${p.reorder}</td>
     </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    </div>
    
   

   
   
	  <!--  
	
    <br>

  -->
<button type="submit" class="bouton-contact" disabled></button>
	
</form>


<div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
 <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="form1" action="saveS.html" method="post">  
  
        <h1><span id="invid" form="form1" name="invid" style="float:left"></span><span id="csc">Add Stocks</span>
           <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
           
                   <p>Product Id<span>*</span></p>
             <select class="selectpicker form-control" data-dropup-auto="false" data-size="4" data-live-search="true" form="form1" name = "pid" id ="pid" onchange="addcid(this.options[this.selectedIndex])"   required>
          <option value="select" selected>Select</option>
        <c:forEach var="p"  items="${model.list6}">
        <option value="${p.prcode}" data-value="${p.prcode},${p.prname},${p.prtype},${p.prcategory}">${p.prcode}</option>
        </c:forEach>
      </select>
       
          <input type="hidden" id="invidh" form="form1" name="invid">
	</div>
  </div>
  
   <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
      <p>Product Name<span>*</span></p>
     <select class="selectpicker form-control" data-dropup-auto="false" data-size="4" data-live-search="true"  form="form1"   name = "pname" id ="pname" onchange="addcname(this.options[this.selectedIndex])"   required>
      <option value="select" selected>Select</option>
        <c:forEach var="p"  items="${model.list6}">
   <option value="${p.prname}" data-value="${p.prcode},${p.prname},${p.prtype},${p.prcategory}">${p.prname}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  
   <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
    
	   <div class="form-group">
            <p>Product Type<span>*</span></p>
   <input type="text" name="ptype" id="ptype" class="form-control input-sm" readonly>   
</div>
	</div>
 </div>
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
          <p>Product Category<span>*</span></p>
    <input type="text" name="pc" id="pc" class="form-control input-sm" readonly>   
         </div>
  </div>
  
   <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
     <p>Expiry Date <span>*</span></p>
         	<input type="date"  max="2999-12-31"   name="expdate" id="expdate"  class="form-control input-sm"  onclick="return validDate()" required>
  
       </div>
  </div>
  
   <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
    
	   <div class="form-group">
	        <p>Pack<span>*</span></p>
    <input type="text" name="pack" id="pack" class="form-control input-sm"  required>
	   
          </div>
	</div>
 </div>
 
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
     <p>Quantity<span>*</span></p>
          <input type="number"  min="0" name="quantity" id="quantity" class="form-control input-sm" value="0"  required>
	
           	</div>
  </div>
  
   <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
    <div class="form-group">
        <p>UnitPrice<span>*</span></p>
    <input type="number" name="up" id="up" min="0" value="0" class="form-control input-sm"   required>

</div>
	</div>
		<div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
   <p>Total Value<span>*</span></p>
          <input type="number" name="total" id="total" value="0.00"readonly="readonly" class="form-control input-sm"  required>
  
	
  </div>
	</div>
	
	<div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
     <p>Reorder Level<span>*</span></p>
          <input type="number"  min="0" name="reorder" id="reorder" class="form-control input-sm" value="0"  required>
	
           	</div>
  </div>
  
   <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">    
      <p>Branch Name<span>*</span></p>
  <select  class="selectpicker form-control input-sm" data-dropup-auto="false" data-size="5" data-live-search="true" form="form1" name="id" id="branch">
        <option value="select" selected disabled>Select Branch</option>
        <c:forEach var="p"  items="${model.list5}">
        <option value="${p.id}">${p.name}</option>
        </c:forEach>
      </select>
           	</div> 
  </div>
  

  
   

 
 <button type="submit" class="bouton-contact" id="bouton-contact"  onclick="return check()" >Save</button>
       </form>
       </div>
       </div>
       </div>
       
       <script>
       var x = document.getElementById("quantity");
       x.addEventListener("change", caluclate);
       x.addEventListener("keyup", caluclate);
       var y = document.getElementById("up");
       y.addEventListener("change", caluclate);
       y.addEventListener("keyup", caluclate);
              
       </script>
       
       <c:forEach var="p"  items="${model.list}">
<script>

checkid('<c:out value="${p.invid}" />');
</script>
</c:forEach>
<script>
if('<c:out value="${model.fda}" />' != '' && '<c:out value="${model.eda}" />' != '' && '<c:out value="${model.lim}" />' !='' || '<c:out value="${model.srchh}" />' !=''){
	$('#fromdate').val('<c:out value="${model.fda}" />')
	$('#todate').val('<c:out value="${model.eda}" />')
	$('#limit').val('<c:out value="${model.lim}" />')
	$('#myInp2').val('<c:out value="${model.srchh}" />')
}   
function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable tbody").rows;
    
    for (var i = 0; i < rows.length; i++) {
        var firstCol = rows[i].cells[0].textContent.toUpperCase();
        var secondCol = rows[i].cells[1].textContent.toUpperCase();
        var thirdCol = rows[i].cells[2].textContent.toUpperCase();
        if (firstCol.indexOf(filter) > -1 || secondCol.indexOf(filter) > -1 || thirdCol.indexOf(filter) > -1) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }      
    }
}

document.querySelector('#myInp').addEventListener('input', filterTable, false);
</script>
</body>
</html>
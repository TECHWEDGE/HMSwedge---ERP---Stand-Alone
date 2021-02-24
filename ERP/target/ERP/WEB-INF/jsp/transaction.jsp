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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/transaction.css" />' type='text/css' media='all' />

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

function checkhome(user){
	 var getData=window.localStorage.getItem("myInfo"); 
	 $('#brnli').text("Logged into :" + window.localStorage.getItem("myInfon"));
	  $('select[name=id]').val(getData);
	   $('#branch').selectpicker('refresh');
	   $('#branch').prop('disabled',true)
	   
	if(user.includes("dbfdesk")){
		 var url = "/ERP/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/ERP/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/ERP/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_Accounts Admin]")){
		
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

function clos(){
	window.location.reload();
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
	
function check(id){
	alert(id);
}
function disable(){
	var res = document.getElementById("ptype").value;
     if(res=="Consumables"){
    	 
    	 document.getElementById("expdate").disabled = true;
    	
     }
     else{
    	 
    	 document.getElementById("expdate").disabled = false;
    	
     }
  	
}
function addcid(){
	var cid = document.getElementById("pid").value; 
	var str = cid.split(',');
	
	var res4 = $('select[name=pid1]').val();
	  
	   
	   $('select[name=pname1]').val(res4);
	   $('#pname').selectpicker('refresh');

	
	document.getElementById("pname").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	document.getElementById("ptype").value=str[2];
	document.getElementById("quantity").setAttribute("max",str[3]); 

	document.getElementById("pc").value=str[4];
	document.getElementById("expiry").value=str[5];
	document.getElementById("invid").value=str[6];
	document.getElementById("csd").value=str[3];
	disable();
	}
function addcname(cname){
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	
	
	 var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(res5);
	   $('#pid').selectpicker('refresh');
	   
	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	document.getElementById("ptype").value=str[2];	
	document.getElementById("quantity").setAttribute("max",str[3]);
	document.getElementById("pc").value=str[4];
	document.getElementById("expiry").value=str[5];
	document.getElementById("invid").value=str[6];
	document.getElementById("csd").value=str[3];
	disable();
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/ERP/getStocks.html";
	}
}
function copy(pid){

	var strSplit = pid.split(',');


   document.getElementById("pid").value = strSplit[0];
   
	   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
	   $("#pid").selectpicker("refresh");
   
	   document.getElementById("pid").disabled = true;
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
   document.getElementById("pname").disabled = true;
   document.getElementById("pid1").value = strSplit[0];
   
   document.getElementById("pname").value= strSplit[1];
   
   document.getElementById("pname1").value = strSplit[1];
   
   document.getElementById("ptype").value = strSplit[2];
   document.getElementById("ptype").disabled = true;
   document.getElementById("quantity").value =strSplit[3];
  
   document.getElementById("pack").value = strSplit[4];
   
   document.getElementById("allodate").value = strSplit[5];
  
   document.getElementById("expdate").value = strSplit[6];
   
   
   document.getElementById("pid1").value = strSplit[0];
   
   document.getElementById("bouton-contact").disabled = true;
   
   

 
  
   document.getElementById("pc").value=strSplit[9];
  
   document.getElementById("expiry").value=strSplit[10];
	
   document.getElementById("quantity").removeAttribute("max");
   
   document.getElementById("invid").value = strSplit[11];
   document.getElementById("csd").value = strSplit[12];
   document.getElementById('bouton-contact').style.visibility = "hidden";
   disable();

 
   $('#myModal').modal('show');

}
function display(){
	
	
	
	$('#myModal').modal('show');
}
function check1(id,name,type,quantity){
	document.getElementById("pid").value = id;
	document.getElementById("pname").value = name;
	document.getElementById("ptype").value = type;
	var input = document.getElementById("quantity");
	input.setAttribute("max",quantity); // set a new value;
	disable();
	
}

function validate(){
	if($('#pid').val() == "select"){
		alert("Please select Product ID/Product Name")
		return false;
	}
	else if($('#pname').val() == "select"){
		alert("Please select Product ID/Product Name")
		return false;	
	}
	else{
		$('#branch').prop('disabled',false)
		return true;
	}
}
function validdate(id){
	if(id == "expdate"){
		validDate("expdate");
	}else{
		validDate("allodate");
	}
	/*
	var va	='Valid? '+ !!document.getElementById(id).value;

	if(va == 'Valid? false'){
	//	alert("invalid date")
		return false;
	}
	else{
		return true;
	}
	*/
	}

$(document).ready(function(){
	//$('#tab2').hide();
	
	$('#quantity').on('change keyup', function() {
		 
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
		 /* $(val).attr("href","/ERP/getStocks?fdate="+fromdate+"&edate="+todate+"&limit="+limit+"&srch="+srch+"") */

		 $(val).attr("href","/ERP/getStocks?limit="+limit+"&srch="+srch+"")
		 unsaved = false;
		return true;
		} 
}

function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}

function validDate(date) {
	
	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate());
var s = document.getElementsByName(date);

for(var i =0;i<s.length;i++){
	if(date == "expdate"){
	s[i].setAttribute('min', getInputDateFormat(today));
//s[i].setAttribute('max', getInputDateFormat(maxDate));	
	}
else{
	s[i].setAttribute('min', getInputDateFormat(today));
	s[i].setAttribute('max', getInputDateFormat(maxDate));	

}
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
    font-size: 14px;
    
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
    font-size: 14px;
    
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
    width: 87%;
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


body{
	background: #eaeaea;
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
<sec:authentication property="principal.authorities" var="username" />

<body onload="checkhome('<c:out value="${username}" />')">
<div class = "wrapper">



<nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Issue Stocks</a>
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
        <li><a href="/ERP/reorder.html" target="_blank">Check Reorder Level</a></li>
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
	  <button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="glyphicon glyphicon-plus"></span>Issue</button>
<font size="5" id = "dd">Stocks Issued</font><span class="button2"><!-- <i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search Item In Table" onkeyup="myFunction()" style="width:150px"/></span> -->
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
        <th style="width:320px;">Product Name</th>
        <th style="width:200px;">Product Type</th>
        
        <th style="width:100px;">Quantity Allocated</th>
        <th style="width:140px;">Allocated to</th>
        <th style="width:100px;">View More</th>
        <!-- <th style="width:20px;"></th> -->
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr id="#tab1">
    <td style="width:100px;">${p1.pid}</td>
    <td style="width:320px;">${p1.pname}</td>
    <td style="width:200px;">${p1.ptype}</td>
   
    <td style="width:100px;">${p1.quantity}</td>
    <td style="width:140px;">${p1.pack}</td>
    <td style="width:100px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.pid},${p1.pname},${p1.ptype},${p1.quantity},${p1.pack},${p1.allodate},${p1.expdate},${p1.allocdate},${p1.allocqret},${p1.pc},${p1.expiry},${p1.invid},${p1.csd}')"></i></td>
   
 </tr>
    </c:forEach>
    <c:forEach var="p2"  items="${model.list2a}">
    <tr id="#tab1">
    <td style="width:100px;">${p2.pid}</td>
    <td style="width:320px;">${p2.pname}</td>
    <td style="width:200px;">${p2.ptype}</td>
   
    <td style="width:100px;">${p2.quantity}</td>
    <td style="width:140px;">${p2.pack}</td>
    <td style="width:100px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p2.pid},${p2.pname},${p2.ptype},${p2.quantity},${p2.pack},${p2.allodate},${p2.expdate},${p2.allocdate},${p2.allocqret},${p2.pc},${p2.expiry},${p2.invid},${p2.csd}')"></i></td>
   
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    </div>
     <button type="submit" class="bouton-contact" onclick="" disabled ></button>
     </form>
     
     <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="form1" action="saveT.html" method="post">  
  
        <h1><button type="submit" id="bouton-contact"  class="btn btn-warning button2" onclick="return validate()" >Save</button> Issue of Stocks
        <button type="button" id="close" class="btn btn-warning button1" onclick="clos()">Close</button>  
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
            <p>Product Id<span>*</span></p>
             <select class="selectpicker form-control" data-dropup-auto="false" data-size="4" data-live-search="true"  name = "pid1" id ="pid" onchange="addcid()"   required>
          <option value="select" selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.ptype},${p.quantity},${p.pc},${p.expdate},${p.invid}">${p.pid}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
            <p>Product Name<span>*</span></p>
             <select class="selectpicker form-control" data-dropup-auto="false" data-size="4" data-live-search="true" data-width="100%"   name = "pname1" id ="pname" onchange="addcname()"   required>
      <option value = "select" selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.ptype},${p.quantity},${p.pc},${p.expdate},${p.invid}">${p.pname}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <input type="hidden" name="pname" id="pname1">
  <input type="hidden" name="pid" id="pid1" >
   <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
    
	   <div class="form-group">
            <p>Product Type<span>*</span></p>
  <input type="text" name="ptype" id="ptype" class="form-control input-sm" readonly="readonly" >	
  </div>
</div>
	</div>

 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
            <p>Quantity Allocated<span>*</span></p>
          <input type="number" name="quantity" id="quantity" min="0" placeholder='0'  class="form-control input-sm"  onkeyup="caluclate()" required>
	</div>
  </div>
  
   <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
            <p>Allocated To<span>*</span></p>
    <input type="text" name="pack" id="pack" class="form-control input-sm"  required>
</div>
  </div>
  
   <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
    
	   <div class="form-group">
            <p>Allocation Date<span>*</span></p>
   <input type="date" max="2999-12-31" name="allodate" id="allodate"   onfocus ="return validdate(this.id)" class="form-control input-sm" required >
</div>
	</div>
 </div>
 
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
            <p>Expected Return Date<span>*</span></p>
          <input type="date" max="2999-12-31" name="expdate" id="expdate"  onfocus ="return validdate(this.id)" class="form-control input-sm" required >	</div>
  </div>
  
   <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
    <div class="form-group">
           <p>Product Category<span>*</span></p>
    <input type="text" readonly="readonly" name="pc" id="pc" class="form-control input-sm" required >	
 
</div>
	</div>
	
	     <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
     <p>Expiry Date <span>*</span></p>
         	<input type="text" readonly="readonly" max="2999-12-31"name="expiry" id="expiry" class="form-control input-sm" required>
  
      	</div>
	
  </div>
	</div>
	
	<div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
       <div class="form-group">
       <p>Inventory Id</span>*</p>
          <input type="text"  name="invid" id="invid" class="form-control input-sm" required readonly="readonly">
        </div>
           	</div>
  
  <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
    <div class="form-group">
       <div class="form-group">
       <p>Current Stocks</span>*</p>
          <input type="text"  name="" id="csd" class="form-control input-sm" required >
        </div>
</div>
	</div>
	<div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
    <div class="form-group">
           <p>Branch Name<span>*</span></p>
  <select  class="selectpicker form-control input-sm" data-dropup-auto="false" data-size="5" data-live-search="true" form="form1" name="id" id="branch">
        <option value="select" selected>Select Branch</option>
        <c:forEach var="p"  items="${model.list5}">
        <option value="${p.id}">${p.name}</option>
        </c:forEach>
      </select>
          
</div>
	</div>
	
  </div>
  
 
   

 
 <button type="" class="bouton-contact" disabled  ></button>
       </form>
       </div>
       
       
  
       </div>
   </div>
 <script>
 if('<c:out value="${model.fda}" />' != '' && '<c:out value="${model.eda}" />' != '' && '<c:out value="${model.lim}" />' !='' || '<c:out value="${model.srchh}" />' !=''){
		$('#fromdate').val('<c:out value="${model.fda}" />')
		$('#todate').val('<c:out value="${model.eda}" />')
		$('#limit').val('<c:out value="${model.lim}" />')
		$('#myInp2').val('<c:out value="${model.srchh}" />')
	} 
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>
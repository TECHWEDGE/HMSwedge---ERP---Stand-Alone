<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">


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


<style type="text/css">


#bc{
 
      width: 70px;
    padding: 1px;
    height: 36px;
    margin-top: -3px;
 
 }

  .panel-info>.panel-heading {
  background-color: #009999;

  font-family: 'Lucida Bright', 'sans-serif';
  color: #ffffff;
  text-align: center;
  
  
  }
  
  .panel-info {
    margin-top: -11px;

}

 .panelhead,th{
background: #009999;
color:white;
}

.panel-footer {

  background-color: #81BDA4;
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
  font-family: 'Tahoma', 'sans-serif';

  margin-bottom:15px;
  
  overflow:auto;
      margin-right: 85px;
}



#cd{
text-align: center;
    padding-right: 60px;
    font-size: 37px;
font-family: 'Times New Roman', 'sans-serif';
}

.button1{
position: relative;
float:left;
top:6px;
}
.button2{
position:relative;
float:right;
}



@media (max-width:640px){

.button2 {
    margin-top: -9px;
}

.mm {
    font-size: 20px;
}
.button1 {
    margin-top: -13px;
}

#home{

    width: 343px;
}

#menu1{
   width: 343px;
}

.nav-pills>li>a {
    font-size: 16px;

}
}




body{
	background: #eaeaea;
}

.wrapper {

     margin-top: 75px;
  height : 700px;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form2 h1 {
  font-size: 18px;
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: rgb(255, 255, 255);
  padding: 30px 16px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form2 {
  border-radius: 5px;
  max-width:1050px;
  width:100%;
  margin: 5% auto;
  margin-top :  1cm;
  background-color: #FFFFFF;
  overflow: hidden;
}

p span {
  color: #F00;
}

p {
  margin: 0px;
  font-weight: 500;
  line-height: 2;
  color:#333;
}

h1 {
  text-align:center; 
  color: #666;
  text-shadow: 1px 1px 0px #FFF;
  margin:50px 0px 0px 0px
}


a {
  text-decoration:inherit
}

textarea {
  border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin: 0;
  width: 225px;
  height: 5px; 
  float: left;
  padding: 0px 15px;
}


.tds{
	width : 200px;
}




.bouton-contact{
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 40px;
  font-size: 18px;
}



table {
    border-collapse: collapse;
    width: 100%;
    }
th {
    background-color: #009999;
    color: black;
    
}

.table-fixed{
 
}
  tbody{
    height:50px;
    
 }
 
#myTable1 {
    border-collapse: collapse;
    width: 100%;
    }
#myTable1 th {
    background-color: #009999;
    color: black;
    width : 180px;
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:200px;
    overflow-y:auto;
 }
 #myTable1 thead,.tbody1{
  
    display:block;
  }

modal-body{
	background-color: #eaeaea;
	height:auto;
	width: auto;
}  

.button1{
	float : left;
}
.button2{
	float : right;
}

.delete{
	width :50px;
}

#col3{
margin-left: 25px; 
border-style : groove;
border-radius : 10px;
width : 95%;
max-width: 100%;

}


.modal.modal-wide .modal-dialog {
  width: 90%;
}
.modal-wide .modal-body {
  overflow-y: auto;
}

.borderless td, .borderless th {
    border: none;
}

fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}

    legend.scheduler-border {
        font-size: 1.2em !important;
        font-weight: bold !important;
        text-align: left !important;
        width:auto;
        padding:0 10px;
        border-bottom:none;
    }
/* irrelevant styling */

#tallModal .modal-body p { margin-bottom: 900px }

.mygrid-wrapper-div {
    border: solid black 2px;
    height: 300px;
    width : 250px;
    overflow: scroll;
    
}

.navbar-right{
    float: right!important;
    margin-right: 0px;
    color: black;
    padding-top: 12px;
    font-size: 14px;
}
</style>


<script type="text/javascript">

var cuser;
function checkhome2(user){
	cuser = user;
$('#brnli').text("Logged into : " + window.localStorage.getItem("myInfon"));     
	
	 if(user.includes("[ROLE_SALESMANAGER]")){
	
		var url = "/ERP/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		// document.getElementById("bouton-contact").disabled = true; 
			document.getElementById("mm").style.display = "none"; 
			document.getElementById("sm").style.display = "none"; 
			document.getElementById("or").style.display = "none"; 
			document.getElementById("pe").style.display = "none"; 
			$('#dpe').hide();	
			$('#dpma').hide();	
			$('#stktrns').hide();
		 
	}
	else if(user.includes("[ROLE_PHARMACIST]")){
	
		 var url = "/ERP/hmspharma" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		 $('#dpma').hide();	
	
		
	}
	 
	
	else{
		 var url = "/ERP/hmspharma" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('#dpma').hide();	
	}
	 
}




function check(id){
	

	if (id == " " || id == null){
		
		id = 1;
	  
		document.getElementById("mid").value = id;
		
	}
	else {
		
		id = Number(id) + 1;
		
   
		
		
		
		document.getElementById("mid").value = id;
		
	}
}
var prname;
function run() {
	
    if(document.getElementById("myname").value == "new"){
    	document.getElementById("form1").reset();
    	oncheck()

		document.getElementById("active").checked = true;
    	location.reload();	
    }
    else{
 	   var str = document.getElementById("myname").value;
	   var strSplit = str.split('=');
	prname = strSplit[0];
	document.getElementById("name").value = strSplit[0];
	document.getElementById("medical").value = strSplit[1];
	document.getElementById("address1").value = strSplit[2];
	document.getElementById("Address2").value = strSplit[3];
	document.getElementById("city").value = strSplit[4];
	document.getElementById("state").value = strSplit[5];
	document.getElementById("country").value = strSplit[6];
	//document.getElementById("pincode").value = strSplit[7];
	document.getElementById("phone").value = strSplit[8];
	document.getElementById("mobile").value = strSplit[9];
	document.getElementById("fax").value = strSplit[10];
	document.getElementById("email").value = strSplit[11];
	document.getElementById("comments").value = strSplit[12];
	document.getElementById("mid").value = strSplit[13]; 

if(strSplit[14] == "on"){
		
		document.getElementById("active").checked = true;
		
	}
	else{
	
		document.getElementById("active").checked = false;
		
	}
    }
    
    $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
    	 
     	unsaved = false;
     });
   
}
function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) ||(charCode = 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/ERP/manufactureho.html";
	}
}
</script>
<script type="text/javascript">

$(document).ready(function () {
	$("input").on("keypress", function(e) {
	    if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	
});

</script>
<script>
       function oncheck(){

    	   $('#brnli').text("Logged into : " + window.localStorage.getItem("myInfon"));
    	   document.getElementById('active').checked=true;
       }
       </script>
       <script>
       function doAjaxPost1() {
    	   // get the form values
//alert("j")
    	       var mname = $('#name').val();
    	   
    	   if(prname == $('#name').val()){
    		   document.getElementById("bc").disabled = false;
    		   return false;
    	   }
        
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/ERP/checkmname.html",
	          data: "name=" + mname,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	   
	       	 
	       		 document.getElementById("bc").disabled = false;
	       	
	     
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	                  if(datec.name != null || datec.name == " "){
	                	  alert("Manufacturer name already exists")
	                	  document.getElementById("bc").disabled = true;
	                  }
	                  
	                  

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }
       function goBack() {
   	    window.history.back();
   	}

       </script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="oncheck(),checkhome2('<c:out value="${username}" />')">
<div class = "wrapper">
 <div class="container1">
<nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Manufacturer Master</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav">
	      <li class=""><a id="ho" href="">Home</a></li>
		      <li class="dropdown navhover">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Masters
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			    <li> <a href="/ERP/manufactureho.html">Manufacturer Master</a></li>
       <li><a href="/ERP/supplierho.html">Supplier Master</a></li>
       <li><a href="/ERP/customerho.html">Customer Master</a></li>
       <li><a href="/ERP/productho.html">Product  Master</a></li>
			    
			        </ul>
      	  </li>
      	  
      	  <li class="dropdown navhover">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Transaction
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			         <li id="or"><a href="/ERP/orderho.html">Order & Reorder</a></li>
        <li id="pe"><a href="/ERP/purchaseho.html">Purchase Entry</a></li>
        <li id="sal"><a href="/ERP/saleho.html">Sales</a></li>			    
			        </ul>
      	  </li>
      	  
      	  	  <li class="dropdown navhover">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Stocks/Transfer
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			      <li id="ps&p"><a href="/ERP/stopriceho.html">Product Stocks and Pricing</a></li>
        <li id="stktrns"><a href="/ERP/branchtransfer.html">Stocks Transfer</a></li>	    
			        </ul>
      	  </li>
      	  
      	  <li class="dropdown navhover">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dispensary
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			  <li id="ds"><a href="/ERP/dsaleho.html">Sales</a></li>
        <li id="dpsp"><a href="/ERP/dstopriceho.html">Product Stocks and Pricing</a></li>		    
			        </ul>
      	  </li>
      	  
      	  <li class="dropdown navhover">
    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">Reports
        		<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		  		<li id=""><a href="/ERP/reports/orderreport.html">Orders</a></li>
       			<li id=""><a href="/ERP/reports/purchasebyinvoice.html">Purchase by Invoice</a></li>	
       			<li id=""><a href="/ERP/reports/stockvaluation.html">Stock Valuation</a></li>
       			<li id=""><a href="/ERP/reports/salesbyinvoice.html">Sales by Invoice</a></li>	
       			<li id=""><a href="/ERP/reports/salesbyproduct.html">Sales by Product</a></li>	
       			<!-- <li id=""><a href="/ERP/incomeByDoctor.html">Income by Doctor</a></li>  --> 
       			<li id=""><a href="/ERP/reports/branchWiseSales.html">Branch Wise Sales</a></li>	
       			<li id=""><a href="/ERP/reports/elapsedStocks.html">Elapsed Stocks</a></li>	
       			<li id=""><a href="/ERP/reports/productWisePurchase.html">Product Wise Purchase</a></li>	
       			<li id=""><a href="/ERP/reports/purchase.html">Purchase Report</a></li>
       			<li id=""><a href="/ERP/reports/supplierWiseDetails.html">Supplier Wise Details</a></li>    
		        </ul>
      	  </li>
      	  
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
		    <li id = "brnli"></li>
		</ul>
	</div>
  </div>
</nav>

</div>
  <form id="form1" action = "save.html" method = "post"></form>
  <div id="form2" >  
  
     <h1><button type="reset" id="refresh" class="btn btn-warning button1" onclick="location.href='/ERP/manufactureho.html';" >
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5" class = "mm" >Manufacturer Master</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="submit" id="bc" class="form-control input-sm button2 btn btn-warning" form="form1" value="Save"/></span>
	</h1>




   <br>
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Manufacturer Details</a></li>
    <li><a data-toggle="pill" href="#menu1">Manufacturer Contact Details</a></li>
</ul>
</div>
<br>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="col3">
      
         
      <div class="form-group row">
 
 <div class="col-xs-4"></div>
 <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
    <p>Select Manufacturer<span></span></p>
 <select class="selectpicker form-control" data-dropup-auto="false" data-size="5" data-live-search="true"  id = "myname" name="myname" onchange="run()">
<option value="new">New</option>
<c:forEach var="mft"  items="${model.list}">
<option value="${mft.name}=${mft.medical}=${mft.address1}=${mft.address2}=${mft.city}=${mft.state}=${mft.country}=${mft.pincode}=${mft.phone}=${mft.mobile}=${mft.fax}=${mft.email}=${mft.comments}=${mft.mid}=${mft.active}">${mft.name}</option>
</c:forEach>
</select>
 </div>
 
 </div>
 
      
      <div class="form-group row">
 
 <div class="col-xs-1"></div>
<div class="col-lg-5 col-md-12 col-xs-12 col-sm-12">
<div class="form-group">

  <p>Manufacturer Name<span>*</span></p>
  <input  type="text"  onfocusout= "doAjaxPost1()" class="form-control" id = "name"  form="form1" name="name"  required>
    <input class="form-control" form="form1" type="hidden"  name="mid" id="mid" value=0>
	       
 
</div>
</div>

  <div class="col-lg-5 col-md-12 col-xs-12 col-sm-12">
  <div class="form-group">
  <p>Manufacturer Type<span>*</span></p>
   <input class="form-control" type="text"  data-size="4" data-live-search="true" form="form1"  name = "medical" id="medical" required>
 

      
        </div>
      
      </div>
 
   
               
  
      </div>
      <br>
    
	      
	      
	        
	           
	      	   
	      </div>
	      
	       
	     </div>
   
       <div id="menu1" class="tab-pane fade">
      
        <div id="col3">
        <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	        
	       <div class="form-group">
	    <p>Phone<span></span></p>
         <input type="text" class="form-control" onkeypress="return onlyNos(event,this);" id="phone" name="phone" form="form1">
	
	</div>
	      </div>
	       <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	        
	       <div class="form-group">
          <p>Mobile<span></span></p>
      <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="mobile" name="mobile" form="form1" >
       
	</div>
	      </div>
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	     <div class="form-group">
  <p>Email<span></span></p>
 <input type="email" form="form1" class="form-control" id="email" name="email" >
</div></div>
	  
	      
	      
	     
	     
	     </div>
	       <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	     <div class="form-group">
  <p>Address1<span></span></p>
 <input type="text" class="form-control"  form="form1" id="address1" name="address1" >
</div></div>
	  
	        
	      <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
            <p>Address2<span></span></p>
         <input type="text" class="form-control"  form="form1" id="Address2" name="address2" >
	</div>
	      </div>
	      
	       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	         <p>Fax<span></span></p>
	       <div class="form-group">
      
        <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="fax" name="fax" form="form1" >
	</div>
	      </div>
	      
	  
	      
	      </div>
	      
	      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	     <div class="form-group">
  <p>Country<span></span></p>
 <input type="text"  class="form-control" id="country" name="country" form="form1"  onkeypress="return onlyAlphabets(event,this);" >
</div></div>
	  
	        
	      <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
            <p>State<span></span></p>
         <input type="text" class="form-control" id="state" name="state" form="form1"  onkeypress="return onlyAlphabets(event,this);" >
	</div>
	      </div>
	      
	       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	         <p>City<span></span></p>
	       <div class="form-group">
      <input type="text"  class="form-control" id="city" name="city" form="form1"  onkeypress="return onlyAlphabets(event,this);" >
       
	</div>
	      </div>
	      
	  
	      
	      </div>
        
	           
	      
	               <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     
	         <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	        <div class="form-group">
	     <p>Comments<span></span></p>
	       <input type="text" class="form-control" id="comments" name="comments" form="form1" >
     
          </div>
	        </div>
	        
	        
	         <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	        <div class="form-group">
	       <br>
	            Active: <input type="checkbox" id="active" name="active"  form="form1" >
        </div>
	        </div>
	        
	 
	      
	      
	      </div>
	      
       
         
      </div>
      </div>
     
    </div>
	    
    
   
     
	 
	 
	 
	
	      
	      
    <button type="" class="bouton-contact"  ></button>
   </div>
     
 </div>
 
   <div class="container">
  
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Suppliers And Product Categories</h4>
        </div>
        <div class="modal-body">
         <div class="form-group row">
<div class="col-xs-3">
 <div class="mygrid-wrapper-div">
<c:forEach var="detBean" items="${model.list}">
<input type="checkbox" id = "${detBean.name}" name="${detBean.name}" onclick = "getvalue('${detBean.name}')" value="${detBean.name}">${detBean.name}</input></br>
</c:forEach>
</div>
</div>
<div class="col-xs-3"></div>
<div class="col-xs-3">
 <div class="mygrid-wrapper-div">
<c:forEach var="detBean1" items="${model.list}">
<input type="checkbox" id = "Apharc" name="${detBean1.name}" onclick = "getPc('Apharc')" value="${detBean1.name}">${detBean1.name}</input></br>
</c:forEach>
</div>
</div>
</div>
</div>
 <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
 </div>
       
      </div>
    </div>
  
  </div>
 
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>  

</body>
</html>
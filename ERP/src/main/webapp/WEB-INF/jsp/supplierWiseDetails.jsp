<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/navbar.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/report.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/table.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<!-- <script type="text/javascript" src="/ERP/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/ERP/resources/js/filterbtn.js"></script> -->

<style type="text/css">

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
background: rgb(102, 158, 226);
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
   margin-left: -43px;
}
.button2{
position:relative;
float:right;
}

#bouton-contact{
	font-size:14px;
	margin-top:-7px;
}
.btn-primary{
	font-size:14px;
}
.mt-9{
	margin-top:-9px;
	}
#bc{
	font-size:18px;
}

@media (max-width:640px){


#bouton-contact{
    margin-left: 60px;
}


.btn-primary{

     margin-left: 49px;
}

#nt{
    margin-left: 140px;
}

#bc{
    margin-left: -40px;
}


.psp {
    font-size: 26px;
   
}

}


body{
	background: #eaeaea;
}

.wrapper {
  margin-top: 75px;
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form2a h1 {
  font-size: 18px;
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form2a {
  border-radius: 5px;
  max-width:1300px;
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
.bouton-contact{
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 20px;
  font-size: 18px;
}

  .button1{
	float : left;
}
.button2{
	float : right;
}



#col3{
margin-left: 15px; 
margin-right: 15px;
border-style : groove;
border-radius : 10px;
  width: auto;
    height: auto;
}

.navbar-right{
    float: right!important;
    margin-right: 0px;
    color: black;
    padding-top: 12px;
    font-size: 14px;
}
 
.selectpicker{
	display:block !important;
	}
	
#myModal{
    background: white !important;
    margin: 78px 86px 0px 86px !important;
    }
    
</style>


 <script type="text/javascript">
 var cuser;
 function checkhome2(user){
	 
	 $('.fcategory .input-block-level').attr('id','fcategory')
	 
 	cuser = user;
 	$('#brnli').text("Logged into : " + window.localStorage.getItem("myInfon"));
 	     
 	
 	 if(user == "[ROLE_SALESMANAGER]" || user == "[ROLE_DISPSALESMANAGER]" ){
 	
 		var url = "/ERP/hmspharma1" ;
 		
 		 var element = document.getElementById('ho');
 		 element.setAttribute("href",url)
 	
 		document.getElementById("bc").style.display = "none"; 
 		document.getElementById("mm").style.display = "none"; 
 		document.getElementById("sm").style.display = "none"; 
 		document.getElementById("or").style.display = "none"; 
 		document.getElementById("pe").style.display = "none";  
 		
 		$("#myTable th:eq(7), #myTable td:nth-child(8)").hide();
 		$("#myTable th:eq(8), #myTable td:nth-child(9)").hide();
 		$("#myTable th:eq(9), #myTable td:nth-child(10)").hide();
 		$("#myTable th:eq(12), #myTable td:nth-child(13)").hide();
 		$("#myTable th:eq(13), #myTable td:nth-child(14)").hide();
 		$("#myTable th:eq(17), #myTable td:nth-child(18)").hide();
 		
        document.getElementById("myTable").style.width = "1730px"; 		
        $('.ft').prop('readonly', true);
        
        $('#dpe').hide();	
		$('#dpma').hide();
		$('#stktrns').hide();
 	}
 	else if(user == "[ROLE_PHARMACIST]" || user == "[ROLE_DISPPHARMACIST]" ){
 	
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
 	/* 
 	 var typingTimer;                
	 var doneTypingInterval = 1000;  
	 var a = jQuery('#fcategory');

	 //on keyup, start the countdown
	 a.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 a.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	  var srch;
	 function doneTyping () {
		 
		 alert("done typing")
		 
	 	srch = $('#fcategory').val();
	 	
	 	//alert("category = "+srch)
	 	
	 	var url = "/ERP/stopricehoFilter?srch="+srch+""
	 	$('#category').find('option:gt(0)').remove();
	 	$('#category').selectpicker('refresh');
	 		
	 	var successFn = function(response){
	 		
	 		//alert("response")
	 		console.log("response list1a = "+response.list1a)	 
	 		 $.each(response.list1a, function(index,p) {
		 	    	
		 		   if ($("#category option[class='"+p.pc+"']").length == 0 || $("#category option[class='"+p.pc+"']").length == 'undefined'){
		 			  // console.log("response list2a = "+response.list2a)	 
		 			  //alert("alerting")
		 			   $('#category').append('<option class="'+p.pc+'" value="'+p.pc+'">'+p.pc+'</option>');
		 			  $('#category').selectpicker("refresh");
		 		   }
		 	   });
	 		 
	    }
	    var errorFn = function(e){
	 	           alert('Error: ' + e);
	 	           }
	 	
	     filterAjax(srch,url,successFn,errorFn)
	 } */
	 
 }
 
 	function getCount(){
		document.getElementById("myTable").rows.length = 1;
	} 


 function datasuccess(data){
	getCount();
	getSuppliers();
	getPurchaseEntries();
	
	if(data != "null"){
		alert(data)
		 window.location = "/ERP/stopriceho.html";
	}
} 
</script>

<script>
var totalsum = 0;
var subtotalsum = 0;
	function sqlToJsDate(sqlDate){
		var date = new Date(sqlDate);
		var dd = ("0" + date.getDate()).slice(-2);
		var mm = ("0" + (date.getMonth() + 1)).slice(-2);
		var yy = date.getFullYear();
		var Jdate = dd+"-"+mm+"-"+yy
		return Jdate;
	    
	}

	function getSuppliers(){
		$.ajax({
	       	  
	           type: "GET",
	           url: "/ERP/getAllSuppliers",
	           dataType: 'json',
	           headers: { 
	               'Accept': 'application/json',
	               'Content-Type': 'application/json' 
	           },
	           success: function(response){
	   			$.each(response, function(index,response) {
	   				$('#supplier').append('<option value="'+response.sid+'">'+response.name+'</option>');
	   				$('#supplier').selectpicker("refresh");
	   				});
	   			},
	            error: function(e){
		         	  alert("Error: Search failed " + e);
		           	}
		        });
	}

	function getPurchaseEntries(){
			var supplierid = $('#supplier').val();
			var url="/ERP/reports/supplierWiseDetailsData"
			var data={
				fromDate : $('#fromDate').val(),
        	   toDate : $('#toDate').val(),
        	   supplierid : supplierid
			}
			
			$.ajax({
	           type: "GET",
	           url: url,
			   data:data,
	           dataType: 'json',
	           headers: { 
	               'Accept': 'application/json',
	               'Content-Type': 'application/json' 
	           },
	           success: function(response){
	           	$('#myTable .tbody tr').remove();
	        	   if(response.length == 0){
	        		   alert("No record found. Please change the dates to view data.");
	   					document.getElementById("totalsum").innerHTML ="0.00"
	        		   $('#print').attr('disabled','disabled');
	        		   return;
	        	   }
	        	   else{
	        		   $('#print').attr('disabled',false)
	        	   }
	   				totalsum=0
	   				$.each(response, function(index,response) {
	   					totalsum = Number(response.total)+totalsum
	   					document.getElementById("totalsum").innerHTML =totalsum.toFixed(2)
	   				var responsedata ="<tr>"+
	   					"<td>"+response.supplier+"</td>"+
		   				"<td>"+response.allocationid+"</td>"+
		   				"<td>"+response.receiveddate+"</td>"+
	   					"<td>"+response.productName+"</td>"+
	   					"<td>"+response.mpack+"</td>"+
	   					"<td>"+response.productCode+"</td>"+
 		   		  		"<td>"+response.batch+"</td> "+
 		   		  		"<td>"+response.quantity+"</td>"+
 		   		        "<td>"+response.total+"</td></tr>"
	   		   			$('#myTable .tbody').append(responsedata)
	   				});
	   			},
               error: function(e){
  	         	  alert("Error: Search failed " + e);
	           	}
	        });
		};

		function reversedate(date){
			 var result = "";
	         var wordArray = date.split("-");
	         for(var i = wordArray.length - 1; i >= 0; i--) {
	             result += wordArray[i] ;
	             if(i != 0){
	            	 result = result+"-" 
	             }
	         }
		return result.trim();
		}
		
		function getReport(){
			var supplierid = $('#supplier').val();
			if(supplierid == "All")
				supplierid = 0;
			var data={
        	   supplierid: supplierid
			}
			 $.ajax({
	       	  
		           type: "GET",
		           url: "/ERP/reports/supplierWiseDetailsReport",
		           data: data,
		           contentType: "application/pdf",
		           accept: "application/pdf",
	        	   responseType: "arraybuffer",
 		           success: function(response){
 		        	  	var bytes = new Int8Array(response);   
	 		        	$('#getreport').attr("href","/ERP/reports/supplierWiseDetailsReport"+"?supplierid="+data.supplierid);
	 		          	$('#getreport')[0].click();
		   			},
	             	error: function(e){
		  	           alert("Error: Couldn't get report " + e);
			         }
		     });
		}
</script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />')">

<div class = "wrapper">

 
 <nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Supplier Wise Details</a>
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
      	  
      	  <!-- <li class="dropdown navhover">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dispensary
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			  <li id="ds"><a href="/ERP/dsaleho.html">Sales</a></li>
        <li id="dpsp"><a href="/ERP/dstopriceho.html">Product Stocks and Pricing</a></li>		    
			        </ul>
      	  </li> -->
      	  
      	  <li class="dropdown navhover">
    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">Reports
        		<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		  		<li id=""><a href="/ERP/reports/orderreport.html">Orders</a></li>
       			<li id=""><a href="/ERP/reports/purchasebyinvoice.html">Purchase by Invoice</a></li>	
       			<li id=""><a href="/ERP/reports/stockvaluation.html">Stock Valuation</a></li>		
       			<li id=""><a href="/ERP/reports/salesbyinvoice.html">Sales by Invoice</a></li>	
       			<li id=""><a href="/ERP/reports/salesbyproduct.html">Sales by Product</a></li>	  
       			<!-- <li id=""><a href="/ERP/incomeByDoctor.html">Income by Doctor</a></li> -->  
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

  <center>
</center>


 <div id="form2a" >    
     <h1><font size="5" class = "psp">Supplier Wise Details</font><span class="button2"></span><i class="" style="color:#ff9900;margin: 4px 8px;"></i></h1>
	 <br>
	<c:set var="today" value="<%=new java.util.Date()%>" />
  	<div id="col3">     
      <div class="form-group row" >
      
	     <div class="col-xs-2"></div>
	     
	      <div class="col-lg-1 col-md-12 col-xs-12 col-sm-12">
		 </div>
	      
	     <div class="col-lg-1 col-md-12 col-xs-12 col-sm-12">
	     </div>
	      
	     <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	     	<div class="form-group fcategory">
        		<p>Suppliers<span>*</span></p>
		         <select class="selectpicker form-control" data-dropup-auto="false" data-live-search="true" data-size="5" name = "supplier" id ="supplier" required>
        		  <option value="All">All</option>
    			</select>
    		</div>
	     </div>
		
		<div class="col-lg-3">
			<div class="form-group">
		       <br>	<br>
				<button id="search" class="btn btn-primary mt-9" value="" onclick="getPurchaseEntries()">Search</button>
				<button id="print" class="btn btn-primary mt-9" onclick="getReport()">Print</button> 
				<a  id="getreport" target="_blank" style="visibility:hidden">Get Report</a>
			</div>
		</div>
	     
	 </div>
	      
	<div class="container table-container" id="span2">
  	   <div class="tableFixHead">   
			<table class="table table-striped table-bordered" id="myTable">
			    <thead class="thead">
			    <tr>
			    	<th>Supplier</th>
					<th>Allocation Id</th>
					<th>Received Date</th>
			        <th>Product Name</th>
			        <th>Pack Size</th>
			        <th>Product Code</th>
			        <th>Batch</th>
			        <th>Purchase Quantity</th>
			        <th>Total</th>
			      </tr>
			    </thead>
  				<tbody class="tbody"></tbody>
			</table>
		</div>
		<div style="float: right;margin-right: 2%;margin-top:1%"><b>Total : <span type="text" id="totalsum"></span></b></div>
	</div> 
	<br><br><br>
</div>
<br><br><br>
</div>
</div>



<script>
datasuccess('<%=request.getParameter("message")%>')
</script> 

<script>
if('<c:out value="${model.exp}" />' == '' && '<c:out value="${model.to}" />'== ''){
	getCount();
}
</script>

</body>	      
</html>  

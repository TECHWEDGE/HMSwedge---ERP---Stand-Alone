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
<link rel="stylesheet" href='<c:url value="/resources/css/table.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/filterbtn.js"></script>

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
  
  
  
</style>


 <script type="text/javascript">
 var cuser;
 function checkhome2(user){
	 $('.productName .input-block-level').attr('id','productName')
	 
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


   	//Filter

 	 var typingTimer;                
	 var doneTypingInterval = 1000;  
	 var a = jQuery('#productName');

	 //on keyup, start the countdown
	 a.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 a.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 

	 //user is "finished typing," do something

	 var srch;
	 function doneTyping () {
		 srch = $('#productName').val();
		 var data= {
					productCode :  $('#category').val(),
					product : srch
			}
			$.ajax({
		       	  
		           type: "GET",
		           url: "/ERP/reports/getProductsByCategory",
		           data: data,
		           dataType: 'json',
		           headers: { 
		               'Accept': 'application/json',
		               'Content-Type': 'application/json' 
		           },
		           success: function(response){
		        	   $('#products').find('option').remove();	
		   			$.each(response, function(index,response) {
		   				$('#products').append('<option value="'+response.pid+'" class="productslist" (change)="change()">'+response.name+'</option>');
		   				$('#products').selectpicker("refresh");
		   				
		   				});
		   			
		   			},
		            error: function(e){
			         	  alert("Error: Search failed " + e);
			           	}
			        });
	 	
	 }
	 
 }
 
 function getCount(){
		document.getElementById("myTable").rows.length = 1;
		var today = new Date();
		today.setMonth(today.getMonth() - 1);
	    document.getElementById("fromDate").valueAsDate = today;
		var add=moment(today).add(1, 'M').toDate();
		document.getElementById("toDate").valueAsDate = new Date(add);
	} 

//function copyName(code,name,category,expDate,toDate,batch,records){
	function copyName(category,expDate,toDate,records){
		
	alert("copying name")
	
	document.getElementById("code").value = code;
	document.getElementById("name").value = name;
	document.getElementById("category").value = category;
	if(records == 0){
		
	}else{
	document.getElementById("records").value = records;
	}
	document.getElementById("batch").value=batch;
	$("#expDate").val(expDate);
	$("#toDate").val(toDate);
}

function chdate(){
	   var val=$('#expDate').val();
	  var add=moment(val).add(1, 'y').toDate();
	    document.getElementById("toDate").valueAsDate = new Date(add);
	
}
 function datasuccess(data){
	 getCount();
	 getCategories();
	 getSales();
	if(data != "null"){
		
		alert(data)
 window.location = "/ERP/stopriceho.html";
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
        var parts = e.srcElement.value.split('.');
     
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        
            return false;
        }
      
        else{
        return true;
        }
    }
    catch (err) {
        alert(err.Description);
    }
}

function onlyNos1(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        var parts = e.srcElement.value.split('.');
     
        if (charCode > 31 && charCode !=46 && (charCode < 48 || charCode > 57)) {
        
            return false;
        }
        else if(parts.length >1 && charCode == 46){
        	return false;
        }
        else{
        return true;
        }
    }
    catch (err) {
        alert(err.Description);
    }
}
function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}
	
function validDate() {
	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate() + 7);
var s = document.getElementsByName("expDate");
for(var i =0;i<s.length;i++){
	s[i].setAttribute('min', getInputDateFormat(today));
}
	 
	}

function setmin(id){
	
	$(id).attr('min',new Date().toJSON().split('T')[0])
}
</script>
   <script>
      $(document).ready( function() {
    	  
    	  $(document).on('keypress', 'input', function(e){ 
    		   if (this.value.length == 0 && e.which == 48 ){
    		      return false;
    		   }
    		});
      });
</script>

<script>
var totalsum=0;
	function sqlToJsDate(sqlDate){
		var date = new Date(sqlDate);
		var dd = ("0" + date.getDate()).slice(-2);
		var mm = ("0" + (date.getMonth() + 1)).slice(-2);
		var yy = date.getFullYear();
		var Jdate = yy+"-"+mm+"-"+dd
		return Jdate;
	    
	}

	function getCategories(){
		$.ajax({
	       	  
	           type: "GET",
	           url: "/ERP/reports/getProductCategory",
	           dataType: 'json',
	           headers: { 
	               'Accept': 'application/json',
	               'Content-Type': 'application/json' 
	           },
	           success: function(response){
		   			$.each(response, function(index,response) {
		   				$('#category').append('<option value="'+response.pc+'">'+response.pc+'</option>');
		   				$('#category').selectpicker("refresh");
		   			});
	   				getProducts();
	   			},
	            error: function(e){
		         	  alert("Error: Search failed " + e);
		           	}
		        });
	}
	
	function getProducts(){
		var data= {
				productCode :  $('#category').val(),
				product : ""
		}
		$.ajax({
	       	  
	           type: "GET",
	           url: "/ERP/reports/getProductsByCategory",
	           data: data,
	           dataType: 'json',
	           headers: { 
	               'Accept': 'application/json',
	               'Content-Type': 'application/json' 
	           },
	           success: function(response){
	        	   $('#products').find('option').remove();	
	          // 	$('#products').append('<option value="All" selected disabled value="0">All</option>')
	   			$.each(response, function(index,response) {
	   				$('#products').append('<option value="'+response.pid+'" class="productslist" (change)="change()">'+response.name+'</option>');
	   				$('#products').selectpicker("refresh");
	   				
	   				});
	   			
	   			},
	            error: function(e){
		         	  alert("Error: Search failed " + e);
		           	}
		        });
	}
	
	function getSales(){
		
		var products = $('#products').val();
		var category = $('#category').val();
		var url;
		if(category != 'All' && products == null){
			
			url="/ERP/reports/getSalesByCategory"
				var data={
					fromDate : $('#fromDate').val(),
					toDate : $('#toDate').val(),
					productCategory : category
				}
		}
			
		else if ((category != 'All' && products != null) || category == 'All' && products != null){
			url="/ERP/reports/getSalesByProduct"
				var data={
					fromDate : $('#fromDate').val(),
					toDate : $('#toDate').val(),
					productCategory : category,
					products: products
				}
		}
		
		else if (category == 'All' && products == null){
			url="/ERP/reports/getAllSalesDetails"
				var data={
					fromDate : $('#fromDate').val(),
					toDate : $('#toDate').val(),
				}
		}
		else{
			return;
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
	        		   document.getElementById("totalsum").innerHTML = "0.00"
	        		   $('#print').attr('disabled','disabled');
	        		   return;
	        	   }
	        	   else{
	        		   $('#print').attr('disabled',false)
	        	   }
	        	   totalsum=0
	   			$.each(response, function(index,response) {
	   			 	var Jdate = sqlToJsDate(response.expirydate)	
	   			 	totalsum = response.gtotal+totalsum
	   					document.getElementById("totalsum").innerHTML =totalsum.toFixed(2)
	   				var responsedata ="<tr><td>"+response.saledetailsList[0].product.pid+"</td>"+
 		   		        "<td>"+response.saledetailsList[0].product.name+"</td>"+
 		   		   		 "<td>"+response.invoice+"</td>"+
 		   		        "<td>"+response.saledetailsList[0].batch+"</td>"+
 		   		    	"<td>"+response.saledetailsList[0].spack+"</td>"+
 		   		        "<td>"+response.saledetailsList[0].quantitysold+"</td>"+
 		   		        "<td>"+response.saledetailsList[0].unitprice+"</td>"+
 		   		        "<td>"+response.gtotal+"</td></tr>"
	   		   			$('#myTable .tbody').append(responsedata) 
	   				});
	   			},
               error: function(e){
  	         	  alert("Error: Search failed " + e);
	           	}
	        });
		};

		$(document).on('change','#category',function(){
			
		});

		
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
			
			var products = $('#products').val();
			var category = $('#category').val();
			
			var url;
			if((category == 'All' && products == null)){
					url = "/ERP/reports/getSalesByProductReport"
				 	var data={
						fromDate: $('#fromDate').val(),
						toDate: $('#toDate').val()
					} 
				$('#getreport').attr("href", url+"?fromDate="+data.fromDate+"&toDate="+data.toDate);
		        $('#getreport')[0].click();
			}
			else if((category != 'All' && products == null)){
				url = "/ERP/reports/getSalesByProductCategoryReport"
			 	var data={
					fromDate: $('#fromDate').val(),
					toDate: $('#toDate').val(),
	        	   	productCategory: category,
				} 
				
				$('#getreport').attr("href", url+"?productCategory="+data.productCategory+"&fromDate="+data.fromDate+"&toDate="+data.toDate);
		        $('#getreport')[0].click();
			}
			else if((category == 'All' && products != null)){
				url = "/ERP/reports/getSalesByProductsReport"
			 	var data={
					fromDate: $('#fromDate').val(),
					toDate: $('#toDate').val(),
	        	   autoid: products,
				} 
				
				$('#getreport').attr("href", url+"?fromDate="+data.fromDate+"&toDate="+data.toDate+"&autoid="+data.autoid);
		        $('#getreport')[0].click();
			}
			else if((category != 'All' && products != null)){
				url = "/ERP/reports/getSalesByProductsandCatgegoryReport"
			 	var data={
					fromDate: $('#fromDate').val(),
					toDate: $('#toDate').val(),
					productCategory: category,
	        	   autoid: products,
				} 
				
				$('#getreport').attr("href", url+"?fromDate="+data.fromDate+"&toDate="+data.toDate+"&productCategory="+data.productCategory+"&autoid="+data.autoid);
		        $('#getreport')[0].click();
			}
		}

</script>

<script>

	function dateValidate(){
		if($('#fromDate').val() > $('#toDate').val()){
			alert("From Date cannot be greather than To Date");
			$('#search').attr('disabled','disabled');
			$('#print').attr('disabled','disabled');
			return;
		}
		else if($('#toDate').val() < $('#fromDate').val()){
			alert("To Date cannot be lesser than From Date");
			$('#search').attr('disabled','disabled');
			$('#print').attr('disabled','disabled');
			return;
		}
		else{
			$('#search').attr('disabled',false);
			$('#print').attr('disabled',false);
		}
		
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
      <a class="navbar-brand" href="#">Sales By Product</a>
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
     <h1><font size="5" class = "psp">Sales by Product</font><span class="button2"></span><i class="" style="color:#ff9900;margin: 4px 8px;"></i></h1>
	 <br>
	<c:set var="today" value="<%=new java.util.Date()%>" />
  	<div id="col3">     
      <div class="form-group row" >
      
	     <div class="col-xs-1"></div>
	     
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	      	<div class="form-group">
            	<p>From Date<span>*</span></p>
      			<input type="date" class="form-control" onfocusout="dateValidate()" id="fromDate" name="fromDate">
      		</div>
		 </div>
	      
	     <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	     	 <div class="form-group">
		        <p>To Date<span>*</span></p>
      			<input type="date" class="form-control" id="toDate" onfocusout="dateValidate()" name="toDate" >
              </div>
	     </div>
	      
	     <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	     	<div class="form-group">
        		<p>Product Category<span>*</span></p>
		         <select class="selectpicker form-control" data-dropup-auto="false" data-live-search="true" data-size="5" name = "category" id ="category" onchange="getProducts()" required>
        		  <option value="All">All</option> 
    			</select>
    		</div>
	     </div>
	     
	     <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	     	<div class="form-group productName">
        		<p>Products<span>*</span></p>
		         <select class="selectpicker form-control" multiple data-dropup-auto="false" data-live-search="true" data-size="5" name = "products" id ="products" required>
        		 <!--  <option value="All">All</option> -->
    			</select>
    		</div>
	     </div>

		<div class="col-lg-3">
			<div class="form-group">
		       <br>	<br>
				<button id="search" class="btn btn-primary" value="" onclick="getSales()">Search</button>
				<button id="print" class="btn btn-primary" onclick="getReport()">Print</button> 
				<a  id="getreport" target="_blank" style="visibility:hidden">Get Report</a>
			</div>
		</div>
	     
	 </div>
	      
	<div class="container table-container" id="span2">
  	   <div class="tableFixHead">   
			<table class="table table-striped table-bordered" id="myTable" id="myTable">
			    <thead class="thead">
			    <tr >
			        <th>Product Code</th>
			        <th>Product Name</th>
			        <th>Invoice</th>
			        <th>Batch</th>
			        <th>Packaging</th>
			        <th>Quantity</th>
			        <th>Unit Price</th>
			        <th>Total</th>
			      </tr>
			    </thead>
  				<tbody class="tbody"></tbody>
			</table>
		</div>
		<div style="float: right;margin-right: 10%;"><b>Total : <span type="text" id="totalsum"></span></b></div>
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

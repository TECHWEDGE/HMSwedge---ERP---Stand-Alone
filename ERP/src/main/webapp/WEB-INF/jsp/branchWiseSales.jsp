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
 }
 
 function getCount(){
		document.getElementById("myTable").rows.length = 1;
		var today = new Date();
		today.setMonth(today.getMonth() - 1);
	    document.getElementById("fromDate").valueAsDate = today;
		var add=moment(today).add(1, 'M').toDate();
		document.getElementById("toDate").valueAsDate = new Date(add);
	} 


 function datasuccess(data){
	getCount();
	getBranches();
	getSalesData();
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

	function getBranches(){
		$.ajax({
	       	  
	           type: "GET",
	           url: "/ERP/getAllBranch",
	           dataType: 'json',
	           headers: { 
	               'Accept': 'application/json',
	               'Content-Type': 'application/json' 
	           },
	           success: function(response){
	   			$.each(response, function(index,response) {
	   				$('#branch').append('<option value="'+response.id+'">'+response.name+'</option>');
	   				$('#branch').selectpicker("refresh");
	   				});
	   			},
	            error: function(e){
		         	  alert("Error: Search failed " + e);
		           	}
		        });
	}

	function getSalesData(){
		
		var url="/ERP/reports/branchWiseSalesData"
		var data={
			fromDate : $('#fromDate').val(),
       	   	toDate : $('#toDate').val(),
       	 	branchid : $('#branch').val()
		}
		console.log("fromdate = ",data.fromDate)
		console.log("toDate = ",data.toDate)
		console.log("branchid = ",data.branchid)
			
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
        	   console.log("response = ",response)
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
   			
   				$.each(response, function(index,response) {
   				var responsedata ="<tr><td>"+response.gender+"</td>"+
   					"<td>"+response.invoice+"</td>"+
		   		    "<td>"+(response.custName==null?"":response.custName)+"</td>"+
		   		  	"<td>"+response.subt+"</td> "+
		   		    "<td>"+response.discount+"</td>"+
		   		 	"<td>"+response.tax+"</td>"+
		   			"<td>"+response.gtotal+"</td></tr>"
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
			
			var branchid = $('#branch').val();
			
			var url;
					url = "/ERP/reports/branchWiseSalesReport"
					var data={
						fromDate : $('#fromDate').val(),
		        	   toDate : $('#toDate').val(),
		        	   branchid: branchid
					}
			 $.ajax({
	       	  
		           type: "GET",
		           url: "/ERP/reports/branchWiseSalesReport",
		           data: data,
		           contentType: "application/pdf",
		           accept: "application/pdf",
	        	   responseType: "arraybuffer",
 		           success: function(response){
 		        	   
 		        	  var bytes = new Int8Array(response);   
 		           
 		        	$('#getreport').attr("href", url+"?fromDate="+data.fromDate+"&toDate="+data.toDate+"&branchid="+data.branchid);
 		          	$('#getreport')[0].click();
		   		},
	             error: function(e){
	  	           alert("Error: Couldn't get report " + e);
		           }
	            
		     });
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
      <a class="navbar-brand" href="#">Branch Wise Sales</a>
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

  <center>
</center>


 <div id="form2a" >    
     <h1><font size="5" class = "psp">Branch Wise Sales</font><span class="button2"></span><i class="" style="color:#ff9900;margin: 4px 8px;"></i></h1>
	 <br>
	<c:set var="today" value="<%=new java.util.Date()%>" />
  	<div>     
      <div class="form-group row" >
      
	     <div class="col-xs-2"></div>
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
	     	<div class="form-group fcategory">
        		<p>Branch<span>*</span></p>
		         <select class="selectpicker form-control" data-dropup-auto="false" data-live-search="true" data-size="5" name = "branch" id ="branch" required>
        		  <option value="All">All</option>
    			</select>
    		</div>
	     </div>
		<div class="col-lg-3">
			<div class="form-group">
		       <br>	<br>
				<button id="search" class="btn btn-primary mt-9" value="" onclick="getSalesData()">Search</button>
				<button id="print" class="btn btn-primary mt-9" onclick="getReport()">Print</button> 
				<a  id="getreport" target="_blank" style="visibility:hidden">Get Report</a>
			</div>
		</div>
	 </div>
	      
	<div class="container table-container">
  	   <div class="tableFixHead" style="margin: 0 170px 0 170px;">   
			<table class="table table-striped table-bordered" id="myTable">
			    <thead class="thead">
			    <tr>
					<th>Branch</th>
					<th>Invoice</th>
			        <th>Customer/Patient</th>
			        <th>Total</th>
			        <th>Discount</th>
			        <th>Tax</th>
			        <th>Grand Total</th>
			      </tr>
			    </thead>
  				<tbody class="tbody"></tbody>
			</table>
		</div>
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

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
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/tile.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/NewFilePharma.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-datetimepicker.min.js"></script>


</head>

 <script>
   $(document).ready(function(){
	   $('#mst').on('click',function(){
		   $('#os').hide();
		   $('#ps').hide();
		   $('#dps').hide();
		   $('#masters').show();
	   })
	   $('#orps').on('click',function(){
		   $('#masters').hide();
		   $('#os').show();
	   })
	   $('#psap').on('click',function(){
		   $('#masters').hide();
		   $('#os').hide();
		   $('#ps').show();
	   })
	   $('#dpa').on('click',function(){
		   $('#masters').hide();
		   $('#os').hide();
		   $('#ps').hide();
		   $('#dps').show();
	   })
	    $('#rpt').on('click',function(){
	    	 $('#masters').hide();
			   $('#os').hide();
			   $('#ps').hide();
			   $('#dps').hide();
		   $('#report').show();
		   
	   })
   })
   </script>
   
<script>
var userss;
function checkhome2(user){
	$('#brnli').text(" You are logged into " + window.localStorage.getItem("myInfon"));
userss = user;
	if(user == "[ROLE_PHARMACIST]"){
	
		 var url = "/ERP/welcome" ;
		$("#welcome").hide();
	}
	else if(user == "[ROLE_DISPPHARMACIST]"){
			
			 var url = "/ERP/welcome" ;
			$("#welcome").hide();
			$(".dp").hide();
			$("#psap").hide();
			$("#orps").hide();
			$(".dp").hide();
			$("#mst").hide();
			$("#masters").hide();
			
		} 
	
	else{
		 var url = "/ERP/welcome" ;
		
	
		 
		 $("#welcome").show();
	}
}

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

#cc{

      margin-left: 6px;
}


#mm{

    margin-right: 0px;
    margin-left: -3px;
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

.ip
{
white-space: normal;
}

/* irrelevant styling */
body { }
.p2 { 
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


function addp(id){
	if($("#admdate").length == 0){
		alert("Please select admission date")
		return false;
	}
	else if($("#disdate").length == 0){
		alert("Please select disacharge date")
	}
	else{
		var url = "/ERP/salespdf?location="+$("#admdate").val()+"&location1="+$("#disdate").val()+"" ;
		$(id).attr("href",url)
		return true;
	}
}

</script>
<script>
$( function() {
	  $( "#result" ).dialog({
	      
	    	dialogClass: 'result',
	      autoOpen: false,
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	    	  
	    
	        effect: "explode",
	        duration: 1000
	      }
	    });
	   $('#result').dialog({height: 400, width:300 });
	    $(".ui-dialog").find(".ui-widget-header").css("background", "linear-gradient(to right, rgb(36,51,138), rgb(17,142,191))","text-align","center");
	    
	     $( "#opener,#opener1").on( "click", function() { 
		  	  
	    	
		  	  var isOpen = $( "#result" ).dialog( "isOpen" );
		        
		    	if(isOpen == true){
		    	  
		    	  $( "#result" ).dialog( "open" );
		      }
		      else{
		    	
		    
		    	 $( "#result" ).dialog( "open" );
		      }
		    	
		    	$('.dp1').datetimepicker({
		   	   	 
			    	defaultDate: new Date(),
			    	useCurrent: false,
			    	format: "yyyy-mm-dd",
			        autoclose: true,
			        todayBtn: true,
			        minView: 2
			       
			    	
			    });

		  	  
		    });  
	    
});

</script>

<script>

	function worinInProgress(){
		alert("Work in progress")
	}

</script>

<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />')">
<div class="container-fluid phei">

	<div class="row log-top">
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
			<p class="log">Welcome ${pageContext.request.userPrincipal.name}.<span id="brnli"></span>
			<span class="log2"><!--<a href="/ERP/home" id="back">Back to HMS Home</a>-->
			 <i class="fa fa-sign-out logout" title="Log Out" onclick="return myconfirm()"></i></span>
			 </p>
		</div>
	</div>

	<div class="row container-fluid2">
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
			<p class="pharmahead">Pharmacy</p>
		</div>
	</div>
</div>

<div class="container pnavtop">

  <ul class="nav nav-pills nav-justified">
    <li class="li2 active" id="mst"><a data-toggle="pill" href="#masters">Masters</a></li>
    <li class="li2" id="orps"><a data-toggle="pill" href="#os">Order &amp; Reorder/Purchase Entry/Sales</a></li>
    <li class="li2" id="psap"><a data-toggle="pill" href="#ps">Product Stocks and Pricing</a></li>
   <!--  <li class="li2" id="dpa"><a data-toggle="pill" href="#dps">Dispensary</a></li> -->
    <li class="li2" id="rpt"><a data-toggle="pill" href="#report">Reports</a></li>
  </ul>
  
  <div class=" ptc">
  <div id="masters" class="tab-pane fade active in pharma-top">
  	<div class="row">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
		<a href="/ERP/manufactureho.html">
			<figure>
       			<img src="resources/icons2/manufacturer.png" class="img2">
     			 <figcaption>
      				<a class="tiletext" id = "mm" href="/ERP/manufactureho.html">Manufacturers</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
		<a href="/ERP/supplierho.html">
			<figure>
       			<img src="resources/icons2/supply master.png" class="img2">
     			 <figcaption>
      				<a class="tiletext" href="/ERP/supplierho.html">Suppliers</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
		<a href="/ERP/customerho.html">
			<figure>
       			<img src="resources/icons2/customer master.png"  id="cc"  class="img2">
     			 <figcaption>
      				<a class="tiletext" id= "cu" href="/ERP/customerho.html">Customers</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
		<a href="/ERP/productho.html">
			<figure>
       			<img src="resources/icons2/product master.png" class="img2">
     			 <figcaption>
      				<a class="tiletext" href="/ERP/productho.html">Products</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
	</div>
  </div>
   
   <div id="os" class="tab-pane fade pharma-top">
  	<div class="row">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
		<a href="/ERP/orderho.html">
			<figure>
       			<img src="resources/icons2/order and reorder.png" class="img2">
     			 <figcaption>
      				<a class="tiletext" href="/ERP/orderho.html">Order & Reorder</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
		<a href="/ERP/purchaseho.html">
			<figure>
       			<img src="resources/icons2/purchase entry.png" class="img2">
     			 <figcaption>
      				<a class="tiletext" href="/ERP/purchaseho.html">Purchase Entry</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
		<a href="/ERP/saleho.html">
			<figure>
       			<img src="resources/icons2/sales.png" class="img2">
     			 <figcaption>
      				<a class="tiletext" href="/ERP/saleho.html">Sales</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2" class="saler">
		<a href="#" id="opener1">
			<figure>
       			<img src="resources/icons2/sales report.png" class="img2">
     			 <figcaption>
      				<a href="#" class="tiletext" id="opener">Sales Report</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
	</div>
		</div>
  
  <div id="ps" class="tab-pane fade pharma-top">
  	<div class="row">
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
		<a href="/ERP/stopriceho.html">
			<figure>
       			<img src="resources/icons2/product stocks and pricing.png" class="img2">
     			 <figcaption class="pss2">
      				<a class="tiletext" href="/ERP/stopriceho.html">Stocks/Pricing</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
		<a href="/ERP/branchtransfer.html">
			<figure>
       			<img src="resources/icons2/stock transfer.png" class="img2">
     			 <figcaption class="pss">
      				<a class="tiletext" href="/ERP/branchtransfer.html">Stocks Transfer</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
	</div>
  </div>
  
  <div id="dps" class="tab-pane fade pharma-top">
  	<div class="row">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
		<a href="/ERP/dstopriceho.html">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/dstopriceho.html">Dispensary Stocks/Pricing</a>
      			</figcaption>
      		</figure>
      		</a>
		</div>
		
		<a href="/ERP/dsaleho.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
			<figure>
       			<img src="resources/icons2/dispensary sales.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/dsaleho.html">Dispensary Sales</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
	</div>
  </div>
  
  <div id="report" class="tab-pane fade pharma-top">
  	<div class="row">
  	
  		<a href="/ERP/reports/orderreport.html"> 
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
			<figure>
       			<img src="resources/icons2/dispensary sales.png" class="img2">
     			 <figcaption class="figcapc">
      				<!--  <a class="tiletext" href="/ERP/reports/orderreport.html">Orders</a> -->
      				<p style="color: white;font-size: 11px;">Orders</p>
      			</figcaption>
      		</figure>
		</div>
		</a> 
		
		<a href="/ERP/reports/purchasebyinvoice.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
			<figure>
       			<img src="resources/icons2/dispensary sales.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/purchasebyinvoice.html">Purchase By Inovice</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
  		<a href="/ERP/reports/stockvaluation.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
			<figure>
       			<img src="resources/icons2/dispensary sales.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/stockvaluation.html">Stock Valuation</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<a href="/ERP/reports/salesbyinvoice.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/salesbyinvoice.html">Sales By Invoice</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<a href="/ERP/reports/salesbyproduct.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
			<figure>
       			<img src="resources/icons2/dispensary sales.png" class="img2">
     			 <figcaption class="figcapc">
      				 <a class="tiletext" href="/ERP/reports/salesbyproduct.html">Sales By Product</a>
      			</figcaption>
      		</figure>
		</div>
		
		<!-- <a href="/ERP/incomeByDoctor.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/incomeByDoctor.html">Income By Doctor</a>
      			</figcaption>
      		</figure>
		</div>
		</a> -->
		
		<a href="/ERP/reports/branchWiseSales.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/branchWiseSales.html">Branch Wise Sales</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<a href="/ERP/reports/elapsedStocks.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/elapsedStocks.html">Elapsed Stocks</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<a href="/ERP/reports/productWisePurchase.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile2">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/productWisePurchase.html">ProductWise Purchase</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<a href="/ERP/reports/purchase.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/purchase.html">Purchase Report</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<a href="/ERP/reports/supplierWiseDetails.html">
		<div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1">
			<figure>
       			<img src="resources/icons2/dispensary product stocks and pricing.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/reports/supplierWiseDetails.html">SupplierWise Details</a>
      			</figcaption>
      		</figure>
		</div>
		</a>
		
		<!-- </a> -->
		
		<!-- <a href="/ERP/dsaleho.html"> -->
		<!-- <div class="col-xs-6 col-sm-6 col-lg-2 col-md-2 tile1" onclick="worinInProgress()">
			<figure>
       			<img src="resources/icons2/dispensary sales.png" class="img2">
     			 <figcaption class="figcapc">
      				<a class="tiletext" href="/ERP/dsaleho.html">Stock Expiry</a>
      				<p style="color: white;font-size: 11px;">Stock Expiry</p>
      			</figcaption>
      		</figure>
		</div> -->
	<!-- 	</a> -->
		
		
	</div>
  </div>
  
  
  </div>
  
   </div>
   
   
   <div id="result"  title="Sales Report">
   <div class="form-group row" >
        <div class="col-xs-10">
        <p class="p2">From Date<span></span></p>
       <div class="form-group">
      <div class='input-group date dp1'>
      <input type='text' name="admdate" id="admdate" class="form-control input-sm" required />
      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
      </div></div>
      </div>
      </div>
     <div class="form-group row" >
        <div class="col-xs-10">
        <p class="p2">To Date<span></span></p>
       <div class="form-group">
      <div class='input-group date dp1'>
      <input type='text' name="disdate" id="disdate" class="form-control input-sm" required />
      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
      </div></div>
      </div>
      </div>   
      <a href="" target="_blank" class="btn btn-warning" onclick="return addp(this)">Sales Report</a></div>
      
      
<!-- <div class="container-fluid mtf">
<div class="row">
<div class="footer">
  <p class="pl">&copy; <a href="https://www.techwedgeconsultants.com/" target="_blank" class="twc">Techwedge Consultants</a>
  Address: No 6, 1st Floor, Aditya Complex, 4th Cross, 5th Main, Hampi Nagar, Vijayanagar, Bangalore 560104</p>
  <p class="ml">Mob: +91 98455 32193</p>
</div>
</div>
</div> -->
</body>
</html> 
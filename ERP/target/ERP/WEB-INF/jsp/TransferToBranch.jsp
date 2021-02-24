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

<script type="text/javascript" src="/ERP/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/ERP/resources/js/filterbtn.js"></script>
<script type="text/javascript" src="/ERP/resources/js/ajaxcomponent.js"></script>

<style type="text/css">
/* 
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

} */


.btn-warning{
position :relative;
top:11px;
right:0px;
display: inline-block;
    padding: 7px 10px;
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
   
    
 /*    .table-responsive{
  font-family: 'Tahoma', 'sans-serif';

  margin-bottom:15px;
  
  overflow:auto;
      margin-right: 85px;
          width: 111%;
    margin-top: 10px;
        margin-left: -61px;
        height: 315px;
} */




td,th,thead{
  border : solid 2px white;

}

thead{
background: rgb(102, 158, 226);
    color: white;
border-bottom:solid 2px black;}

#cd{
text-align: center;
    padding-right: 60px;
    font-size: 37px;
font-family: 'Times New Roman', 'sans-serif';
}





@media (max-width:640px){



#bc{
    margin-left: 10px;
}

#re{
        margin-left: 10px;
}



.table-responsive{
  width: 110%;
      height: 313px;
      font-family: 'Tahoma', 'sans-serif';
margin-top: 22px;
  margin-bottom:15px;
  margin-left: -14px;
  overflow-X:auto;
  overflow-y:auto;
      margin-right: 85px;
}




}


body{
background: #eaeaea;
}
label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 1; 
    font-size: 15px;
     font-family: 'Open Sans', sans-serif;
    }
.astrick{
    color:red;}
    
.button_padd{
    padding-top: 12px;
}
/* .table-responsive {
    min-height: .01%;
    max-height: 200px;
    overflow-x: auto;
    overflow-y: auto;
}
th
{
background: #009999;
}
td{
    background: white;
    text-align: center;
    vertical-align: middle;
    } */
    
    
    .panel-default{
    margin-top: 65px;
    }
    
.panel-default>.panel-heading {
    color: white;
    background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
    border-color: #ddd;
    font-size: 
    

}
.panel-footer {
    padding: 0px;
    border-top: 1px solid #009999;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
    background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
    height: 46px;
}
.navbar-right{
    float: right!important;
    margin-right: 0px;
    color: black;
    padding-top: 12px;
    font-size: 14px;
}
</style>

<script>
var cuser;
function checkhome2(user){
	
	 $('.fcategory .input-block-level').attr('id','fcategory')
	 
	cuser = user;
	$('#brnli').text("Logged into : " + window.localStorage.getItem("myInfon"));
	 var getData=window.localStorage.getItem("myInfo"); 
		
	 $('select[name=fid]').val(getData);
	 
	 $('#myTable .tbody tr').each(function(){
			$('.list :selected').text("Dispensary")
		});
	 
	 if(user == "[ROLE_SALESMANAGER]" || user == "[ROLE_DISPSALESMANAGER]" ){
	
		var url = "/ERP/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	
		document.getElementById("bc").style.display = "none"; 
		document.getElementById("mm").style.display = "none"; 
		document.getElementById("sm").style.display = "none"; 
		document.getElementById("or").style.display = "none"; 
		document.getElementById("pe").style.display = "none";  
		
		$("#myTable th:eq(6), #myTable td:nth-child(7)").hide();
		$("#myTable th:eq(7), #myTable td:nth-child(8)").hide();
		$("#myTable th:eq(8), #myTable td:nth-child(9)").hide();
		$("#myTable th:eq(11), #myTable td:nth-child(12)").hide();
		$("#myTable th:eq(12), #myTable td:nth-child(13)").hide();
		$("#myTable th:eq(16), #myTable td:nth-child(17)").hide();
       document.getElementById("myTable").style.width = "1730px"; 		
       $('.ft').prop('readonly', true);
       
       $('#dpe').hide();	
		$('#dpma').hide();
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
	 $("#myTable .tbody tr").each(function(){
			
    	 var x=this.cells;
        var a = x[7].getElementsByTagName('input')[0].value;
        var b =  Number(x[9].getElementsByTagName('input')[4].value)/100;
        
      var c = Number(x[7].getElementsByTagName('input')[0].value) + (Number(x[7].getElementsByTagName('input')[0].value) * Number(b));
      x[8].getElementsByTagName('input')[0].value = c.toFixed(2); 
 });
	 
	 
	 
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
	 }
	 
	 
}

function getStks(th,getval,pid){
	 var myname = getval.getAttribute("value");
	  $.ajax({
     	  
          type: "GET",
          url: "/ERP/getStks.html?location1="+myname+"&location2="+pid+"",
          dataType: "JSON",
          contentType: "application/json; charset=UTF-8",
          
          success: function(response){
   
       	   $.each(response, function(index, datec) {
          $(th).closest('td').next('td').text(parseInt(datec.cstock));       
       	   });    
          },
          error: function(e){
       	  
       	           alert('Error: ' + e);
       	  
       	           }
       	           });
}
function verify(inp,out){
	
	if(Number(inp) > Number(out)){
		alert("Greater")
	
		return false;
	}
	else{
		
		return true;
	}
}


function getCount(){
		document.getElementById("myTable").rows.length = 1;
	  
	    document.getElementById("expDate").valueAsDate = new Date();
	    var val=$('#expDate').val();
		  var add=moment(val).add(5, 'y').toDate();
		//  add=moment(add).format("DD-MM-YYYY");
		  
		    document.getElementById("toDate").valueAsDate = new Date(add);
	    //document.getElementById("toDate").valueAsDate = new Date();
	} 
	
function addCs(getval,id,batch){
	var myname = getval.getAttribute('data-value'); 	

	//var cid = document.getElementById("pid").value; 
	var str = myname.split(',');
	if(Number(str[0]) == Number(id)){
		if(str[1] == batch){
			alert("you can add")
		}
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
function copyName(code,name,category,expDate,toDate,batch,records){
	
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
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/ERP/branchtransfer.html";
	}
}
function hideRows(){
	var res = 0;
	var c;
	var d;
var chk = $('#myTable tr td:first-child :checkbox:checked').length;

if(chk == 0){
	alert("Please select the checkboxes beside each of the products you wish to transfer")
	return false;
}


	$("#myTable .tbody tr").each(function() {
		   
		        
		        var x=this.cells;
		       var a = x[4].getElementsByTagName('input')[0].value;
		       var b = x[9].getElementsByTagName('input')[11].value;
		      
		       c = x[2].getElementsByTagName('input')[0].value;
		       d = x[3].getElementsByTagName('input')[0].value;
		        if(Number(a) < Number(b) ){
		   		 res = 1;
		     
		   		 return false;
		   	 }
		        
		    });
	
	if(res != 0){
	
		alert("Quantity to transfer is greater than current stocks for " + c + " : " + d)
		return false;
	}
	else{ 
	
		$('#myTable tr td:first-child :checkbox:not(:checked)').closest('tr').remove();
	 return true;
	}
}

function fetchSearchResults(){
    var uri = "/ERP/searchTransferStocks"
    var databody = {
      "name" : $("#name").val(),
      "code" : $("#code").val(),
      "expirydate" : $("#expDate").val(),
      "toexpirydate" : $("#toDate").val(),
      "limit": $("#records").val(),                   
      "batch" : $("#batch").val(),
      "category" : $("#category").val()
    }    
    var successFn = (response)=>{
   	 $(".table-responsive").empty();
   	 $(".table-responsive").html(response);
    }
    var errorFn = (error) =>{
          console.log(error);
          alert("Error occurred")  
    }
    doAjaxCall(uri,databody,successFn,errorFn,"GET");
	}


</script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />')">


 <nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Stocks Transfer</a>
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


<div class="container-fluid">
<div class="panel panel-default">
	<div class="panel-heading text-center"><h2>Stocks Transfer</h2></div>
	<div class="panel-body">
	<div class="container">
	
	<form:form id="form2" action="transferStocks.html"  modelAttribute="productStocks" method="post"></form:form>
	<form id ="form1" method="get" action="tbsearch.html">
	
	
	 <div class="row">
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group">
		<label>Product Code</label><span class="astrick">*</span>
		<input type="text" class="form-control" placeholder="Product Code" name="code" id="code">
		</div>
		
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group">
		<label>Product Name</label><span class="astrick">*</span>
		<input type="text" class="form-control" placeholder="Product Name" name="name" id="name">
		</div>
		
		<%-- 
		 <div class="col-xs-4">
	      <div class="form-group fcategory">
	     
        <p>Category<span>*</span></p>
         <select class="selectpicker form-control"  data-live-search="true" data-size="5" name = "category" id ="category" required>
          <option value="All">All</option>
        <c:forEach var="pp"  items="${model.list1}">
         <option class="${pp.pc}" value="${pp.pc}">${pp.pc}</option>
         </c:forEach>
    </select> </div>
	
	      </div> --%>
		
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group fcategory">
		<label>Category</label><span class="astrick">*</span>
		<select class=" selectpicker form-control" data-dropup-auto="false" data-live-search="true" data-size="5" name="category" id="category" required>
		<option selected="selected">All</option>
		 <c:forEach var="pp"  items="${model.list1}">
         <option class="${pp.pc}" value="${pp.pc}">${pp.pc}</option>
         </c:forEach>
		</select>
		</div> 
		
	</div> 
	
	
	<div class="row">
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group">
		<label>Expiry Date</label><span class="astrick">*</span>
		<input type="date" class="form-control" placeholder="12-12-2018" name="expDate" id="expDate">
		</div>
		
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group">
		<label>To Date</label><span class="astrick">*</span>
		<input type="date" class="form-control" placeholder="12-12-2018" name="toDate" id="toDate">
		</div>
		
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group">
		<label>Batch</label><span class="astrick">*</span>
		<input type="text" class="form-control" placeholder="Batch Code" name="batch" id="batch">
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4 col-md-12 col-xs-12 col-sm-12 form-group">
		<label>Show</label><span class="astrick">*</span>
		<input type="text" class="form-control" placeholder="20" value="20" id="records" name="records" >
		</div>
		
		<div class="col-lg-8 col-md-12 col-xs-12 col-sm-12 form-group button_padd">
		  <button type="button" id="bouton-contact" class="btn btn-warning" onclick="fetchSearchResults()">Search</button>
		  <!-- <button type="button" class="btn btn-primary">Refresh</button> -->
		<a href="/ERP/branchtransfer.html" class="btn btn-primary" id ="re" role="button">Refresh</a>
		  <button type="submit" form="form2" class="btn btn-info" id="bc" onclick = "return hideRows()">Transfer Stocks</button>
		</div>
		
	</div>
	</form>
	
    <div class="table-responsive">   
        <jsp:include page="TransferTableComponent.jsp" />
	</div>

	</div>
	</div>
	<div class="panel-footer"></div>
</div>

</div>
<script>
datasuccess('<%=request.getParameter("message")%>')
if('<c:out value="${model.exp}" />' == '' && '<c:out value="${model.to}" />'== ''){

	getCount();
}
else{
   copyName('<c:out value="${model.code}" />','<c:out value="${model.name}" />','<c:out value="${model.category}" />','<c:out value="${model.exp}" />','<c:out value="${model.to}" />','<c:out value="${model.batch}" />','<c:out value="${model.limit}" />');
}
   </script>
</body>
</html>
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
   
    
    .table-responsive{
 /*  font-family: 'Tahoma', 'sans-serif'; */

  /* margin-bottom:15px; */
  overflow-y:hidden;
   overflow-x:auto; 
     /*  margin-right: 85px;
          width: 108%; */
  /*   margin-top: 10px; */
        margin-left: -48px;
        height:400px;
}


td,th,thead{
  border : solid 2px white;

}

thead{
border-bottom:solid 2px black;}


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
/* #myTable{
	margin-left:8px;
} */

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


.table-responsive{
  width: 27%;
      height: 313px;
      font-family: 'Tahoma', 'sans-serif';
margin-top: 22px;
  margin-bottom:15px;
  margin-left: -4px;
  overflow:auto;
      margin-right: 85px;
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

/* #myTable {
    border-collapse: collapse;
    width: 100%;
    
    }
#myTable th {
    background-color: #009999;
    color: black;
 
}
 #myTable tbody{
    height:250px;
    overflow :auto;
 }
  #myTable thead,tbody{
  
    display:block;
  } */

 

  
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

#span2{
height :350px;
/* width : 1200px; */
/* overflow-X : auto;
overflow-Y : auto; */
}
.navbar-right{
    float: right!important;
    margin-right: 0px;
    color: black;
    padding-top: 12px;
    font-size: 14px;
}
  
  
  
  tbody{
    height: 284px;
    overflow-y: auto;
    overflow-x: hidden;
    display: block;
    /* width: 1760px; */
        width: 100%;
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
 		
 		/* $("#myTable th:eq(6), #myTable td:nth-child(7)").hide();
 		$("#myTable th:eq(7), #myTable td:nth-child(8)").hide();
 		$("#myTable th:eq(8), #myTable td:nth-child(9)").hide();
 		$("#myTable th:eq(11), #myTable td:nth-child(12)").hide();
 		$("#myTable th:eq(12), #myTable td:nth-child(13)").hide();
 		$("#myTable th:eq(16), #myTable td:nth-child(17)").hide(); */
 		
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
 
 function getCount(){
		document.getElementById("myTable").rows.length = 1;
	  
	    document.getElementById("expDate").valueAsDate = new Date();
	    var val=$('#expDate').val();
		  var add=moment(val).add(5, 'y').toDate();
		//  add=moment(add).format("DD-MM-YYYY");
		  
		    document.getElementById("toDate").valueAsDate = new Date(add);
	    //document.getElementById("toDate").valueAsDate = new Date();
	} 
function search(id,name,batch,stk,expdate){

document.getElementById("codeS").value = id;
document.getElementById("nameS").value = name;
document.getElementById("batchS").value = batch;
document.getElementById("cs").value = stk;

document.getElementById("expdate").value = expdate;

$('#myModal').modal('show');
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

function chdate(){
	   var val=$('#expDate').val();
	  var add=moment(val).add(1, 'y').toDate();
	//  add=moment(add).format("DD-MM-YYYY");
	  
	    document.getElementById("toDate").valueAsDate = new Date(add);
	
}
function datasuccess(data){
	
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
//s[i].setAttribute('max', getInputDateFormat(maxDate));	
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
   
$(document).ready(function() {
  
	$("#myTable .tbody tr").each(function(){
		
        	 var x=this.cells;
	       /*  var a = x[6].getElementsByTagName('input')[0].value;
	        var b = Number(x[12].getElementsByTagName('input')[0].value)/100;
	        var c = Number(a) + (Number(a) * Number(b));
	        x[13].getElementsByTagName('input')[0].value = c.toFixed(2);
	       
	        x[16].getElementsByTagName('input')[0].value = (Number( x[9].getElementsByTagName('input')[0].value) * Number( x[13].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[18].getElementsByTagName('input')[0].value = (Number(x[15].getElementsByTagName('input')[0].value) * Number(x[17].getElementsByTagName('input')[0].value))
	        x[19].getElementsByTagName('input')[0].value = (Number(x[13].getElementsByTagName('input')[0].value) * Number(x[18].getElementsByTagName('input')[0].value)).toFixed(2);
		      
       */
       
       var a = x[7].getElementsByTagName('input')[0].value;
       var b = Number(x[13].getElementsByTagName('input')[0].value)/100;
       var c = Number(a) + (Number(a) * Number(b));
       x[14].getElementsByTagName('input')[0].value = c.toFixed(2);
      
       x[17].getElementsByTagName('input')[0].value = (Number( x[10].getElementsByTagName('input')[0].value) * Number( x[14].getElementsByTagName('input')[0].value)).toFixed(2);
       x[19].getElementsByTagName('input')[0].value = (Number(x[16].getElementsByTagName('input')[0].value) * Number(x[18].getElementsByTagName('input')[0].value))
       x[20].getElementsByTagName('input')[0].value = (Number(x[14].getElementsByTagName('input')[0].value) * Number(x[19].getElementsByTagName('input')[0].value)).toFixed(2);
	      
 
       
	    
	});
	    $(document).on('focusout','.tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	      //  x[6].getElementsByTagName('input')[0].value = (Number(x[8].getElementsByTagName('input')[0].value)/(Number(x[5].getElementsByTagName('input')[0].value)*Number(x[7].getElementsByTagName('input')[0].value))).toFixed(2);
		    
	   /*  x[11].getElementsByTagName('input')[0].value=(Number(x[6].getElementsByTagName('input')[0].value)*Number(x[9].getElementsByTagName('input')[0].value)).toFixed(2);

	        var a = x[6].getElementsByTagName('input')[0].value;
	        var b = Number(x[12].getElementsByTagName('input')[0].value)/100;
	        var c = Number(a) + (Number(a) * Number(b));
	        x[13].getElementsByTagName('input')[0].value = c.toFixed(2);

	        x[16].getElementsByTagName('input')[0].value = (Number( x[9].getElementsByTagName('input')[0].value) * Number(x[13].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[18].getElementsByTagName('input')[0].value = (Number(x[15].getElementsByTagName('input')[0].value) * Number(x[17].getElementsByTagName('input')[0].value))
	        x[19].getElementsByTagName('input')[0].value = (Number(x[13].getElementsByTagName('input')[0].value) * Number(x[18].getElementsByTagName('input')[0].value)).toFixed(2);
	        */
	        
	        x[12].getElementsByTagName('input')[0].value=(Number(x[7].getElementsByTagName('input')[0].value)*Number(x[10].getElementsByTagName('input')[0].value)).toFixed(2);

	        var a = x[7].getElementsByTagName('input')[0].value;
	        var b = Number(x[13].getElementsByTagName('input')[0].value)/100;
	        var c = Number(a) + (Number(a) * Number(b));
	        x[14].getElementsByTagName('input')[0].value = c.toFixed(2);

	        x[17].getElementsByTagName('input')[0].value = (Number( x[10].getElementsByTagName('input')[0].value) * Number(x[14].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[19].getElementsByTagName('input')[0].value = (Number(x[16].getElementsByTagName('input')[0].value) * Number(x[18].getElementsByTagName('input')[0].value))
	        x[20].getElementsByTagName('input')[0].value = (Number(x[14].getElementsByTagName('input')[0].value) * Number(x[19].getElementsByTagName('input')[0].value)).toFixed(2);
	       
	    });
	   
   });
   
   </script>    

<script>

	function listatus(e){
		
		//alert("fun e = "+e)
		/* if(e == 'Active' || e == 'on'){
		//	alert("fun listatus if")
			$('.status').prop('checked',true)
		}
		else if(e == 'Inactive' || e == 'off'){
		//	alert("fun listatus else")
			$('.status').prop('checked',false)
		} */
		
		if(e=='on'){
			//alert("listatus if")
			$('.status'+e+'').prop('checked',true)
		}
		else{
			//alert("listatus else")
			$('.status'+e+'').prop('checked',false)
		}
		
	}
		function statuschange(checkboxobj){
			
			//alert("uqk = "+uqk)
			 if($(checkboxobj).prop("checked") == false){
				 $(checkboxobj).val('off');
				
					/*var url = "/ERP/psstatus?uqkval="+uqk+""
						
					var successFn = function(response){
						
					    
				   }
				   var errorFn = function(e){
					           alert('Error: ' + e);
					           }
					
				    filterAjax(uqk,url,successFn,errorFn)*/
			}
			 else  {
				 $(checkboxobj).val('on');
					/*var url = "/ERP/psstatus2?uqkval="+uqk+""
						
					var successFn = function(response){
						
					    
				   }
				   var errorFn = function(e){
					           alert('Error: ' + e);
					           }
					
				    filterAjax(uqk,url,successFn,errorFn)*/
			}
			
	}

		function fetchSearchResults(){
         var uri = "/ERP/searchProductStocks"
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
        	 $("#span2").empty();
        	 $("#span2").html(response);
         }
         var errorFn = (error) =>{
               console.log(error);
               alert("Error occurred")  
         }
         doAjaxCall(uri,databody,successFn,errorFn,"GET");
		}

		function verifyUpdate(buttonObj){
			var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
			if(tableRef.rows.length == "0"){
				alert("Cannot update empty stocks")
				return false;
			}
			else{
				$("#form2").submit();
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
      <a class="navbar-brand" href="#">Product Stocks & Pricing</a>
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

  <center>
</center>
  <div id="form2a" >  
  
     <h1>
     <font size="5" class = "psp">Product Stocks and Pricing </font><span class="button2"></span><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
	 
	</h1>
	    
	    <div class="container">
</div>
<br>
<c:set var="today" value="<%=new java.util.Date()%>" />
      <div id="col3">
       <!--<form id = "form2" method="post" action ="pssaveho.html"></form> -->
       <form:form id="form2" method="post" modelAttribute="productStocks" action="saveProductStocks.html"></form:form>
     <form id ="form1" class="" method="get" action="pssearchho.html">
     
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
            <p>Product Code<span>*</span></p>
      <input type="text" class="form-control" id="code" name="code" placeholder="Product Code">
       
      </div>
	</div>
	
	      
	       <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	     
        <p>Product Name<span>*</span></p>
       <input type="text" class="form-control" id="name" name="name" placeholder="Product Name">
       </div>
	
	      </div>
	      
	      
	          <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group fcategory">
	     
        <p>Category<span>*</span></p>
         <select class="selectpicker form-control"  data-dropup-auto="false" data-live-search="true" data-size="5" name = "category" id ="category" required>
          <option value="All">All</option>
        <c:forEach var="pp"  items="${model.list1}">
         <option class="${pp.pc}" value="${pp.pc}">${pp.pc}</option>
         </c:forEach>
    </select> </div>
	
	      </div>
	      </div>
	      
	            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
            <p>Expiry Date<span>*</span></p>
      <input type="date" class="form-control" maxlength="2999-12-31" min="2017-11-21" id="expDate" name="expDate">
     
      </div>
	</div>
	
	      
	       <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	     
        <p>To Date<span>*</span></p>
      <input type="date" class="form-control"  maxlength="2999-12-31" id="toDate" name="toDate" >
              </div>
	
	      </div>
	      
	      
	          <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	     
        <p>Batch <span>*</span></p>
       <input type="text" class="form-control" id="batch" name="batch" placeholder="Batch code">
      </div>
	
	      </div>
	      
	      
	      
	      </div>    
	      
	      
	    
	  

	     <div class="form-group row" >
  <div class="col-xs-1"></div>
  
   <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group">
	<p> Show<span>*</span></p>
	    <input type="number" class="form-control" id="records"   name="records" value='20' required>
  
     </div>
	      </div>
	      <div class="col-xs-2">
	       <div class="form-group">
	       <br>	
	 
    <input type="button" id="bouton-contact" class="btn btn-warning" value="Search" onclick="fetchSearchResults()">
  <a href="/ERP/stopriceho.html" class="btn btn-primary" role="button">Refresh</a>

	       </div>
	       </div>
	       
<div class="col-xs-5" id = "nt" style="padding-top: 13px;color: red;">Note: Changes to Unit CP and Markup, updates Unit SP. Changes to other fields, if required, have to be done manually</div>	       

	       </div>
	       </form>
	       <div class="container" id="span2">
	       <jsp:include page="ProductStockTableComponent.jsp" />
	       </div>
<br><br><br>
     <div class="form-group row" >
  <div class="col-xs-6"></div>
<div class="col-xs-2">
	      
	      <div class="form-group"> 
    <input type="button" form="form2" class="btn btn-warning button1" id='bc' onclick="verifyUpdate()" value="Update" >
	  </div>
	  </div>
	  </div>
</div>

  
     <input type="button"  form="purchasesave" id="" class="bouton-contact" >


 </div>
</div>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
<script>
if('<c:out value="${model.exp}" />' == '' && '<c:out value="${model.to}" />'== ''){

	getCount();
}
else{
   copyName('<c:out value="${model.code}" />','<c:out value="${model.name}" />','<c:out value="${model.category}" />','<c:out value="${model.exp}" />','<c:out value="${model.to}" />','<c:out value="${model.batch}" />','<c:out value="${model.limit}" />');
}
   </script>
   
 
<c:forEach var="p"  items="${model.listatus}">
<script>
//console.log("listat = '<c:out value="${p.status}" />'")
//listatus('<c:out value="${p.status}" />');


</script>
</c:forEach>
  

	  </body>
	   
	      
</html>  

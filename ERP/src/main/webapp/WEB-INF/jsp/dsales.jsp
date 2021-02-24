<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy </title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">

<link rel='stylesheet' href='<c:url value="/resources/css/printsales.css" />' type='text/css' media='print' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/navbar.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/ERP/resources/js/filterbtn.js"></script>

<style>

.panel-info>.panel-heading {
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));

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

  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
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
  font-family: 'Tahoma', 'sans-serif';

  margin-bottom:15px;
  
  overflow:auto;
      margin-right: 85px;
          width: 108%;
    margin-top: 10px;
        margin-left: -61px;
}


td,th,thead{
  border : solid 2px white;

}

thead{
backgroundr: rgb(102, 158, 226);
    color: white;
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
   /*  margin-left: 12px;
top:6px; */
}
.button1{
position: relative;
float:left;
/* top:6px; */
}
.button2{
position:relative;
float:right;
font-size: 15px;
 
   width: 73px;
   margin-top: -12px;
}

#myImg{
    margin-top: 30px;
   
}

#adbar{
margin-top: 30px;
}

#gtot{
font-size:14px;
   margin-top: 40px;
}

#bouton-contact{
font-size:14px;
   margin-top: 40px;
}

#addbt{
font-size: 14px;
   height: 35px;
}

#viewpr{
   font-size: 14px;
   height: 35px;
}


#myTable3{
   width: 92%;
   margin-right: 0px;
   margin-left: 64px;
}




@media (max-width:640px){

.ui-widget.ui-widget-content {
    max-width: 100%;
    max-height: 100%;
}

#cdiscount{
    margin-bottom: -58px;
}

#bouton-contact{
    margin-left: 152px;
    margin-top: -59px;
}

#hiden{
    margin-top: 10px;
}

#viewpr{
    margin-left: 130px;
    margin-top: -75px;
}

#close{
margin-top: -14px;
}

#myImg{
margin-left: 20px;
    margin-top: 30px;
}

#adbar{
        width: 180px;
    margin-left: 70px;
}


.table-responsive{
  width: 113%;
      font-family: 'Tahoma', 'sans-serif';
margin-top: 22px;
  margin-bottom:15px;
  margin-left: -4px;
  overflow-X:auto;
  overflow-Y:auto;
      margin-right: 85px;
          margin-left: -18px;
}

#ch{
font-size: 25px;
    margin-left: 43px;
}




}

body{
	background: #eaeaea;
}

.wrapper {
margin-top: 65px;
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form1 h1 {
  font-size: 18px;
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form1 {
  border-radius: 5px;
  max-width:1300px;
  width:100%;
  margin: 5% auto;
  margin-top :  1cm;
  background-color: #FFFFFF;

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
  margin-top: 20px;
  font-size: 18px;
}


/* 
table {
    border-collapse: collapse;
    width: 100%;
    
    }
th {
    background-color: #009999;
    color: white;
   
} */



.button1{
	float : left;
}
.button2{
	float : right;
}



#col3{
    margin-top: -33px;
    margin-left: 25px;
    margin-right: 12px;
border-style : groove;
border-radius : 10px;
width : auto;
height : auto;
}

#span2{

}

#meta2 { border : 0.1pt solid; width: 300px; float: right; margin-right: 10px; }
#meta2 td .total-value { text-align: right;}
#meta2 td.meta-head { text-align: left; background: #eee;width: 70px; }
#meta2 td textarea { width: 100%; height: 20px; text-align: right; }

tr.duplicate td{
	   background-color: red;
 }
 
  #adbar pre{
    display: block;
   padding: 0px;
    margin: 0 0 10px;
    font-size: 13px;
    line-height: 1.42857143;
    color: #333;
    word-break: break-word;
    word-wrap: break-word;
    border : none;
    background-color :white;
    white-space: pre-wrap;        /* Branch 1 */
   
}
.navbar-right{
    float: right!important;
    margin-right: 0px;
    color: black;
    padding-top: 12px;
    font-size: 14px;
}
  .bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 182px;
}

.ui-dialog .ui-dialog-title {
    float: left;
    margin: .1em 0;
    white-space: nowrap;
    width: 90%;
    overflow: hidden;
    text-overflow: ellipsis;
    color: white;
}
</style>


<script type="text/javascript">
/*
 *tr.duplicate td{
	   background-color: red;
 }
 */
  
 
 
 

var cuser;
function checkhome2(user){
	
	/* if($('input[type=checkbox]').prop('checked')){
		$('#viewpr').show();
	}
	else{
		$('#viewpr').hide();
	} */
	$('.finvoice .input-block-level').attr('id','finvoice')
	$('.patname .input-block-level').attr('id','patname')
	$('.patid .input-block-level').attr('id','patid')
	$('.fcname .input-block-level').attr('id','fcname')
	$('.fcid .input-block-level').attr('id','fcid')
	
	cuser = user;
check()

	$('#brnli').text("Logged into : " + window.localStorage.getItem("myInfon"));	     
	
	 if(user.includes("[ROLE_DISPSALESMANAGER]")){
	
		var url = "/ERP/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		
			document.getElementById("mm").style.display = "none"; 
			document.getElementById("sm").style.display = "none"; 
			document.getElementById("or").style.display = "none"; 
			document.getElementById("pe").style.display = "none"; 
		 
			$('#dr1').hide();	
			$('.pra').hide();
			$('#dpe').hide();
			$('#stktrns').hide();
			$('.tra').hide();
			$('.sta').hide();
			$('#ch').text('Dispensary Sales')
			$('.navbar-brand').text('Dispensary Sales')
		 
	}
	else if(user == "[ROLE_DISPPHARMACIST]"){
	
		 var url = "/ERP/hmspharma" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('#dr1').hide();	
			$('.pra').hide();
			$('#stktrns').hide();
			$('.tra').hide();
			$('.sta').hide();
			$('#ch').text('Dispensary Sales')
			$('.navbar-brand').text('Dispensary Sales')
	}
	 
	else if(user == "[ROLE_PHARMACIST]"){
		
		 var url = "/ERP/hmspharma" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
			
		 $('#ch').text('Dispensary Sales')
			$('.navbar-brand').text('Dispensary Sales')
			$('#dpma').hide();
			
	}
	else if(user == "[ROLE_ASSISTANT]"){
		
		 var url = "/ERP/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
			
		 $('#ch').text('Dispensary Sales')
			$('.navbar-brand').text('Dispensary Sales')
			$('#dpma').hide();
		 $('#dr1').hide();
		 $('#tra').hide();
		 $('#dr2').hide();
		 $('#sta').hide();
	}
	else if(user == "[ROLE_Accounts Admin]"){
		
		 var url = "/ERP/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
			
		 $('#ch').text('Dispensary Sales')
			$('.navbar-brand').text('Dispensary Sales')
			$('#dpma').hide();
		 $('#dr1').hide();
		 $('#tra').hide();
		 $('#dr2').hide();
		 $('#sta').hide();
			
	}
	else if(user.includes("[ROLE_SALESMANAGER]")){
	
		var url = "/ERP/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		
			document.getElementById("mm").style.display = "none"; 
			document.getElementById("sm").style.display = "none"; 
			document.getElementById("or").style.display = "none"; 
			document.getElementById("pe").style.display = "none"; 
			$('#dpe').hide();	
			$('#dpma').hide();
			$('#stktrns').hide();
		
		 
	}
	
	else{
		 var url = "/ERP/hmspharma" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 $('#ch').text('Dispensary Sales')
			$('.navbar-brand').text('Dispensary Sales')
			$('#dpma').hide();
			
	}
	 
	 
	 
	 var typingTimer;                
	 var doneTypingInterval = 1000;  
	 var a = jQuery('#finvoice');
	 var b = jQuery('#patname');
	 var c = jQuery('#patid');
	 var d = jQuery('#fcname');
	 var e = jQuery('#fcid');

	 //on keyup, start the countdown
	 a.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 a.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	//on keyup, start the countdown
	 b.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping1, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 b.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	//on keyup, start the countdown
	 c.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping1, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 c.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	//on keyup, start the countdown
	 d.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping2, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 d.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	//on keyup, start the countdown
	 e.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping2, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 e.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	 

	 //user is "finished typing," do something

	 var srch;
	 var srch2;
	 var srch3;
	 var srch4;
	 var srch5;
	 function doneTyping () {
	 	srch = $('#finvoice').val();
	 	
	 	/* alert("finvoice = "+srch)
	 	alert("patname = "+srch2)
	 	alert("patid = "+srch3)
	 	alert("fcname = "+srch4)
	 	alert("fcid = "+srch5) */
	 	
	 	
	 	var url = "/ERP/dsalehoFilter?srch="+srch+""
	 	$('#sinvoice').find('option:gt(0)').remove();
	 	$('#sinvoice').selectpicker('refresh');
	 	
	 	var successFn = function(response){
	 		
	 		//alert("response")
	 		//Select invoice
	 		console.log("response list9a = "+response.list9a)	 
	 		 $.each(response.list9a, function(index,p) {
		 	    	
		 		   if ($("#sinvoice option[class='"+p.invoice+"']").length == 0 || $("#sinvoice option[class='"+p.invoice+"']").length == 'undefined'){
		 			  // console.log("response list2a = "+response.list2a)	 	
		 			   $('#sinvoice').append('<option class="'+p.invoice+'" data-value="'+p.autoid+'"  value="'+p.invoice+'">'+p.invoice+'</option>');
		 			  $('#sinvoice').selectpicker("refresh");
		 		   }
		 	   });
	 		 
	 		//Product name and code
	 		console.log("response list10a = "+response.list10a)	
	 	     $.each(response.list10a, function(index,p) {

	 	    	 if ($("#pname option[class='"+p.ean+"']").length == 0 || $("#pname option[class='"+p.ean+"']").length == 'undefined' || $("#ean option[class='"+p.ean+"']").length == 0 || $("#ean option[class='"+p.ean+"']").length == 'undefined'){
						console.log("response list2 = "+response.list2)	 			   
	 			   $('#pname').append('<option class="'+p.ean+'" value="'+p.ean+','+p.productName+','+p.batch+','+p.expDate+','+p.unit+','+p.unitPrice+','+p.quantity+'" data-value="'+p.pid+'">'+p.productName+'</option>');
					$('#ean').append('<option class="'+p.ean+'" value="'+p.ean+','+p.productName+','+p.batch+','+p.expDate+','+p.unit+','+p.unitPrice+','+p.quantity+'" data-value="'+p.pid+'">'+p.ean+'</option>');	 			   
	 			   $('#pname').selectpicker("refresh");
	 			  $('#ean').selectpicker("refresh");
	 		   }
	 	   });
	 	     
	 		
	 		
	 		//}
	    }
	    var errorFn = function(e){
	 	           alert('Error: ' + e);
	 	           }
	 	
	     filterAjax(srch,url,successFn,errorFn)
	 }
	 
	 
	 function doneTyping1 () {

		 srch2 = $('#patname').val();
		 	srch3 = $('#patid').val();
		 	
		 	var url = "/ERP/dsalehoFilter?srch2="+srch2+"&srch3="+srch3+""
		
		 	 $('#pname').find('option:gt(0)').remove();
		 	$('#pname').selectpicker('refresh');
		 	$('#ean').find('option:gt(0)').remove();
		 	$('#ean').selectpicker('refresh');		
		 	
		 	var successFn = function(response){
		 	
		 		//Product name and code
		 		console.log("response list10a = "+response.list10a)	
		 	     $.each(response.list10a, function(index,p) {
		 	    	if ($("#pname option[class='"+p.prc+"']").length == 0 || $("#pname option[class='"+p.prc+"']").length == 'undefined' || $("#ean option[class='"+p.prc+"']").length == 0 || $("#ean option[class='"+p.prc+"']").length == 'undefined'){
						console.log("response list2 = "+response.list2)	 			   
	 			       $('#pname').append('<option class="'+p.prc+'" value="'+p.pid+'" data-value="'+p.pid+'">'+p.name+'</option>');
					   $('#ean').append('<option class="'+p.prc+'" value="'+p.pid+'" data-value="'+p.pid+'">'+p.prc+'</option>'); 
					   $('#pname').selectpicker("refresh");
		 			   $('#ean').selectpicker("refresh");
		 		   }
		 	   });
		 	     
		    }
		    var errorFn = function(e){
		 	           alert('Error: ' + e);
		 	           }
		 	
		     filterAjax2(srch2,srch3,url,successFn,errorFn)
		 
	 }
	 
	 function doneTyping2 () {

		 srch4 = $('#fcname').val();
		 	srch5 = $('#fcid').val();
		 	
		 	var url = "/ERP/dsalehoFilter?srch4="+srch4+"&srch5="+srch5+""
		
		 	$('#name').find('option:gt(0)').remove();
		 	$('#name').selectpicker('refresh');
		 	$('#customer').find('option:gt(0)').remove();
		 	$('#customer').selectpicker('refresh');		
		 	
		 	var successFn = function(response){
		 	
		 		//Product name and code
		 		//if($('input[type=checkbox]').prop('checked')){
		 		console.log("response list11a = "+response.list11a)	 
		 	   $.each(response.list11a, function(index,p) {
		 	    	//$(response.lista).hide();
		 		   if ($("#name option[class='"+p.allocationid+"']").length == 0 || $("#name option[class='"+p.allocationid+"']").length == 'undefined' || $("#customer option[class='"+p.allocationid+"']").length == 0 || $("#customer option[class='"+p.allocationid+"']").length == 'undefined'){
		 			  // console.log("response list2a = "+response.list2a)	 	
		 			    $('#name').append('<option class="pat" value="'+p.pid+'" data-value="'+p.pid+','+p.fname+','+p.mobile+','+p.gender+','+p.age+','+p.dob+'">'+p.fname+'</option>');
		 			    $('#customer').append('<option class="pat" value="'+p.pid+'" data-value="'+p.pid+','+p.fname+','+p.mobile+','+p.gender+','+p.age+','+p.dob+'">'+p.pid+'</option>');
		 			    $('#name').selectpicker("refresh");
		 			  	$('#customer').selectpicker("refresh");
		 		   }
		 	   });
		 	     
		    }
		    var errorFn = function(e){
		 	           alert('Error: ' + e);
		 	           }
		 	
		     filterAjax2(srch4,srch5,url,successFn,errorFn)
		 
	 }
	 
	 
}
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginRight = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginRight= "0";
    document.body.style.backgroundColor = "white";
}
function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
var x = document.getElementById('myTable').getElementsByTagName('tbody')[0];

   document.getElementById("totalItems").value=x.rows.length;
   // document.getElementById("subTotal").value=x;
//   highlightDuplicates() 
   }
   
function disp(){
	
	if(document.getElementById("sinvoice").value == "Select" ){
		alert("Please select the Invoice")
		return false;
	}
	$(".ft").hide();
	$("#ch").text("Sales Invoice");
	//$("#chbox").next("span").andSelf().hide(); 
	$('.table-responsive').removeClass('table-responsive');
	$("#myTable th:eq(13), #myTable td:last-child").hide();
	$("#myTable th:eq(0), #myTable td:nth-child(1)").show();
	$("#myTable th:eq(1), #myTable td:nth-child(2)").hide();
	$("#myTable th:eq(4), #myTable td:nth-child(5)").hide();
	$("#myTable th:eq(6), #myTable td:nth-child(7)").hide();
	$("#myTable th:eq(7), #myTable td:nth-child(8)").hide();
	$("#myTable th:eq(8), #myTable td:nth-child(9)").hide();
	$("#myTable th:eq(10), #myTable td:nth-child(11)").hide();

	document.getElementById("addbt").style.display = "none";
	//document.getElementById("pr").style.display = "block";
	document.getElementById("gtot").style.visibility = "hidden";
	document.getElementById("bouton-contact").style.visibility = "hidden";
	document.getElementById("close").style.display = "none";
	document.getElementById("hiden").style.display = "none";
	//document.getElementById("di").style.display = "none";
	window.print();
	
	$(".ft").show();
	$("#ch").text("Sales");	
//	$("#chbox").next("span").andSelf().show(); 
	$('.table-responsive').addClass('table-responsive');
	document.getElementById("addbt").style.display = "block";
	document.getElementById("gtot").style.visibility = "visible";
	document.getElementById("bouton-contact").style.visibility = "visible";
	document.getElementById("close").style.display = "block";
	document.getElementById("hiden").style.display = "block";
	//document.getElementById("pr").style.display = "block";
	 $("#myTable th:eq(0), #myTable td:nth-child(1)").hide();
	 $("#myTable th:eq(1), #myTable td:nth-child(2)").show();
	 $("#myTable th:eq(4), #myTable td:nth-child(5)").show();
	 $("#myTable th:eq(6), #myTable td:nth-child(7)").show();
	 $("#myTable th:eq(7), #myTable td:nth-child(8)").show();
	 $("#myTable th:eq(8), #myTable td:nth-child(9)").show();
	 $("#myTable th:eq(10), #myTable td:nth-child(11)").show();
	$("#myTable th:eq(13), #myTable td:last-child").show();
//	document.getElementById("di").style.display = "block";
}

function check(){
	
	
   //	alert(id);
		id = 1;
		var str1 = "DPHIN-";
	    var m = moment().format("DDMMYYYY");
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);

	//	alert(res1);
		document.getElementById("invoice").value = res;

	
      
		//alert(res1);
	
}

function getSum(result){
	document.getElementById("subTotal").value = result;
	document.getElementById("sub").value = result;
}
function getSum1(result,x){
	var y = document.getElementById("sub").value;
	//alert(result);
	//alert(y);
	
	document.getElementById("subTotal").value = Number(y) + Number(result);
}

function caluclate(qty,stks,total){
    var arr = [];
	//alert(qty);
	//alert(stks);
	//alert(total);
    var cnt = document.getElementById(qty).value;
    //alert(cnt);
	var gtStock = document.getElementById("stkHd").value;
	//alert(gtStock);
	var res = gtStock - cnt;
	//alert(res);
	document.getElementById(stks).value = res;
	var x = document.getElementById("upSale").value;
	//alert(x);
    var result = cnt * x;
   
	document.getElementById(total).value = result;
	
	var x = document.getElementById("myTable").rows.length-1;
	//alert(x);
	if(x == 1){
		
	getSum(result);
	}
	else{
		getSum1(result,cnt);
	}
	
	 
}


function verifyproAdd(){
	
	//var x = ;
	//var x1 =document.getElementById("saleCustId").value;
	//var x2 = document.getElementById("saleCustName").value;
	//var x3 = document.getElementById("saleCustPhone").value;
	//var x4 = document.getElementByName("quantity").value;
	
	var x5 = document.getElementsByClassName("quantitysold");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Quantity sold cannot be equal to 0")
			return false;
		}
	}
	
	var x5 = document.getElementsByClassName("totalquantity");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Selling Pack Size cannot be zero")
			return false;
		}
	}

	
	
	var x5 = document.getElementsByClassName("spsize");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Selling Pack Size cannot be 0")
			return false;
		}
	}

	var x5 = document.getElementsByClassName("unitsellingprice");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Unit SP should have a valid value")
			return false;
		}
	}

	if((document.getElementById("myTable").rows.length-1) == 0 )
	{
		alert("No products added.")
	   return false;
	}
	
   
    
	else{
  totalIt()
		return true;
	}
	
    
}

function verifyproAdd1(){
	var x = document.getElementById("myTable").rows.length-1;
	 if((document.getElementById("gTotal").value) == 0)  {
			alert("Please click on Generate Total button to calculate total"); 
		return false;
		  }
	 else if(x == 0){
		 alert("No products added")
		 return false;
	 }
	 doAjaxSave('saveSales');
}

function doAjaxSave(id){
	
	var formattr =  $('#saveSales').attr('action')
	$.ajax({
   	  
		 type: $('#'+id).attr('method'),
	     url :  $('#'+id).attr('action'),
	     async : false,
	    data: $('#'+id).serialize(),
          
          success: function(response){
       	if(response.toString() != "Success") {
       		
      	  alert("Data Saved Successfully")
      	 // $('#saveSales').attr('action','usaleho2.html')
          }
      
       	console.log("response = "+response)

        	$('#sinvoice').find('option:gt(0)').remove();
		$('#sinvoice').selectpicker('refresh'); 
		
		$('#sinvoice').append('<option class='+response+' value='+response+' selected>'+response+' </option>')
        $('#sinvoice').selectpicker('refresh');
      	  unsaved = false;
          },
          error: function(e){
       	  
       	           alert('Error: ' + e);
       	  
       	           }
       	           });
	
}


function getCount(){
	var x = document.getElementById("myTable").rows.length-1;
    document.getElementById("totalItems").value=x;
    
  //  document.getElementById("invoiceDate").valueAsDate = new Date();
  
}
/*
function copyCustId(id,name,phone,sex,age,dId,dname,dphone){
	
	alert(dId);
	
	document.getElementById("customer").value=id;
	alert(id);
	document.getElementById("phone").value = phone;
	document.getElementById("name").value = name;
	document.getElementById("sex").value = sex;
	document.getElementById("age").value = age;
	
	document.getElementById("saleCustId").value=dId;
	alert(dId);
	
	document.getElementById("saleCustName").value = dname;
    alert(dname);
	document.getElementById("saleCustPhone").value =dphone;
    alert(dphone);

}

function copyCustName(id,name,phone,sex,age){
	document.getElementById("customer").value=id;
	document.getElementById("phone").value = phone;
	document.getElementById("name").value = name;
	document.getElementById("sex").value = sex;
	document.getElementById("age").value = age;
}

function copyCustPhone(id,name,phone,sex,age){
	document.getElementById("customer").value=id;
	document.getElementById("phone").value = phone;
	document.getElementById("name").value = name;
	document.getElementById("sex").value = sex;
	document.getElementById("age").value = age;
}
*/
function addcid(customerobj){

       $("#cid").val($(customerobj).val());
	   var str = $(customerobj).attr("data-value");
	   var strSplit = str.split(',');
	  
		document.getElementById("phone").value = str;
		document.getElementById("name").value = str;
		document.getElementById("sex").value = strSplit[3];
		document.getElementById("age").value = strSplit[4];
		
		document.getElementById("saleCustId").value=strSplit[0];
		
		document.getElementById("saleCustName").value = strSplit[1];
	   
		document.getElementById("saleCustPhone").value =strSplit[2];
	 
		
		  
		   
		   $('select[name=name]').val($(customerobj).val());
		   $('#name').selectpicker('refresh');
		   
		   
     //   var res4 = $('select[name=ean]').val();
	  
		   
	       $('select[name=phone]').val($(customerobj).val());
		   $('#phone').selectpicker('refresh');
		   if(strSplit[5].includes("Fileno")){
			   $("#fileno").val(strSplit[5])
		   }
		   else{
			   
		 
		 var custDisc = strSplit[5].toLowerCase();
		 
		// alert(custDisc);
		
		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
				// alert("cust" +custDisc);
				 document.getElementById("med").value = custDisc;
				// alert("in" +document.getElementById("med").value );
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
		  }		
	 
		 }
	
}

function addcname(customerobj){
	   $("#cid").val($(customerobj).val());
	    var str = $(customerobj).attr("data-value");	  
	    var strSplit = str.split(',');
	   
		document.getElementById("phone").value = str;
		document.getElementById("customer").value = str;
		document.getElementById("sex").value = strSplit[3];
		document.getElementById("age").value = strSplit[4];
	 
		document.getElementById("saleCustId").value=strSplit[0];
		
		document.getElementById("saleCustName").value = strSplit[1];
	   
		document.getElementById("saleCustPhone").value =strSplit[2];
		
		   $('select[name=phone]').val($(customerobj).val());
		   $('#phone').selectpicker('refresh');
		   
		   $('select[name=customer]').val($(customerobj).val());
		   $('#customer').selectpicker('refresh');
		
		   if(strSplit[5].includes("Fileno")){
			   $("#fileno").val(strSplit[5])
		   }
		   else{
		var custDisc = strSplit[5].toLowerCase();
		 
	
		
		// alert(custDisc);
		

		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
			//	 alert("cust" +custDisc);
				 document.getElementById("med").value = custDisc;
			//	 alert("in" +document.getElementById("med").value );
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
		 }
	 
		// doAjaxPost(strSplit[5],str);
		 }
	
}

function addcphone(customerobj){
//	alert("code reaching here");
       $("#cid").val($(customerobj).val());
	   var str = $(customerobj).attr("data-value");
	   var strSplit = str.split(',');
	   
		document.getElementById("name").value = str;
		document.getElementById("customer").value = str;
		document.getElementById("sex").value = strSplit[3];
		document.getElementById("age").value = strSplit[4];
		
		document.getElementById("saleCustId").value=strSplit[0];
		
		document.getElementById("saleCustName").value = strSplit[1];
	    
		document.getElementById("saleCustPhone").value =strSplit[2];
	
		   $('select[name=name]').val($(customerobj).val());
		   $('#name').selectpicker('refresh');
		   
		   $('select[name=customer]').val($(customerobj).val());
		   $('#customer').selectpicker('refresh');
		   
		   if(strSplit[5].includes("Fileno")){
			   $("#fileno").val(strSplit[5])
		   }
		   else{ 
		var custDisc = strSplit[5].toLowerCase();
		 
		// alert(custDisc);
		
		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
				
				 document.getElementById("med").value = custDisc;
				
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
		 }
	 
		 }
	
	
	
}

function selectprdcode(productobj){
	
	   $('select[name=pname]').val($(productobj).val());
	   $('#pname').selectpicker('refresh');}


function add2(productobj){
	
    var res4 = $('select[name=pname]').val();
 	  // alert(res4)
	   
 	   $('select[name=ean]').val($(productobj).val());
	   $('#ean').selectpicker('refresh');
}

function calc(idx) {
	


/*
else if(document.getElementById("sk"+idx).value < document.getElementById("quantity"+idx).value ){
	alert("Sales quantity cannot exceed product stock")
	return false;
}
*/

	
	  var price = parseFloat(document.getElementById("up"+idx).value) *  parseFloat(document.getElementById("quantity"+idx).value);
	// alert(document.getElementById("stkHd").value)
	  var res =  document.getElementById("sk"+idx).value - document.getElementById("quantity"+idx).value;
	   //  alert(idx+":"+price);  
	   document.getElementById("stock"+idx).value = res;
	   
	  document.getElementById("total"+idx).value= price.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
	  
	}
	function setdefault(){
	//  document.getElementById("medicine").value = "new";
	    //alert(document.getElementById("medicine").value);
	}

var cust = [];

function checkCust(ctype,dtype,value){
	cust.push({ctype : ctype, dtype : dtype, value : value });
}

var sp =[];

function checkSp(type,value){
  
	sp.push({type : type,value : value});
	

}



	function totalIt() {
		
		$("#myTable .tbody tr").each(function(){
			
			var x=this.cells;
	      
			var qty = document.getElementById("unitSale").value;
			var spsize = document.getElementsByClassName("spsize").value;
			var up1 = document.getElementsByClassName("unitsellingprice").value;
			
			if(spsize<1){
	   			alert("Selling Pack Size cannot be equal to 0")
	   			return false;
	   		}
			
	   		if(qty<1){
	   			alert("Quantity sold cannot be equal to 0")
	   			return false;
	   		}	
	   		
	   		if(up1<1){
	   			alert("Unit SP cannot be equal to 0")
	   			return false;
	   		}
			
	      if(Number(x[7].getElementsByTagName('input')[0].value) < Number(x[9].getElementsByTagName('input')[0].value))
		    {
	    	  
		       //$(this).find("td:eq(2) span").text("matched");
		      alert("Sales quantity cannot exceed product stocks for Product Name "+x[1].getElementsByTagName('input')[0].value+" and Batch no "+x[2].getElementsByTagName('input')[0].value)
		      document.getElementById("bouton-contact").disabled = true;

		      return false;
		    		    }   
		    else{
		    	  document.getElementById("bouton-contact").disabled = false;
		    return true;	  
		    }
		});
		
	var no = highlightDuplicates();
	
	if(no == 1){
		return false;
	}  
	
		
	var qtys = document.getElementsByClassName("totalprice");
	 
	  var total=0;
	  for (var i=0;i<qtys.length;i++) {
	   // calc(i);  
	   total += Number(qtys[i].value)//isNaN(price)?0:price;
	  }
	  document.getElementById("subTotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
	  
	  var tax = document.getElementById("tax").value;
	  var taxab = Number(tax/100) * Number(total.toFixed(2));
	  
	  
	  var discount = document.getElementById("cdiscount").value;
      var discountab = Number(discount/100) * Number(total.toFixed(2));
	 
	  
	  var gtotal = Number(total.toFixed(2)) + Number(taxab.toFixed(2)) - Number(discountab.toFixed(2));
	  document.getElementById("gTotal").value = gtotal.toFixed(2);
	  //product discount caluclation
	/* var sum =0;
	  var pdiscount = 0;
	  for(var i=0; i<sp.length;i++){
		  
		  if(sp[i].type= "amount"){
			  
			 pdiscount =  Number(sp[i].value);
	//		  document.getElementById("disc").value = pdiscount;
		  
			//  ptax = Number(document.getElementById("subTotal").value) - Number(sp[i].value);
		  
			  
		  }
		  else{
			  var ptotal = Number(document.getElementById("subTotal").value) * (Number(sp[i].value)/100);
				pdiscount = Number(ptotal);
		//		 document.getElementById("disc").value = pdiscount; 
				//	ptax = document.getElementById("subTotal").value - Number(ptotal);	
				
		  }
		      sum = Number(sum) + Number(pdiscount);  
		    //  alert("sum" + sum);
	  }
	  
	  //cust Disc ccaluclation
      var subTax = 0;
	  var cdiscount =0;
	  for(var i=0;i<cust.length;i++){
	
		if(document.getElementById("med").value == cust[i].ctype){
		//	 alert(cust[i].dtype);
			if(cust[i].dtype == "Amount"){
				
				cdiscount= Number(cust[i].value);
			//	document.getElementById("disc").value = cdiscount;
				//	subTax =	parseFloat(ptax) - (parseFloat(cust[i].value));
			}
			else{
			
				var subtotal = Number(document.getElementById("subTotal").value) * (Number(cust[i].value)/100);
				
				 cdiscount = Number(subtotal);
			//	 document.getElementById("disc").value = cdiscount;
				 
				
			   // subTax = ptax - (parseFloat(subtotal));	
			}
		}  
	  }
	  
	  document.getElementById("disc").value = Number(cdiscount) + Number(sum);
	  
	  var sum =0;	
	  for(var i =0; i<nam.length;i++){
		  
		  sum = Number(sum) + Number(nam[i].per);
		  
	  }
	
	 
	  var arr1 = sum/100;
	 
	//  alert("arr1" + arr1);
	  arr = Number(arr1) * Number(total);
	  //alert("arr"+arr);
	/*  
	  var x = document.getElementsByName("addtax");
	  for(var i = 0;i<x.length;i++){
		  alert(x.length);
		  x[i].id = per; 
	  }
	 */
	 /*	  for(var i =0; i<nam.length;i++){
		  var per = Number(nam[i].per)/100;
		  var name = 0;
		  var x = document.getElementById("myTable").rows.length-1;
		  
		  
		  
		  document.getElementById(nam[i].name).value = per;  
	  
	  }
	*/
//	  document.getElementById("gTotal").value  = Number(arr) + Number(document.getElementById("subTotal").value) -Number(pdiscount)- Number(cdiscount);
	  
	 
	  
	}      

	var nam = [];	
	
	
	function totalIt1(name,per){
		
		nam.push({name : name, per : per});
		
	}
	
	function date(){
		 document.getElementById("invoicedate").valueAsDate = new Date();
		 $("#myTable th:eq(0), #myTable td:nth-child(1)").hide();
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
	

function add() {
//alert()
    var row = 1;
 
    var textean = document.getElementById("eanHd").value;
    var text = document.getElementById("pnameHd").value;
    var text1 = document.getElementById("batchHd").value;
    var text2 = document.getElementById("expHd").value;
    var text2a = document.getElementById("uHd").value
    var text3 = document.getElementById("upHd").value;
    //var text5 = document.getElementById("freeHd").value;
    var text4 = document.getElementById("stkHd").value;
  //if (text4 < 10){
    //	alert("no stock");
   // }
   // else{
	   
	 
    for(var x=0; x<row; x++) {
    	
    	var stks= Math.random().toString(36).substr(2, 10);
 	  
 	   var qty = Math.random().toString(36).substr(4, 10);
 	  
 	   
 	  var total = Math.random().toString(36).substr(5, 10);
	
 	var un =  Math.random().toString(36).substr(3, 10);
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody1')[0];
    var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
  
    	getCount();
          
           var idx = document.getElementById("myTable").rows.length-1;
           var quantity =  "quantity"+idx;
           
          
           var stks = "stock"+idx;
           
           var total = "total" + idx;
           
           var unitp = "up" + idx;
         
        var newCell = rowsAdd.insertCell();
       
        newCell.innerHTML="<tr><td ><input form ='saveSales' class='form-control input-sm' readonly = 'readonly' type='text' id = 'productSale' name= 'pname' value = '"+text+"'required> </td></tr>";
        newCell.style.width ='310px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input form ='saveSales'  class='form-control input-sm' readonly = 'readonly' type='text' id = 'batchSale' name= 'batch' value = '"+text1+"'></td></tr>";
        newCell.style.width ='100px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='text' id = 'expSale' name= 'expDate' value = '"+text2+"'></td></tr>";
        newCell.style.width ='150px';

        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input  form ='saveSales' type='text' class='form-control input-sm' name= 'unit' id = 'unitSale' value= "+text2a+"></td></tr>";
        newCell.style.width ='100px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' required onkeypress='return onlyNos(event,this);' class='form-control input-sm' type='number' min='1' value='0' id = '"+unitp+"' name= 'unitprice' value = '"+text3+"'></td></tr>";
        newCell.style.width ='90px'; 
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form='saveSales'  onkeypress='return onlyNos(event,this);' class='form-control input-sm' type='number' min='1' style='width: 100px;' id = '"+quantity+"'  name='quantity'  oninput = calc('"+idx+"),totalIt()  value = '0' required ></td></tr>";
        newCell.style.width ='100px';
        
       // newCell = rowsAdd.insertCell();
       // newCell.innerHTML="<tr><td><input form ='saveSales' type='text' style='width: 100px;' id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
       // newCell.style.width ='90px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' required class='form-control input-sm'readonly = 'readonly' type='text' id = '"+stks+"' name='stk[]'  value = '"+text4+"'></td></tr>";
        newCell.style.width ='90px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td ><input  class='form-control input-sm' required form ='saveSales' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0'></td></tr>";
        newCell.style.width ='90px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><span class='fa'><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i></span></td></tr>";
        newCell.style.width ='50px';
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
//}
    }
    
}  
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/ERP/dsaleho.html";
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
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        
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

function auto_grow(element) {
	
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}
	
	

</script>
<script>
var a1 = 0;
var a2 = 0;
function highlightDuplicates() {
 $('#myTable .tbody tr').each(function(index1){
          var row = $(this)
          var row_val1 = row.find("td:nth-child(2) input").val()
          var row_val2 = row.find("td:nth-child(3) input").val()
        
          $('#myTable .tbody tr').each(function(index2){
              
             var compare_row = $(this)
             var compare_row_val1 = compare_row.find("td:nth-child(2) input").val()
             var compare_row_val2 = compare_row.find("td:nth-child(3) input").val()
        
             if(index1!=index2 && row_val1==compare_row_val1 && row_val2==compare_row_val2){
            	
                row.addClass('duplicate')
                compare_row.addClass('duplicate')
             }
             else{
            	 if(row.hasClass('duplicate')){
            		 row.removeClass('duplicate')
            	 }
            	 if(compare_row.hasClass('duplicate')){
            		 compare_row.removeClass('duplicate')
            	 }
             }
          })
       })
       
       if($('tr.duplicate').length>0){
          alert('Duplicates found for same product name and batch.Please remove  the duplicate products')
          return 1;
       }else{
    	   return 0;
       }
       

    // loop over all input fields in table
    /*
    $('#myTable td:nth-child(2)').find('input').each(function() {
        // check if there is another one with the same value
   
        if ($('#myTable td:nth-child(2)').find('input[value="' + $(this).val() + '"]').size() > 1) {
            // highlight this
            a1+= 1;
        } 
    });
    $('#myTable td:nth-child(3)').find('input').each(function() {
        if ($('#myTable td:nth-child(3)').find('input[value="' + $(this).val() + '"]').size() > 1) {
            // highlight this
               a2+= 1;
        } 
        
    });
    */
}


</script>
<script>
 function doAjaxPost(user2) {
    	   // get the form values

    	      //  var name = $('#pname').val();
        
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/ERP/dgetinvoice.html",
	          data: "invoice=" + user2,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	       //    alert(response);
	        	   $.each(response.list2, function(index, datec) {
	                   //to print name of employee
	                 
	                   if ($("#ean option[value="+datec.invoicedate+"]").length == 0){
	               
	                	   $("#ean").append('<option value="'+datec.ean+','+datec.productName+'">'+datec.ean+'</option>');
	                   
	                   $("#ean").selectpicker("refresh");
	                   }
	                   
	                   if ($("#pname option[value="+datec.productName+"]").length == 0){
	    	               
	                	   $("#pname").append('<option value="'+datec.ean+','+datec.productName+'">'+datec.productName+'</option>');
	                   
	                   $("#pname").selectpicker("refresh");
	                   }

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
    	  
    	        	        }
 </script>
<script>
       function doAjaxPost1() {
    	   // get the form values

    	      //  var name = $('#pname').val();
    	    var userean = document.getElementById("eanHd").value;
    	    var naming = $('#pnameHd').val();
       if(document.getElementById("pname").value == "new"){
    	   alert("Please select products")
    	   return false;
       }
       var user3 = $('select[name="pname"] :selected').attr('data-value');
     
       $('select[name=ean]').val("new");
       $('#ean').selectpicker('refresh');	
   	 		   
   	   $('select[name=pname]').val("new");
       $('#pname').selectpicker('refresh');	
       $.ajax({
         	  
	           type: "GET",
	   
	           url: "/ERP/dgetinvprds.html",
	          data: "pid=" + user3,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	            
	        	   if(response.length == 0){
	        		   alert("Product cannot be added. No Stock");
	        	   }
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	       var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
           var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
      
    	getCount();
    	   var arraycnt = tableRef.rows.length -1;
           var idx = document.getElementById("myTable").rows.length-1;
           var quantity =  "quantity"+idx;
           
          
           var stks = "stock"+idx;
           
           var total = "total" + idx;
           
           var unitp = "up" + idx;
           
           var sk = "sk"+idx;
          
         /*if(datec.unitprice == 0){
        	 datec.unitprice = Number(datec.free) + (Number(datec.free)*(0.7));
         }*/
           
         var newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input type = 'text' class='form-control input-sm' form ='saveSales' readonly = 'readonly' name = 'saledetailsList["+arraycnt+"].product.prc' id='eans' value='"+datec.code+"'></td></tr>";
           
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm' readonly = 'readonly' type='text' id = 'productSale' name= 'saledetailsList["+arraycnt+"].product.name' value = '"+datec.name+"'required><input type='hidden' name='saledetailsList["+arraycnt+"].product.pid' id='pid' form ='saveSales' value='"+datec.pid+"'></td></tr>";
         
         
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td class = 'pc'><input form ='saveSales'  class='form-control input-sm' readonly = 'readonly' type='text' id = 'batchSale' name= 'saledetailsList["+arraycnt+"].batch' value = '"+datec.batch+"'></td></tr>";
       
         
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='date' id = 'expSale' name= 'saledetailsList["+arraycnt+"].expirydate' value = '"+moment(datec.expirydate).format('YYYY-MM-DD')+"'></td></tr>";
         

         // sales pack desc
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td class = 'pc'><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spack' name='saledetailsList["+arraycnt+"].spack' required value ='"+datec.spdesc+"' required></td></tr>";
         
    // single pack size
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input class='form-control input-sm spsize' form='saveSales' onkeypress='return onlyNos(event,this);'   type='number' min='1' id = 'spsize' name='saledetailsList["+arraycnt+"].spsize' value = '"+datec.spsize+"' required></td></tr>";
         
  
         //single unit pack size
         
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input class='form-control input-sm ' form ='saveSales'  type='text' id = 'sudesc'   name= 'saledetailsList["+arraycnt+"].sudesc' required value = '"+datec.sudesc+"' ></td></tr>";
        
         // current stock
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input form ='saveSales'  class='form-control input-sm'readonly = 'readonly' type='text' id = '"+stks+"' name='stk[]'  value = '"+datec.currentstock+"'></td></tr>";
        
         //quantity sold
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td class = 'pc'><input onkeypress='return onlyNos(event,this);' form ='saveSales' type='number' min='1' class='form-control input-sm quantitysold' name= 'saledetailsList["+arraycnt+"].quantitysold' id = 'unitSale' value= '0'></td></tr>";
        
         //tot quantity in single unit  
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><input form='saveSales'  class='form-control input-sm totalquantity' type='text' readonly style='width: 100px;' id = '"+quantity+"'  name='saledetailsList["+arraycnt+"].totalquantity' value = '0' ></td></tr>";
      
         
         
         //unit sp 
       
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td class='pc'><input form ='saveSales' onkeypress='return onlyNos1(event,this);' class='form-control input-sm unitsellingprice' type='text' id = '"+unitp+"' name= 'saledetailsList["+arraycnt+"].unitprice' required value = '"+Number(datec.sp).toFixed(2)+"'></td></tr>";
        
        
        // newCell = rowsAdd.insertCell();
        // newCell.innerHTML="<tr><td><input form ='saveSales' type='text' style='width: 100px;' id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
        // newCell.style.width ='90px';
         
         //price
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td ><input  class='form-control input-sm totalprice' form ='saveSales' readonly = 'readonly' type='text' id = '"+total+"'  name='saledetailsList["+arraycnt+"].total'  value = '0'></td></tr>";
         
         
         newCell = rowsAdd.insertCell();
         newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i><input type='hidden' id='"+sk+"' value='"+Number(datec.quantity)+"'></td></tr>";
         
                
         
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
//}
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
       
  
	        	        	   
    	        	        }


      

       
       
       </script>
  
     <script>
     function doAjaxPost3(invoiceobj) {
  	   // get the form values
   var invoicevalue = $(invoiceobj).attr("data-value");	   
  if($(invoiceobj).val() == "Select"){
	  location.href = "dsaleho.html"
	}
  else{
  	      //  var name = $('#pname').val();
    // var user3 = document.getElementById("sinvoice").value;
 $("#fileno").val('')
 
 var url = "/ERP/reports/dsalesReport?autoid="+invoicevalue+"" ;
 var element = document.getElementById('close');
 element.setAttribute("href",url)
    $.ajax({
       	  
	           type: "GET",
	   
	           url: "/ERP/dgtinvoice.html",
	          data: {
                 "autoid":invoicevalue 
		      },
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	       var jsonoutput = response[0];
	       console.log(jsonoutput)
	       $("#fileno").val(jsonoutput.fileno)
  	  // document.getElementById("chbox").disabled = true;
document.getElementById("invoicedate").value =moment(jsonoutput.invoicedate).format('YYYY-MM-DD');

//document.getElementById("author").value = datec.author;
document.getElementById("sex").value  = jsonoutput.customer.sex ;
document.getElementById("age").value = jsonoutput.customer.age;

document.getElementById("totalItems").value = jsonoutput.titems;

document.getElementById("subTotal").value = jsonoutput.subt;
document.getElementById("cdiscount").value = jsonoutput.cdiscount;
document.getElementById("tax").value = jsonoutput.tax;
document.getElementById("gTotal").value = jsonoutput.gtotal;
document.getElementById("cdiscount").value = jsonoutput.cdiscount;

$("#customer").append('<option value="'+jsonoutput.customer.cid+'" selected="">'+jsonoutput.customer.customer+'</option>');
$("#customer").selectpicker("refresh");

$("#name").append('<option value="'+jsonoutput.customer.cid+'" selected="">'+jsonoutput.customer.name+'</option>');
$("#name").selectpicker("refresh");

$("#phone").append('<option value="'+jsonoutput.customer.cid+'" selected="">'+jsonoutput.customer.phone+'</option>');
$("#phone").selectpicker("refresh");

document.getElementById('bouton-contact').disabled = true;
document.getElementById('customer').disabled = true;
document.getElementById('name').disabled = true;
document.getElementById('phone').disabled = true;
document.getElementById('ean').disabled = true;
document.getElementById('pname').disabled = true;
document.getElementById('addbt').disabled = true;
document.getElementById('gtot').disabled = true;
$('#tax').prop('readonly',true)

	     
	     $("#myTable tbody tr").remove();
	    $.each(jsonoutput.saledetailsList, function(index, datec) {
	        		                 //to print name of employee
	       var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
   //      var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
     
  	//getCount();
       
         var idx = document.getElementById("myTable").rows.length;
         var quantity =  "quantity"+idx;
         
        var pr = "productSale"+idx;
     
        var stks = "stock"+idx;
         
         var total = "total" + idx;
         
         var unitp = "up" + idx;
         
         var sk = "sk"+idx;
      	        	   
	        	   var markup = "<tr><td class='pc'>"+idx+"</td><td class='pc'><input type = 'text' class='form-control input-sm' form ='saveSales' disabled name = 'ean' id='eans' value='"+datec.product.prc+"'></td><td><textarea rows='1' cols='30' form ='saveSales' disabled class='form-control input-sm' id = '"+pr+"' name= 'pname' value = '"+datec.product.name+"' oninput='auto_grow(this)' required>"+datec.product.name+"</textarea></td><td class='pc'><input form ='saveSales'  class='form-control input-sm' disabled type='text' id = 'batchSale' name= 'batch' value = '"+datec.batch+"'></td><td class='pc'><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='date' id = 'expSale' name= 'expDate' value = '"+moment(datec.expirydate).format('YYYY-MM-DD')+"'></td><td><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spack' name='spack' disabled required value ='"+datec.spack+"' required></td><td class='pc'><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spsize' name='spsize' disabled value = '"+datec.spsize+"' required></td><td class='pc'><input class='form-control input-sm ' form ='saveSales'  type='text' id = 'sudesc'   name= 'sudesc' disabled required value = '"+datec.sudesc+"' ></td><td class='pc'><input form ='saveSales'  class='form-control input-sm' disabled type='text' id = '"+stks+"' name='stk[]'  value = '"+datec.stock+"'></td><td><input  form ='saveSales' type='text' class='form-control input-sm' disabled name= 'unit' id = 'unitSale' value= "+datec.quantitysold+"></td><td><input form='saveSales'  class='form-control input-sm' type='number'  id = '"+quantity+"'  name='qty[]' name='quantity' value='"+datec.totalquantity+"'disabled ></td><td class='pc'><input form ='saveSales' onkeypress='return onlyNos(event,this);' disabled class='form-control input-sm' type='text' id = '"+unitp+"' name= 'unitprice' value = '"+datec.unitprice+"'></td><td class='pc'><input  class='form-control input-sm' form ='saveSales' disabled type='text' id = '"+total+"'  name='price[]'  value = '"+datec.total+"'></td><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i><input type='hidden' id='"+sk+"' value='"+datec.quantity+"'></td></tr>";
      $('#myTable .tbody').append(markup);   
  
      $("#myTable th:eq(0), #myTable td:nth-child(1)").hide();
      document.getElementById(pr).oninput();
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
  	        	        }
$(document).on('change', ':input', function(){ //triggers change in all input fields including text type
	  
	unsaved = false;
});

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
   
   $(function () {
	   
	   var m,n,g;
	  
	    $('#myTable').on('focusout','.tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	        var a = x[5].getElementsByTagName('input')[0].value;
	        var b = x[8].getElementsByTagName('input')[0].value;
	        if(x[10].getElementsByTagName('input')[0].value == ""){
	        	$('#sp').text("Unit SP should have a valid value")
	        }
	        else{
	        	$('#sp').text("")
	        
	        }
	        x[9].getElementsByTagName('input')[0].value = (Number(a) * Number(b)).toFixed(0);
	        x[11].getElementsByTagName('input')[0].value =   Number(x[9].getElementsByTagName('input')[0].value) * Number(x[10].getElementsByTagName('input')[0].value);
	       
	    });
	
	    
   });
   
   function goBack() {
	    window.history.back();
	}
		
   function disppat(){
	   $(".sp").val($(".sp option:first").val());
	   
	   $("#age").val('');
	   $("#sex").val('');
	   $("#fileno").val('');
	   
	  /* if(document.getElementById("chbox").checked == true){
	   $('#customer').find('.cust').hide();
	   $('#customer').selectpicker('refresh');
	   $('#name').find('.cust').hide();
	   $('#name').selectpicker('refresh');
	   $('#phone').find('.cust').hide();
	   $('#phone').selectpicker('refresh');
	   
	   $('#customer').find('.pat').show();
	   $('#customer').selectpicker('refresh');
	   $('#name').find('.pat').show();
	   $('#name').selectpicker('refresh');
	   $('#phone').find('.pat').show();
	   $('#phone').selectpicker('refresh');
	   }
	   
	   else{
		   
	
		   $('#customer').find('.pat').hide();
		   $('#customer').selectpicker('refresh');
		   $('#name').find('.pat').hide();
		   $('#name').selectpicker('refresh');
		   $('#phone').find('.pat').hide();
		   $('#phone').selectpicker('refresh');
		   
		   $('#customer').find('.cust').show();
		   $('#customer').selectpicker('refresh');	   
		   $('#name').find('.cust').show();
		   $('#name').selectpicker('refresh');
		   $('#phone').find('.cust').show();
		   $('#phone').selectpicker('refresh');	   
		   
		   
	   }*/
   }
   
   function chid(id){
	   if($('#sinvoice').val() == "Select"){
		   alert("Please select Invoice Id from 'Select Invoice' dropdown")
		   return false;
	   }
	   else{
		   return true;
	   }
   }
   </script>  
   
 <script>
     
     var addpe;
  		
     $( function() {
  		  $( "#vpv" ).dialog({
  		      
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
  		  
  		var fileno;
		  	var str;
		  	var strSplit;
		  	var strSplit2;
  		    $('#viewpr').on( 'click',function() {
  		    	
  		    	if($('#name').val() == 'New')
		    		{
		    		alert("Please select Customer Name or Id")
		    		return false;
		    		}
  		    	
  		    	fileno = $('#fileno').val();
  		    	str = document.getElementById("name").value;
  			   strSplit = str.split(',');
  			 strSplit2=strSplit[0];

  			 doAjaxPost(fileno,strSplit2)
  		    
  			/*  var isOpen = $( "#vpv" ).dialog( "isOpen" );

  		    	if(isOpen == true){
  		    	  
  		    	  $( "#vpv" ).dialog( "open" );
  		      }
  		      else{
  		    
  		    	 $( "#vpv" ).dialog( "open" );
  		      } */
  		    
  		    });
  		  $('#vpv').dialog({height: 300, width:1000 });
  		    $(".ui-dialog").find(".ui-widget-header").css("background", "linear-gradient(to right, rgb(36,51,138), rgb(17,142,191))","text-align","center");
	  });
     
     
         
      function doAjaxPost(fileno,pid) {

  	   $("#myTable3 .tbody2 tr").remove();
  	  var counter = 1;
  	             $.ajax({
  	        	           type: "GET",
  	        	           url: "/ERP/prescription1/"+fileno+"/"+pid+"",
  	        	           dataType: "JSON",
  	        	           contentType: "application/json; charset=UTF-8",
  	             
  	             success: function(response){
  	            	 
  	            	 console.log("response = "+response.list5)
  	            	 
  	            	 if(response.list5.length == 0 && $('#name').val() != 'New'){
  	                  	alert("No Prescription found for this Customer")
  	                  	$( "#vpv" ).dialog( "close" );
  	                  	}
  	                        	else
  	                        	{
  	                        	var isOpen = $( "#vpv" ).dialog( "isOpen" );

  	                    	if(isOpen == true){
  	                    	 
  	                    	 $( "#vpv" ).dialog( "open" );
  	                      }
  	                      else{
  	                    
  	                    	$( "#vpv" ).dialog( "open" );
  	                      }
  	                    	
  	                        	}
  	                            
  	            	 
			   $.each(response.list5, function(index, drug) {
				  
	 var tableRef = document.getElementById('myTable3').getElementsByTagName('tbody')[0];
	var cnt = tableRef.rows.length;
	var dmc = "dm"+cnt;
	var baf = "baf"+cnt;
	var id = Math.random();  

	var markup = "<tr><td><input type='text' class='form-control input-sm'  form ='formc'   id = '"+id+"' value='"+drug.typeofdr+"' name= 'typeofdr' readonly></td><td><input  form ='formc' class= 'form-control input-sm button1' value='"+drug.drugname+"' type='text' id = '"+tableRef.rows.length+"' name= 'drugname'readonly></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.strdrug+"' type='text' id = 'strdrug' name= 'strdrug' readonly></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.dosage+"' type='text' id = 'dosage' name= 'dosage' readonly></td><td><input  form ='formc' class= 'form-control input-sm'   id = '"+dmc+"'  name= 'dm'  readonly></td><td><input  form ='formc' class= 'form-control input-sm'  type='text' id = '"+baf+"' name= 'baf' value='"+drug.baf+"'></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.totn+"' type='text' id = 'totn' name= 'totn'></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.nofdays+"' type='text' id = 'nofdays' name= 'nofdays' readonly><input  form ='formc' class= 'form-control input-sm' type='hidden' id = 'uqk22' name= 'uqk22' value='"+drug.uqk+"' readonly></td></tr>";
	$('#myTable3 .tbody2').append(markup);
	document.getElementById(dmc).value = drug.dm; 			 	   	   			 	
				   
			   });
      
      },
      error: function(e){
   	  
   	           alert('Error: ' + e);
   	  
   	           }
   	           });
   	   
   	           }

     </script>
     
      <script>
     
     function validsave(id){
    	 
    	// alert("aleritng")
    	
    	 var formattr =  $('#formc').attr('action')
      	$.ajax({
         	  
      		 type: $('#'+id).attr('method'),
      	     url :  $('#'+id).attr('action'),
      	     async : false,
      	    data: $('#'+id).serialize(),
           
           success: function(response){
        	if(response.toString() != "Success") {
        		
       	  alert("Data Saved Successfully")
           }
       
           },
           error: function(e){
        	  
        	           alert('Error: ' + e);
        	  
        	           }
        	           });     	 
     }
     
     </script>
     

</head>


<sec:authentication property="principal.authorities" var="username" />
<body onload="date(),checkhome2('<c:out value="${username}" />'),disppat()">

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
      <a class="navbar-brand" href="#">Dispensary Sales </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav">
	      <li class=""><a id="ho" href="">Home</a></li>
		      <li class="dropdown navhover" id="dr1">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Masters
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
	   <li id="mm" class="pra"> <a href="/ERP/manufactureho.html">Manufacturer Master</a></li>
       <li id="sm" class="pra"><a href="/ERP/supplierho.html">Supplier Master</a></li>
       <li class="pra"><a href="/ERP/customerho.html">Customer Master</a></li>
       <li><a href="/ERP/productho.html">Product  Master</a></li>
			    
			        </ul>
      	  </li>
      	  
      	  <li class="dropdown navhover tra"id="tra">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Transaction
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			         <li id="or"><a href="/ERP/orderho.html">Order & Reorder</a></li>
        <li id="pe"><a href="/ERP/purchaseho.html">Purchase Entry</a></li>
        <li id="sal"><a href="/ERP/saleho.html">Sales</a></li>			    
			        </ul>
      	  </li>
      	  
      	  	  <li class="dropdown navhover sta" id="sta">
    			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Stocks/Transfer
        		<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			      <li id="ps&p"><a href="/ERP/stopriceho.html">Product Stocks and Pricing</a></li>
        <li id="stktrns"><a href="/ERP/branchtransfer.html">Stocks Transfer</a></li>	    
			        </ul>
      	  </li>
      	  
      	 <!--  <li class="dropdown navhover" id="dr2">
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
       			<!-- <li id=""><a href="/ERP/incomeByDoctor.html">Income by Doctor</a></li>   -->
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

<div id="main">
 <div id="form1" >  
  
     <h1> <font id="ch" size="5">Sales </font> <span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i></span>
      <a href="#" id="close" onclick="return chid(this)" target="_blank" class="btn btn-warning button2" >Print</a>    
     
     </h1>
     
   <div class="form-group row" style="display:none">
 <div class="col-xs-1 col-lg-0"></div>
  <div class="col-xs-3 col-lg-4">
    <figure>
       <img id="myImg"  class="img-responsive"/>
       </figure>
  </div>
  <!-- <div class="col-xs-4 col-lg-8"></div> -->
  <div id="adbar" class="col-xs-4 col-lg-offset-3 col-lg-4" contenteditable="false">
  <h4 id="ln"><b></b></h4>
  <pre><h5 id="lb"></h5></pre>   

  
  </div>
 
</div>
     <div class = "head">
 
 
	 <form:form id="saveSales" method="post" modelAttribute="sales" action="dispsaveSales.html"></form:form>
 <form id = "searchSales" action = "dgtinvoice.html" method="post">
 </form>
  <form id = "formc" action = "dupdatepres" method="post"></form>
 <div class="container" style="margin-top: 29px;">
</div>
<br>

 

      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group finvoice">
            <p>Select Invoice :<span>*</span></p>
          <select class="selectpicker form-control"  data-dropup-auto="false" data-size="5" data-live-search="true" name = "sinvoice" id ="sinvoice"  onchange="doAjaxPost3(this.options[this.selectedIndex])"  required>
    <option value="Select">New</option>
       <c:forEach var="q"  items="${model.list9}">
       <option class="${q.invoice}" value="${q.invoice}" data-value="${q.autoid}">${q.invoice}</option>
       </c:forEach>
</select>
      <input readonly = "readonly" type = "hidden" class="form-control input-sm"  name="invoice" id="invoice" form="saveSales" >
<!-- <input type="hidden" id = "invoice" name="invoice"  form ="saveSales">  -->
</div>

	
	      </div>

	 <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	     
         <p>Invoice Date :<span>*</span></p> 
      <input type= "date" name="invoicedate"  id = "invoicedate" class="form-control"  form ="saveSales" required>
       
       </div>
	
	      </div>
	      
       <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12"> 
  
  <div class="form-group">
  
   <p>Created By :<span>*</span></p>
<input  readonly = "readonly"  type = "text" name="createdby" id="author" value="${pageContext.request.userPrincipal.name}" class="form-control input-sm"  form ="saveSales" >
</div>
  </div>
  
  <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group">

   <p>Cust Discount(%) : <span>*</span></p>
<input  type="text" class="form-control input-sm" maxlength="3" name="cdiscount" id="cdiscount"  onkeypress='return onlyNos(event,this);' value="0" form ="saveSales" >
<input  type="hidden"  id="med" name = "med" >
     </div>
	      </div>
  
	  <div class="col-xs-2">
	 <br></br>
	<input type="hidden" id = "chbox" name="isPatient" value="true" form="saveSales"> 
	  </div>      
	  </div>
	  
	   <div class="form-group row" >
  <div class="col-xs-1"></div>
	     
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group fcid">

   <form action="sale1.html" method = "get">
            <p>Customer Id:<span></span></p>
       <select class="selectpicker form-control sp"  data-dropup-auto="false" data-size="6"  data-live-search="true" name = "customer" type="text" id ="customer" class="form-control input-sm"  onchange="addcid(this.options[this.selectedIndex])">
    <option value="New">New</option>
    <c:forEach var="sale1"  items="${model.list11}">
      <option class="pat"  value="${sale1.autoid}" data-value = "${sale1.pid},${sale1.fname},${sale1.mobile},${sale1.gender},${sale1.age},${sale1.dob}">${sale1.pid}</option>
    </c:forEach>
 </select>
 </form>
     </div>
	      </div>
	      
	       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group fcname">
	      <form action="sale1.html" method = "get">
            <p>Customer Name:<span></span></p>
   <select class="selectpicker form-control sp"  data-dropup-auto="false" data-size="6" data-live-search="true" name = "name" type="text" id ="name" class="form-control input-sm"  onchange="addcname(this.options[this.selectedIndex])">
    <option value="New">New</option>
    <c:forEach var="sale1"  items="${model.list11}">
         <option class="pat" data-subtext="${sale1.dob}" value="${sale1.autoid}" data-value = "${sale1.pid},${sale1.fname},${sale1.mobile},${sale1.gender},${sale1.age},${sale1.dob}">${sale1.fname}</option>
    </c:forEach>
 </select>
 </form>
     </div>
	      </div>
	      
	       <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	    
   <form action="sale1.html" method = "get">
 <p>Customer Phone:<span></span></p>
   <select class="selectpicker form-control sp" data-dropup-auto="false"  data-size="6" data-live-search="true" name = "phone" type="text"  id ="phone"  class="form-control input-sm"  onchange="addcphone()">
    <option value="New">New</option>
    <c:forEach var="sale1"  items="${model.list11}">
     <option class="pat"  value="${sale1.autoid}" data-value = "${sale1.pid},${sale1.fname},${sale1.mobile},${sale1.gender},${sale1.age},${sale1.dob}">${sale1.mobile}</option>
    </c:forEach>
 </select>
 </form>
      
</div>
	        
	      </div>
	      <input form ="" type = "hidden" name = "custId" id="saleCustId">
          <input form ="" type = "hidden" name = "custName" id="saleCustName">
          <input form ="" type = "hidden" name = "custPhone" id="saleCustPhone">
 <input form="saveSales" type="hidden" name="customer.cid" id="cid" value=0 />
 <input form="saveSales" type="hidden" name="autoid" id="autoid" value=0 />
 
	      <div class="col-lg-1 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	      
            <p>Gender:<span></span></p>
           <input form =""  type="text" name="gender" id="sex" class="form-control input-sm"  readonly="readonly">
 </div>
   </div>
   
  
   
  
	     
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group">

   
            <p>Age:<span></span></p>  
             <input form =""  readonly = "readonly"  class="form-control input-sm"  type ="text" name="age" id ="age">
     </div>
	   </div>  
   </div> 
   <input form="purchasesave" type="hidden" name="orderid" id="orderid">
  <input form="purchasesave" type="hidden" name="supplier" id="supplier">
	   
	     <div class="form-group row" >
  <div class="col-xs-1"></div>
	      
	      <c:forEach var="q"  items="${model.list2}">
   <script>
   checkSupply('<c:out value="${q.supplier}" />','<c:out value="${q.quantity}" />','<c:out value="${q.unit}" />','<c:out value="${q.up}" />');
   </script>
   </c:forEach>
	     
	     
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group patid">
	       
	        <p>Code(EAN):<span></span></p>
      <select class="selectpicker"  data-dropup-auto="false" data-show-subtext="true" data-size="6" data-live-search="true" name = "ean" id ="ean"  onchange="selectprdcode(this.options[this.selectedIndex])" required>
    <option value="new">New</option>
    <c:forEach var="sale"  items="${model.list10}">
    <option class="${sale.prc}" value ="${sale.pid}" data-value="${sale.pid}">${sale.prc}</option>
    </c:forEach>
    </select>
   
	       </div>
	       </div>
	       
	       
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group patname">
	       
   <p>Product:<span></span></p>
     <select class="selectpicker" data-dropup-auto="false" data-size="6" data-show-subtext="true" data-live-search="true" name = "pname" id ="pname"  onchange="add2(this.options[this.selectedIndex])" required>
      <option value="new">New</option>
  <c:forEach var="sale"  items="${model.list10}">
   <option class="${sale.name}" value="${sale.pid}" data-value="${sale.pid}">${sale.name}</option>
   
 </c:forEach>
 </select>
 </div>
	       </div>
	       
	       
	       
	       <div class="col-lg-1 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group">
	      
<br>

	       <button type="button" id="addbt" style="width:80px;" class="form-control input-sm button1 btn btn-warning"  onclick="return doAjaxPost1()"> ADD</button>
	       </div>
	       </div>



<div class="col-lg-2 col-md-12 col-xs-2 col-sm-12">
	       <div class="form-group">
	      
<br>

	       <!-- <button type="button" id="viewpr" style="width:78%;" class="form-control input-sm button1 btn btn-warning" href="prprs1" onclick="return verpr(this);">View Prescription</button> -->
	       <a class="input-sm button1 btn btn-warning btn-sm" id ="viewpr">View Prescription</a>
	       </div>
	       </div>
	         
	      <!--  <div class="col-xs-1"></div> -->
	       <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	       
   <p>File No:</p>
   <input type="text" readonly name="fileno" id="fileno" form="saveSales" class="form-control input-sm">
    </div>
    </div>
	       </div>
	       <input type="hidden" name="eanHd" id="eanHd" >       
	       <input type="hidden" name="pnameHd" id="pnameHd" >
  <input type="hidden" name="batchHd" id="batchHd" >
 <input type="hidden" name="expHd" id="expHd">
  <input type = "hidden" name= "uHd" id= "uHd">
 <input type="hidden" name="upHd" id="upHd" >

 <input type="hidden" name="freeHd" id ="freeHd">
 <input type="hidden" name="stkHd" id="stkHd">
	       <div class="container">
	   <input form="purchasesave" type="hidden" name="ean" id="ean">
    
  <div class="container" id="span2">
  	   <div class="table-responsive">   
  <table class="table table-striped table-bordered table-hover table-condensed " style="" id="myTable">
    <thead class="thead">
    <tr>
    <th id="slno">Sl No</th>
    <th>Product Code</th>
    <th>Product Name</th>
    <th class='pc'>Batch</th>
    <th>Exp Date</th>
    <th class='pc'>Selling Pack Desc</th>
    <th>Selling Pack Size</th>
     <th>Single Unit Desc</th>
    <th>Current Stock in Single Units</th>
    <th class='pc'>Qty Sold</th>
    <th>Total Quantity in Single unit</th>
   
    <th class='pc'>Unit SP</th>
    <th class='pc'>Price</th>
    <th>Delete</th>
      </tr>
    </thead>
   <tbody class="tbody">
     
    </tbody>
    
  </table>
                   
  </div>
</div>
<div class="form-group row" >
      
	 <div class="col-xs-1"></div>
	    
<div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
 <div class="form-group">
 <button type="button" class="btn btn-warning button1" id='gtot' onclick='return verifyproAdd()'>
	  <span class="fa fa-refresh fa-spin"></span> Generate Total</button></div>
	 
 </div>
	  
	  <div class="col-xs-2"></div>
	  
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
           <input type="button" form="saveSales" class="btn btn-warning button1" id='bouton-contact' value="Save" onclick="return verifyproAdd1()">
	      </div>
	  
	  </div>
	  
	   <div class="col-xs-3"></div>
	  
	   <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
  <table id="meta2" class="buuton2">
  
   <tr>
                    
                    <td  colspan="" class="total-line meta-head">Total Items</td>
		      <td style="width:10px" class="total-value"><div id="subtotal"><input form ="saveSales" class="form-control input-sm rem" value="0" readonly = "readonly" type= "text" name="titems"  id="totalItems"></div></td>
                </tr>
                <tr>
                <tr>
                    
                    <td  colspan="" class="total-line meta-head">Sub Total</td>
		      <td style="width:10px" class="total-value"><div id="subtotal"><input form ="saveSales" class="form-control input-sm rem" value="0.00" readonly = "readonly" type= "text" name="subt"  id="subTotal" ></div></td>
                </tr>
             

                    
                  
                <tr>
                    <td colspan="" class="total-line meta-head">Tax(%)</td>
		      <td class="total-value"><div id=""><input form ="saveSales" value="0" type="text" class="form-control input-sm rem" name="tax" onkeypress='return onlyNos1(event,this);' min="0"  id="tax" onmouse="alert("please click on generate total");"></div></td>
                </tr>
                <tr>
             
                <tr>
                    <td colspan="" class="total-line meta-head">Grand Total</td>

		      <td class="total-value balance"><input value="0.00" form ="saveSales"readonly = "readonly" class="form-control input-sm rem" type= "text" name="gtotal"  id="gTotal" ></td>
                </tr>
                
                  </table>
           </div>
  
   </div>
   <div class="col-xs-1"></div>
	    
<div class="col-xs-7">
 <div class="form-group" id="hiden">
	  <h7> Note: Click on "Generate Total" button each time any changes are done </h7> 
	  <p><h7 id="sp"></h7></p>       
 </div>
 </div>
	    
	  </div>
  
	  

 

 
 


  </div> 
  </div>
   
      
	      
 <input type=""  class="bouton-contact" disabled >
 
 
</div>
  </div>
 </div>
 </div>
 
 
 
 <!-- JQuery Modal -->
 
 <div id="vpv" title="Prescription">
 
  <div class="table-responsive">   
  <table class="table table-striped table-bordered table-hover table-condensed " style="" id="myTable3">
    <thead class="thead2">
    <tr>
        <th>Category of Drug</th>
        <th>Name of Drug</th>
        <th>Strength of Drug</th>
        <th>Dosage</th>
        <th>Frequency</th>
        <th>Remarks</th>
        <th>Quantity Dispensed</th>
        <th>No. of Days</th>
       
      </tr>
    </thead>
    <tbody class="tbody2">
   
    </tbody>
    </table>
    
    <div>
     <button id ="uppres" class="btn btn-warning button2" onclick="return validsave('formc');" class="form-control input-sm" >Save</button> 
    </div>
    
    </div>
</div>
 
 <!-- JQuery Modal Close --> 
 
  <c:forEach var="sp"  items="${model.list8}">
<script>
checkSp('<c:out value="${sp.spDtype}" />','<c:out value="${sp.spDvalue}" />');
</script>

 </c:forEach>
<c:forEach var="custD"  items="${model.list7}">
<script>
checkCust('<c:out value="${custD.custType}" />','<c:out value="${custD.discType}" />','<c:out value="${custD.discValue}" />');
</script>
 </c:forEach>
 <script>
 var loadadd = `<c:out value='${model.realAddress}'/>`;
 $('#ln').text('<c:out value='${model.realName}'/>')
 $('#lb').text(loadadd)
 var add = '<c:out value='${model.realLogo}'/>'
 var add1= '<c:out value='${model.realIname}'/>'
 var url = "/ERP/downlogo?location="+add+"&location1="+add1+"";
 $('#myImg').attr("src",url)
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>  
               

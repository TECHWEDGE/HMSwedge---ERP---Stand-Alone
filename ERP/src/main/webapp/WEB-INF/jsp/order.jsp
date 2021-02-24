<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
<link rel='stylesheet' href='<c:url value="/resources/css/printsaleo.css" />' type='text/css' media='print' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<%-- <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' > --%>
<link rel="stylesheet" href='<c:url value="/resources/css/navbar.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/table.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<!-- <script type="text/javascript" src="/ERP/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-datetimepicker.min.js"></script> -->
<script type="text/javascript" src="/ERP/resources/js/verifychange2.js"></script>
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

#count{
margin-left: 20px;
}

.button2 {
    margin-top: -16px;
}

.or {
    font-size: 23px;
}
.button1 {
    margin-top: -8px;
}

#addepr{

      margin-left: 134px;
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


#form1 h1 {
  font-size: 18px;
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: rgb(255, 255, 255);
  padding: 30px 16px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form1 {
  border-radius: 5px;
  max-width:1000px;
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
width : auto;
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
function goBack() {
    window.history.back();
}

var cuser;
function checkhome2(user){
	
	$('.patname .input-block-level').attr('id','patname')
	$('.patid .input-block-level').attr('id','patid')
	$('.oid .input-block-level').attr('id','oid')
	
	cuser = user;
	check()
	$('#brnli').text("Logged into : " + window.localStorage.getItem("myInfon"));
	     getCount()
	
	 if(user.includes("[ROLE_SALESMANAGER]")){
	
		var url = "/ERP/hmspharma1" ;
		
	
		
		 document.getElementById("bouton-contact").disabled = true; 
			document.getElementById("mm").style.display = "none"; 
			document.getElementById("sm").style.display = "none"; 
			document.getElementById("or").style.display = "none"; 
			document.getElementById("pe").style.display = "none"; 
		
		
			$('#dpe').hide();	
			$('#dpma').hide();
	}
	else if(user.includes("[ROLE_PHARMACIST]")){
	
		 var url = "/ERP/hmspharma" ;
			
		
		 $('#dpma').hide();	
	
		
	}
	 
	
	else{
		 var url = "/ERP/hmspharma" 
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('#dpma').hide();	
	}
	 
	 var typingTimer;                
	 var doneTypingInterval = 1000;  
	 var a = jQuery('#patname');
	 var b = jQuery('#patid');
	 var c = jQuery('#oid');

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
	   typingTimer = setTimeout(doneTyping, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 b.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	//on keyup, start the countdown
	 c.on('keyup', function () {
	   clearTimeout(typingTimer);
	   typingTimer = setTimeout(doneTyping, doneTypingInterval);
	 });

	 //on keydown, clear the countdown 
	 c.on('keydown', function () {
	   clearTimeout(typingTimer);
	 });
	 
	 

	 //user is "finished typing," do something

	 var srch;
	 var srch2;
	 var srch3;
	 function doneTyping () {
	 	srch = $('#patname').val();
	 	srch2 = $('#patid').val();
	 	srch3 = $('#oid').val();
	 	
	 //	alert("done typing")
	 	
	 	var url = "/ERP/orderhoFilter?srch="+srch+"&srch2="+srch2+"&srch3="+srch3+""
	 	$('#pname').find('option:gt(0)').remove();
	 	$('#pname').selectpicker('refresh');
	 	$('#ean1').find('option:gt(0)').remove();
	 	$('#ean1').selectpicker('refresh');
	 	$('#sinvoice').find('option:gt(0)').remove();
	 	$('#sinvoice').selectpicker('refresh');
	 		
	 	var successFn = function(response){
	 		
	 	     $.each(response.list, function(index,p) {
	 		   if ($("#pname option[class='"+p.prc+"']").length == 0 || $("#pname option[class='"+p.prc+"']").length == 'undefined' || $("#ean1 option[class='"+p.prc+"']").length == 0 || $("#ean1 option[class='"+p.prc+"']").length == 'undefined'){
						console.log("response list = "+response.list)	 			   
	 			   $('#pname').append('<option class="'+p.prc+'" value="'+p.name+'" data-value="'+p.prc+','+p.name+','+p.stocks+','+p.dps+','+p.product+'" >'+p.name+'</option>');
	 			  $('#ean1').append('<option class="'+p.prc+'" value="'+p.prc+'" data-value="'+p.prc+','+p.name+','+p.stocks+','+p.dps+','+p.product+'" >'+p.prc+'</option>');	 			   
	 			   $('#pname').selectpicker("refresh");
	 			  $('#ean1').selectpicker("refresh");
	 		   }
	 	   });
	 	     
	 	    $.each(response.list1, function(index,p) {
		 		   if ($("#sinvoice option[class='"+p.prc+"']").length == 0 || $("#sinvoice option[class='"+p.prc+"']").length == 'undefined'){
		 			  	console.log(p)	 	
		 			   $('#sinvoice').append('<option class="'+p.orderid+'" data-value="'+p.autoid+'=='+p.author+'=='+p.delivery+'=='+p.count+'=='+p.supplier+'=='+p.supplierid+'=='+p.orderDate+'" value="'+p.orderid+'">'+p.orderid+'</option>');
		 			   $('#sinvoice').selectpicker("refresh");
		 		   }
		 	   });
	 	    
	    }
	    var errorFn = function(e){
	 	           alert('Error: ' + e);
	 	           }
	 	
	     //filterAjax5(srch,srch2,srch3,srch4,srch5,url,successFn,errorFn)
	     filterAjax6(srch,srch2,srch3,url,successFn,errorFn)
	     
	 }
}

function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    var x = document.getElementById('myTable').getElementsByTagName('tbody')[0];
    document.getElementById("count").value=x.rows.length;
    
}

function check(){
	
	var n = moment().format("DD-MM-YYYY hh:mm");
	document.getElementById("orderDate").value = n;
	
	
		
		id = 1;
		var str1 = "ORD-";
		var str2 = "HO";
		var str3 = "-";
		var m = moment().format("DDMMYYYY");
		
		var str4 = id;
		var res = str1.concat(str2);
		var res1 = res.concat(str3);
		var res3 = res1.concat(m);
		var res4 = res3.concat(str4);
		
		document.getElementById("orderid").value = res3;
		

			

}

function auto_grow(element) {
	
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}

function getCount(){
	var x = document.getElementById("myTable").rows.length;
	
    document.getElementById("count").value=$("#myTable .tbody tr").length;

    
  //  document.getElementById("invoiceDate").valueAsDate = new Date();
  
}

var quanto;
var unito;
var upo;
var p;
var dps;
var prids;
function add1(getval){
	

	var myname = getval.getAttribute('data-value'); 
	  
	   var strSplit = myname.split(',');
	 
     if(strSplit[0] == "Select"){
    	 $('select[name=pname]').val('Select');
  	   $('#pname').selectpicker('refresh');
     }
     else{ 
   	   $('select[name=pname]').val(strSplit[1]);
	   $('#pname').selectpicker('refresh');
	   p = strSplit[2];
	   dps = strSplit[3];
	   prids = strSplit[4]
     }
	   
		// document.getElementById("eans").value = strSplit[0];
	       
		   
	   
		   
	   
	   
}


function add2(getval){
	
	var myname = getval.getAttribute('data-value'); 
	       var strSplit = myname.split(',');
	       if(strSplit[1] == "Select"){
	    	   $('select[name=ean1]').val('Select');
			   $('#ean1').selectpicker('refresh');
	       }
	       else{
	   	   $('select[name=ean1]').val(strSplit[0]);
		   $('#ean1').selectpicker('refresh');
		   p = strSplit[2];
		   dps = strSplit[3];
		   prids = strSplit[4];
		//   document.getElementById("eans").value = strSplit[0];
	       }
	   
	 
	
}

function calc(tid) {
	
	  
	
	idx = tid;

	 
	  
	  var price = (parseFloat(document.getElementById("unitprice"+idx).value) *  parseFloat(document.getElementById("quantity"+idx).value)) - parseFloat(document.getElementById("discount"+idx).value) + parseFloat(document.getElementById("tax"+idx).value);
	 
	
	  document.getElementById("total"+idx).value= price.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
	 
	   
	}
	function setdefault(){
	//  document.getElementById("medicine").value = "new";
	    //alert(document.getElementById("medicine").value);
	}




	function totalIt() {
	  var qtys = document.getElementsByName("qty[]");
	 
	  var total=0;
	  for (var i=1;i<=qtys.length;i++) {
	    calc(i);  
	    var price = parseFloat(document.getElementById("total"+i).value);
	    total += Number(price)//isNaN(price)?0:price;
	  }
	  document.getElementById("grandTotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
	  
	  
	  
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
	
    
  
 
    var pname = encodeURI(document.getElementById("pname").value);
    var ean = document.getElementById("ean1").value;
    var sup= document.getElementById("Supplier").value;
    if(sup=="Select"){
    	alert("Please select Supplier")
    	return false;
    }
if(pname == "Select" && ean == "Select"){
	alert("Please select the Product")
	return false;
}

    
var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];

var stop;
if($("#myTable .tbody tr").length == 0)
	{
	var markup = "<tr><td style='width:100px;'><input form ='saveo' type='hidden' name='orderdetailsid' id='orderdetailsid' value=0 /><input type='text'  class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = "+ean+" readonly required></td><td style='width:400px;'><input type='text'  form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName'  value = '"+decodeURI(pname)+"'  readonly required><input type='hidden' name='pida' id='pid' form='saveo' value='"+prids+"'></td><td style='width:160px;'><input id = 'unit' form ='saveo' type='text' name= 'unit' class='form-control input-sm' value='"+dps+"' required></td><td style='width:100px;'><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);'  id = 'quantity' name= 'quantity' min = '1' value = '0' class='form-control input-sm' required ></td><td style='width:100px;'><input type = 'text' form ='saveo'  readonly='readonly' type='text'  id = 'stks' name='stks' value="+Number(p)+" class='form-control input-sm' required></td><td style='width:70px;'><i class='fa fa-trash-o'  style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>"

	 $('#myTable tbody').append(markup);
	
	}
else{
	$("#myTable .tbody tr td:nth-child(1)").each(function(){
		var quantity=$(this).find('input').val();
		
		if(quantity == $('#ean1').val())
			{
				stop = 0;
				alert("Product already added")
				return false;
			}
		else{
			stop = 1;
		}
	});
	
}

if(stop == 1)
	{
	var markup = "<tr><td style='width:100px;'><input form ='saveo' type='hidden' name='orderdetailsid' id='orderdetailsid' value=0 /><input type='text'  class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = "+ean+" readonly required></td><td style='width:400px;'><input type='text'  form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName'  value = '"+decodeURI(pname)+"'  readonly required><input type='hidden' name='pida' id='pid' form='saveo' value='"+prids+"'></td><td style='width:160px;'><input id = 'unit' form ='saveo' type='text' name= 'unit' class='form-control input-sm' value='"+dps+"' required></td><td style='width:100px;'><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);'  id = 'quantity' name= 'quantity' min = '1' value = '0' class='form-control input-sm' required ></td><td style='width:100px;'><input type = 'text' form ='saveo'  readonly='readonly' type='text'  id = 'stks' name='stks' value="+Number(p)+" class='form-control input-sm' required></td><td style='width:70px;'><i class='fa fa-trash-o'  style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>"

	 $('#myTable tbody').append(markup);

	}


/* var stop;	

$("#myTable .tbody tr td:nth-child(2)").find('input').each(function(){

  if(this.value == decodeURI(pname)){
	  stop = "0"
  }
  else{
	  stop = "1"
  }
   		
   	 });
   	 

if(stop == "0"){
	unsaved = false;
	alert("Product already added")
	return false;
}
var markup = "<tr><td style='width:100px;'><input type='text'  class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = "+ean+" readonly required></td><td style='width:400px;'><input type='text'  form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName'  value = '"+decodeURI(pname)+"'  readonly required><input type='hidden' name='pida' id='pid' form='saveo' value='"+prids+"'></td><td style='width:160px;'><input id = 'unit' form ='saveo' type='text' name= 'unit' class='form-control input-sm' value='"+dps+"' required></td><td style='width:100px;'><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);'  id = 'quantity' name= 'quantity' min = '1' value = '0' class='form-control input-sm' required ></td><td style='width:100px;'><input type = 'text' form ='saveo'  readonly='readonly' type='text'  id = 'stks' name='stks' value="+Number(p)+" class='form-control input-sm' required></td><td style='width:70px;'><i class='fa fa-trash-o'  style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>"

 $('#myTable tbody').append(markup);


 */ 
 getCount()
 
  $('select[name=pname]').val('Select');
  $('#pname').selectpicker('refresh');
  
  $('select[name=ean1]').val('Select');
  $('#ean1').selectpicker('refresh');
/* 

    for(var x=0; x<row; x++) {
    	
    	
	
 	
 	      var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
 	      var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
 
 	      getCount();
  
           var idx = document.getElementById("myTable").rows.length-1;
           
           var quantity =  "quantity"+idx;
           
           var unit = "unit"+idx;
           
          var up = "unitprice"+idx;
           
          var discount = "discount"+idx;
           
          var tax = "tax"+idx;
           
          var total = "total" + idx;
         
   
        var newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input type = 'hidden' form ='purchasesave' name = 'ean1' id='eans' value='"+str[0]+"'><input class='form-control input-sm' form ='purchasesave'  type='text' id = 'productSale' name= 'pname1' value = '"+str[1]+"'required> </td></tr>";
        newCell.style.width ='150px';
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' type ='text'  name='Batch1' value ='' id='batch'  form ='purchasesave' required></td></tr>";
        newCell.style.width ='70px';
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' type ='date' name='mDate1'  id='mDate'  form ='purchasesave' required></td></tr>";
     

        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<input class='form-control input-sm'  form ='purchasesave'  type='date' id = 'expSale' name= 'expDate1' required>";
       
 
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form='purchasesave' min='0'   type='number'  id = '"+quantity+"' name='qty[]' oninput = calc('"+idx+"'),totalIt()  onchange = calc('"+idx+"'),totalIt() value = '"+quanto+"' required></td></tr>";
        newCell.style.width ='70px';
   
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form ='purchasesave'  type='text' id = 'unitp'  name= 'unitp' required ></td></tr>";
        newCell.style.width ='70px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form ='purchasesave' onkeypress='return onlyNos(event,this);' min='0' type='text' id = '"+up+"'  name= 'up2[]'  required oninput = calc('"+idx+"'),totalIt()></td></tr>";
        newCell.style.width ='100px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);'  class='form-control input-sm' form ='purchasesave' min='0' type='text' id = '"+discount+"' name='discount1[]' required  value ='0' oninput = calc('"+idx+"'),totalIt()></td></tr>";
        newCell.style.width ='60px';  
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave' min='0' type='text' id = '"+tax+"' name='tax1[]'  value = '0' required oninput = calc('"+idx+"'),totalIt()></td></tr>";
        newCell.style.width ='60px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave' type='text'  id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
        newCell.style.width ='100px';
        
       
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0'></td></tr>";
        newCell.style.width ='80px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px' onclick='deleteRow(this)'></i></td></tr>";
        newCell.style.width ='50px';
        
        disbut();
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
}
*/    }
    
    
    /*
function checkactive(id,odate,ed,cr,name,supplier,pack,quant,stock,up1,total1){
	
	document.getElementById("Supplier").setAttribute("disabled","disabled");
	document.getElementById("orderid").value = id;
	document.getElementById("orderDate").value = odate;
	document.getElementById("receiveddate").value = ed;
	
	 
	  $('select[name=supplier]').val(supplier);
	  $('#Supplier').selectpicker('refresh');

	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody1')[0];
    var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	  
    var idx = document.getElementById("myTable1").rows.length-1;
	
    var quantity =  "quantity"+idx;
    
    var unit = "unit"+idx;
    
   var up = "unitprice"+idx;
    
   var discount = "discount"+idx;
    
   var tax = "tax"+idx;
    
   var total = "total" + idx;
	
   var newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' class='form-control input-sm' type='text' id = 'productSale' name= 'pname1'   value = '"+name+"'required> </td></tr>";
   newCell.style.width ='250px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input type ='text' class='form-control input-sm'   name='Batch1'  id='batch'  form ='purchasesave' required></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input type ='date'  class='form-control input-sm'  name='mDate1'  id='mDate'  form ='purchasesave' required></td></tr>";
   newCell.style.width ='200px';

   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave'  type='date' id = 'expSale' name= 'expDate1' value = ''></td></tr>";
   newCell.style.width ='200px';
  

   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form='purchasesave' class='form-control input-sm'   type='number'  id = '"+quantity+"' name='qty[]'  onchange = calc('"+idx+"'),totalIt() value = '"+quant+"' ></td></tr>";
   newCell.style.width ='50px';

   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' class='form-control input-sm'  type='text' id = 'unitp'  name= 'unitp' value = '"+pack+"'></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' class='form-control input-sm'  type='number' id = '"+up+"'  name= 'up2[]' value = '"+up1+"' onchange = calc('"+idx+"'),totalIt()></td></tr>";
   newCell.style.width ='70px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave' type='number' id = '"+discount+"' name='discount1[]'  value ='0' onchange = calc('"+idx+"'),totalIt()></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave'  type='number' id = '"+tax+"' name='tax1[]'  value = '0' onchange = calc('"+idx+"'),totalIt()></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' type='text' class='form-control input-sm'  id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
   newCell.style.width ='50px';
   
  
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><tdclass='count-me'><input  class='form-control input-sm'  form ='purchasesave' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '"+total1+"'></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>";
   newCell.style.width ='10px';
  
//onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
  
     //calc('"+idx+"')

}


function checkSupply(supply,quant,unit,up){
	
	quanto = quant;
	unito = unit;
	upo = up;
	
	$("#Supplier").append('<option value="'+supply+'"selected="">'+supply+'</option>');
	   $("#Supplier").selectpicker("refresh");
}

function disbut(){
	//alert();
	if(document.getElementById("pname").value == "Select"){
		document.getElementById("addepr").disabled = true;
	}
	else{
		document.getElementById("addepr").disabled = false;	
	}
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	 
	
	if(tableRef.rows.length == "0"){
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
	}
	
}
	


function validate()
{    alert("changes saved successfully!");
	
	document.getElementById("purchasesave").submit();
	
	}
	
*/	
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/ERP/orderho.html";
	}
}
function disp(){
	console.log(unsaved)
	   
	   
	if(document.getElementById("sinvoice").value == "Select"){
		alert("Please select Order Id")
		return false;
	}
	if(unsaved == true){
		alert("Please save the changes before printing")
		return false;
	}
	$("#col3").css("border-style","none");
	 document.getElementById("myTable").style.width = "890px"; 	
	document.getElementById("re").style.visibility = "hidden";
	$("#myTable th:eq(4), #myTable td:nth-child(5)").hide();
	$("#myTable th:eq(5), #myTable td:nth-child(6)").hide();
	$("#myTable th:eq(6), #myTable td:nth-child(7)").hide();

	$(".fe").hide();
	document.getElementById("addepr").style.display = "none";
	//document.getElementById("pr").style.display = "block";
	//document.getElementById("gtot").style.visibility = "hidden";
	document.getElementById("bouton-contact").style.visibility = "hidden";
	document.getElementById("close").style.display = "none";
	//document.getElementById("col3").style.width = "1070px";
	//document.getElementById("di").style.display = "none";
	window.print();
	
	document.getElementById("re").style.visibility = "visible";
	document.getElementById("addepr").style.display = "block";
	//document.getElementById("gtot").style.visibility = "visible";
	document.getElementById("bouton-contact").style.visibility = "visible";
	document.getElementById("close").style.display = "block";
	$(".fe").show();
	//document.getElementById("col3").style.width = "1170px";

	//document.getElementById("pr").style.display = "block";
	$("#myTable th:eq(4), #myTable td:nth-child(5)").show();
	$("#myTable th:eq(5), #myTable td:nth-child(6)").show();
	$("#myTable th:eq(6), #myTable td:nth-child(7)").show();
	document.getElementById("myTable").style.width = "930px"; 	
	$("#col3").css("border-style","groove");
//	document.getElementById("di").style.display = "block";
}



function verifypro(){
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var today = moment().format("DD-MM-YYYY hh:mm");
	document.getElementById("orderDate").value = today;
	if((tableRef.rows.length) < 1 )
	{
		alert("No products added.")
	   return false;
	}
	
}
</script>
<script>
$(document).ready(function(){
	$('#close').prop("disabled",true);
	
	$("#sinvoice").change(function(){
    	
    	var theValue = $("#sinvoice").val();
        if(theValue!='Select')
            {
        	$('#close').prop("disabled",false);
            }
        });
})

function doAjaxdel(r,autoid){

	var c = $('#sinvoice').val();
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var y;
	
	var ra = confirm("You are deleting a product. Do you want to proceed?");
	if (ra == false) {
		return false;
	}
	   
	var res;
	if(tableRef.rows.length == 1){
		var i = confirm("You are deleting all the products in the Order. This order will not be saved. Do you want to proceed?")
	if(i == false){
		return false;
	}	
	else{
		y = 1;
	}
	}
	
	   $.ajax({
      	 
           type: "GET",
           url: "/ERP/delor/"+((y== 1) ? $('#autoid').val() : 0)+"/"+autoid,
           async : false,      
           dataType: "JSON",
           contentType: "application/json; charset=UTF-8",
           
         success: function(response){
              	if(response.toString() == "success")   
                 {
             	  alert("Record deleted Successfully")
                 }
              	if(y > 0){
              		window.location = "/ERP/orderho.html";
              	}
             	  unsaved = false;
                 },
                 

            	
              //   error: function(e){
              	  
              	//           alert('Error: ' + e);
              	  
              	 //          }
              	           });
	   deleteRow(r)
}

</script>
<script>

       function doAjaxPost(orderObj) {
          if($(orderObj).val() == "Select"){
        	  location.href = "orderho.html"
          } 
    	 var objSplit = $(orderObj).attr('data-value').split("==");
        document.getElementById("saveo").reset();
        document.getElementById("orderid").value = $(orderObj).val();
        $('#autoid').val(objSplit[0]);
        document.getElementById("author").value = objSplit[1];
        document.getElementById("count").value = objSplit[3];

		 $('select[name=supplierid]').val(objSplit[5]);
		 $('#Supplier').selectpicker('refresh');

		 document.getElementById("orderDate").value = objSplit[6];  
		 if($(orderObj).val() == "Select"){
			 
		     $("#myTable tbody tr").remove(); 
			  $('select[name=ean1]').val('Select');
			   $('#ean1').selectpicker('refresh');
			   
			   $('select[name=pname]').val('Select');
			   $('#pname').selectpicker('refresh');
			   $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
		            
		        	unsaved = false;
		        });
			   
			   window.location.reload();
			   
			  return false;
		 }
       $("#myTable tbody tr").remove();
     
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/ERP/getDetailsho.html",
		       data: {"autoid" : $("#autoid").val()},
	           async : false,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	     	  
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	     		 
        		   var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
        		  var eanid = "ean" + tableRef.rows.length;
        		  var pid = "pid" + tableRef.rows.length;
        	
        		   var markup = "<tr><td style='width:100px;' class='pc'><input form ='saveo' type='hidden' name='orderdetailsid' id='orderdetailsid' value='"+datec.autoid+"' /><input type = 'text' class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = '"+datec.ean+"' readonly required></td><td style='width:400px;' class='pc1'><input type='text' form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName' readonly value='"+datec.productName+"' required><input type='hidden' form='saveo' name='pida' id='pid' value='"+datec.pid+"' ></td><td style='width:160px;' class='pc2'><input id = 'unit' class='form-control input-sm' form ='saveo' type='text' name= 'unit' value='"+decodeURI(datec.unit)+"' required></td><td style='width:100px;' class='pc'><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);' id = 'quantity' name= 'quantity' min = '1' value = '"+datec.quantity+"' class='form-control input-sm'  required></td><td style='width:100px;'class='pc'><input type = 'text' form ='saveo'   type='text'  id = 'stks' name='stks' value="+Number(datec.stks)+"  readonly='readonly' class='form-control input-sm' required></td><td style='width:70px;'><i class='fa fa-trash-o' id='"+encodeURI(datec.ean)+"' style='font-size:20px' onclick=doAjaxdel(this,'"+datec.autoid+"')></i></td></tr>"

        		   $('#myTable tbody').append(markup);
        		  // document.getElementById(eanid).oninput();
        		  // document.getElementById(pid).oninput();
        		   $('#sa').val('ed');
        		
        		  $('#orderDate').prop('readonly',true)
        	        
	                   });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
    	unsaved = false;
		 
    	        	        }


      

       
       
       </script>
       <script>
       $('input').keypress(function(e){ 
    	   if (this.value.length == 0 && e.which == 48 ){
    	    
    		   return false;
    	      
    	   }
    	});
       
       </script>
       <script type="text/javascript">
   
$(function () {
	
/* $('#datetimepicker1').datetimepicker({
	 
	defaultDate: new Date(),
	useCurrent: false,
	format: "dd-mm-yyyy  hh:ii",
    autoclose: true,
   
    todayBtn: true,
    
	
}); */

});

function chdate(id){
	var datea = $(id).val().split(' ');

	var from = datea[0].split("-");
	var f = new Date(from[2], from[1] - 1, from[0]);
	

var date1 = new Date()
var longformat = f*1;

var longformat1 = date1*1; 	
if(longformat > longformat1){
	alert("Cannot create orders for future dates")
	$('#bouton-contact').prop("disabled",true)
	return false;
}
else{
	$('#bouton-contact').prop("disabled",false)
	return true
}
}

function chod(id){
	if($('#sinvoice').val() == "Select"){
		alert("Please select order id")
		return false;
	}
	else{$(id).attr('href','/ERP/reports/orderReport?autoid='+$('#sinvoice').val()+'')
		return true;}
	
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
      <a class="navbar-brand" href="#">Order & Reorder</a>
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


  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="submit"  form="saveo" onclick="return verifypro();" id="bouton-contact" onkey  class="btn btn-warning button2">Save</button> 
       <font size="5" class= "or">Order & Reorder</font><span class="button1"><i class="" style="color:#ff9900;margin: 4px 8px;"></i> 
       <a href="#" id="close" target="_blank" class="btn btn-warning button1 rmt" onclick="return chod(this)">Print</a> 

	</h1>
	    
	    <div class="container">
</div>
<br>
<form id="ui" action=""></form>
<form id="saveo" action="saveOrderho.html" method="post"></form>
 
      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group oid">
       <p>Order Id <span></span></p>
 <select class="selectpicker form-control"  data-dropup-auto="false" data-size="6" data-live-search="true" name = "sinvoice" id ="sinvoice"  onchange="return doAjaxPost(this.options[this.selectedIndex])">
    <option value="Select">New</option>
    <c:forEach var="od"  items="${model.list1}">
      <option class="${od.orderid}" data-value="${od.autoid}==${od.author}==${od.delivery}==${od.count}==${od.supplier}==${od.supplierid}==${od.orderDate}" value="${od.autoid}">${od.orderid}</option>
    </c:forEach>
</select>
     
     <!--      <select class="selectpicker" data-show-subtext="true" data-live-search="true"  name = "supplier" id ="Supplier"  onchange="doAjaxPost(this.value);this.selectedindex = -1" required>
  <option>--Select--</option>
 <c:forEach var="purchase"  items="${model.list1}">
 <option value = "${purchase.supplier}">${purchase.supplier}</option>
 </c:forEach>
      </select>
      -->
      
      
      </div>
	</div>

	      
	       <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	     
        <p>Order Date<span>*</span></p>
        <!-- <div class='input-group date' id='datetimepicker1'> -->
       <input type="text" class="form-control input-sm" onfocusout ="return chdate(this)" name="orderDate" id ="orderDate" required readonly>
        <!-- <span class="input-group-addon" id="re"><span class="glyphicon glyphicon-calendar "></span></span>
   
       </div> -->
	</div>
	      </div>
	      
	       <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12"> 
  
  <div class="form-group">
  
  <p>Supplier<span>*</span></p>
     <select class="selectpicker form-control input-sm" data-dropup-auto="false"  data-size="5" data-show-subtext="true" data-live-search="true"  name = "supplierid" id ="Supplier"  form="saveo" required>
  <option value="Select">Select</option>
 <c:forEach var="product"  items="${model.list6}">
  <option value="${product.sid}" >${product.name}</option>
 </c:forEach>
      </select>
</div>
  </div>
  
	      <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group">
	       <p>Created By <span></span></p>
	       <input form="saveo" readonly type="text" id = "author" name="author" value="${pageContext.request.userPrincipal.name}" class="form-control input-sm">
     </div>
	      </div>
	  </div>
	  
	  
	  
  <input form="saveo" type="hidden" name="autoid" id="autoid" value=0>
  <input form="saveo" type="hidden" name="orderid" id="orderid">
  <input type='hidden' name='sa' id='sa' form='saveo' value="cr">
 <div class="form-group row" >
  <div class="col-xs-1"></div>
	<!--    
	    
	      
	      <c:forEach var="q"  items="${model.list2}">
   <script>
   checkSupply('<c:out value="${q.supplier}" />','<c:out value="${q.quantity}" />','<c:out value="${q.unit}" />','<c:out value="${q.up}" />');
   </script>
   </c:forEach>
	-->      
	     
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group fe patid">
	       
	        <p>Product Code<span>*</span></p>
      <select class="selectpicker form-control input-sm" data-dropup-auto="false" data-size="6" data-show-subtext="true" data-live-search="true" name = "ean1" id ="ean1"  onchange="add1(this.options[this.selectedIndex])" required>
     <option value="Select" data-value="Select">Select</option>
     <c:forEach var="product"  items="${model.list}">
       <option class="${product.prc}" value="${product.prc}" data-value="${product.prc},${product.name},${product.stocks},${product.dps},${product.product}">${product.prc}</option>
    </c:forEach>
</select> 
   

	       </div>
	       </div>
	       
	       
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group fe patname">
	       
   <p>Product Name<span>*</span></p>
      <select class="selectpicker form-control input-sm" data-dropup-auto="false" data-size="6"  data-show-subtext="true" data-live-search="true" name = "pname" id ="pname"  onchange="add2(this.options[this.selectedIndex])" required>
       <option value="Select" data-value="Select">Select</option>
        <c:forEach var="product"  items="${model.list}">
       <option class="${product.prc}" value="${product.name}" data-value="${product.prc},${product.name},${product.stocks},${product.dps},${product.product}">${product.name}</option>
    </c:forEach>
     </select>
	       </div>
	       </div>
	       
	       
	       
	       <div class="col-xs-1">
	       <div class="form-group">
	      
<br>
<p></p>
	       <button type="button" id="addepr" style="width:80px;" class="button1 btn btn-warning"  onclick="return add()"> ADD</button>
	       </div>
	       </div>
	       </div>
	       
	       
	       
	  
      <div class="container table-container">
			<div class="tableFixHead"> 
			<table class="table table-striped table-bordered" id ="myTable">
    <thead>
      <tr> 
      
 <th class="pc">Product Code</th>
 <th class="pc1">Product Name</th>
 <th class="pc2">Pack Size</th>
 <th class="pc">Quantity</th>
 <th class="pc">Current Stocks</th>
 <th>Delete</th>
 
 <!-- 
 <th style="width:">Unit Cp</th>
 <th style="width:">Discount</th>
 <th style="width:">Tax</th>
 <th style="width:">Unit Sp</th>
 <th style="width:">Total</th>
 <th style="width:">Delete</th>
 <th style="width:"></th>
  -->
      </tr>
    </thead>
   
   <tbody class="tbody">
     <c:forEach var="ps"  items="${model.list5}">
     <tr>
     <td ><input type="hidden" form ='saveo' name="orderdetailsid" id="orderdetailsid" value=0 /><input type='text'  class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = "${ps.prc}" readonly  required></td>
     <td ><input type='text'  form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName'  value = "${ps.name}" readonly required><input type='hidden' name='pida' id='pid' form='saveo' value="${ps.product}"></td>
     <td ><input id = 'unit' form ='saveo' type='text' name= 'unit' class='form-control input-sm' value="${ps.dps}" required></td>
     <td ><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);'  id = 'quantity' name= 'quantity' min = '1' value = '0' class='form-control input-sm' required ></td>
     <td ><input type = 'text' form ='saveo'  readonly='readonly' type='text'  id = 'stks' name='stks' value="${ps.stocks}" class='form-control input-sm' required></td>
     <td width="43px;"><i class='fa fa-trash-o'  style='font-size:20px'onclick='deleteRow(this)'></i></td>
     
     </tr>
     </c:forEach>
     
    </tbody>
 
  </table>
  </div>
  
    </div>
  
  <div class="form-group row" >
  <div class="col-xs-9"></div>
    <div class="col-lg-2 col-md-12 col-xs-6 col-sm-12">
   
    
   Total Items<input  form="saveo"  class="form-control" readonly = "readonly" type= "text" name="count" id="count">
      
 </div>
  </div>
  <!-- 
   <div class="form-group">
    <label class="sr-only" for="show">show</label>
   <div class="input-group">
    <div class="input-group-addon">Grand Total</div>
    <input form ="purchasesave" class="form-control" readonly = "readonly" type= "text" name="grandTotal" id="grandTotal" >
       </div>
   
  </div>
  -->
  
  </div>
  
 	  
	  
	  
	  
	      
 <input type=""  disabled class="bouton-contact"  >
	  </div>
	  </div>
	  <script>
datasuccess('<%=request.getParameter("message")%>')
</script>

 
	  </body>
	   
	      
</html>  



				
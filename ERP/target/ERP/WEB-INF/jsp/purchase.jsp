<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-confirm.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/navbar.css" />' />

<script type="text/javascript" src="/ERP/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/ERP/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/ERP/resources/js/jquery-ui.min.js"></script>
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
   
    
    .table-responsive{
  font-family: 'Tahoma', 'sans-serif';

  margin-bottom:15px;
      margin-left: -45px;
  overflow:auto;
      width: 111%;
    margin-top: 10px;
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
}
.button2{
position:relative;
float:right;
}



@media (max-width:640px){

#gtot{
    margin-left: 135px;
}

#subtotal{
width: 215px;
margin-left: 30px;
}

#grandTotal{
width: 215px;
margin-left: 30px;
}


.button2 {
    margin-top: -13px;
}

.pe {
    font-size: 25px;
}
.button1 {
    margin-top: -8px;
    
}

.table-responsive{

          margin-left: -7px;
    font-family: 'Tahoma', 'sans-serif';
    margin-bottom: 15px;
    overflow: auto;
    margin-right: 85px;
    width: 113%;
    margin-top: 10px;
}

#addepr{
    margin-left: 133px;
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
  background:linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  color: rgb(255, 255, 255);
  padding: 30px 16px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#scroll{
	overflow:auto;
}
#form1 {
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

#mDate{
width : 130px;
}

#expSale{
width : 130px;
}
/* #myTable {
    border-collapse: collapse;
    width: 100%;
    }
#myTable th {
    background-color: #009999;
    color: black;
    
 } */
 

  .button1{
	float : left;
}
.button2{
	float : right;
}



#col3{

margin-left: 7px;
margin-right: 7px;
    border-style: groove;
    border-radius: 10px;
    width: auto;
    height: auto;
  
}

#span2{
height:300px;!important;
overflow : auto;
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
	//$(".expSale").attr("min",new Date())     
	
	 if(user.includes("[ROLE_SALESMANAGER]")){
	
		var url = "/ERP/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
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
	 var supplier 
	 function doneTyping () {
	 	srch = $('#patname').val();
	 	srch2 = $('#patid').val();
	 	srch3 = $('#oid').val();
	 	supplier= $("#Supplier option:selected").text();
	 	
	 	/* alert("srch = "+srch)
	 	alert("srch2 = "+srch2)
	 	alert("srch3 = "+srch3)
	 	alert("done typing") */
	 	
	 	var url = "/ERP/purchaseFilter?srch="+srch+"&srch2="+srch2+"&srch3="+srch3+"&supplier="+supplier+""
	 	$('#pname').find('option:gt(0)').remove();
	 	$('#pname').selectpicker('refresh');
	 	$('#ean').find('option:gt(0)').remove();
	 	$('#ean').selectpicker('refresh');
	 	$('#allocationid1').find('option:gt(0)').remove();
	 	$('#allocationid1').selectpicker('refresh');
	 		
	 	var successFn = function(response){
	 		console.log("response list2 = "+response.list2)	
	 	     $.each(response.list2, function(index,p) {
	 	    	// alert("list2")
	 		   if ($("#pname option[class='"+p.ean+"']").length == 0 || $("#pname option[class='"+p.ean+"']").length == 'undefined' || $("#ean option[class='"+p.ean+"']").length == 0 || $("#ean option[class='"+p.ean+"']").length == 'undefined'){
						console.log("response list2 = "+response.list2)	 			   
	 			   $('#pname').append('<option class="'+p.ean+'" value="'+p.ean+','+p.productName+'" data-value="'+p.pid+'">'+p.productName+'</option>');
					$('#ean').append('<option class="'+p.ean+'" value="'+p.ean+','+p.productName+'" data-value="'+p.pid+'">'+p.ean+'</option>');	 			   
	 			   $('#pname').selectpicker("refresh");
	 			  $('#ean').selectpicker("refresh");
	 		   }
	 	   });
	 	     
	 	    $.each(response.list2a, function(index,p) {
	 	    	
		 		   if ($("#allocationid1 option[class='"+p.allocationid+"']").length == 0 || $("#allocationid1 option[class='"+p.allocationid+"']").length == 'undefined'){
		 			  // console.log("response list2a = "+response.list2a)	 	
		 			   $('#allocationid1').append('<option class="'+p.allocationid+'" value="'+p.allocationid+'">'+p.allocationid+'</option>');
		 			  	$('#allocationid1').selectpicker("refresh");
		 		   }
		 	   });
	 	    
	    }
	    var errorFn = function(e){
	 	           alert('Error: ' + e);
	 	           }
	 	
	     filterAjax4(srch,srch2,srch3,supplier,url,successFn,errorFn)
	 }
}
function check(){
	
	var n = moment().format("DD-MM-YYYY hh:mm");
	document.getElementById("receiveddate").value = n;
	

		
		id = 1;
		var str1 = "All-";
		
		var m = moment().format("DDMMYYYY");
		
		var str4 = id;
		var res = str1.concat(m);
		var res1 = res.concat(id);
	
		
		document.getElementById("allocationid").value = res;
		

	
}

function isDate(txtDate)
{
    var currVal = txtDate;
    if(currVal == '')
        return false;
    
    var rxDatePattern =/^\d{4}-\d{2}-\d{2}$/ ; //Declare Regex   
    var dtArray = currVal.match(rxDatePattern); // is format OK?
    if (dtArray == null) 
        return false;
    
    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[1];
    dtDay= dtArray[3];
    dtYear = dtArray[5];        
    
    if (dtMonth < 1 || dtMonth > 12) 
        return false;
    else if (dtDay < 1 || dtDay> 31) 
        return false;
    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31) 
        return false;
    else if (dtMonth == 2) 
    {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay> 29 || (dtDay ==29 && !isleap)) 
                return false;
    }
    return true;
}


function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    var x = document.getElementById("myTable").rows.length;
    document.getElementById("totalItems").value=x;
   // document.getElementById("subTotal").value=x;
   disbut();
   if(x<=0){
	   document.getElementById("disc").value=0.00;
	   totalIt();
   }
   else{
	   totalIt();
	   
   }
   
}



function getCount(){

	var x = document.getElementById("myTable").rows.length;
	    document.getElementById("totalItems").value=x;
    
    
  //  document.getElementById("invoiceDate").valueAsDate = new Date();
  
}

var quanto;
var unito;
var upo;
var p;

function add1(){
	

	   var str = document.getElementById("ean").value;
	   
	  
	   var strSplit = str.split(',');
	  var p = strSplit[1];
	 
       var res4 = $('select[name=ean]').val();
   	  
	   
   	   $('select[name=pname]').val(str);
	   $('#pname').selectpicker('refresh');

	   
		// document.getElementById("eans").value = strSplit[0];
	       
		   
	    disbut();
	      
		   
	   
	   
}


function add2(){
	
	   var str = document.getElementById("pname").value;
	 
	       var strSplit = str.split(',');
	       var p = strSplit[1];
	       var res5 = $('select[name=pname]').val();
	   	   
		   
	   	   $('select[name=ean]').val(res5);
		   $('#ean').selectpicker('refresh');
		//   document.getElementById("eans").value = strSplit[0];
		   
	     disbut();
		 
	 
	
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
	
		 var qtys = document.getElementsByClassName("totalpurchaseprice");
		
		  var total=0;
		  for (var i=0;i<qtys.length;i++) {
		    //calc(i);  
		    
		    total += Number(qtys[i].value)//isNaN(price)?0:price;
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
	
    var row = 1;
  
 
    var text = document.getElementById("pname").value;
    var prid = Number($('select[name="pname"] :selected').attr('data-value'));

   // var ean = document.getElemntById("ean").value
      
    $('select[name=ean]').val("Select");
    $('#ean').selectpicker('refresh');	
	 		   
	$('select[name=pname]').val("Select");
    $('#pname').selectpicker('refresh');	
var str = text.split(',');
    

  

    for(var x=0; x<row; x++) {
    	
    	
	
 	
 	      var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
 	      
 
 	      getCount();
  
           var idx = document.getElementById("myTable").rows.length;
           
           var quantity =  "quantity"+idx;
           
           var unit = "unit"+idx;
           
          var up = "unitprice"+idx;
           
          var discount = "discount"+idx;
           
          var tax = "tax"+idx;
           
          var total = "total" + idx;
         var batch = "batch" + idx;
         var mdesc  = "mdesc" + idx;
         var exp = "expdate"+idx; 
         let x = idx - 1; 
         var row = "<tr><td><input class='form-control input-sm' type = 'text' form ='purchasesave' name = 'ean1' id='eans' value='"+str[0]+"'></td><td><input class='form-control input-sm' form ='purchasesave'  type='text' id = 'productSale' name= 'pname1' value = '"+str[1]+"'required></td><td><input class='form-control input-sm' type ='text'  name='purchaseDetailsList["+x+"].batch' value ='NA' id='"+batch+"' onfocusout = \"(doAjaxPost2(this.value,'"+prid+"'))\" form ='purchasesave' required></td><td><input type='date' class='form-control input-sm expSale' max='2999-12-31'  id = '"+exp+"' name= 'purchaseDetailsList["+x+"].expirydate' form ='purchasesave' required></td><td><input class='form-control input-sm' form='purchasesave'   type='text'  id = 'mpack' name='purchaseDetailsList["+x+"].packdesc' required value ='NA' required></td><td><input class='form-control input-sm' form='purchasesave'  onkeypress='return onlyNos(event,this);'  type='number' min='1' id = '"+mdesc+"' name='purchaseDetailsList["+x+"].packsize' required  value = '1' required></td><td><input class='form-control input-sm unitp' form ='purchasesave'  type='text' id = 'sudesc'   name= 'purchaseDetailsList["+x+"].singleunitdesc' required value = 'NA' ></td><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm purchaseqty' form ='purchasesave'  type='number' min='1' id = '"+quantity+"' name='purchaseDetailsList["+x+"].purchaseqty'  required value ='0'></td><td><input  class='form-control input-sm caluclate totalpurchaseprice' form ='purchasesave' type='text' id = '"+discount+"' name='purchaseDetailsList["+x+"].totalpurchaseprice' required  value ='0.00'></td><td><input  class='form-control input-sm unitcp' form ='purchasesave' type='text' id = '"+up+"'  name= 'purchaseDetailsList["+x+"].unitcp'  value = '0.00' onfocusout = checkbatch($('#"+batch+"').val(),$('#"+exp+"').val(),$('#"+mdesc+"').val(),$('#"+up+"').val()) required ></td><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave' type='text'  id = 'freeSale' name= 'purchaseDetailsList["+x+"].stocknumber'  value = '0'  ></td><td><input class='form-control input-sm'  form ='purchasesave' readonly = 'readonly' type='text' id = '"+total+"'  name='purchaseDetailsList["+x+"].stockvaluepurchase'  value = '0.00'></td><td><i class='fa fa-trash-o' style='font-size:20px' onclick='deleteRow(this)'></i><input type='hidden' name='purchaseDetailsList["+x+"].pid' form ='purchasesave' id = 'pid' value="+prid+"></td></tr>";
   
         $('#myTable .tbody').append(row);
    
         


        disbut();
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
}
    validDate()
    }
    
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

*/
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
	 
	
	if(tableRef.rows.length == 0){
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
	}
	
}
	


function verifyproAdd(){
	
	//var x = ;
	//var x1 =document.getElementById("saleCustId").value;
	//var x2 = document.getElementById("saleCustName").value;
	//var x3 = document.getElementById("saleCustPhone").value;
	//var x4 = document.getElementByName("quantity").value;
	
	var x5 =document.getElementsByClassName("purchaseqty");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Purchase Qty cannot be 0")
			return false;
		}
	}

	var x5 =document.getElementsByClassName("totalpurchaseprice");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Please enter 'Total Purchase Price' or 'Unit CP' value based on option selected in 'Price Entry'")
			return false;
		}
	}
	
	var x5 =document.getElementsByClassName("unitcp");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Please enter 'Total Purchase Price' or 'Unit CP' value based on option selected in 'Price Entry'")
			return false;
		}
	}

	var x5 =document.getElementsByClassName("expSale");
	for(var i = 0;i<x5.length;i++){
		if(! isDate(x5[i].value))
		{ alert('Invalid Date');
		
		  $('#ean').prop('disabled',true)
		   	  $('#pname').prop('disabled',true)
		   	  $('#bouton-contact').prop('disabled',true) 
		return false;}
		else if(x5[i].value <= moment().format("YYYY-MM-DD")){
			alert("Expiry date should be greater than Current date")
  	              $('#ean').prop('disabled',true)
     		   	  $('#pname').prop('disabled',true)
     		   	  $('#bouton-contact').prop('disabled',true)   
			return false;
		}
		else{
		  	  $('#ean').prop('disabled',false)
 		   	  $('#pname').prop('disabled',false)
 		   	  $('#bouton-contact').prop('disabled',false)
		}
	}

	if((document.getElementById("myTable").rows.length-1) == 0 )
	{
		alert("please add the products")
	   return false;
	}
	
	else{
		totalIt();
		return true;
	}
	
}

function verifyproAdd1(){
	 if((document.getElementById("grandTotal").value) == 0)  {
			alert("Please click on Generate total")
		return false;
		  }
}

function validate()
{    alert("changes saved successfully!");
	
	document.getElementById("purchasesave").submit();
	
	}
	
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/ERP/purchaseho.html";
	}
}

function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}
	
function validDate() {
	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate() + 7);
var s = document.getElementsByName("expDate1");
for(var i =0;i<s.length;i++){
	s[i].setAttribute('min', getInputDateFormat(today));
//s[i].setAttribute('max', getInputDateFormat(maxDate));	
}
	 
	}

function setUrl(myurl){
	var url = myurl.getAttribute('value');
	var autoid = myurl.getAttribute('id');
	/* $('#vp').attr("href","/ERP/prpur?allo="+url+""); */
	console.log("autoid = ",autoid)
	$('#vp').attr("href","/ERP/reports/purchaseEntryReport?autoid="+autoid);
}

function chdate(id){
	var datea = $(id).val().split(' ');

	var from = datea[0].split("-");
	var f = new Date(from[2], from[1] - 1, from[0]);
	

var date1 = new Date()
var longformat = f*1;

var longformat1 = date1*1; 	
if(longformat > longformat1){
	alert("Cannot create purchase entry for future dates")
	$('#bouton-contact').prop("disabled",true)
	    $('#ean').prop('disabled',true)
       $('#pname').prop('disabled',true)
        $('#gtot').prop('disabled',true)
         $('#addepr').prop('disabled',true)
         $('#Supplier').prop('disabled',true)
     		   	  
	return false;
}
else{
	$('#bouton-contact').prop("disabled",false)
		
	    $('#ean').prop('disabled',false)
       $('#pname').prop('disabled',false)
         $('#gtot').prop('disabled',false)
         $('#addepr').prop('disabled',false)
           $('#Supplier').prop('disabled',false)  
	return true;
}
}

function checkUrl(valie){
	
	console.log("value - ",valie)
	 if($("#allocationid1").val() == "select"){
		alert("Please select Allocation Id")
	}
}
</script>
<script>

       function doAjaxPost(user2) {
    	   // get the form values
    	   $("#supplier").val($(user2).val())
    	      //  var name = $('#pname').val();
      //  document.getElementById("purchasesave").reset();
        $('#ean').find('option').not(':first').remove();
        $('#pname').find('option').not(':first').remove();
		
        document.getElementById("Supplier").disabled = true;
       
        $("#myTable tbody tr").remove();
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/ERP/getsupplyorder.html",
	          data: {
		          "supplier" : $(user2).attr('data-value')
		          },
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	    
	        	   $.each(response.list2, function(index, datec) {
		        	   console.log(datec)
	                   //to print name of employee
	             
	                //   if ($("#ean option[value="+datec.ean+"]").length == 0){
	               e = datec.ean;
	               p = datec.pname;
	                	   $("#ean").append('<option class="'+datec.ean+'" value="'+datec.ean+','+datec.productName+'" data-value="'+datec.pid+'">'+datec.ean+'</option>');
	                   
	                   $("#ean").selectpicker("refresh");
	                  // }
	          //  alert(datec.productName)
	                 // if ($("#pname option[value="+datec.productName+"]").length == 0 ){
	    	             
	                	   $("#pname").append('<option class="'+datec.ean+'" value="'+datec.ean+','+datec.productName+'" data-value="'+datec.pid+'">'+datec.productName+'</option>');
	                   
	                   $("#pname").selectpicker("refresh");
	                  // }

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
var ba;
var ex;
var mps;
var cps;
       function doAjaxPost2(batch,id) {
    	   // get the form values
    	   
       
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/ERP/getBatdet?location="+encodeURIComponent(batch)+"&&location1="+id+"",
	          data: "0",
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	   
	        	   $.each(response, function(index, datec) {
	               
	        		 ba = datec.batch;
	                 ex = datec.expirydate;
	                 mps = datec.mpsize;
	                 cps = datec.cp;
	        	   });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }


       function checkbatch(batch,exp,mpsize,cp){
     	
     	  if(batch == ba){
     		
     		  if(exp != ex || mpsize != mps || cp != cps){
     		
     			 $.alert({
     			    title: 'Warning!',
     			    content: 'Product with same batch exists with Exp Date - '+moment(ex).format("DD-MM-YYYY")+', Manufacturing Pack Size - '+mps+' and UnitCP - '+cps+'.<br>1. Correct all the differences and continue to add.<br>2. Change the Batch name and add as a new batch.<br>3. Cancel the entry and update Quantity detail in Product Stocks & Pricing screen.',
     			});
     		   	  $('#ean').prop('disabled',true)
     		   	  $('#pname').prop('disabled',true)
     		   	  $('#bouton-contact').prop('disabled',true)
     		   	  return false;
     		  }
     		  else{
     			 $('#ean').prop('disabled',false)
    		   	  $('#pname').prop('disabled',false) 
     		   	  $('#bouton-contact').prop('disabled',false)
     			  return true;
     		  }
     	  }
     	  
  
       }

       
       
       </script>


 <script>
 
 
      $(document).ready( function() {
    	  
    	  $('input[type="text"]').on('keypress',function(e){ 
    	    		  if (this.value.length == 0 && e.which == 48 ){
    		      return false;
    		   }
    		});
    	  
      });

 </script>
 <script>
   
   $(function () {
	    $('#myTable').on('focusout','.tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	        var a = x[8].getElementsByTagName('input')[0].value;
	        var b = x[9].getElementsByTagName('input')[0].value;
	        
	       
	       if(document.getElementById("cash").checked == true){
	        	
	        	b =0;
	        	x[9].getElementsByTagName('input')[0].value = 0;
	        	b= Number(x[8].getElementsByTagName('input')[0].value)/(Number(x[7].getElementsByTagName('input')[0].value)*Number(x[5].getElementsByTagName('input')[0].value)); 
	        	x[9].getElementsByTagName('input')[0].value = Number(b).toFixed(2);
	        //	var idm =  x[9].getElementsByTagName('input')[0].id; 
	        //	if(!$('#'+idm).val().includes("NaN") && !$('#'+idm).val().includes("0.00")  ){
	        //		document.getElementById(idm).oninput();
	        //	} 
	        //console.log(x[9].getElementsByTagName('input')[0].value.length)
	        }
	        
	        else if(document.getElementById("ins").checked == true){
	        	a = 0;
	        	x[8].getElementsByTagName('input')[0].value = 0;
	        		a = Number(b) * Number(x[7].getElementsByTagName('input')[0].value)*Number(x[5].getElementsByTagName('input')[0].value); 
	        	x[8].getElementsByTagName('input')[0].value = Number(a);
	        	
	        }
	        else{
	        	 
	        }
	        x[10].getElementsByTagName('input')[0].value = Math.round(Number(x[5].getElementsByTagName('input')[0].value) * Number(x[7].getElementsByTagName('input')[0].value));
	        x[11].getElementsByTagName('input')[0].value = Math.round(Number(x[9].getElementsByTagName('input')[0].value) * Number(x[10].getElementsByTagName('input')[0].value)).toFixed(2)
	       price = 0;
	      
	    });
	   
   });
   
   </script> 
   <script type="text/javascript">
   
$(function () {
	
$('#datetimepicker1').datetimepicker({
	 

	useCurrent: false,
	format: "dd-mm-yyyy  hh:ii",
    autoclose: true,
    todayBtn: true,
 
    
});

});

   
</script>     

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="disbut(),checkhome2('<c:out value="${username}" />')">
<div class = "wrapper">


<nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Purchase Entry</a>
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
  <div id="form1" >  
  
     <h1>
      <button type="reset" id="refresh" class="btn btn-warning button1" onclick="location.href='/ERP/purchaseho.html';" >
	  <span class="fa fa-refresh"></span> Refresh</button> <a id="vp" target="_blank" class="btn btn-warning button2 rmt" onclick="return checkUrl(this)">Print</a>
	
       <font size="5" class = "pe">Purchase Entry </font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
	 
	
    
	

	</h1>
	    
	    <div class="container">
</div>
<br>
<form id="ui" action=""></form>
<!--<form id="purchasesave" action="purchaseSaveho.html" method="post"></form>-->
<form:form id="purchasesave" method="post" modelAttribute="purchases" action="savePurchases.html"></form:form>
  
       <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
            <p>Supplier<span>*</span></p>
     <select class="selectpicker" data-dropup-auto="false" data-show-subtext="true" data-live-search="true"  name = "supplier" id ="Supplier"  onchange="doAjaxPost(this.options[this.selectedIndex])" required>
  <option>--Select--</option>
 <c:forEach var="purchase"  items="${model.list1}">
 <option data-value = "${purchase.name}" value = "${purchase.sid}">${purchase.name}</option>
 </c:forEach>
      </select>
      </div>
	</div>

	      
	       <div class="col-lg-2 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group">
	     
        <p>Supplier Invoice<span>*</span></p>
       <input  form="purchasesave" type="text" name="supplierinvoice" id = "supplierinvoice" class="form-control" required>
       <input form="purchasesave" type="hidden" name="autoid" id="autoid" value=0 />
       </div>
	
	      </div>
	      
	<div class="col-lg-2 col-md-12 col-xs-12 col-sm-12"> 
  
  <div class="form-group">
  
   <p>Received Date<span>*</span></p>
 <div class='input-group date' id='datetimepicker1'>
    <input   type="text" data-date-end-date="0d" class="form-control" name="receiveddate" id = "receiveddate" onchange ="return chdate(this)" required readonly>
       <span class="input-group-addon"><span  class="glyphicon glyphicon-calendar"></span></span>
    </div>
</div>


	      
	  </div>
	  
	  <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group oid">
            <p>Allocation Id<span>*</span></p>
     <select class="selectpicker" data-dropup-auto="false" data-show-subtext="true" data-live-search="true"  name = "allocationid1" id ="allocationid1" onchange="setUrl(this.options[this.selectedIndex])"  required>
  <option value="select">Select for Print</option>
 <c:forEach var="purchase"  items="${model.list2a}">
 <option class="${purchase.allocationid}" value = "${purchase.allocationid}" id="${purchase.autoid}">${purchase.allocationid}</option>
 </c:forEach>
      </select>
      </div>

  </div>  
  <div class="col-xs-1">
 <!--   <a href="#" target="_blank" id="vp" onclick="return checkUrl(this)">View Purchase Entry</a>-->
  
  </div>
</div>
    
	  <input form="purchasesave" type="hidden" name="allocationid" id="allocationid">
  <input form="purchasesave" type="hidden" name="supplierid" id="supplier">
<!--  <input form="purchasesave" type="hidden" name="ean1" id="eans">-->  
	   
	     <div class="form-group row" >
  <div class="col-xs-1"></div>
	      
	     	     
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group patid">
	       
	        <p>Code<span></span></p>
      <select class="selectpicker" data-dropup-auto="false" form="ui" data-size="5"  data-show-subtext="true" data-live-search="true" name = "ean" id ="ean"  onchange="add1()" required>
     <option value="Select">New</option>
   
 </select>
	       </div>
	       </div>
	       
	       
	      <div class="col-lg-3 col-md-12 col-xs-12 col-sm-12">
	      <div class="form-group patname">
	       
   <p>Product<span></span></p>
      <select class="selectpicker" data-dropup-auto="false" form="ui" data-size="5" data-show-subtext="true" data-live-search="true" name = "pname" id ="pname"  onchange="add2()" required>
       <option value="Select">New</option>
     </select>
	       </div>
	       </div>
	       
	       
	       
	       <div class="col-xs-1">
	       <div class="form-group">
	      
<br>
<p></p>
	       <button type="button" id="addepr" style="width:80px;" class="button1 btn btn-warning"  onclick="add()"> ADD</button>
	       </div>
	       </div>
	       
	       <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
	       <div class="form-group">
	       <br>
	       <b>Price Entry: </b><input type="radio" name="type" id="cash" value="cash" checked>Total Purchase Price
	        <input type="radio" name="type"  id="ins" value="ins" >Unit CP
	
	       </div>
	       </div>
	       
	       </div>
	       
	       
	        
	   <div class="container">
		<div class="row col-lg-12 col-md-12 col-xs-12">
			<div class="table-responsive"  > 
			<table class="table table-striped table-bordered" id ="myTable">
    <thead>
      <tr> 
    <th>Product Code</th>
    <th>Product Name</th>
    <th>Batch</th>
    <th>Exp Date</th>
    <th>Manufacture Pack Desc</th>
    <th>Manufacturing Pack Size</th>
    <th>Single Unit Desc</th>
    <th>Purchase Qty</th>
    <th>Total Purchase Price</th>
    <th>Unit CP</th>
    <th>Stock Number</th>
    <th>Stock Value at Purchase</th>
    <th></th>
</tr>
    <!-- 
 <th style="width:140px">Product Name</th>
 <th style="width:70px">Batch</th>
 <th style="width:150px">M Date</th>
 <th style="width:150px">Exp Date</th>
 <th style="width:70px">Quantity</th>
 <th style="width:80px">Unit</th>
 <th style="width:90px">Unit CP</th>
 <th style="width:60px">Discount</th>
 <th style="width:60px">Tax</th>
 <th style="width:90px">Unit SP</th>
 <th style="width:70px">Total</th>
 <th style="width:10px">Delete</th>
 <th style="width:20px"></th> -->
    </thead>
   
   <tbody class="tbody">
     
     
     
     
    </tbody>
 
  </table>
  </div>
    </div>
    </div>
   
<br>
<div class="col-xs-1"></div>
	
	 <div class="col-xs-2">
	      
	      <div class="form-group"> 
	      
	      
    <button type="submit" class="btn btn-warning button1" id='gtot' onclick = "return verifyproAdd()">
	  <span class="fa fa-refresh fa-spin"></span> Generate Total</button>
	  </div>
	  </div>
  
	
	      <div class="col-xs-2">
	      
	      <div class="form-group"> 
    <input type="submit"  form="purchasesave" class="btn btn-warning button1" id='bouton-contact' value="Save" onclick = "return verifyproAdd1()">
	  </div>
	  </div>
  
    <div class="div6">
 
 <form  class="form-inline">
  <div class="col-xs-4"></div>
	  
	   <div class="col-lg-5 col-md-12 col-xs-12 col-sm-12">
	      
	      <div class="form-group">
	      <label class="sr-only" for="show">Total</label>
  <table id="meta2" class="buuton2">
  
   <tr>
                    
                    <td colspan="" class="total-line meta-head">Total Items</td>
		      <td style="width:10px" class="total-value"><div id="subtotal">&emsp;<input  form="pentry" style="border:thin solid;" value="0" class="form-control" readonly = "readonly" type= "text" name="totalItems" id="totalItems"> 
      </div>
      </td>
       </tr>
                
                    <br>          
                
             
                <tr>
                
                    <td  colspan="" class="total-line meta-head">Grand Total</td>

		      <td class="total-value balance">&emsp;<input form ="purchasesave" class="form-control" style="border:thin solid;" value="0.00" readonly = "readonly" type= "text" name="grandtotal" id="grandTotal" >
       </tr>
                
                  </table>
   </div>
   </div>  
   </form>
    </div>
 
  
   
  <div class="col-lg-7 col-md-12 col-xs-12 col-sm-12">
 <div class="form-group">
	  <h7> Note: Click on "Generate Total" button each time any changes are done </h7>   
	 
	       
 </div>
 </div>
   	
      
 <input type=""  class="bouton-contact"   form="purchasesave" id="bouton-contact" class="btn btn-warning button1" disabled></input>
	  
	  </div>
	  
	  </div>

	  </div>
	  <script>
datasuccess('<%=request.getParameter("message")%>')
</script>



	  </body>
	
	      
</html>  

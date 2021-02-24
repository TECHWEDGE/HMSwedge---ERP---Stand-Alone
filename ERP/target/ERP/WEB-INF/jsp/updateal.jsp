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
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href="resources/css/NewFilehome2.css">
  <link rel="stylesheet" href="resources/css/NewFileTable.css">

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/filterbtn.js"></script>

<style type="text/css">

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
  max-width:600px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
}

#address2{
	 border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin:0;
  width: 312px;
  height: 50px; 
  float: left;
  padding: 0px 15px;
}

.bouton-contact{
  background: linear-gradient(to right, rgb(36,51,138), rgb(17,142,191));
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
}

.modal-body{
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
#myTable {
    border-collapse: collapse;
    width: 778px !important;
    
    }
#myTable th {
    background: rgb(102, 158, 226);
    color: white;
}
.table-bordered>thead>tr>th {
    border-bottom-width: 1px;
        height: 36px;
        word-break: break-all;
}
 #myTable tbody {
    height: 305px;
    overflow-y: scroll;
}
  #myTable thead,tbody{
  
    display:block;
  }
  .navbar-default .navbar-toggle .icon-bar {
    background-color: #e8e8e8;
}
  @media (max-width:640px){
	.panel-head{
	    font-size: 18px;
	    margin-top: 8px;
	}
	.ctc{
	    margin-top: 89px;
	}
 
    #myTable {
    border-collapse: collapse;
    width: 277px !important;
    
    }
     .button2 {
    margin-top: -10px;
    float: right;
	}
	.button1 {
    float: left;
    margin-top: -10px;
	}
	.font{
    font-size: 13px;
	}
}


</style>




<script type="text/javascript">


function checkid(str){
	
	 
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "Fileno-";
	  
		var str3 = id;
		var res = str1.concat(str3);
	

		document.getElementById("fileno").value = res;
		
		
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "Fileno-";
		  
		
		var res = str1.concat(ida);
		
		document.getElementById("fileno").value = res;
		 
	//	alert(res1);
	}
}
$(document).ready(function(){
    $('.selectpicker').selectpicker({
        required: 'true',
        
    });
});
function checkhome(user){
	//document.getElementById("bc").style.display = "none";
	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}

	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	
	
	
	 var typingTimer;                
 	var doneTypingInterval = 1000;  
 	var a = jQuery('#myInp');

 	a.on('keyup', function () {
 	  clearTimeout(typingTimer);
 	  typingTimer = setTimeout(doneTyping, doneTypingInterval);
 	});

 	a.on('keydown', function () {
 	  clearTimeout(typingTimer);
 	});
 	
 	var srch;
    	function doneTyping () {
    		srch = $('#myInp').val();
    		
    		var url = "/HMS/loadasFilter?srch="+srch+"";
    		var successFn = function(response){
	
    		$('.tabone').hide();
			$('.tabtwo').hide();
	$.each(response.list3, function(index,p1) {
     			var markup2 = "<tr class='tabtwo'><td style='width:236px;max-width:236px'><a href='#'  onclick='copy('"+p1.aid+","+p1.aname+","+p1.arole+"')'>"+p1.aid+"</a></td><td style='width:314px;max-width:314px;'>"+p1.aname+"</td><td style='width:208px;max-width:208px;'>"+p1.arole+"</td></tr>"
     			$('.tabone').hide();
     			$('#myTable .tbody').append(markup2);
 		
		     });
			 
    		   
    		
    	   }
    	   var errorFn = function(e){
    		           alert('Error: ' + e);
    		           }
    		
    	    filterAjax(srch,url,successFn,errorFn)
    	}
}
/* function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
	 */
function check(id){
	alert(id);
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/loadas.html";
	}
}

function addcid(getval){
	var myname = getval.getAttribute('data-value'); 	

	//var cid = document.getElementById("pid").value; 
	var str = myname.split(',');

//	var res4 = $('select[name=pid1]').val();
	  
	  
	   $('select[name=pname1]').val(str[1]);
	   $('#pname').selectpicker('refresh');

	
	//document.getElementById("pname").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	
	
	disable();
}

function clos(){
	window.location.reload();
}
function addcname(getval){
	
	var myname = getval.getAttribute('data-value'); 	
//	var cid = document.getElementById("pname").value; 
	var str = myname.split(',');
	
	// var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(str[0]);
	   $('#pid').selectpicker('refresh');
	   
//	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	
}

function copy(pid){

	var strSplit = pid.split(',');
  document.getElementById("aid").value = strSplit[0];
  document.getElementById("aname").value = strSplit[1];
  document.getElementById("arole").value = strSplit[2];
  changetext(strSplit[2])
  
   $('#myModal').modal('show');

}
function validmess(){
	var a = document.getElementById("pname").value;
	var b = document.getElementById("pid").value;
	var c = document.getElementById("docid").value;

	if(a.length == 0){
	 alert("Please select the Patient Name")
	 return false;
	}
	else if(b.length == 0){
		 alert("Please select the Patient Id")
		 return false;
		}
	else if(c.length == 0){
		 alert("Please select the Doctor Name")
		 return false;
	}
	
	else if(a.length == 0 && b.length == 0 && c.length == 0){
		alert("Please fill all the mandatory fields")
		return false;
	}
	
	else{
		return true;
	}
}

function changetext(val){
	
	if(val.includes("ASSISTANT")){
		$('.text-muted').text('Assistant role can generate bills in "Bill Generation" module and has access to other frontdesk modules.');
	}
	else if(val == "DISPPHARMACIST"){
		$('.text-muted').text('Dispensary pharmacist role has access to all modules in "Dispensary". Also has access to view "Product Master" in "Pharmacy".');
	}
	else if(val == "DISPSALESMANAGER"){
		$('.text-muted').text('Dispensary SalesManager role has access to "Customer Master" and "Sales" modules in "Dispensary". Also has access to view "Product Master" module in "Pharmacy" and "Product Stocks and Pricing" module in "Dispensary".');
	}
	else if(val.includes("PHARMACIST")){
		$('.text-muted').text('Pharmacist role has access to all modules in "Pharmacy".');
	}
	else if(val.includes("SALESMANAGER")){
		$('.text-muted').text('SalesManager role has access to "Customer Master" and "Sales" modules in "Pharmacy". Also has access to view "Product Master" module and "Product Stocks and Pricing" module in "Pharmacy".');
	}
	
	else{
		$('.text-muted').text('Accounts Admin role can edit generated bills in "Bill Generation" module and can add/edit in "Bill Configuration". Also has access to other frontdesk modules.');
	}
}

</script>
<script type="text/javascript">
$(document).ready(function () {

	
	 
	
		 $('input[type="time"][value="now"]').each(function(){    
		   var d = new Date(),        
		       h = d.getHours(),
		       m = d.getMinutes();
		   if(h < 10) h = '0' + h; 
		   if(m < 10) m = '0' + m; 
		   $(this).attr({
		     'value': h + ':' + m
		   });
		 });
		
		 $("#time").on("focusout",function(e){

		 var today = new Date().toISOString().split('T')[0];
		
		 if(today == document.getElementById("appointment").value){
		 var d = new Date(),        
		     h = d.getHours(),
		     m = d.getMinutes();
		 if(h < 10) h = '0' + h; 
		 if(m < 10) m = '0' + m; 
		 var time = h + ':' + m;
		 
		     var currentTime = new Date();
		     var userTime = $("#time").val().split(":"); 
		     if(currentTime.getHours() > parseInt(userTime[0])){
		   	 alert("Cannot create appointments for past dates")
		   	 $( "#time" ).val(time);
		         $(this).focus();                
		     }
		     /*
		     if(currentTime.getHours() <= parseInt(userTime[0])){
		         if(currentTime.getMinutes() > parseInt(userTime[1])){
		       	 alert("Cannot create appointments for future dates");
		       	 $( "#time" ).val(time);
		         $(this).focus();
		         }
		     }
		 */    
		 }
		 });

});
</script>

</head>

<sec:authentication property="principal.authorities" var="username" />

<body onload = "checkhome('<c:out value="${username}" />')">

<nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Assistant Role Details</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav">
	      <li class="active"><a id="ho" href="home.html">Home</a></li>
	    </ul>
	</div>
  </div>
</nav>

<div class="container ctc">

  <div class="panel panel-default">
    <div class="panel-heading p-head">
    
    	<div class="col-xs-6 col-sm-5 col-lg-9 col-md-9">
    		<h3 class="text-center panel-head">Assistant Role Management</h3>
    	</div>
    	<div class="col-xs-6 col-sm-5 col-lg-3 col-md-3 p-head2">
    		<p class="glyphicon glyphicon-search g-search"></p><input id="myInp" class="form-control" placeholder="Search by Staff Name or Id">
    	</div>
    
    </div>
    
    <div class="panel-body">
    
    
    	<div class="">
			  
			  <table class="table table-bordered table-hover table-condensed" id="myTable" style="width: 2330px;"  id="myTable">
    <thead class="thead">
      <tr>
        
        <th style="width:237px;max-width:237px;word-break: break-all;">Assistant Id</th>
        <th style="width:314px;max-width:314px;word-break: break-all;">Assistant Name</th>
        <th style="width:225px;max-width:225px;word-break: break-all;">Assistant Role</th>
      </tr>
    </thead>
    <tbody class="tbody">
     <c:forEach var="p1"  items="${model.list3}">
     <tr class="tabone">
        <!-- <td style="width:236px;">1<td>
        <td style="width:297px;">2</td>
        <td style="width:208px;">3</td> -->
        <td style="width:236px;max-width:236px;"><a href="#"  onclick="copy('${p1.aid},${p1.aname},${p1.arole}')">${p1.aid}</a></td>
        <td style="width:314px;max-width:314px;">${p1.aname}</td>
        <td style="width:208px;max-width:208px;">${p1.arole}</td>
      </tr>
      </c:forEach>
     
      
     
    </tbody>
  </table>
  
  
		</div>
    	
    
    </div>
    
    <div class="panel-footer"></div>
  </div>
  
</div>


     
     <div class="container">
  <!-- Trigger the modal with a button -->

  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    
       <form id="form1" action="saveas.html" method="post">  
  
        <h1><button type="submit" id="bouton-contact" onclick="" class="btn btn-warning button2" >Update</button> 
       <span id="ch" class="font">Change Assistant Roles </span>
        <button type="button" id="close" class="btn btn-warning button1" onclick="clos()">Close</button> 
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
            <p>Assistant Name<span>*</span></p>
          <input type="text" class="form-control input-sm" form="form1" name="aname" id="aname" required>
       
	</div>
  </div>
  <div class="col-xs-2"></div>
   <div class="col-xs-4">
  <div class="form-group">
      <p>Assistant ID<span>*</span></p>
      <input type="text" class="form-control input-sm" form="form1" name="aid" id="aid" required>
   
</div>
  </div>
  
 </div>
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
               <p>Assign Role<span>*</span></p>
    <select class="form-control" form="form1" data-size="5" data-width="100%" name="arole" id="arole" onchange="changetext(this.value)" required >
           <option value="Accounts Admin">Accounts Admin</option>
           <option value="ASSISTANT">Assistant</option>
           <option value="PHARMACIST">PHARMACIST</option>
           <option value="SALESMANAGER">SALESMANAGER</option>
           <option value="DISPPHARMACIST">DISPENSARY PHARMACIST</option>
           <option value="DISPSALESMANAGER">DISPENSARY SALESMANAGER</option>
            </select>
             <small class="text-muted">Accounts Admin role has access to edit bill modules and also to other frontdesk modules.</small>
            
            </div>
  </div>
  </div>

 
  <button type="" id="" class="bouton-contact"  ></button>
       </form>
       </div>
       
       
  
       </div>
   </div>
 
<script>
function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable tbody").rows;
    
    for (var i = 0; i < rows.length; i++) {
        var firstCol = rows[i].cells[0].textContent.toUpperCase();
        var secondCol = rows[i].cells[1].textContent.toUpperCase();
        var thirdCol = rows[i].cells[2].textContent.toUpperCase();
        if (firstCol.indexOf(filter) > -1 || secondCol.indexOf(filter) > -1 || thirdCol.indexOf(filter) > -1) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }      
    }
}

/* document.querySelector('#myInp').addEventListener('input', filterTable, false); */
</script>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>
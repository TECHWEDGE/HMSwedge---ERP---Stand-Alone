<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>HMS Wedge</title>
  
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html;" charset="utf-8"/>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"> -->
<link rel="stylesheet" href="resources/css/Login.css">
	
<script type="text/javascript" src="resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="resources/js/moment.min.js"></script>

<style>

</style>

<script type="text/javascript">
function handleSelect(elm)
{
window.location = elm.value;
}

function formab(){
	alert();
	document.getElementById("gh").submit();
	document.getElementById("f").submit();
	alert();
}

function copyval(val){
	$("#exp").text("Licence will expire on "+val)
}

function setData(getval){
	window.localStorage.setItem("myInfo",getval.getAttribute('value'));
	window.localStorage.setItem("myInfon",getval.getAttribute('data-value'));
	window.localStorage.setItem("myInfot",getval.getAttribute('data-val'));
	window.name = getval.getAttribute('value')
	
}
function verbranch(){
	
	if($('#branch').val() == "select" || $('#branch').val() == null){
		alert('Please select the branch')
		return false;
		
	}else{
		doAjaxCreateSess($('#branch').val())
		return true;
	}
}


function  doAjaxPostNew(met,uri,data1,successFn,errorFn,ctype,dat) {
   // alert(uri)
    $.ajax({
	  
	           type: met,
	   
	           url: uri,
	           data: "tabvalue="+data1,
	           async : false,
	           dataType: dat,
	           contentType: ctype,
	           success: successFn,
             error: errorFn
            
	        	           });
   
	        	  }
function doAjaxCreateSess(value){
	 
var uri = "/ERP/crsess?location="+value+"";
	  
	  var data = 0;
	 
var successFn =  function(response){
	  if(response.toString() == "success")   
  {
alert('success')
  }
	 
  };
  

	
 var errorFn =  function(e){
	  
	           alert('Error: ' + e);
	  
        }
 var get = "GET";
 doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8","text"); 
}
</script>
  
</head>

<body>
 <nav class="navbar navbar-default navbar-fixed-top" id="myHeader">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Login</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="/ERP/welcome">Home</a></li>
	      <li><a href="/ERP/licence">Licence</a></li>
	    </ul>
	    
	    <ul class="nav navbar-nav navbar-right">
      		<li class="ls"><a href="#" id="exp"style="cursor:default;color:white"></a></li>
    	</ul>
	</div>
  </div>
</nav>


<div class="Container mt">

	<div class="row mt2">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-offset-2 col-lg-8 HMS-title">
			<div><img src="resources/icons/cms logo.png"></div>
			<h1>Welcome to HMS Wedge</h1>
		</div>
	</div>
	
	<c:if test="${param.error == 'true'}">
         <div style="color:red;" class="text-center">
          
               <h5 style="margin-left: -97px;"> Login Failed!!! 
                Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</h5>
                 
         </div>
</c:if>

<h3 style="color:red;">${message}</h3>
	
	<div class="row">
		<div class="col-xs-offset-2 col-xs-10 col-sm-12 col-md-6 col-lg-offset-4 col-lg-3 form">
			<form name='f' id='f' action="${pageContext.request.contextPath}/j_spring_security_check" method='POST' >
				<h4>Login to your account</h4>
				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-11 col-lg-12">
						<div class="from-group">
							<input class="form-control" form="f"  type="text" name ="username" id ="username" placeholder="Username">
						</div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-11 col-lg-12">
						<div class="from-group">
							<input class="form-control" form="f" type="password" name = "password"  id ="password" placeholder="Password">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-11 col-lg-12">
						<div class="from-group">
							<select class="selectpicker form-control" data-dropup-auto="false" data-size="5" data-live-search="true" form="f" name="branch" id="branch" onchange="setData(this.options[this.selectedIndex])" >
								<option value="select" selected disabled>Select</option>
							        <c:forEach var="p"  items="${model.list2}">
							        <option value="${p.id}" data-value="${p.name}" data-val = "${p.type}">${p.name}</option>
							        </c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-11 col-lg-12 login">
						<div class="from-group">
							<input form="f" type="submit" class="btn" onclick="return verbranch()" value="Login">
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	
</div>


<script>
// Toggle Function
$('.toggle').click(function(){
  // Switches the Icon
  $(this).children('i').toggleClass('fa-pencil');
  // Switches the forms  
  $('.form').animate({
    height: "toggle",
    'padding-top': 'toggle',
    'padding-bottom': 'toggle',
    opacity: "toggle"
  }, "slow");
});

</script>
<c:forEach var="p"  items="${model.list}">
<script>
copyval('<c:out value="${p.expiry}" />')
</script>
</c:forEach>


<div class="container-fluid mtf">
<div class="row">
<div class="footer">
  <p class="pl">&copy; <a href="https://www.techwedgeconsultants.com/" target="_blank" class="twc">Techwedge Consultants</a>
  Address: No 6, 1st Floor, Aditya Complex, 4th Cross, 5th Main, Hampi Nagar, Vijayanagar, Bangalore 560104</p>
  <p class="ml">Mob: +91 98455 32193</p>
</div>
</div>
</div>


</body>
</html>

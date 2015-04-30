<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"	href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/goodman.css">
<link rel="stylesheet" href="css/bootstrap-select.css" type="text/css" />
<link rel="apple-touch-icon-precomposed" sizes="144x144"	href="img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"	href="img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"	href="img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"	href="img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="img/favicon.png">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/filter.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>

</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<%@include file="Header.jsp"%>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div id="hiddenDiv" class="row clearfix" style="display: none;">
						<form role="form" action="addCustomer" method="post">
							<div class="col-md-3 column">
								<div class="form-group">
									 <label for="customerID">Customer ID</label>
									 <input type="text" class="form-control" name="customerID" id="customerID" required/>
								</div>
								<div class="form-group">
									<label for="firstName">First Name</label>
									<input type="text" class="form-control" name="firstName" id="firstName" />
								</div>
								<div class="form-group">
									<label for="lastName">Last Name</label>
									<input type="text" class="form-control" name="lastName" id="lastName" />
								</div>
								<div class="form-group">
									<label for="vehicle">Vehicles</label><br>
									<select  class="selectpicker" id="chooseVehicle"  name="vehicle">
								    	<c:forEach items="${customers}" var ="customer">
								        	<optgroup label="${customer.firstName} ${customer.lastName}">
									        	<c:forEach items="${customer.vehicles}" var ="vehicle">
									   				<option value="${vehicle.vehicleId}">${vehicle.manufacturer}-${vehicle.model}-${vehicle.year}</option>
									   			</c:forEach>
								   			</optgroup>
								      	</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-3 column">
								
								<div class="form-group">
									<label for="email">Email</label>
									<input type="text" class="form-control" name="email" id="email"/>
								</div>
								<div class="form-group">
									<label for="phone">Phone</label>
									<input type="text" class="form-control" name="phone" id="phone"/>
								</div>
								<button type="button" class="btn btn-danger" onclick="hideDIV()">cancel</button>
								<button type="submit" class="btn btn-success">Submit</button>
								
							</div>
							<div class="col-md-6 column">
							
							</div>
						</form>
					</div>
					<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-2 column">
							<button type="button" class="btn btn-primary" onclick="exposedDIV()">Add New Customer</button>
						</div>
						<div class="col-md-10 column">
							<div class="input-group">
					       		<span class="input-group-addon">Filter</span>
					    		<input id="filter" type="text" class="form-control" placeholder="Type here...">
							</div>
						</div>
					</div>
	
				<table class="table table-striped">
					<thead>
						<th>ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Phone</th>
						</tr>
					</thead>
					<tbody class="searchable">
						<c:forEach items="${customers}" var="customer" varStatus="counter">
							<tr>
								<td>${customer.id}</td>
								<td>${customer.firstName}</td>
								<td>${customer.lastName}</td>
								<td>${customer.email}</td>
								<td>${customer.phone}</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	

function exposedDIV() {
    document.getElementById("hiddenDiv").style.display = "inline";
}

function hideDIV() {
    
    document.getElementById("customerID").value = '';
    document.getElementById("firstName").value = '';
    document.getElementById("lastName").value = '';
    document.getElementById("email").value = '';
    document.getElementById("phone").value = '';
    document.getElementById("hiddenDiv").style.display = "none";
}

$(document).ready(function() {
	  
    $('.selectpicker').selectpicker({
        size: 4
    });
});


</script>
</body>
</html>

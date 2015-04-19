<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home Page</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
	<link rel="stylesheet" type="text/css" href="css/goodman.css">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
 	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  	<link rel="shortcut icon" href="img/favicon.png">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/filter.js"></script>
	
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<%@include file="Header.jsp"%>
			<div class="row clearfix">
			
				<div class="col-md-12 column">
					<div class="input-group"> <span class="input-group-addon">Filter</span>
					    <input id="filter" type="text" class="form-control" placeholder="Type here...">
					</div>
					<table class="table table-striped">
					    <thead>
					        <tr>
								<th>Vehicle Id</th><th>Model</th><th>Engine</th><th>Year</th><th>Customer Name</th>
							</tr>
					    </thead>
					    <tbody class="searchable">
					        <c:forEach items="${vehicles}" var ="vehicle" varStatus="counter">
								<tr>
									<td>${vehicle.vehicleId}</td>
									<td>${vehicle.manufacturer} ${vehicle.model}</td>
									<td>${vehicle.engine}</td>
									<td>${vehicle.year}</td>
									<td>${vehicle.customer.firstName} ${vehicle.customer.lastName}</td>
									<td></td>
								</tr>
							</c:forEach>
					    </tbody>
					</table>
				</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>
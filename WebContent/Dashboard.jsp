<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<script type="text/javascript" src="js/scripts.js"></script>
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<%@include file="Header.jsp" %>
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-430508">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-1" data-toggle="tab">Machine Fault</a>
					</li>
					<li>
						<a href="#panel-2" data-toggle="tab">Maintenance Needed</a>
					</li>
					<li>
						<a href="#panel-3" data-toggle="tab">Machine In Work</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
						<p>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>DTC</th><th>Date</th><th>Level</th><th>Type</th><th>Description</th><th>Status</th><th>Customer</th><th>Vehicle</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${vehicleFaults}" var ="vehicleFault">
										<tr class='${vehicleFault.dtc.dtcCssClass}'>
											<td>${vehicleFault.dtc.dtc}</td><td>${vehicleFault.dateTime}</td><td>${vehicleFault.level}</td><td>${vehicleFault.type}</td><td>${vehicleFault.details}</td><td>${vehicleFault.dtcStatus}</td><td>${vehicleFault.device.vehicle.customer.firstName} ${vehicleFault.device.vehicle.customer.lastName}</td><td>${vehicleFault.device.vehicle.manufacturer} ${vehicleFault.device.vehicle.model}</td>
										</tr>
								    </c:forEach>
								</tbody>
							</table>
						</p>
					</div>
					<div class="tab-pane" id="panel-2">
						<p>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>
											#
										</th>
										<th>
											Model
										</th>
										<th>
											VehicleId
										</th>
										<th>
											Customer  
										</th>
										<th>
											Next Service
										</th>
										<th>
											Service type
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<tr class="danger">
										<td>
											1
										</td>
										<td>
											Volvo L120F
										</td>
										<td>
											48-515-39
										</td>
										<td>
											Nir Brosh
										</td>
											<td>
											213 hours
										</td>
										<td>
											2000
										</td>
									</tr>
									<tr class="danger">
										<td>
											2
										</td>
										<td>
											Volvo L120F
										</td>
										<td>
											48-515-39
										</td>
										<td>
											Nir Brosh
										</td>
											<td>
											213 hours
										</td>
										<td>
											2000
										</td>
									</tr>
									<tr class="warning">
										<td>
											3
										</td>
										<td>
											Volvo L120F
										</td>
										<td>
											48-515-39
										</td>
										<td>
											Nir Brosh
										</td>
											<td>
											213 hours
										</td>
										<td>
											2000
										</td>
									</tr>
									<tr class="success">
										<td>
											4
										</td>
										<td>
											Volvo L120F
										</td>
										<td>
											48-515-39
										</td>
										<td>
											Nir Brosh
										</td>
											<td>
											213 hours
										</td>
										<td>
											2000
										</td>
									</tr>
									<tr class="active">
										<td>
											5
										</td>
										<td>
											Volvo L120F
										</td>
										<td>
											48-515-39
										</td>
										<td>
											Nir Brosh
										</td>
											<td>
											213 hours
										</td>
										<td>
											2000
										</td>
									</tr>
								</tbody>
							</table>
						</p>
					</div>
					<div class="tab-pane" id="panel-3">
						<p>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>
											#
										</th>
										<th>
											Customer
										</th>
										<th>
											Model
										</th>
										<th>
											VehicleId
										</th>
										<th>
											Engine hours 
										</th>
										<th>
											Engine RPM	r/min										
										</th>
										<th>
											fuel consumption L/H
										</th>
										<th>
											Engine Temp C
										</th>
										<th>
											Location
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											Reut Bone
										</td>
										<td>
											Volvo A30F
										</td>
										<td>
											42-799-64
										</td>
										<td>
											2035
										</td>
											<td>
											1450
										</td>
										<td>
											9.4
										</td>
										<td>
											86
										</td>
										<td>
											Eilat, Israel
										</td>
									</tr>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											Reut Bone
										</td>
										<td>
											Volvo A30F
										</td>
										<td>
											42-799-64
										</td>
										<td>
											2035
										</td>
											<td>
											1450
										</td>
										<td>
											9.4
										</td>
										<td>
											86
										</td>
										<td>
											Eilat, Israel
										</td>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											Reut Bone
										</td>
										<td>
											Volvo A30F
										</td>
										<td>
											42-799-64
										</td>
										<td>
											2035
										</td>
											<td>
											1450
										</td>
										<td>
											9.4
										</td>
										<td>
											86
										</td>
										<td>
											Eilat, Israel
										</td>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											Reut Bone
										</td>
										<td>
											Volvo A30F
										</td>
										<td>
											42-799-64
										</td>
										<td>
											2035
										</td>
											<td>
											1450
										</td>
										<td>
											9.4
										</td>
										<td>
											86
										</td>
										<td>
											Eilat, Israel
										</td>
									</tr>
								</tbody>
							</table>
						</p>
					</div>
				</div>
			</div>
			<%@include file="Address.html" %>
		</div>
	</div>
</div>

</body>
</html>
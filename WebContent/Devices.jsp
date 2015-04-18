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
	<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/goodman.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-editable.css">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
 	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  	<link rel="shortcut icon" href="img/favicon.png">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/filter.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
	
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<%@include file="Header.jsp"%>
			<div class="row clearfix">
			<div class="col-md-1 column"></div>
				<div class="col-md-11 column">
					<div class="input-group"> <span class="input-group-addon">Filter</span>
					    <input id="filter" type="text" class="form-control" placeholder="Type here...">
					</div>
					<table class="table table-striped">
					    <thead>
					        <tr>
								<th>#</th><th>DeviceId</th><th>VehicleId</th><th>Customer</th><th>Model</th><th>Year</th><th>Initial Mileage</th><th>Initial Engine Hours</th>
							</tr>
					    </thead>
					    <tbody class="searchable">
					        <c:forEach items="${devices}" var ="device" varStatus="counter">
								<tr>
									<td>${counter.count}</td>
									<td>${device.deviceId}</td>
									<td>${device.vehicle.vehicleId}</td>
									<td>${device.vehicle.customer.firstName} ${device.vehicle.customer.lastName}</td>
									<td>${device.vehicle.model}</td>
									<td>${device.vehicle.year}</td>
									<td>${device.initialMileage}</td>
									<td><a href="#" id="${device.deviceId}" data-type="text" data-pk="${device.deviceId}" data-name="InitialEngineHours" data-url="EditAttribute?tableName=Devices&idColumnName=DeviceId" data-original-title="Enter Initial Engine Hours"> ${device.initialEngineHours}</a></td>
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

<c:forEach items="${devices}" var ="device" varStatus="counter">
<script>
$('#'+"${device.deviceId}").editable();
</script>
</c:forEach>

</body>
</html>
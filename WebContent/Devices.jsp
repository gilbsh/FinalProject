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
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>

	
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<%@include file="Header.jsp"%>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div id="hiddenDiv" class="row clearfix" style="display: none;">
						<form role="form" action="addDevice" method="post">
							<div class="col-md-3 column">
								<div class="form-group">
									 <label for="deviceID">Device ID</label>
									 <input type="text" class="form-control" name="deviceID" id="deviceID" required/>
								</div>
								<div class="form-group">
									<label for="PurchaseDate">Purchase Date</label>
									<input type="date" class="form-control" name="purchaseDate" id="purchaseDate" />
								</div>
								<div class="form-group">
									<label for="vehicle">Vehicles</label><br>
									<select  class="selectpicker" id="chooseVehicle"  name="vehicle">
								    	<c:forEach items="${customers}" var ="customer">
								        	<optgroup label="${customer.firstName} ${customer.lastName}"></optgroup>
								        	<c:forEach items="${customer.vehicles}" var ="vehicle">
								   				<option value="${vehicle.vehicleId}">${vehicle.manufacturer}-${vehicle.model}-${vehicle.year}</option>
								   			</c:forEach>
								      	</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-3 column">
								
								<div class="form-group">
									<label for="InitialMileage">Initial Mileage</label>
									<input type="number" class="form-control" name="InitialMileage" id="InitialMileage" min="0"/>
								</div>
								<div class="form-group">
									<label for="InitialEngineHours">Initial Engine Hours</label>
									<input type="number" class="form-control" name="InitialEngineHours" id="InitialEngineHours" min="0" />
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
							<button type="button" class="btn btn-primary" onclick="exposedDIV()">Add new device</button>
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
					        <tr>
								<th>#</th><th>DeviceId</th><th>VehicleId</th><th>Customer</th><th>Model</th><th>Year</th><th>Initial Mileage</th><th>Initial Engine Hours</th><th>Location</th>
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
									<td><a href="#" id="initialMileage${device.deviceId}" data-type="text" data-pk="${device.deviceId}" data-name="InitialMileage" data-url="EditAttribute?tableName=Devices&idColumnName=DeviceId" data-original-title="Enter Initial Mileage">${device.initialMileage}</td>
									<td><a href="#" id="initialEngineHours${device.deviceId}" data-type="text" data-pk="${device.deviceId}" data-name="InitialEngineHours" data-url="EditAttribute?tableName=Devices&idColumnName=DeviceId" data-original-title="Enter Initial Engine Hours"> ${device.initialEngineHours}</a></td>
									<td><input src="img/location.png" type="image"  data-toggle="modal" data-target=".bs-example-modal-lg" width="50" height="25"></td>
								</tr>
							</c:forEach>
					    </tbody>
					</table>
					<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
 						<div class="modal-dialog modal-lg" >
  							<div class="modal-content" id="contact-modal">
  								<div class="modal-header">
								    <button type="button" class="close" data-dismiss="modal">�</button>
								    <h3></h3>
								</div>
    							<div class="modal-body" >
    								<div id="map-canvas" style="width: 500px; height: 400px"></div>
  								</div>
						    </div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:forEach items="${devices}" var ="device" varStatus="counter">
<script>
$('#initialEngineHours'+"${device.deviceId}").editable();
$('#initialMileage'+"${device.deviceId}").editable();
</script>
</c:forEach>
	<script>
	

function exposedDIV() {
    document.getElementById("hiddenDiv").style.display = "inline";
}

function hideDIV() {
    
    document.getElementById("deviceID").value = '';
    document.getElementById("InitialMileage").value = '';
    document.getElementById("InitialEngineHours").value = '';
    document.getElementById("purchaseDate").value = '';
    document.getElementById("hiddenDiv").style.display = "none";
}


function initialize() {
	  var myLatlng = new google.maps.LatLng(31.866577,34.887627);
	  var mapOptions = {
	    zoom:14,
	    center: myLatlng
	  }
	  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	  var marker = new google.maps.Marker({
	      position: myLatlng,
	      map: map,
	      title: 'Vehicle Location'
	  });
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	
	$("#map-canvas").on("shown.bs.modal", function () {
	    google.maps.event.trigger(map, "resize");
	});
	
	$(document).ready(function() {
	    
	    $('.selectpicker').selectpicker({
	        size: 4
	    });
	});

</script>

</body>
</html>
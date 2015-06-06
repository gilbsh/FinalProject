<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/c3.css">
<link rel="stylesheet" type="text/css" href="css/goodman.css">
<link rel="stylesheet" href="css/bootstrap-select.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-multiselect.css"
	type="text/css" />
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="img/favicon.png">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/d3.min.js"></script>
<script type="text/javascript" src="js/c3.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<!-- <script type="text/javascript" src="js/scripts.js"></script>-->
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<%@include file="Header.jsp"%>
				<h3>Explore your vehicles...</h3>
				<form role="form" action="graphData" method="post">
					<div class="col-md-4 column">
						<div class="control-group select optional">
							<label for="vehicle">Vehicles</label><br> <select required
								id="chooseVehicle" multiple="multiple" name="vehicls[]" size="2">
								<c:forEach items="${customers}" var="customer">
									<optgroup label="${customer.firstName} ${customer.lastName}">
										<c:forEach items="${customer.vehicles}" var="vehicle">
											<option value="${vehicle.vehicleId}">${vehicle.manufacturer}-${vehicle.model}-${vehicle.year}</option>
										</c:forEach>
									</optgroup>
								</c:forEach>
							</select><br> <label for="Parameter">Parameter</label><br> <select
								class="selectpicker" name="parameter">
								<c:forEach items="${parameters}" var="parameter">
									<option value="${parameter.parameterName}">${parameter.parameterName}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="col-md-3 column">
						<div class="form-group">
							<label for="aggregationType">Aggregation Type</label><br> <select
								class="selectpicker" Id="aggregationType" name="aggregationType">
								<option>MAX</option>
								<option>MIN</option>
								<option>AVG</option>
							</select> <label for="timeResolution ">Time Resolution</label><br> <select
								class="selectpicker" Id="timeResolution" name="timeResolution">
								<option>Day</option>
								<option>Hour</option>
								<option>Minute</option>
							</select>
						</div>
					</div>

					<div class="col-md-2 column">
						<label for="endDate">End Date</label> <input type="date" required
							class="form-control" name="endDate" id="endDate" /> <br>
						<button type="submit" class="btn btn-primary">Execute</button>
					</div>
				</form>
			</div>
			<br>
			<div class="row clearfix">
				<div class="text-center">
					<h3>${headLine}</h3>
				</div>
				<div id="chart"></div>
			</div>
			<div class="row clearfix">
				<%@include file="Address.html"%>
			</div>
		</div>
</body>

<script>
	$(document).ready(function() {
		$('#chooseVehicle').multiselect({
			enableFiltering : true,
			enableClickableOptGroups : true,
		});

		$('.selectpicker').selectpicker({
			size : 4
		});

		$('#chart').css("position", "")
	});
</script>

	<script>
		var obj = ${chart};
		console.log(obj);
		var chart = c3.generate(obj);
		$("#chart").children(":first").css( "overflow", "visible" );
	</script>

</html>
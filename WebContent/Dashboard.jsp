<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
					<li>
						<a href="#panel-1" data-toggle="tab">Fault Tools</a>
					</li>
					<li class="active">
						<a href="#panel-2" data-toggle="tab">Waiting Tools</a>
					</li>
					<li class="active">
						<a href="#panel-3" data-toggle="tab">Tools In Work</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-1">
						<p>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>
											#
										</th>
										<th>
											Fault
										</th>
										<th>
											Engine hours
										</th>
										<th>
											VehicleId
										</th>
										<th>
											Model
										</th>
										<th>
											Customer
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Default
										</td>
									</tr>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Approved
										</td>
									</tr>
									<tr class="success">
										<td>
											2
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											02/04/2012
										</td>
										<td>
											Declined
										</td>
									</tr>
									<tr class="warning">
										<td>
											3
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											03/04/2012
										</td>
										<td>
											Pending
										</td>
									</tr>
									<tr class="danger">
										<td>
											4
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											04/04/2012
										</td>
										<td>
											Call in to confirm
										</td>
									</tr>
								</tbody>
							</table>
						</p>
					</div>
					<div class="tab-pane active" id="panel-2">
						<p>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>
											#
										</th>
										<th>
											VehicleId
										</th>
										<th>
											Model
										</th>
										<th>
											Hours till next treatment  
										</th>
										<th>
											treatment type
										</th>
										<th>
											Customer
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Default
										</td>
									</tr>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Approved
										</td>
									</tr>
									<tr class="success">
										<td>
											2
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											02/04/2012
										</td>
										<td>
											Declined
										</td>
									</tr>
									<tr class="warning">
										<td>
											3
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											03/04/2012
										</td>
										<td>
											Pending
										</td>
									</tr>
									<tr class="danger">
										<td>
											4
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											04/04/2012
										</td>
										<td>
											Call in to confirm
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
											VehicleId
										</th>
										<th>
											Model
										</th>
										<th>
											Fault
										</th>
										<th>
											Engine TMP
										</th>
										<th>
											Engine hours
										</th>
										<th>
											fuel consumption
										</th>
										<th>
											Location
										</th>
										<th>
											Customer
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Default
										</td>
									</tr>
									<tr class="active">
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Approved
										</td>
									</tr>
									<tr class="success">
										<td>
											2
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											02/04/2012
										</td>
										<td>
											Declined
										</td>
									</tr>
									<tr class="warning">
										<td>
											3
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											03/04/2012
										</td>
										<td>
											Pending
										</td>
									</tr>
									<tr class="danger">
										<td>
											4
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											04/04/2012
										</td>
										<td>
											Call in to confirm
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
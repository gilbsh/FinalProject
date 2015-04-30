<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/goodman.css">
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
<script type="text/javascript" src="js/filter.js"></script>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<%@include file="Header.jsp"%>
			<div class="col-md-12 column">
				<div class="tabbable" id="tabs-430508">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-1" data-toggle="tab">Machine
								Fault</a></li>
						<li><a href="#panel-2" data-toggle="tab">Maintenance
								Needed</a></li>
						<li><a href="#panel-3" data-toggle="tab">Rule Alerts</a></li>
					</ul>
					<div class="tab-content">
						<%@include file="VehicleFaultsTable.jsp"%>
						<%@include file="MaintenanceNeededTable.jsp"%>
						<%@include file="RuleAlerts.jsp"%>
					</div>
				</div>
			</div>
			<%@include file="Address.html"%>
		</div>
	</div>
</body>
</html>
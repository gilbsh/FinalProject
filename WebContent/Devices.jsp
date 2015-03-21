<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
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
		<div class="col-md-12 column">
		<%@include file="Header.jsp"%>
			<div class="row clearfix">
			<div class="col-md-1 column"></div>
				<div class="col-md-11 column">
					<div class="tabbable" id="tabs-10795">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#panel-603078" data-toggle="tab">Add</a>
							</li>
							<li>
								<a href="#panel-411325" data-toggle="tab">Edit</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-603078">
								<p>
									<%@include file="AddDevice.jsp" %>
								</p>
							</div>
							<div class="tab-pane" id="panel-411325">
								<p>
									<%@include file="EditDevice.jsp" %>
								</p>
							</div>
						</div>
					</div>
				</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>
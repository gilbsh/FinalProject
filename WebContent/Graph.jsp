<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<!-- <script type="text/javascript" src="js/scripts.js"></script>-->
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<%@include file="Header.jsp"%>
			<div class="col-md-12 column">
				<h3>Welcome To Goodman corporation not official Website.</h3>
				<div id="chart"></div>
			</div>
			<%@include file="Address.html"%>
		</div>
	</div>
</body>

<script>
	var chart = c3.generate({
		data : {
			columns : [ [ 'data1', 30, 200, 100, 400, 150, 250 ],
					[ 'data2', 50, 20, 10, 40, 15, 25 ] ]
		}
	});

	setTimeout(function() {
		chart.load({
			columns : [ [ 'data1', 230, 190, 300, 500, 300, 400 ] ]
		});
	}, 2000);

	setTimeout(function() {
		chart.load({
			columns : [ [ 'data3', 130, 150, 200, 300, 200, 100 ] ]
		});
	}, 4000);

	setTimeout(function() {
		chart.unload({
			ids : 'data1'
		});
	}, 6000);
</script>
</html>
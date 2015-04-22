<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Goodman</title>
	<link rel="stylesheet" type="text/css" href="css/goodman.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<%@include  file="Headline.html" %>			
			<div class="span8 offset2">
				<h3 class="text-muted">
					Please Enter your email and password
				</h3>
				<form role="form" action="LoginServlet" method="post">
					<div class="form-group">
						 <label for="rmail">Email address</label><input name="email" type="email" class="form-control" id="exampleInputEmail1" required />
					</div>
					<div class="form-group">
						 <label for="password">Password</label><input name = "password" type="password" class="form-control" id="exampleInputPassword1" required />
					</div>
					<button type="submit" class="btn btn-default">Log In</button>
				</form>
				<div class="errorMessage" >${message}</div>
			</div>
		</div>
	</div>
</body>
</html>
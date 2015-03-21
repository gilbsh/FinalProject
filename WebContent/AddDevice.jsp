<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home Page</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
	<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
	<link rel="stylesheet" href="css/bootstrap-select.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="css/goodman.css">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
 	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  	<link rel="shortcut icon" href="img/favicon.png">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<script type="text/javascript" src="js/bootstrap-select.js"></script>
</head>
<body>
<script type="text/javascript">
    $(document).ready(function() {	    	
        $('.multiSelection').each(
        	function(){
        		$(this).multiselect({
           		includeSelectAllOption: true,
            	enableFiltering: true
       		 })
       		});
        
        $('.selectpicker').selectpicker({
            size: 4
        });
    });
</script>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<form role="form" class="form-inline">
						<div class="form-group">
							 <label for="exampleInputEmail1">Device ID</label>
							 <input class="form-control" id="exampleInputEmail1" /><br>
						</div><br>
						
						<div class="form-group">
							 <label for="exampleInputPassword1">Chassis Number</label><br>														
								<select class="selectpicker">
									<%-- <c:forEach items="${parameters}" var ="parameter">
				    				<option>${parameter.parameterName}</option>
			        	    		</c:forEach> --%>
			        	    		<option>Between</option>
									<option>Not Between</option>
									<option>></option>
									<option>&lt</option>
									<option>%</option>
								</select>
						</div><br>
						<div class="form-group">
							 <label for="exampleInputPassword1">Licence Number</label><br>														
								<select class="selectpicker">
									<%-- <c:forEach items="${parameters}" var ="parameter">
				    				<option>${parameter.parameterName}</option>
			        	    		</c:forEach> --%>
			        	    		<option>Between</option>
									<option>Not Between</option>
									<option>></option>
									<option>&lt</option>
									<option>%</option>
								</select>
						</div><br><br>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
				<div class="col-md-6 column">
					<form role="form" class="form-inline">
						<div class="form-group">
							 <label for="exampleInputEmail1">Email address</label><input type="email" class="form-control" id="exampleInputEmail1" />
						</div>
						<div class="form-group">
							 <label for="exampleInputPassword1">Password</label><input type="password" class="form-control" id="exampleInputPassword1" />
						</div>
						<div class="form-group">
							 <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile" />
							<p class="help-block">
								Example block-level help text here.
							</p>
						</div>
						<div class="checkbox">
							 <label><input type="checkbox" /> Check me out</label>
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
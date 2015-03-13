<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<!--  <script type="text/javascript" src="js/scripts.js"></script>-->
</head>
<body>
<div class="container">

	<script type="text/javascript">
	    $(document).ready(function() {
	        $('#example-post').multiselect({
	            includeSelectAllOption: true,
	            enableFiltering: true
	        });
	        
	        $('.selectpicker').selectpicker({
	            size: 4
	        });
	    });
	</script>

	<div class="row clearfix">
		<div class="col-md-12 column">
			<%@include file="Header.jsp"%>
			<form role ="form" action="CreateRuleServlet" method="post">		
				<div class="row clearfix">
						<div class="col-md-3 column">
							<h3>
								Rule Details
							</h3>
							<div class="form-group">
								 <label for="ruleName">Rule Name</label><input required class="form-control" id="ruleName" name="ruleName">
							</div>
							<div class="form-group">
								 <label for="ruleDescription">Rule Description</label><input required class="form-control" id="ruleDescription" name="ruleDescription">
							</div>
						</div>
						<div class="col-md-4 column">
							<h3>
								Population Filter
							</h3>
							    <div class="form-group">
							        <label class="control-label">Choose Customer</label>
							        <div>
							            <select id="example-post" name="customers[]" multiple="multiple">
							                <option value="1">Option 1</option>
							                <option value="2">Option 2</option>
							                <option value="3">Option 3</option>
							                <option value="4">Option 4</option>
							                <option value="5">Option 5</option>
							                <option value="6">Option 6</option>
							            </select>
							        </div>
							    </div>				  
						</div>
						<div class="col-md-5 column">
							<h3>
								Rule Conditions
							</h3>
							<div class="tabbable" id="tabs-420867">
								<ul class="nav nav-tabs">
									<li class="active">
										<a href="#dtcRules" data-toggle="tab">Parameter Rules</a>
									</li>
									<li>
										<a href="#parameterRules" data-toggle="tab">DTC Rules</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="dtcRules">
										<br>
										<div class="form-group">
											<label for="ruleParameter">Rule Parameter</label><br>																				
											<select class="selectpicker">
												<option>Gil</option>
												<option>Shahar</option>
												<option>Omer</option>
											</select>
										</div>
										<div class="form-group">					
											<label for="ruleCondition">Rule Condition</label><br>
											<select class="selectpicker">
												<option>Between</option>
												<option>Not Between</option>
												<option>></option>
												<option>&lt</option>
											</select>
										</div>									
									</div>
									<div class="tab-pane" id="parameterRules">
										<p>
											Choose Wanted DTC's
										</p>
										<div class="btn-group">
											 <button class="btn btn-default">DTC</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
											<ul class="dropdown-menu">
												<li>
													<a href="#">DTC</a>
												</li>
												<li class="disabled">
													<a href="#">Another action</a>
												</li>
												<li class="divider">
												</li>
												<li>
													<a href="#">Something else here</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			<%@include file="Address.html" %>
		</div>
	</div>
</div>
</body>
</html>
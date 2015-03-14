<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
								            <select id="chooseCustomer" name="customers[]" multiple="multiple" class="multiSelection">
								            	<c:forEach items="${customers}" var ="customer">
								            		<option value="${customer.id}">${customer.firstName} ${customer.lastName}</option>
								            	</c:forEach>
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
													<c:forEach items="${parameters}" var ="parameter">
								            			<option>${parameter.parameterName}</option>
								            		</c:forEach>
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
											<div class="row clearfix">
												<div class="col-md-4 column">
													<div class="form-group">
											 			<label for="ruleValuen">Value</label><input required type="number" class="form-control" name="ruleValue">
													</div>
												</div>
												<div class="col-md-4 column">
													<div class="form-group">
											 			<label for="ruleValuen">Value</label><input required type="number" class="form-control" name="ruleValue">
													</div>
												</div>
											</div>						
										</div>
										<div class="tab-pane" id="parameterRules"><br>
											<div class="form-group">
								      		  <label class="control-label">Choose Dtc</label>
										        <div>
										            <select id="chooseDtc" name="dtc[]" multiple="multiple" class="multiSelection">
										            	<c:forEach items="${customers}" var ="customer">
										            		<option value="${customer.id}">${customer.firstName} ${customer.lastName}</option>
										            	</c:forEach>
										            </select>
										        </div>
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
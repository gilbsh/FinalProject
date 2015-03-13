<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="goodman.Models.User"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% User currentUser = (User)session.getAttribute("currentSessionUser");%>

	<div class="progress">
		<div class="progress-bar progress-success">
		</div>
	</div>
	<%@include  file="Headline.html" %>
	<h3 class="text-muted">
	Welcome <%=currentUser.getFirstName()+" "+currentUser.getLastName() %>
	</h3>
	<%@include  file="Nav.html" %>
</body>
</html>
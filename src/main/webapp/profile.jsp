
<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	
	
	Message message=new Message("User not logged","danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;

}
%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/global_bootstrap.jsp"%>




<title>Profile</title>
</head>
<body>

	<div class="container-fluid m-0 p-0">


		<%@ include file="components/global_nav.jsp"%>
		<%@include file="components/message.jsp"%>
	</div>


</body>
</html>
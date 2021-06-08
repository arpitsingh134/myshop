



<%@page import="com.entities.User"%>
<%
User userTest = (User) session.getAttribute("currentUser");%>
<% 
if (userTest == null) {
%>

<li class="nav-item"><a class="nav-link active" href="login.jsp">Login</a>
</li>
<li class="nav-item"><a class="nav-link active" href="register.jsp">Register</a>
</li>



<%
} else {
%>


<li class="nav-item"><a class="nav-link active" href="#"><%=userTest.getUserName()%></a>
</li>
<li class="nav-item"><a class="nav-link active"
	href="LogoutServlet">Logout</a></li>




<%
}
%>


<%

%>
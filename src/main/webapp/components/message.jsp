
<%@page import="com.helper.Message"%>
<%
session = request.getSession();
Message message = (Message) session.getAttribute("message");
if (message != null) {

	//print
%>

<div class="alert alert-<%=message.getMessageType() %> alert-dismissible fade show text-center "
	role="alert">
	<strong><%=message.getMessageString() %></strong> 
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>


<%


session.removeAttribute("message");
}
%>
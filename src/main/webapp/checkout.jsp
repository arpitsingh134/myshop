<%@page import="com.helper.Message"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	
	
	

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>

	
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {

	Message message = new Message("User not logged !! Login to checkout your products", "danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;

} 


%>


<%@ include file="components/global_bootstrap.jsp"%>
</head>
<body>
	<div class="container-fluid m-0  p-0 ">


		<%@ include file="components/global_nav.jsp"%>


		<div class="container">

			<div class="row mt-5">

				<div class="col-md-6">

					<div class="card">

						<div class="card-body">
							<h3 class="text-center my-2">Your Selected Items</h3>
							<div class="cart-body"></div>

						</div>

					</div>

				</div>
				<div class="col-md-6">

					<div class="card">

						<div class="card-body">
							<h3 class="text-center my-2">Details for this order</h3>
							<form action="" method="post">

								<div class="form-group">
									<label for="Name">Name</label> <input type="text" value="<%=user.getUserName() %>"
										required="required" class="form-control" id="userName"
										name="userName" placeholder="User Name">
								</div>


								<div class="form-group">
									<label for="userEmail">Email address</label> <input value="<%=user.getUserEmail() %>"
										required="required" type="email" class="form-control"
										id="userEmail" name="userEmail" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="userPhone">Phone No</label> <input type="number" value="<%=user.getUserPhone() %>"
										required="required" maxlength="10" class="form-control"
										id="userPhone" name="userPhone"
										placeholder="User Phone Number">
								</div>




								<div class="form-group">
									<label for="userAddress">Enter Your Shipping address</label>
									<textarea class="form-control" id="userAddress" 
										required="required" name="userAddress" rows="3"><%=user.getUserAddress() %></textarea>
								</div>



								<div class="container text-center ">
									<button type="submit" class="btn btn-outline-success">Order Now</button>
									<button onclick="continueShopping()" class="btn btn-outline-primary">Continue shopping</button>
								</div>

							</form>



						</div>

					</div>

				</div>
			</div>

		</div>



	</div>
</body>
</html>


<%@page import="com.entities.User"%>
<%
User userTest = (User) session.getAttribute("currentUser");
%>





<nav class="navbar navbar-expand-lg navbar-dark custom-bg ">
	<div class="container">

		<a class="navbar-brand" href="index.jsp">My Shop</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle " href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>
			<!--     <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->

			<ul class="navbar-nav ml-auto">

				<li class="nav-item" data-toggle="modal"
					data-target="#cartItemsModal"><a class="nav-link active"
					href="#"><i class="fa fa-shopping-cart" style="font-size: 24px"></i><span
						class="ml-1 cart-items"></span> </a></li>


				<%
				if (userTest == null) {
				%>

				<li class="nav-item"><a class="nav-link active"
					href="login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="register.jsp">Register</a></li>



				<%
				} else {
				%>


				<li class="nav-item"><a class="nav-link active"
					href="<%=userTest.getUserType().equals("admin") ? "admin.jsp" : "profile.jsp"%>"><%=userTest.getUserName().toLowerCase()%></a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					href="LogoutServlet">Logout</a></li>

				<%
				}
				%>

			</ul>


		</div>

	</div>
</nav>

<%@include file="cart_items_modal.jsp"%>
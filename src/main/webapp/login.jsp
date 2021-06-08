<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/global_bootstrap.jsp" %>




<title>Login</title>
</head>
<body>

<div class="container-fluid m-0 p-0">


<%@ include file="components/global_nav.jsp" %>


		<div class="row mt-5">

			<div class="col-md-4 offset-md-4">
				<div class="card">
				
					
					<div class="card-header text-center custom-bg text-white">
						<i class='fa fa-user-circle ' style='font-size: 36px'></i>
						<h3>Login Here</h3>
					</div>
					<div class="card-body px-2">
						<%@ include file="components/message.jsp" %>

						<form action="LoginServlet" method="post">



							<div class="form-group">
								<label for="userEmail">Email address</label> <input
									required="required" type="email" class="form-control"
									id="userEmail" name="userEmail" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="userPassword">Password</label> <input
									type="password" class="form-control" id="userPassword"
									required="required" name="userPassword" placeholder="Password">
							</div>
							
							<!-- 
					<div class="form-group">
						<label for="userPic">Example file profile</label> <input
							type="file" class="form-control-file" id="userPic" name="userPic">
					</div>




					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">Check
							me out</label>
					</div> -->

							<div class="container text-center mb-2">
								<button type="submit" class="btn btn-outline-success mx-2">Login</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						<a href="register.jsp" class="d-block text-center mb-3 ">If not Registered click here to register</a>

						</form>

					</div>
				</div>
			</div>

		</div>




</div>






</body>
</html>
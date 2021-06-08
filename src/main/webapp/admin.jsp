<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.helper.Helper"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.Message"%>
<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {

	Message message = new Message("User not logged", "danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;

} else {
	if (user.getUserType().equals("normal")) {

		Message message = new Message("Warning !! You are not admin", "warning");
		session.setAttribute("message", message);
		response.sendRedirect("login.jsp");
		return;

	}

}




%>
<%
List<Category> categories = null;

CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
categories = categoryDao.getAllCategory();
Map<String,Long>  map=Helper.getCounts(FactoryProvider.getFactory());


%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/global_bootstrap.jsp"%>




<title>Admin</title>
</head>
<body>

	<div class="container-fluid m-0 p-0">


		<%@ include file="components/global_nav.jsp"%>

		<div class="container mt-3  admin">
			<%@ include file="components/message.jsp"%>
			<div class="row">
				<div class="col-md-4 ">
					<div class="card text-center">

						<div class="card-body ">


							<div class="container">
								<img class="img-fluid rounded-circle " style="max-width: 125px;"
									alt="user_icon" src="icons/user.png">

							</div>
							<h3><%=map.get("userCount") %></h3>
							<h2 class="text-uppercase text-muted">User</h2>
						</div>

					</div>


				</div>
				<div class="col-md-4 ">
					<div class="card text-center">

						<div class="card-body ">


							<div class="container ">
								<img class="img-fluid  " style="max-width: 125px;"
									alt="user_icon" src="icons/list.png">

							</div>
							<h3><%=categories.size() %></h3>
							<h2 class="text-uppercase text-muted">Categories</h2>
						</div>

					</div>


				</div>
				<div class="col-md-4 ">
					<div class="card text-center">

						<div class="card-body ">


							<div class="container">
								<img class="img-fluid rounded-circle " style="max-width: 125px;"
									alt="user_icon" src="icons/shipping.png">

							</div>
							<h3><%=map.get("productCount") %></h3>
							<h2 class="text-uppercase text-muted">Products</h2>
						</div>

					</div>


				</div>
			</div>
			<div class="row m-3">
				<div class="col-md-4 offset-md-2">
					<div class="card text-center" data-toggle="modal"
						data-target="#addCategoryModal">

						<div class="card-body ">


							<div class="container">
								<img class="img-fluid  " style="max-width: 125px;"
									alt="user_icon" src="icons/categories.png">

							</div>
							<p class="mt-2 ">Click Here to add category</p>
							<h2 class="text-uppercase text-muted">Add Categories</h2>
						</div>

					</div>


				</div>
				<div class="col-md-4 ">
					<div class="card text-center" data-toggle="modal"
						data-target="#addProductModal">

						<div class="card-body ">


							<div class="container ">
								<a href="#"> <img class="img-fluid  "
									style="max-width: 125px;" alt="user_icon" src="icons/plus.png"></a>

							</div>
							<p class="mt-2 ">Click Here to add product</p>
							<h2 class="text-uppercase text-muted">Add Product</h2>
						</div>

					</div>


				</div>

			</div>


		</div>

	</div>



	<!-- modal for add category -->



	<!-- Modal -->
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white rounded">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="SaveCategoryServlet" method="post">

						<div class="form-group">
							<label for="categoryTitle">Category Title</label> <input
								type="text" required="required" class="form-control"
								id="categoryTitle" name="categoryTitle">
						</div>


						<div class="form-group">
							<label for="categoryDescription">Category Description</label>
							<textarea class="form-control" id="categoryDescription"
								required="required" name="categoryDescription" rows="3"></textarea>
						</div>

						<div class="container text-center ">
							<button type="submit" class="btn btn-outline-success">Save</button>
							<button type="reset" class="btn btn-outline-warning">Reset</button>
						</div>




					</form>


				</div>

			</div>
		</div>
	</div>
	<!-- end modal -->





	<!-- modal for add PRODUCT -->



	<!-- Modal -->
	<div class="modal fade" id="addProductModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white rounded">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="SaveProductServlet" method="post"
						enctype='multipart/form-data'>

						<div class="form-group">
							<select class="form-control" id="category" name="category"
								required>
								<option disabled="disabled" selected="selected">--
									Select Category --</option>

								<%


								for (Category cat : categories) {
								%>
								<option value="<%=cat.getCategoryID()%>"><%=cat.getCategoryTitle()%></option>
								<%
								}
								%>



							</select>
						</div>



						<div class="form-group">
							<label for="pName">Product Name</label> <input type="text"
								required="required" class="form-control" id="pName" name="pName">
						</div>


						<div class="form-group">
							<label for="pDescription">Product Description</label>
							<textarea class="form-control" id="pDescription"
								required="required" name="pDescription" rows="3"></textarea>
						</div>



						<div class="form-group">
							<label for="pName">Product Price</label> <input type="number"
								required="required" class="form-control" id="pPrice"
								name="pPrice">
						</div>

						<div class="form-group">
							<label for="pDiscount">Product Discount</label> <input
								type="number" required="required" class="form-control"
								id="pDiscount" name="pDiscount">
						</div>

						<div class="form-group">
							<label for="pQuanity">Product Quantity</label> <input
								type="number" required="required" class="form-control"
								id="pQuanity" name="pQuanity">
						</div>
						<div class="form-group">
							<label for="pPhoto">Product Photo</label> <input type="file"
								class="form-control-file" id="pPhoto" name="pPhoto">
						</div>


						<div class="container text-center ">
							<button type="submit" class="btn btn-outline-success">Save</button>
							<button type="reset" class="btn btn-outline-warning">Reset</button>
						</div>




					</form>


				</div>

			</div>
		</div>
	</div>
	<!-- end modal -->








</body>
</html>
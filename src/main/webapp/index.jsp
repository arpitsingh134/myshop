<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Product"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/global_bootstrap.jsp"%>

<%
ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
String cat = "all";

List<Product> products = null;

if (request.getParameter("categoryID") != null) {

	cat = request.getParameter("categoryID");

}
if (cat.trim().equals("all")) {

	products = productDao.getAllProducts();
} else {

	int categoryID = Integer.parseInt(cat);
	products = productDao.getProductsByCategoryID(categoryID);

}
CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
List<Category> categories = categoryDao.getAllCategory();
%>


<title>Home</title>
</head>
<body>
	<div class="container-fluid m-0  p-0 ">


		<%@ include file="components/global_nav.jsp"%>


		<div class="row">

			<div class="col-md-2  ">

				<ul class="list-group mt-4 mx-2">
					<a href="index.jsp?categoryID=all" class="list-group-item  active">All
						Products</a>

					<%
					for (Category category : categories) {
					%>
					<a href="index.jsp?categoryID=<%=category.getCategoryID()%>"
						class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
					<%
					}
					%>
				</ul>



			</div>
			<div class="col-md-10 ">

				<div class="row mt-4 ">
					<div class="col-md-12 m-2">

						<div class="card-columns ">


							<%
							for (Product product : products) {
							%>


							<div class="card" style="width: 18rem; margin: 3 auto;">
								<div class="cantainer text-center">

									<img class="card-img-top  m-2"
										src="img/productImg/<%=product.getpPhoto()%>"
										style="max-height: 200px; max-width: 90%; width: auto;"
										alt="Card image cap">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=product.getpName()%></h5>
									<p class="card-text"><%=Helper.get10Words(product.getpDescription())%></p>
								</div>

								<div class="card-footer  text-center">

									<a class="btn btn-outline-success btn-sm float-left">
										&#8377; <%=Helper.getDiscountedPrice(product.getpPrice(), product.getpDiscount())%>
									</a>

									<p class="btn btn-sm float-left">
										<del>
											&#8377;<%=product.getpPrice()%></del>
									</p>

									<p class="btn btn-sm float-right">
										<%=product.getpDiscount()%>&#x25;
									</p>
									<br>
									<button
										class="btn btn-sm text-white custom-bg text-center m-2 "
										onclick="add_to_cart(<%=product.getpPid()%>,'<%=product.getpName()%>',<%=product.getpPrice()%>)">Add
										to Cart</button>


								</div>
							</div>


							<%
							}
							if (products.size() == 0) {

							out.println("<h3>No Items in this category</h3>");

							}
							%>




						</div>


					</div>


				</div>

			</div>

		</div>





	</div>


</body>
</html>
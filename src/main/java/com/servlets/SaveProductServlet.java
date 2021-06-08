package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;
import com.helper.Helper;
import com.helper.Message;

/**
 * Servlet implementation class SaveProductServlet
 */
@WebServlet("/SaveProductServlet")
@MultipartConfig
public class SaveProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		out.print("in get method");
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			PrintWriter out = response.getWriter();

			String pName = request.getParameter("pName");
			String pDescription = request.getParameter("pDescription");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuanity = Integer.parseInt(request.getParameter("pQuanity"));
			int pCategory = Integer.parseInt(request.getParameter("category"));
			Part pPhotoPart = request.getPart("pPhoto");
			String pPhoto = pPhotoPart.getSubmittedFileName();
//			out.println("price "+pPrice+"quantity"+pQuanity+"cat id :"+pCategory+"Disco"+pDiscount);
//			out.println("photoName"+pPhoto);

//			System.out.println(pPhoto+":"+pCategory);
			// get category using categoryID
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			Category category = categoryDao.getCategoryByID(pCategory);
//			System.out.println(request.getContextPath()+"productImg"+File.separator+pPhoto);
//			System.out.println(request.getRealPath("productImg"));

			Product product = new Product(pName, pDescription, pPhoto, pPrice, pDiscount, pQuanity, category);
			// System.out.println(product);
			// save product

			ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
			int result = productDao.saveProduct(product);

			String path = request.getRealPath("/") +"img"+File.separator+ "productImg" + File.separator + pPhoto;
			Helper.saveFile(pPhotoPart.getInputStream(), path);
			System.out.println(path);
//			System.out.println();

			HttpSession httpSession = request.getSession();
			Message message = new Message("Product Saved successfully !! ", "success");
			httpSession.setAttribute("message", message);
			response.sendRedirect("admin.jsp");

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}

package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryDao;
import com.entities.Category;
import com.helper.FactoryProvider;
import com.helper.Message;

/**
 * Servlet implementation class SaveCategoryServlet
 */
@WebServlet("/SaveCategoryServlet")
public class SaveCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveCategoryServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String categoryTitle = request.getParameter("categoryTitle");
			String categoryDescription = request.getParameter("categoryDescription");
			Category category = new Category(categoryTitle, categoryDescription);

			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			int result = categoryDao.saveCategory(category);
			
			
			HttpSession httpSession=request.getSession();
			Message message=new Message("Category Saved successfully !! Category ID :"+result, "success");
			httpSession.setAttribute("message", message);
			response.sendRedirect("admin.jsp");
			
			
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

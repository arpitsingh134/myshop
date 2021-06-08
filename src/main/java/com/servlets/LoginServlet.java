package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;
import com.helper.Message;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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

		PrintWriter out = response.getWriter();
		try {
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");

			String userPassword = request.getParameter("userPassword");

			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(userEmail, userPassword);

			HttpSession httpSession = request.getSession();
			if (user == null) {
				Message message = new Message("Please Check User Name or Password !! ", "danger");
				httpSession.setAttribute("message", message);
				response.sendRedirect("login.jsp");
				return;
			} else {

				//Message message = new Message("Login Successfully !!", "success");

				httpSession.setAttribute("currentUser", user);
				//httpSession.setAttribute("message", message);

				if ("admin".equals(user.getUserType())) {
					response.sendRedirect("admin.jsp");
				} else if ("normal".equals(user.getUserType())) {

					response.sendRedirect("index.jsp");
				} else {

					out.println("<h1>user type is not defined" + user.getUserType() + "</h1>");

				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}

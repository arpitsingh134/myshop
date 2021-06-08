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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out= response.getWriter();
	try {
		String userName =request.getParameter("userName");
		String userEmail =request.getParameter("userEmail");
		//out.println(userEmail);
		String userPassword =request.getParameter("userPassword");
		String userPhone =request.getParameter("userPhone");
		String userAddress =request.getParameter("userAddress");
		
		User user=new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress);
		UserDao userDao=new UserDao(FactoryProvider.getFactory());
		int result =userDao.saveUser(user);
		
		
		//out.print("<h1>user is succussfully saved "+result+"</h1>");
		
		
		
		HttpSession httpSession=request.getSession();
		Message message=new Message("Register successfully !! UserID :"+result, "success");
		httpSession.setAttribute("message", message);
		response.sendRedirect("register.jsp");
		
		

		
		
	} catch (Exception e) {
		// TODO: handle exception
	}
		
		
		
		
	}

}

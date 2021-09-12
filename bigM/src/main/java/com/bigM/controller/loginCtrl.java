package com.bigM.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bigM.dao.UserDB;


@WebServlet({ "/loginCtrl", "/login" })
public class loginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		//db operation
		UserDB mdb = new UserDB();;
		response.setContentType("text/html");
		
		PrintWriter pw = response.getWriter();
		if(mdb.loginUser(email,password)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", mdb.getUserByEmail(email));
			response.sendRedirect("home.html");
		}else {
			pw.print(getClass()+"Wrong Crediantials...try again");
//			RequestDispatcher view = request.getRequestDispatcher("login.html");
//			view.forward(request, response);
		}
		
		
	}

}

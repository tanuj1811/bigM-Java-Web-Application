package com.bigM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bigM.dao.UserDB;
import com.bigM.model.User;


@WebServlet({ "/UserCtrl", "/register" })
public class UserCtrl extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = new User(
					
					request.getParameter("name"),
					request.getParameter("email"),
					request.getParameter("number"),
					request.getParameter("shopName"),
					request.getParameter("tmp null"),
					request.getParameter("password"),
					request.getParameter("address")

					);
			UserDB udb = new UserDB();
			udb.addUser(user);
			System.out.println(getClass()+" :: "+udb.getUserByEmail(user.getEmail()));
			response.sendRedirect("home.html");
			
			
		} catch (Exception e) {
			System.out.println(getClass()+" Something went wrong" + e);
		}
	}

}

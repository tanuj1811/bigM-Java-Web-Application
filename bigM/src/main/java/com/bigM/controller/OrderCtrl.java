package com.bigM.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bigM.dao.OrderDB;
import com.bigM.model.Order;
import com.bigM.model.User;


@WebServlet({ "/OrderCtrl", "/saveOrder" })
public class OrderCtrl extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("[ Printing user from OrderCrtl ] ::" + user);
		Order order = new Order(
				
				user.get_id(),
				request.getParameter("orderName"),
				request.getParameter("shopName"),
				request.getParameter("orderNumber"),
				request.getParameter("productName"),
				request.getParameter("qty"),
				request.getParameter("type"),
				request.getParameter("description"),
				request.getParameter("deliveryAddress1"+","+"deliveryAddress2"+","+"deliveryAddress3")
				);
		System.out.println(order);
		order.setUserId(user.get_id());
		//db operation
		OrderDB odb = new OrderDB();
		boolean flag = odb.addOrder(order);
		response.sendRedirect("home.html");
		
	}

}

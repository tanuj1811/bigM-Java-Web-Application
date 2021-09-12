<%@page import="com.bigM.dao.UserDB"%>
<%@page import="com.bigM.model.User"%>
<%@page import="com.bigM.model.Order"%>
<%@page import="com.bigM.dao.OrderDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%! HttpSession session; %>

	<%
		OrderDB odb = new OrderDB();
		UserDB udb = new UserDB();
		String action = request.getParameter("action");
		
		session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(action.equals("updatePassword")){
			String newPassword = request.getParameter("newPassword");
			String oldPassword = request.getParameter("oldPassword");
			if(user.getPassword().equals(oldPassword)){
				udb.updatePassword(newPassword, user.get_id());
				response.sendRedirect("Profile.jsp");
			}else{
				out.print("Invalid crediantials .. try again");
			}
			
		}else if(action.equals("update")){
			String orderId = request.getParameter("orderId");
			Order newOrder = new Order(
					
					request.getParameter(user.get_id()),
					request.getParameter("orderName"),
					request.getParameter("shopName"),
					request.getParameter("orderNumber"),
					request.getParameter("productName"),
					request.getParameter("qty"),
					request.getParameter("description"),
					request.getParameter("deliveryAddress")
					);
			System.out.println(getClass()+"updating..");
			odb.updateOrderByOrderId(newOrder,orderId);
			System.out.println(getClass()+"updated..");
			response.sendRedirect("Order.jsp?orderId="+orderId);	
		}else if(action.equals("delete")){
			String orderId = request.getParameter("orderId");
			odb.deleteOrderByOrderId(orderId);
			response.sendRedirect("pendingList.jsp");
		}
	%>

</body>
</html>
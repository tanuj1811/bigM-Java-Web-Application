<%@page import="java.util.List"%>
<%@page import="com.bigM.model.Order"%>
<%@page import="com.bigM.dao.OrderDB"%>
<%@page import="com.bigM.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  <%!
  	HttpSession session ;
	User user;
	RequestDispatcher view; 
	OrderDB odb;
  %>
  
  	<%
	  	try{
			session = request.getSession();
			user = (User)session.getAttribute("user");
			String productName = request.getParameter("productName");
			List<Order> orders = odb.findByProductNameContaining(productName, user.get_id());
			orders.forEach((e)-> System.out.print(e));
			
		}catch(Exception e){
			System.out.println(getClass().getSimpleName()+"[placeOder.jsp] Exception Ocuur" + e);
			RequestDispatcher view = request.getRequestDispatcher("../index.html");
			view.forward(request, response);
		}  	
  	%>
  	
  	
  	
  	

</body>
</html>
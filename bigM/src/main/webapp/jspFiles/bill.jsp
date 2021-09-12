<%@page import="com.bigM.model.Order"%>
<%@page import="com.bigM.model.OrderBill"%>
<%@page import="com.bigM.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="bill.css">
	
    <title>Invoice </title>
  </head>
  <body >
  <%!
  	HttpSession session ;
	User user;
	RequestDispatcher view;
	OrderBill bill;
  %>
  
  	<%
	  	try{
			session = request.getSession();
			user = (User)session.getAttribute("user");
			if(user == null){
				RequestDispatcher view = request.getRequestDispatcher("../index.html");
				view.forward(request, response);
			}
			
		}catch(Exception e){
			System.out.println(getClass().getSimpleName()+"[placeOder.jsp] Exception Ocuur" + e);
			RequestDispatcher view = request.getRequestDispatcher("../index.html");
			view.forward(request, response);
		}  	
  	
  	
  	
  	%>
  
  
  
  
  	<div class="container" style="width:100vh">
  		<header>
			<h1>Invoice</h1>
			<address>
				<h4>Bill From:</h4>
				<p>big-M</p>
				<p>101 E. Chapman Ave<br>Orange, CA 92866</p>
				<p>(+91) 9501802975</p>
			</address>
			<span><img alt="" src="http://www.jonathantneal.com/examples/invoice/logo.png"><input type="file" accept="image/*"></span>
			<address style="float: right;">
				<h4>Shipped To:</h4>
				<p>big-M</p>
				<p>101 E. Chapman Ave<br>Orange, CA 92866</p>
				<p>(+91) 9501802975</p>
			</address>
			<span><img alt="" src="http://www.jonathantneal.com/examples/invoice/logo.png"><input type="file" accept="image/*"></span>
		</header>
		
		<article>
			<h1>Recipient</h1>
			<address >
				<p>Some Company<br>c/o Some Guy</p>
			</address>
			<table class="meta">
				<tr>
					<th><span>Invoice #</span></th>
					<td><span><%=bill.get_id() %></span></td>
				</tr>
				<tr>
					<th><span>Date</span></th>
					<td><span><%=bill.getBillDate() %></span></td>
				</tr>
				<tr>
					<th><span>Amount Due</span></th>
					<td><span id="prefix" ><%='\u20b9' %></span><span><%=bill.getTotalAmount() - bill.getAmountPaid() %></span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span>Product</span></th>
						<th><span >Qty.</span></th>
						<th><span >Ordered Date</span></th>
						<th><span >Delivered Date</span></th>
						<th><span >Total-Price</span></th>
					</tr>
				</thead>
				<tbody>
					<% 
						for(Order order: bill.getOrders()){
					%>		
					<tr>
						<td><span >Coka Cola</span></td>
						<td><span >1 bottle</span></td>
						<td><span >12/25/30</span></td>
						<td><span >12/25/30</span></td>
						<td><span data-prefix>$</span><span><%= 1*20 %></span></td>
					</tr>
							
					<%		
						}
					%>
					
				</tbody>
			</table>
			
			<table class="balance">
				<tr>
					<th><span >Total</span></th>
					<td><span data-prefix><%='\u20b9' %></span><span><%=bill.getTotalAmount()%></span></td>
				</tr>
				<tr>
					<th><span >Amount Paid</span></th>
					<td><span data-prefix><%='\u20b9' %></span><span><%=bill.getAmountPaid()%></span></td>
				</tr>
				<tr>
					<th><span >Balance Due</span></th>
					<td><span data-prefix><%='\u20b9' %></span><span><%=bill.getTotalAmount() - bill.getAmountPaid() %></span></td>
				</tr>
			</table>
		</article>
		<aside style ="margin-top: 50vh">
			<h1><span >Additional Notes</span></h1>
			<div >
				<p>A finance charge of 1.5% will be made on unpaid balances after 30 days.</p>
			</div>
		</aside>
		
		
		
  	</div>
  	
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>
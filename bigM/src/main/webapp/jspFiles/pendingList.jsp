<%@page import="org.bson.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bigM.dao.OrderDB"%>
<%@page import="com.bigM.model.Order"%>
<%@page import="com.bigM.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="../allStyles/loginPage.css">
	<link rel="stylesheet" href="nicepage.css">
	<script src="script.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" crossorigin="anonymous">
	
    <title>big.M-Order-List</title>
    <style type="text/css">
    	.menu{
    		background: rbg(0,0,0,0.7);
    		margin-top: -30px;
    		padding-top:0px;
    		width: 18rem;
    		margin-left: 190px;
    		position: fixed;
    		z-index: 999;
    		text-align: left;
    		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); 
    		
    	}
    	li a{
    		text-decoration: none;
    	}
    	 
    </style>
</head>
<body style = "background-color: #333333">



	<%!
		List<Order> orders = new ArrayList<>();
		OrderDB odb = new OrderDB();
		HttpSession session ;
		User user;
		RequestDispatcher view;
		String[] str;
		Document obj ;
	%>
	<%
		
		try{
			session = request.getSession();
			user = (User)session.getAttribute("user");
			if(user == null){
				RequestDispatcher view = request.getRequestDispatcher("../home.html");
				view.forward(request, response);
			}
			str = user.getAddress().split(",");
			System.out.println(user.toString());
		}catch(Exception e){
			System.out.println(getClass().getSimpleName()+"[placeOder.jsp] Exception Ocuur" + e);
		}
	%>
	
	<!--  navbar starts here    -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" style = "height:50px">
	  <div class="container-fluid">
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
	    	<a href="#" data-toggle="collapse" data-target="#menu" aria-expanded="false" aria-controls="collapseExample" style = "margin-left:170px; padding-right: 1px;color: blue;" title="menus"><i class="fas fa-bars"></i></a>
	      	  <a  style = "padding-left: 10px; color:blue;" class="navbar-brand" href="#">big.M</a>
	      <ul class="navbar-nav me-auto mb-2 mb-lg-3" style = "margin-left: 20px">
	        <li class="nav-item">
	          <a class="nav-link " aria-current="page" href="../home.html" autofocus>Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true" autofocus>About-Us</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" href="Profile.jsp" autofocus><i class="fas fa-id-card"></i><%=user.getName() %></a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="../index.html" autofocus>Sign-Out</a>
	        </li>
	      </ul>
	      <form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	      
	    </div>
	  </div>
	</nav>
	
	<div class="card menu collapse" id="menu">
  	  <div class="card-body">
  	  	<div class="card-footer">
		    <a href ="Profile.jsp"><i class="fas fa-id-card"></i>Profile</a><br>
		  </div>
  	  	<ul class="list-group list-group-flush" style = "padding-bottom: 10px; padding-top: 10px">
		    <li class="list-group-item"><a href ="placeOrder1.jsp"><i class="fas fa-plus"></i> Add Order</a></li>
	         <li class="list-group-item"><a href ="pendingList.jsp"><i class="fas fa-server"></i> Previous Orders</a></li>
	         <li class="list-group-item"><a href ="pendingList.jsp"><i class="fas fa-file-signature"></i> Pending Orders</a></li>
	         <li class="list-group-item"><a href ="receivedList.jsp"><i class="fas fa-file-signature"></i> Received Orders</a></li>
	         <li class="list-group-item"><a href ="#"><i class="fas fa-file-invoice-dollar"></i> Previous Bills</a></li>
		 </ul>
         
          <div class="card-footer">
		    <a href ="../index.html"><i class="fas fa-id-card"></i> Log-Out</a><br>
		  </div>
		  
         
      </div>
    </div>
    
<!--  navbar ends here    -->
	<section class="order-form my-4 mx-4" >
    	<div class="container" style = "margin-top:5rem; background-color: #e0e5eb">
			<div class="row">
    	  		<div class="col-12">
		       		<h1>Hello, Mr.<%=user.getName() %></h1>
		      	    <span>List of received Orders till now...</span>
		      	    <hr class="mt-1">
       			</div>
				<table class="table table-dark table-hover" style ="margin-top: 5rem;">
			 		 <thead class = "table-dark" >
				   		 <tr style ="padding-bottom: 5px;">
				  	  	  <th scope="col">#</th>
				  	  	  <th scope="col">Date</th>
				  	  	  <th scope="col">Bill Name</th>
				  	  	  <th scope="col">Product Name</th>
				  	  	  <th scope="col">Qty.</th>
				  	  	  
				  	  	  <th scope="col">View</th>
				  	  	  <th scope="col">Edit/Delete</th>
				 	   </tr>
			 		 </thead>
				 	 <tbody class ="table-light">
				 	 	<%
				 	 		//for loop
				 	 		orders = odb.getNonPlacedOrdersByUserId(user.get_id());
				 	 		for(Order order: orders){
				 	 			
				 	 			
				 	 	%>
				   		 <tr>
				   		   <th scope="row">#-></th>
				   		   <td><%=order.getOrderDate() %></td>
				   		   <td><%=order.getOrderName() %></td>
				  		    <td><%=order.getProductName() %></td>
				   		   <td><%=order.getQty() %></td>
				  		    
				  		    <td>
				  		    	<a href='Order.jsp?orderId=<%=order.get_id() %>' class="btn btn-info" role="button">Veiw</a>
				  		    
				  		    </td>
				  		    <td>
				  		    	<div class="col-md-12">
				                    <ul class="social-network social-circle" style="color: blue">
				                        <li><a href='editOrder.jsp?orderId=<%=order.get_id() %>' class="icoTwitter" title="edit"><i class="far fa-edit"></i></a></li>
                            			<li><a href='actions.jsp?action=delete&orderId=<%=order.get_id() %>' class="icoTwitter" title="delete"><i class="fas fa-trash"></i></a></li>
				                    </ul>
                				</div>
				  		    </td>
				  		    
				 	   	</tr>
				 	   	<% }  %>
				 	   
				  	</tbody>
				</table>
			</div>
    	</div>
  </section>
	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
</body>
</html>
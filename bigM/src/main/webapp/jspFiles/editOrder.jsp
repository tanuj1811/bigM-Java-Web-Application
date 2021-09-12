<%@page import="com.bigM.dao.OrderDB"%>
<%@page import="com.bigM.model.Order"%>
<%@page import="com.bigM.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bigM-Edit Your Order</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="Vieworder.css">
	<link rel="stylesheet" href="nicepage.css">
	<script src="script.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<!-- google fonts -->
	
	<style type="text/css">
    	.menu{
    		background: rbg(0,0,0,0.7);
    		margin-top: 50px;
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

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" crossorigin="anonymous">


	<%!
		HttpSession session ;
		User user;
		RequestDispatcher view;
		Order order;
	%>
	<%
	
		
		try{
			String orderId = request.getParameter("orderId");
			OrderDB odb = new OrderDB();
			order = odb.getOrderByOrderId(orderId);
			session = request.getSession();
			user = (User)session.getAttribute("user");
			if(user == null){
				RequestDispatcher view = request.getRequestDispatcher("../home.html");
				view.forward(request, response);
			}
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
<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img
                src="../images/veiwOrderimg.jpg"
                alt="Sample photo"
                class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;"
              />
            </div>
           
            
	            <div class="col-xl-6">
	             <div class="card-body p-md-5 text-black">
	              
	              <form action="actions.jsp?action=update&orderId=<%=order.get_id() %>" method = "post">
	                <h3 class="mb-5 text-uppercase">Update Your Order :)</h3>
	
	                <div class="row">
	                  <div class="col-md-6 mb-4">
	                    <div class="form-outline">
	                      <input type="text" name="orderName" class="form-control form-control-lg" value = <%=order.getOrderName() %>>
	                      <label class="form-label" for="form3Example1m">Bill Name:</label>
	                    </div>
	                  </div>
	                  <div class="col-md-6 mb-4">
	                    <div class="form-outline">
	                      <input type="text" name="shopName" class="form-control form-control-lg" value = <%=order.getShopName() %>>
	                      <label class="form-label" for="form3Example1n">Shop Name</label>
	                    </div>
	                  </div>
	                </div>
	
	                <div class="row">
	                  <div class="col-md-6 mb-4">
	                    <div class="form-outline">
	                      <input type="text" name = "orderNumber" class="form-control form-control-lg" value=<%=order.getOrderNumber() %> />
	                      <label class="form-label" for="form3Example1m1">Contact Number</label>
	                    </div>
	                  </div>
	                  <div class="col-md-6 mb-4">
	                    <div class="form-outline">
	                      <input type="text" name="productName" class="form-control form-control-lg" value = <%=order.getProductName() %> />
	                      <label class="form-label" for="form3Example1n1">Ordered Product </label>
	                    </div>
	                  </div>
	                </div>
	                <select class="form-select form-select-lg mb-3" name="type" aria-label=".form-select-lg example">
					  <option selected><%=order.getType() %></option>
					  <option value="1">20mL</option>
					  <option value="2">60mL</option>
					  <option value="3">1L</option>
					  <option value="3">1.5L</option>
					  <option value="3">2L</option>
					</select>
	
	                <div class="form-outline mb-4">
	                  <input type="text" name="qty" class="form-control form-control-lg" value =<%=order.getQty() %>/>
	                  <label class="form-label" for="form3Example8"> Ordered Quantity</label>
	                </div>
					
					 <div class="form-outline mb-4">
	                  <input type="text" name="description" class="form-control form-control-lg" value =<%=order.getDescription() %>/>
	                  <label class="form-label" for="form3Example8"> Description</label>
	                </div>
	                            
	                <div class="form-outline mb-4">
	                  <input type="text" name = "deliveryAddress" class="form-control form-control-lg" value = <%=order.getDeliveryAddress() %>/>
	                  <label class="form-label" for="form3Example9">Delivery Address</label>
	                </div>
	
	                
	
	                <div class="d-flex justify-content-end pt-3">
	                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
	                  <button class="btn btn-outline-success btn-submit">Update</button>
	                </div>
	
	                         
            		</form>
				</div>
	         </div> 
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
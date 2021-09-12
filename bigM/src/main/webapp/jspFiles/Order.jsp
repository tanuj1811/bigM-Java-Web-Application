<%@page import="com.bigM.dao.OrderDB"%>
<%@page import="com.bigM.model.Order"%>
<%@page import="com.bigM.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <!-- nice page meta tags -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Some Recent Blogs, Post 1 Headline, Post 2 Headline, Post 3 Headline, Post 4 Headline">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
  
  <!-- ends here -->
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="Vieworder.css">
	<link rel="stylesheet" href="nicepage.css">
	<script src="script.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<!-- google fonts -->
	<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    <title>bigM-Home</title>
    
     <!-- nice page scripts tags -->
      <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/default-logo.png",
		"sameAs": []
	}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Login">
    <meta property="og:type" content="website">
     
     <!-- nice page script ends here -->
    <style type="text/css">
    	.menu{
    		background: rbg(0,0,0,0.7);
    		margin-top: 20px;
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
			System.out.println(getClass()+" "+ order);
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


<section class="u-clearfix u-valign-middle u-section-1" id="carousel_adb7">
      <div class="u-clearfix u-layout-wrap u-layout-wrap-1">
        <div class="u-layout">
          <div class="u-layout-row">
            <div class="u-align-left u-container-style u-image u-layout-cell u-right-cell u-size-19 u-image-1" data-image-width="760" data-image-height="1280">
              <div class="u-container-layout u-container-layout-1"></div>
            </div>
            <div class="u-container-style u-gradient u-layout-cell u-left-cell u-size-41 u-layout-cell-2">
              <div class="u-border-8 u-border-palette-4-light-2 u-container-layout u-container-layout-2">
                <blockquote class="u-align-left u-text u-text-1">
                  <span style="text-decoration: underline !important;" class="u-text-palette-2-base">
                    <span style="font-weight: 700; font-size: 1.25rem;" class="u-text-body-alt-color">
                      <span style="text-decoration: underline !important;">Product</span>
                    </span>
                  </span>: <%=order.getProductName() %>
                </blockquote>
                <blockquote class="u-align-left u-text u-text-2">
                  <span style="font-size: 1.25rem; font-weight: 700; text-decoration: underline !important;" class="u-text-body-alt-color">Ouantity</span> : <%=order.getQty() %>
                </blockquote>
                <blockquote class="u-align-left u-text u-text-3">
                  <span style="font-weight: 700; font-size: 1.125rem; text-decoration: underline !important;" class="u-text-body-alt-color">Ordered Date</span> : <%=order.getOrderDate() %>
                </blockquote>
                <blockquote class="u-align-left u-text u-text-4">
                  <span style="font-weight: 700; font-size: 1.25rem; text-decoration: underline !important;" class="u-text-body-alt-color">Contact Number</span> : <%=order.getOrderNumber() %>
                </blockquote>
                <blockquote class="u-align-left u-text u-text-5">
                  <span style="font-weight: 700; font-size: 1.25rem; text-decoration: underline !important;" class="u-text-body-alt-color">Shop Name</span> : <%=order.getShopName() %>
                </blockquote>
                
                <blockquote class="u-align-left u-text u-text-5">
                  <span style="font-weight: 700; font-size: 1.25rem; text-decoration: underline !important;" class="u-text-body-alt-color">Type</span> : <%=order.getType() %>
                </blockquote>
                
                <blockquote class="u-align-left u-text u-text-6">
                  <span style="font-weight: 700; text-decoration: underline !important; font-size: 1.25rem;" class="u-text-body-alt-color">Delivery Address</span> :<%=order.getDeliveryAddress() %><br>
                  <br>
                  <br>
                </blockquote>
                <blockquote class="u-align-left u-text u-text-7">
                  <span style="font-weight: 700; font-size: 1.25rem; text-decoration: underline !important;" class="u-text-body-alt-color">Description</span>: <%=order.getDescription() %><br>
                  <br>
                  <br>
                </blockquote>
                <blockquote class="u-align-left u-text u-text-7">
                  <span style="font-weight: 700; font-size: 1.25rem; text-decoration: underline !important;" class="u-text-body-alt-color">Delivered Date:</span>: <%=order.getDeliveredDate() %><br>
                  <br>
                </blockquote>
                <blockquote class="u-align-center u-text u-text-8">
                  <span style="font-size: 1.25rem; font-weight: 700; text-decoration: underline !important;" class="u-text-custom-color-1">Status</span> : <%if(order.isPlaced()){ %>Delivered<%}else{ %> On The Way<%} %>
                </blockquote>
                <%if(!order.isPlaced()){ %>
	                <a href="editOrder.jsp?orderId=<%=order.get_id() %>" class="u-align-center u-border-2 u-border-black u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-none u-radius-48 u-text-black u-text-hover-white u-btn-2">Edit</a>
	                <a href="actions.jsp?action=delete&orderId=<%=order.get_id() %>" class="u-align-center u-border-2 u-border-black u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-48 u-text-black u-text-hover-white u-btn-3"><i class="fas fa-trash"></i>Delete</a>
                <%} %>
                
                <a  <%if(!order.isPlaced()){%>href='pendingList.jsp'<%}else{ %>href = 'receivedList.jsp' <%} %>class="u-align-center u-border-2 u-border-black u-btn u-btn-round u-button-style u-hover-custom-color-2 u-none u-radius-48 u-text-black u-text-hover-white u-btn-1">Go Back</a>
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
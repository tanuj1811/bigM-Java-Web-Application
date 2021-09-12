<%@page import="com.bigM.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<meta charset="ISO-8859-1">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../allStyles/loginPage.css">
    <link rel="stylesheet" href="Veiwoder.css">
    <link rel="stylesheet" href="nicepage.css">
	<script src="script.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" crossorigin="anonymous">
	
    <title>big.M-Order</title>
  	<style type="text/css">
    	.menu{
    		background: rbg(0,0,0,0.7);
    		margin-top: 0px;
    		width: 18rem;
    		margin-left: 190px;
    		position: absolute;
    		z-index: 999;
    		text-align: left;
    		
    	}
    	li a{
    		text-decoration: none;
    	}
    	 
    </style>
</head>
<body style = "background-color: #333333">

	<%!
		HttpSession session ;
		User user;
		RequestDispatcher view;
		String[] str;
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
		    <a href ="#"><i class="fas fa-id-card"></i>Profile</a><br>
		  </div>
  	  	<ul class="list-group list-group-flush" style = "padding-bottom: 10px; padding-top: 10px">
		    <li class="list-group-item"><a href ="#"><i class="fas fa-id-card"></i>Add Order</a></li>
	         <li class="list-group-item"><a href ="#"><i class="fas fa-id-card"></i>Previous Orders</a></li>
	         <li class="list-group-item"><a href ="#"><i class="fas fa-id-card"></i>Pending Orders</a></li>
	         <li class="list-group-item"><a href ="#"><i class="fas fa-id-card"></i>Received Orders</a></li>
		 </ul>
         
          <div class="card-footer">
		    <a href ="#"><i class="fas fa-id-card"></i> Log-Out</a><br>
		  </div>
         
      </div>
    </div>
    
<!--  navbar ends here    -->
	
  <section class="order-form my-4 mx-4" >
    <div class="container" style = "margin-top:5rem; background-color: #e0e5eb">

      <div class="row">
        <div class="col-12">
          <h1>Hello, Mr.<%=user.getName() %></h1>
          <span>Fill the following details to order..</span>
          <hr class="mt-1">
        </div>
        <form action="../OrderCtrl" method  ="post" >
		
          <div class="row mx-4">
            <div class="col-12 mb-2">
              <label class="order-form-label">Your Name</label>
            </div>
            <div class="col-12 col-sm-6">
              <input class="order-form-input" name = "orderName" value = <%=user.getName() %>>
            </div>
          </div>
           <div class="row mx-4">
            <div class="col-12 mb-2">
              <label class="order-form-label">Shop Name</label>
            </div>
            <div class="col-12 col-sm-6">
              <input class="order-form-input" name = "shopName" value = <%=user.getShopName() %>>
            </div>
          </div>
          <div class="row mx-4">
            <div class="col-12 mb-2">
              <label class="order-form-label">Contact Number</label>
            </div>
            <div class="col-12 col-sm-6">
              <input class="order-form-input" name = "orderNumber" value = <%=user.getNumber() %>>
            </div>
          </div>

          <div class="row mt-3 mx-4">
            <div class="col-12">
              <label class="order-form-label">Product Name:</label>
            </div>
            <div class="col-12">
              <input class="order-form-input" name="productName" placeholder=" Ex-Thump-ups">
            </div>
          </div>

          <div class="row mt-3 mx-4">
            <div class="col-12">
              <label class="order-form-label">Qty.</label>
            </div>
            <div class="col-12">
              <input class="order-form-input" name="qty" placeholder=" 12 derzn">
            </div>
          </div>

          <div class="row mt-3 mx-4">
            <div class="col-12">
              <label class="order-form-label" for="date-picker-example" autofocus="autofocus">Description</label>
            </div>
            <div class="form-group">
			   <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" style = "width: 700px" name = "description" placeholder="If necessary...try to add some discription of product"></textarea>
			 </div>

          <div class="row mt-3 mx-4">
            <div class="col-12">
              <label class="order-form-label">Delivery Address</label>
            </div>
            <div class="col-12">
              <input class="order-form-input" name = "deliveryAddress1" value = <%= str[0] %>>
            </div>
            <div class="col-12 mt-2">
              <input class="order-form-input" name="deliveryAddress2" value = <%=str[1] %> >
            </div>
            <div class="col-12 col-sm-6 mt-2 pr-sm-2">
              <input class="order-form-input"  value = "Ludhiana">
            </div>
            <div class="col-12 col-sm-6 mt-2 pr-sm-2">
              <input class="order-form-input" name = "deliveryAddress3" value = <%= str[str.length-1] %> >
            </div>
          </div>

           <div class="form-check d-flex justify-content-left mb-5 mt-3" style = "padding-left: 50px">
		                  <input
		                    class="form-check-input me-2"
		                    type="checkbox"
		                    value=""
		                    id="form2Example3cg"
		                  />
		                  <label class="form-check-label" for="form2Example3g" >
		                    I agree all statements in <a href="home.html" class="text-body" ><u>Terms of service</u></a>
		                  </label>
		                </div>

          <div class="row mt-3">
            <div class="col-12">
              <button type="submit" id="btnSubmit" class="btn btn-dark d-block mx-auto btn-submit">Place Order</button>
            <!--   <button type="button" id="btnEmergencySubmit" class="btn btn-dark d-block mx-auto btn-submit">Emergency Required</button>-->
            </div>
          </div>

        </div>
      	  		</form>	
      </div>
    </div>
  </section>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
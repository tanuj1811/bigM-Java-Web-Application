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
	<link rel="stylesheet" href="../allStyles/profile.css">
	<link rel="stylesheet" href="nicepage.css">
    <title>Hello, world!</title>
    <style type="text/css">
    	.change-password{
    		margin-top: 60px;
    		width: 30rem;
    		position: fixed;
    		margin-left:30vw;
    		z-index: 999;
    		text-align: center;
    		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); 
    		border-radius: 10px;
    	}
    
    </style>
  </head>
  <body style = "background-color: #333333">
  <%!
		HttpSession session ;
		User user;
		RequestDispatcher view;
		
	%>
	<%
	
		
		try{
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
		<div class="card change-password collapse" id="change-password">
	  	  <div class="card-body">
	  	  	<div class="card-footer">
			    <span><i class="fas fa-id-card"></i>Change Your Password</span><br>
			  </div>
	  	  	<div style="padding-top: 10px; padding-bottom: 10px;">
	  	  		<form method="post" action="actions.jsp?action=updatePassword">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Current Password</label>
				    <input type="password" name="oldPassword" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				    <div id="emailHelp" class="form-text">Enter your Current Password</div>
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input type="password" name="newPassword" class="form-control" id="exampleInputPassword1">
				  </div>
				  
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
	  	  	</div>
	         
	          <div class="card-footer">
			    <a href ="Profile.jsp"> Cancel</a><br>
			  </div>
	         
	      </div>
	    </div>
	
  
  <div style="margin-top: 5vh;">
  	<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-xl-6 col-md-12">
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white">
                                <div class="m-b-25"> <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image"> </div>
                                <h6 class="f-w-600"><%=user.getName() %></h6>
                                <p><%=user.getShopName() %></p> <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                                <div style="margin-left: -15px;">
                                	<a href="#" data-toggle="collapse" data-target="#change-password" aria-expanded="false" aria-controls="collapseExample" class="u-align-center u-border-2 u-border-black u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-none u-radius-48 u-text-black u-text-hover-white u-btn-1">Change Password</a>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Personal - Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Email</p>
                                        <h6 class="text-muted f-w-400"><%= user.getEmail() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Phone</p>
                                        <h6 class="text-muted f-w-400"><%=user.getNumber() %></h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Score</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Market Score</p>
                                        <h6 class="text-muted f-w-400">100</h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Market Value Score</p>
                                        <h6 class="text-muted f-w-400">15</h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Other Infomation</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Address</p>
                                        <h6 class="text-muted f-w-400"><%=user.getAddress() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Proof</p>
                                        <h6 class="text-muted f-w-400"><%=user.getProof() %></h6>
                                    </div>
                                </div>
                                <ul class="social-link list-unstyled m-t-40 m-b-10">
                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
    

   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  </body>
</html>
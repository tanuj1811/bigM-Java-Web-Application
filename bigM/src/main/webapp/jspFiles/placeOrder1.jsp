<%@page import="com.bigM.dao.OrderDB"%>
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
	<link rel="stylesheet" href="nicepage.css">
    <title>Hello, world!</title>
    
    <style type="text/css">
.card {
    background-color: #fff;
    border-radius: 90px;
    border: none;
    position: relative;
    margin-bottom: 30px;
    box-shadow: 0 0.46875rem 2.1875rem rgba(90,97,105,0.1), 0 0.9375rem 1.40625rem rgba(90,97,105,0.1), 0 0.25rem 0.53125rem rgba(90,97,105,0.12), 0 0.125rem 0.1875rem rgba(90,97,105,0.1);
  height:50vh;
  width: 30vw;
  text-align:center;
  padding: 10px 10px 100px 0px;
}
.l-bg-cherry {
    background: linear-gradient(to right, #493240, #f09) !important;
    color: #fff;
}

.l-bg-blue-dark {
    background: linear-gradient(to right, #373b44, #4286f4) !important;
    color: #fff;
}

.l-bg-green-dark {
    background: linear-gradient(to right, #0a504a, #38ef7d) !important;
    color: #fff;
}

.l-bg-orange-dark {
    background: linear-gradient(to right, #a86008, #ffba56) !important;
    color: #fff;
}

.card .card-statistic-3 .card-icon-large .fas, .card .card-statistic-3 .card-icon-large .far, .card .card-statistic-3 .card-icon-large .fab, .card .card-statistic-3 .card-icon-large .fal {
    font-size: 110px;
}

.card .card-statistic-3 .card-icon {
    text-align: center;
    line-height: 50px;
    margin-left: 15px;
    color: #000;
    position: absolute;
    right: -5px;
    top: 20px;
    opacity: 0.1;
}



.l-bg-cyan {
    background: linear-gradient(135deg, #289cf5, #84c0ec) !important;
    color: #fff;
}

.l-bg-green {
    background: linear-gradient(135deg, #23bdb8 0%, #43e794 100%) !important;
    color: #fff;
}

.l-bg-orange {
    background: linear-gradient(to right, #f9900e, #ffba56) !important;
    color: #fff;
}

.l-bg-cyan {
    background: linear-gradient(135deg, #289cf5, #84c0ec) !important;
    color: #fff;
}


table { font-size: 100%; table-layout: fixed; width: 100%; }
table { border-collapse: separate; border-spacing: 2px; }
th, td { border-width: 1px; padding: 0.5em; position: relative; text-align: left; }
th, td { border-radius: 0.25em; border-style: solid; }
th { background: ; border-color: #BBB; }
td { border-color: #DDD; }

table.balance th, table.balance td { width: 100%; }
table.balance td { text-align: right; }
table.balance {  width: 110%; }
table.balance:after { clear: both; content: ""; display: table; }
    
    </style>
</head>
<body style = "background-color: #333333">

 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" crossorigin="anonymous">


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
<header>

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



</header>



<main style="margin-top: 4%">
<div class = "container">
		<div class="col-md-999 ">
		    <div class="row" >
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-cherry">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-glass-cheers"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Coke</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                            <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                  <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Coka-Cola" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-glass-cheers"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Limca</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Limca" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-green-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-glass-cheers"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Maaza</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Maaza" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-glass-cheers"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Thumps-up</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Thumps-up" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-glass-cheers"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Kinley</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Kinley" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-trash"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Sprite</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Sprite" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-trash"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Fanta</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Fanta" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-trash"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Minute Maid</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                             <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Minute-Maid" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-5 col-lg-6" style="padding: 10px 10px 10px 10px;">
		            <div class="card l-bg-orange-dark">
		                <div class="card-statistic-3 p-4">
		                    <div class="card-icon card-icon-large"><i class="fas fa-trash"></i></div>
		                    <div class="mb-4">
		                        <h1 class="card-title mb-0 mt-0">Schweppes</h1>
		                    </div>
		                  <center>
		                    <div class="row  mb-2 d-flex">
		                        <div class="col-8">
		                            <h2 class="d-flex align-items-center mb-0">
		                                
		                            </h2>
		                            <table class="balance">
		                                <tr>
		                                  <th><span >20mL</span></th>
		                                  <td><span><%='\u20b9' %> 20</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >1L</span></th>
		                                  <td><span>Rs.50</span></td>
		                                </tr>
		                                <tr>
		                                  <th><span >2L</span></th>
		                                  <td><span>Rs.90</span></td>
		                                </tr>
		                              </table>
		                        </div>
		                  </div>
		                    <div class="d-flex justify-content-end pt-3">
			                  <!-- <a href = 'actions.jsp?action=update&orderId=' type="button" class="btn btn-outline-success btn-submit">Update</a> -->
			                   <a class="btn btn-outline-success btn-success bg-dark" type = "button" href="placeOrder2.jsp?productName=Schweppes" >Book This One</a>
			                </div>
		                </center>   
		                    
		                </div>
		            </div>
		        </div>
		        
		        
		        
		        
		        
		        
		        
		        
		
		    </div>
		</div>

</div>
</main>

	












 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style type="text/css">

    .login_button,.logout_button{
      color: white;
      font-size: 14px;
      padding: 8px 20px;
      border-radius: 50px;
      text-decoration: none;
      transition: 0.3s background-color;
    }
    
    .login_button:hover,.logout_button:hover{
      background-color: rgb(53, 123, 222);
      border-color: rgb(16, 102, 224);
      color: white;
    }
    .navbar-toggler{
      border: none;
    }

    .navbar-toggler:hover{
      color: black;
      
    }
    .navbar-toggler:focus{
      box-shadow: none;
      outline: none;

    }
    .profile{
      color: white;
      text-decoration: none;
    }


    .nav-link{
      color: white;
      font-weight: 500;
    }
    .nav-link:hover,.nav-link.active{
      color: rgb(53, 123, 222);
      text-decoration-line: underline;
      padding-bottom: 5px;
    }
    .navbar{
      border: solid 1px white;
      background-color: rgba(173, 181, 237,0.6);
    }
    
    .offcanvas{
      background-color: rgba(173, 181, 237,0.6);
    }
    .profilepassword{
      display: none;

    }

    .profilename{
      display: inline;
      
      
    }
    .profilepassword a{
      background-color: rgba(173, 181, 237,0.8);
      border: 1px solid white;
      width: auto;
      height: 34px;
      font-family: font-family: Georgia, serif;;
      font-weight: 600;
      font-size: 14px;
      padding-left: 10px;
      padding-right: 10px;
      text-decoration: none;
      color: white;


    }

    .profilename:hover .profilepassword{
      display: block;
      position: absolute;
      display: flex;
      flex-direction: column;
    }
    .rightnav{
    display:flex;
    align-items: center;
    justify-content: center;
    align-items: center;
    gap: 5px;
    }
    .profilepassword a:hover{
      color: rgb(53, 123, 222);
      text-decoration-line: underline;

    }
    .profile:hover{
            color: rgb(53, 123, 222);

    }

  </style>
    
</head>
<body>

  <nav class="navbar navbar-expand-lg fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand me-auto" href="#">Logo</a>
    
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Logo</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link  mx-lg-z" aria-current="page" href="Home.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="EventList.jsp">Events</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="#">About Us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="#">Contact</a>
          </li>
         <% if(session.getAttribute("uname")!=null && !("1".equals(session.getAttribute("uid"))) ){ %> 
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="EventStatus.jsp">Status</a>
          </li>
           <% } %>
          <% if("1".equals(session.getAttribute("uid"))){ %> 
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="viewCustomer.jsp">Clients</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="Bookings.jsp">Bookings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="AddEvents.jsp">Add/Delete Event</a>
          </li>
           <li class="nav-item">
            <a class="nav-link mx-lg-z" href="EditEvent.jsp">Edit Events</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="EnqueryList.jsp">Enquery</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-z" href="#">Feedback</a>
          </li>
          <% } %> 
        </ul>
      </div>
    </div>
    <div class="rightnav">
    <% if(session.getAttribute("uname")==null){ %>
    <a href="Login.jsp" class="login_button btn btn-outline-light">Login</a>
    <a href="Register.jsp" class="login_button btn btn-outline-light">Signup</a>
    <% } %>
    <% if(session.getAttribute("uname")!=null){ %> 
    <div class="profilename">
      <p href="#" class="profile"><i class="fa-solid fa-circle-user "></i><%= session.getAttribute("uname") %>
      <div class="profilepassword">
        <a href="ViewProfile.jsp">View Profile</a>
        <a href="PasswordValidation.jsp">Change Password</a>
      </div>
    </p>
    </div>
    <span>
        <a href="Logout.jsp" class="logout_button btn btn-outline-light">Logout</a>
    
    </span>

    

     <% } %>
    <button class="navbar-toggler " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    </div>
    
  </div>
</nav>
</body>
</html>
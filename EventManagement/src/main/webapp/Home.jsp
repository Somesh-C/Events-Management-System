<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
	<script>
//jQuery.validator.addMethod( name, method [, message ] )
   
// value---> "current value of the validated element".
//elememt---> " element to be validated ".

            jQuery.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            });
            
            jQuery(document).ready(function($) {
                $("#enquery").validate({
                    //ignore: [],
                    rules: {
                        name: {
                            required: true
                        },
                        email: {
                            required: true,
                            checkemail: true
                        },
                        phone: {
                            required: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        catagory: {
                            required: true,
                         
                        },
                        message: {
                            required: true,
                            
                            
                        }
                    },
                    messages: {
                        name: {
                            required: "Please enter the name."
                        },
                        email: {
                            required: "Please enter the email.",
                            email: "Please enter valid email id"
                        },
                        phone: {
                            required: "Please enter the number.",
                            minlength: "Please enter the  10 digit number .",
                            maxlength: "More than 10 digits."
                        },
                        catagory: {
                            required: "Please enter the catagory.",
                            
                        },
                        message: {
                            required: "Please enter the message.",
                            
                        }
                    }
                });
            });
        </script>
        
<style type="text/css">
    body{
						background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));

    }
    .slidind_bar img{
        height: 700px;
        padding-left: 20px;
        padding-right: 20px;
        border: solid 1px white;
        border-bottom-right-radius: 10%;
        border-bottom-left-radius:  10%;
    }

    .slidind_bar h1{
        font-weight: 800;
        font-size: 50px;
    }
    .welcome{
        color: rgb(224, 221, 49);
    }

    .slidind_bar p{
        font-weight: 500;
        font-size: 40px;
        color: rgb(184, 194, 212);
    }
    .aboutus p{
        font-family: cursive;
        text-align: left;
        font-size: 18px;
    }
    .aboutus h1{
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;
        font-size: 50px;
    }
    .aboutus button{
        height: 50px;
        color: white;
        background-color:rgb(230, 60, 135);
        border-radius: 10px;
        border: solid 1px rgb(230, 60, 135);
        font-size: 20px;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 700;
    }
    .aboutus button:hover{
        color: black;
        border: solid 1px rgb(237, 7, 109);
        background-color:white ;
        box-shadow: rgba(230, 60, 135, 0.35) 0px 30px 30px;


    }
    .aboutus .col{
        padding-bottom: 15px;
    }

    .about{
        color: rgb(230, 60, 135);
    }
    .aboutus{
        background-color: rgb(232, 213, 222);
    }
    .whatwedo h2{
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;
        font-size: 50px;
        text-align: center;
    }
    .whatwedo h1{
        text-align: center;
        font-weight: 700;
        color: rgba(250, 250, 250, 0.7);
        -webkit-text-stroke-width: 1px;
        -webkit-text-stroke-color: black;


    }
    .whatwedo button{
        color: black;
        border: 1px solid white;
        border-radius: 10px;
        background-color: rgba(235, 240, 245, 0.3);
        height: 40px;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;




    }
    .whatwedo button:hover{
        color: white;
        background-image: linear-gradient(to right ,rgb(230, 60, 135) , rgb(61, 144, 227));

    }
    form{
        display: flex;
        flex-direction: column;
        background-image: linear-gradient(to right ,rgb(230, 60, 135) , rgb(61, 144, 227));
        align-items: center;
    }

    form h1{
        color: white;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;
        padding-top: 20px;

    }
    
    form h3{
        color: white;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;
        padding-top: 20px;

    }

    form input{
        width: 70%;
        height: 40px;
        border: 2px  solid white;
        border-radius: 20px;
        font-weight: 600;
        padding-left: 20px;
        
    
    }

    form input:hover{

        border: 3px  solid rgb(41, 162, 227);
        
    }

    form label{
        padding-top: 20px;
        display: flex;
        color: white;
        font-size: 18px;
        font-weight: 600;

    }


    form button{
        height: 40px;
        width: 100px;
        background-color: rgba(225, 225, 225,0.2);
        border: solid 2px white;
        border-radius: 10px;
        color: white;
    }

    form button:hover{
        color: black;
        border-color: rgb(73, 170, 222);
    }
    .submitbutton{
        padding-top: 20px;
        padding-bottom: 20px;

    }
    .contact{
        background-color: rgb(188, 167, 217);

    }
    .contact h2,p{
        padding-left: 20px;
       padding-right: 20px;


        
    }
    .contact h2{
        padding-top: 25px;
    }
    .contact p{
        font-weight: 70px;
                font-weight: 600;

    }

    .contact h1{

        color: white;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;
        text-align: center;
        padding-top: 20px;
    }

    .contact h2{

        color: white;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 600;
    }
    .insta,.linkdin,.youtub, .facebook{
        font-size: 40px;
        padding-left: 10px;
        color: white;
    }
    .msg{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        
    
    }
    

}
</style>
</head>
<body>
      <%@include file="Header.jsp"%> 

<div class="slidind_bar">
    
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC5MO4cPTMP3Ezp_zZxP6zcVfC5nbtCPDQQw&s" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1><span class="welcome">Welcome To</span> Events and Services!</h1>
        <p>We take the responsibility of making your dream a reality</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSubcWL0EnxRU-k6dy73U0ZNk0EFiqEY3tq7Q&s" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1><span class="welcome">Welcome To</span> Events and Services!</h1>
        <p>We take the responsibility of making your dream a reality</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-SLQcGOZZYvzBGeI3XLGk0eX8W2D2zoO98Q&s" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1><span class="welcome">Welcome To</span> Events and Services!</h1>
        <p>We take the responsibility of making your dream a reality</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>

<div class="aboutus">
<div class="container text-center">

  <div class="row">
    <div class="col">
      <h1><span class="about">About</span> Us</h1>
    </div>
  </div>

  <div class="row">
    <div class="col-lg">
      <p>We are Corporate Event Planners and one of the Best Event Management Company in Bangalore with our services available PAN India. Our forte lies in delivering cutting edge, innovative and professional event management services. We are a bunch of fun loving, energetic and passionate people working towards the common goal of providing exceptional services. From inspirational ideas to stunning productions, strong themes and creative programs, we do everything to create memorable experiences and branding opportunities that exceed customer expectations. </p>
    </div>
    <div class="col-lg">
      <p>We take pride in presenting ourselves as one of the best in the industry. We offer a wide range of event management services. Be it a Virtual conference, Award ceremony, Product launch, Family event or Sports event, we have you covered. We are a one stop solution to all your corporate situations.</p>
    </div>
    
  </div>

  <div class="row">
    <div class="col">
      <button>Know More <i class="fa-solid fa-circle-right"></i></button>
    </div>
  </div>
</div>
</div>

<div class="whatwedo">
     <h2>What We Do</h2>
    <div class="row">

        <div class="col-lg">
            <div class="card text-bg-dark">
                <a href="EventList.jsp">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7r8lb20iTGpbd3htqypgykpd5pH7fdJVxsw&s" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex justify-content-center align-items-center flex-column">
                        <h1 class="card-title">CORPORATE EVENTS MANAGEMENT SERVICE</h1>
                        <div>
                            <button>View more</button>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg">
            <div class="card text-bg-dark">
                <a href="EventList.jsp">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7r8lb20iTGpbd3htqypgykpd5pH7fdJVxsw&s" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex justify-content-center align-items-center flex-column" >
                        <h1 class="card-title ">SOCIAL EVENTS MANAGEMENT SERVICE</h1>
                        <div>
                            <button>View more</button>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg">
            <div class="card text-bg-dark">
                <a href="EventList.jsp">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7r8lb20iTGpbd3htqypgykpd5pH7fdJVxsw&s" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex justify-content-center align-items-center flex-column">
                        <h1 class="card-title">PRODUCT LAUNCHES MANAGEMENT SERVICE</h1>
                        <div>
                            <button>View more</button>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        
    </div>
    
</div>

<div class="contactenquery">
    <div class="row justify-content-md-center p-2">
        <div class="col-lg-5 contact">
            <h1>Contact Us</h1>
            <h2>Locate Us</h2>
            <p>#123, 18th Cross Road, 2nd Main Road,Bengaluru, Karnataka 560012 </p>
            <h2>Mail Us</h2>
            <p>csomesh003@gmail.com</p>
            <h2>Phone Us</h2>
            <p>9980756172, 7259622651</p>
            <h2>Follow Us</h2>
            <p><span class="insta"><i class="fa-brands fa-instagram"></i></span> <span class="linkdin"><i class="fa-brands fa-linkedin"></i></span> <span class="youtub"><i class="fa-brands fa-youtube"></i></span> <span class="facebook"><i class="fa-brands fa-facebook"></i></span> </p>
        </div>
        <div class="col-lg-5">
            <form action="events" method="POST" id="enquery">
            <%if(request.getAttribute("Enquerystatus")!=null){  %>
            <div class="msg">
             <h1>Thank you Contacting</h1>
             <h3><%=request.getAttribute("Enquerystatus") %></h3>
             </div>
            <%} %>
            <% if(request.getAttribute("Enquerystatus")==null){ %>
            <h1>Send Enquery</h1>
            <label>Name:</label>
            <input type="text" name="name" placeholder="Enter Full Name">
            <label>Email:</label>
            <input type="email" name="email" placeholder="Enter Email Address">
            <label>Phone:</label>
            <input type="tel" name="phone" placeholder="Enter Phone Number">
            <label>Catagory:</label>
            <input type="text" name="catagory" placeholder="Select Catagory">
            <label>Message:</label>
            <input type="text" name="message" placeholder="Enter Message">
            
            <div class="submitbutton">
				<button type="submit" name="EnqueryButton">Submit</button>
            </div>
            <%} %>
             </form>
           
        </div>
        
    </div>
    
</div>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	
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
                $("#login").validate({
                    //ignore: [],
                    rules: {

                        email: {
                            required: true,
                            checkemail: true
                        },
                        password: {
                            required: true,
                            minlength: 6
                        }      
                    },
                    messages: {
                        
                        email: {
                            required: "Please enter the email.",
                            email: "Please enter valid email id"
                        },
                        
                        password: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to  6.",
                        }
                        
                    }
                });
            });
        </script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/js/all.min.js" integrity="sha512-1JkMy1LR9bTo3psH+H4SV5bO2dFylgOy+UJhMus1zF4VEFuZVu5lsi4I6iIndE4N9p01z1554ZDcvMSjMaqCBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style type="text/css">
    	body{
    		background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));
    		margin: 0;
    		padding: 0;
    		display: flex;
    		align-items: center;
    		justify-content: center;
    		height: 100vh;
    		flex-direction: column;
    		

    	}
    	.allitems{
    		border: solid 1px black;
    		width: 40%;
    		display: flex;
    		height: 300px;
    		border-radius: 15px;

    	}
    	.leftside{
    		width: 50%;
    		background-image: url("https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3Vwd2s2MTY5MTk3NS13aWtpbWVkaWEtaW1hZ2Uta293YjI4OTguanBn.jpg");
    		background-repeat: no-repeat;
    		background-size: cover;
    		    		   text-align: center;

    		border-top-left-radius: 15px;
    		border-bottom-left-radius: 15px;
    		font-family: Helvetica, Arial, sans-serif;
    		display: flex;
    		flex-direction: column;
    		align-items: center;
    		justify-content: center;

    	}
    	.rightside{
    		width: 50%;
    		background-color: rgba(123, 126, 219,0.2);
    		padding-left: 10px;

    	}
    	.formcontent{
    		display: flex;
    		flex-direction: column;
    	}
    	.rightside input{
    		width: 80%;
    		height: 25px;
    		border-radius: 10px;
    		font-family: Helvetica, Arial, sans-serif;
    		
    		
    	}
    	.rightside label{
    		
    		font-family: Helvetica, Arial, sans-serif;
            font-weight: 600;
    		

    	}
    	.rightside h1{
    	padding-left: 0px;
    		text-align: center;
    		font-family: Helvetica, Arial, sans-serif;
            font-weight: 800;
            color: rgb(102, 139, 232);


    	}
    	.buttons{
    	 padding-top: 20px;
    	 padding-right: 20px;
    	 display: flex;
    	 align-items: center;
    	 justify-content: space-between;
    	}
    	.buttons button{
    		height: 30px;
    		width: 110px;
    		border-radius: 10px;
    	}
    	.leftside h1{
    		   font-family: Helvetica, Arial, sans-serif;
    		   font-weight: 800;
    		   color: white;
    		   text-align: center;

    	}
    	.leftside h3{
font-family: cursive;    		   font-weight: 800;
    		   color: white;
    		   text-align: center;
    	}
    	.leftside button{
    		font-family: Helvetica, Arial, sans-serif;
    		   font-weight: 800;
    		   text-align: center;
    		   background-color: rgba(250, 245, 245, 0.3);
    		   color: white;
    		   height: 40px;
    		width: 110px;
    		border-radius: 10px;
    		border: solid 1px white;
    	}
    	.buttons a{
    		color: rgb(102, 139, 232);
    	}
    	.msg{
    	color:red;
    	font-family: Helvetica, Arial, sans-serif;
    		   font-weight: 800;
    	}
    	
    	.error{
    	color:red;
    	
    	}
    	

    </style>
</head>
<body>       
<%@include file="Header.jsp"%>

         <% if(request.getAttribute("status")!=null){ %>
         <h2 class="msg"><%=request.getAttribute("status") %></h2>
         <%} %>

	<div class="allitems">
		<div class="leftside">
			<h1>Welcome Back!</h1>
			<h3>Event Management System</h3>
			 <a href="Register.jsp"><button>Register</button></a>
			
		</div>
		<div class="rightside">
			<form action="events" method="POST"  class="formcontent" id="login">
				<h1>Login</h1>
				<label>E-mail:</label>
				<input type="email" name="email" placeholder="Enter your email">
				<label>Password:</label>
				<input type="Password" name="password" placeholder="Enter Password">
				<div class="buttons">
					<button type="submit" name="Login">Login</button>
					<a href="#">Forgot Password?</a>
				</div>
			
			</form>	
		</div>
	</div>


</body>
</html>
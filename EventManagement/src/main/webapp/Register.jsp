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
                $("#register").validate({
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
                        password1: {
                            required: true,
                            minlength: 6
                        },
                        password2: {
                            required: true,
                            minlength: 6,
                            equalTo: "#pw"
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
                        password1: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to  6.",
                        },
                        password2: {
                            required: "Please reenter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                            equalTo: "mismatch password"
                        }
                    }
                });
            });
        </script>
	<style type="text/css">
		.Register_form{
			display: flex;
			flex-direction: column;
			margin-left: 40%;
			margin-right: 40%;
			margin-top:4%;
			border-radius: 10px;
    		border: solid 1px black;
 			background-color: rgba(123, 126, 219,0.2);
		}
		.all_tags{
			display: flex;
			flex-direction: column;
		}
		.Registration{
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.all_tags input{
			width: 80%;
    		border: none;
    		border-radius: 6px;
    		height: 20px;
    		border-bottom: solid 3px rgb(192, 200, 237);
		}
		.all_tags input:hover{
    		border-color: rgb(100, 116, 189);

    	}
    	.all_tags button{
    		width: 40%;
    		height: 30px;
    		background-color: white;
         border: solid 1px black;
    		border-radius: 10px;
    	}
    	.all_tags button:hover{
           background-color: rgb(192, 200, 237);
        }
        .all_tags button:active{
           background-color: rgb(100, 116, 189);
           color: white;
        }
        .all_tags,.texts {
    		 padding-left: 10%;

    	}
    	.all_tags label{
    		
    	}
    	.buttons{
    		display: flex;
    		align-items: center;
    		justify-content: flex-start;
    		padding-left: 0%;
    		padding-top: 10px;
    	}
    	
    	.error{
    	color:red;
    	
    	
    	}
    
	</style>
</head>
<body>
<%@include file="Header.jsp"%>

         <% if(request.getAttribute("status")!=null){ %>
         <%=request.getAttribute("status") %>
         <%} %>

	<div >
	<form class="Register_form" action="events" method="post" id="register">
	<div class="Registration">
		<h2>Registration</h2>
	</div>
	<div class="all_tags">
			
		<label>Enter name:</label>
		<input type="text" name="name">
		<label>E mail:</label>
		<input type="email" name="email">
		<label>Phone number:</label>
		<input type="tel" name="phone">
		<label>Enter Password:</label>
		<input type="Password" name="password1" id="pw">
		<label>Confirm Password:</label>
		<input type="Password" name="password2">
		<div class="buttons">
			<button type="submit" name="Register">Register</button>
		</div>
		
	</div>
	<div class="texts">
		<p>Already have an account <a href="Login.jsp">Click here</a> for Login</p>

	</div>
		</form>

		</div>



</body>
</html>
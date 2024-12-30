<%@page import="com.event.module.*" %>
<%@page import="com.event.DAO.*" %>
<%@page import="java.util.*"%>

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
                $("#bookevent").validate({
                    //ignore: [],
                    rules: {
                    	uname: {
                            required: true
                        },
                        email: {
                            required: true,
                            checkemail: true
                        },
                        address: {
                            required: true
                          
                        },
                        ename: {
                            required: true
                           
                        },
                        ecost: {
                            required: true
                           
                        },
                        edate: {
                            required: true
                           
                        }
                    },
                    messages: {
                    	uname: {
                            required: "Please enter the name."
                        },
                        email: {
                            required: "Please enter the email.",
                            email: "Please enter valid email id"
                        },
                        address: {
                            required: "Please enter the address."
                           
                        },
                        ename: {
                            required: "Please enter event name."
                            
                        },
                        ecost: {
                            required: "Please enter the event cost."
                           
                        },
                        edate: {
                            required: "Please select the event date."
                           
                        }
                    }
                });
            });
        </script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<style type="text/css">
		body{
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
			height: 100vh;
									background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));

			
		}
		.allforms input{
			width
		}
		form{
			width: 350px;
			border: solid 4px white;
			border-radius: 15px;
			padding: 15px;
			background-color: rgba(247, 247, 247,	0.5);
			
			
		}

		label, input{
			font-family: Helvetica, Arial, sans-serif;
        font-weight: 700;
		}

		.naming{
			font-family: Helvetica, Arial, sans-serif;
        font-weight: 700;
      color: rgb(237, 111, 69);
      text-align:center;

		}

		input{
			height: 30px;
			outline: none;
		}

		input:hover{
			border: solid 1px rgb(98, 118, 222);
		}

		.msg{
            color:rgb(129, 237, 66);
            text-align:center;
      

		}

		.details{
			      padding-top: 70px;

		}

	</style>
</head>

<body class="container-md">
<%@include file="Header.jsp"%>

<div class="details">

     <%
     EventModule e=new EventModule(session);
     String eid=request.getParameter("EventId");
     Events e1=e.getEventBookingDetaile(eid); 
 
     %>
     
     <%if(request.getAttribute("status")!=null){ %>
     <h4 class="msg"><%=request.getAttribute("status") %>
     <br>
     <a href="EventStatus.jsp">Click here </a> to check status
     </h4>
     
     
     
     <% } %>


     

	<h3 class="naming">Book an event</h3>

	<form action="events" method="POST" class="allforms " id="bookevent">
  <div class="mb-3">
    <label class="form-label">Name:</label>
    <input type="text" class="form-control" name="uname" value="<%=session.getAttribute("uname") %>">
  </div>
  <div class="mb-3">
    <label class="form-label">Email:</label>
    <input type="email" class="form-control" name="email" value="<%=session.getAttribute("umail") %>">
  </div>
  <div class="mb-3">
    <label class="form-label">Address:</label>
    <input type="text" class="form-control" name="address" placeholder="Enter your Address">
  </div>
  <div class="mb-3">
    <label class="form-label">Event Name:</label>
    <input type="text" class="form-control" name="ename" value="<%=e1.getEventName() %>" disabled readonly >
  </div>
  <div class="mb-3">
    <label class="form-label">Event Cost:</label>
    <input type="text" class="form-control" name="ecost" value="<%= e1.getEventCost() %>" disabled readonly >
  </div>
  <div class="mb-3">
    <label class="form-label">Event Date:</label>
    <input type="date" class="form-control" name="edate">
  </div>
  <input type="hidden" name="eid" value="<%= e1.getEventId() %>">
  <button type="submit" name="BookEvent"class="btn btn-primary">Book Event</button>
</form>
</div>
</body>
</html>
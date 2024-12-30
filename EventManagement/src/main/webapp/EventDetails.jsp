
<%@page import="com.event.module.*" %>
<%@page import="com.event.DAO.*" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>

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

		.details{
			display: flex;
			justify-content: flex-start;
			flex-direction: column;
			gap: 30px;
		}

		.element{
			font-family: Helvetica, Arial, sans-serif;
        	font-weight: 800;
		}
		

		.name{
			color: rgb(177, 219, 77);
		}
		
		.cost{
			color: rgb(171, 227, 39);
		}
		

	</style>
</head>
<body>
<%@include file="Header.jsp"%>

    
     <% EventModule e= new EventModule(session);
      String catagory=request.getParameter("EventCategory");
      Events e1=e.getEventDetails(catagory);
        
     %>
    <h3><%= e1.getEventCategory() %> Events</h3>
	<div class="card mb-3" style="max-width: 600px;">
  	<div class="row g-0">
    	<div class="col-md-6">
      		<img src="https://img.freepik.com/premium-photo/wedding-pics_1305541-8038.jpg" class="img-fluid rounded-start" alt="...">
    	</div>
    	<div class="col-md-6">
      		<div class="card-body details">
        		<h5 class="card-title">Event Name: <span class="element name"><%= e1.getEventName() %></span></h5>
        		<h6>Cost: <span class="element cost">&#8377;<%= e1.getEventCost() %></span></h6>
        		<p class="card-text"><%=e1.getEventDetaile() %></p>
        		
        		<a href="BookEvents.jsp?EventId=<%= e1.getEventId() %> " class="btn btn-primary">Book now</a>
      		</div>
    	</div>
  </div>
</div>

</body>

</html>
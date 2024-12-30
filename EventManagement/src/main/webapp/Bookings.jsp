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
		
		
		.container h2{
			display: flex;
			align-items: center;
			justify-content: center;
			background-color: rgb(92, 172, 230);
			border-top-left-radius: 20px;
			border-top-right-radius: 20px;
			width: 100%;
			height: 60px;
			color: white;
            font-family: Helvetica, Arial, sans-serif;
            font-weight: 800;
		}
		body{
			margin-top: 70px;
			background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));
		}

		img{
			width: 80px;
		}

		form{
			display: flex;
			flex-direction:column;		
			gap: 5px;
		}
		
		.container{
		padding-top:70px;
		}
		
		.Cancell{
		color:red;
		}
		
		.Booked{
		color:green;
		}

		
	</style>
</head>
<body>
  <%@include file="Header.jsp"%>

	<div class="container">
		<h2>Booking Detailes</h2>
	<table class="table table-striped">
    	<tr>
    		<th>Booking Id</th>
    		<th>Image</th>
    		<th>Event Name</th>
    		<th>Cost</th>
    		<th>Email</th>
    		<th>Booking Date</th>
    		<th>Event Date</th>	
    		<th>Status</th>
    	</tr>
    	
    	<%
    	EventModule e=new EventModule(session);
    	ArrayList<Bookings> al=e.getBookings();
    	Iterator<Bookings> it=al.iterator();
    	
    	while(it.hasNext()){
    		
    	Bookings b=it.next();
    	
    	%>

    	<tr>
    		<td><%=b.getBookingID() %></td>
    		<td><img src="<%=b.getEventImg() %>" alt="..."></td>
    		<td><%= b.getEventName() %></td>
    		<td><%= b.getEventCost() %></td>
    		<td><%= b.getEmail() %></td>
    		<td><%= b.getBookingDate() %></td>
    		<td><%= b.getEventDate() %></td>

    		<td>
    			<form action="events" method="POST">
				<input type="hidden" name="BookingId" value="<%= b.getBookingID() %>" />
				<%if(b.getStatus().equalsIgnoreCase("pending")){ %>
				<input type="submit" class="btn btn-danger" name="CancellEvent" value="Cancell" />
				  <% if(session.getAttribute("uid").equals("1")){ %>
				<input type="submit" class="btn btn-success" name="AcceptEvent" value="Accept" />
				   <%} %>
				<%} %>
				
				<% if(b.getStatus().equalsIgnoreCase("Booked")){ %>
				<p class="Booked"><%=b.getStatus() %></p>
				<%} %>
				
				<% if(b.getStatus().equalsIgnoreCase("Cancelled")){ %>
				<p class="Cancell"><%=b.getStatus() %></p>
				<%} %>

				</form>
            </td>
    	</tr>
    	
    	<%} %>
  
    </table>
	</div>
</body>
</html></title>
</head>
<body>

</body>
</html>
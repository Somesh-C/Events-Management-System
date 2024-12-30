
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
		
		.fullbody{
		padding-top:70px;
		}
		body{
			margin-top: 70px;
			background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));
		}
		
		.msg{
		text-align:center;
		color:rgb(247, 150, 59);
        font-family: Helvetica, Arial, sans-serif;
        font-weight: 800;
		}

		
	</style>
</head>
<body>
              <%@include file="Header.jsp"%>

<div class="fullbody">
       <% if(request.getAttribute("status")!=null){ %>
       <h3 class="msg"><%= request.getAttribute("status") %></h3>
       <% } %> 
       
       
	<div class="container">
		<h2>Enquery List</h2>
	<table class="table table-striped">
    	<tr>
    		<th>ID</th>
    		<th>Name</th>
    		<th>E-mail</th>
    		<th>Phone No</th>
    		<th>Catagory</th>
    		<th>Description</th>
    		<th>Date</th>
    		<th>Delete</th>	
    	</tr>
    	
    	                <%
						EventModule e1 = new EventModule(session);
						ArrayList<Enquery> ar = e1.getEnquiryList();
						Iterator<Enquery> itr = ar.iterator();
						while (itr.hasNext()) {
						Enquery e = itr.next();
						%> 
    	

    	<tr>
    		<td><%=e.getId()%></td>
			<td><%=e.getName()%></td>
			<td><%=e.getEmail()%></td>
			<td><%=e.getPhno()%></td>
			<td><%=e.getCatagory()%></td>
			<td><%=e.getDescription()%></td>
			<td><%=e.getDate()%></td>

    		<td>
    			<form action="events" method="POST">
				<input type="hidden" name="EnqueryId" value= "<%= e.getId()%>"/>
				<input type="submit" name="DeleteEnquery" class="btn btn-danger" value="Delete"/>
				</form>
            </td>
    	</tr>
    	              <% } %> 
    </table>
		
	</div>

</div>
</body>
</html>
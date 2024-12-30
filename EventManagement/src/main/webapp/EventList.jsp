
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
			gap: 30px;
			margin-left: 20px;
			margin-right: 20px;
			background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));

		}
		.cards{
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
			padding-bottom: 20px;
			
		}

		.row{
			display: flex;
			align-items: center;
			justify-content: center;

		}
		.content{
			padding-top: 70px;
		}

		.card h5{
			font-family: Helvetica, Arial, sans-serif;
        font-weight: 800;
		}

		.card a{
			font-family: Helvetica, Arial, sans-serif;
        font-weight: 700;
		}
		.card p{
			font-family: Helvetica, Arial, sans-serif;
        
		}

		.card{

			border-radius: 20px;
		}

	</style>

</head>
<body>
    <%@include file="Header.jsp"%>

	<div class=" text-center content">
  <div class="row">

	<%EventModule e=new EventModule(session);
	ArrayList<Events> al=e.getEventList();
	Iterator<Events> ir=al.listIterator();
	
	while(ir.hasNext()){
			Events es =ir.next();
	
	%>
	

	
    <div class="col-lg-4 cards">
        
    		<div class="card" style="width: 18rem;">
         		<img src="<%=es.getEventImg() %>" class="card-img-top" alt="...">
  					<div class="card-body">
    					<h5 class="card-title"><%=es.getEventCategory() %></h5>
    					<p class="card-text"><%=es.getEventDetaile() %></p>
    					<a href="EventDetails.jsp?EventCategory=<%=es.getEventCategory()%>" class="btn btn-primary">Book now</a>
  					</div>
			</div>
        <!-- Card name -->  
    </div>
   <%} %>

  </div>
  </div>
</div>
</body>
</html>
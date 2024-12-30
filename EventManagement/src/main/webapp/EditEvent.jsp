<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/js/all.min.js" integrity="sha512-1JkMy1LR9bTo3psH+H4SV5bO2dFylgOy+UJhMus1zF4VEFuZVu5lsi4I6iIndE4N9p01z1554ZDcvMSjMaqCBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
	<script>
//jQuery.validator.addMethod( name, method [, message ] )
   
// value---> "current value of the validated element".
//elememt---> " element to be validated ".
            
            jQuery(document).ready(function($) {
                $("#deleteevent").validate({
                    //ignore: [],
                    rules: {
                    	category: {
                            required: true
                        }
                       
                    },
                    messages: {
                    	category: {
                            required: "Please select the event category."
                        }
                    }
                });
            });
        </script>

	<style type="text/css">
		body{
			background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));

		}
		.allcotents{
			display: flex;
			flex-direction: column;
			width: 20%;
		}
		.addevent{
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			padding-top: 70px;

		}
		.addevent h1{
			text-align: center;
			font-family: Helvetica, Arial, sans-serif;
			font-weight: 800;
			color: rgb(102, 139, 232);


		}
		.addevent input{
            height: 35px;
			border-radius: 10px;
			border: solid 3px white;
			background-color: rgba(127, 102, 237, 0.1);

		}
		.addevent label{
			padding-top: 10px;

		}
		.buttons{
			display: flex;
			justify-content: space-between;
			padding-top: 20px;
		}
		.buttons button{
			height: 40px;
			width: 110px;
			border: 2px solid white;
			border-radius: 5px;
			background-color: rgba(127, 102, 237, 0.1);
		}
	</style>
</head>
<body>
<%@include file="Header.jsp"%>

	<div class="addevent">
	
			<% if(request.getAttribute("status")!=null){ %>
        	 <h2 class="msg"><%=request.getAttribute("status") %></h2>
         	<%} %>
         	
		<form action="events" method="POST" class="allcotents" id="deleteevent">
			<h1>Edit Events</h1>
			
			<label>Select Event Category:</label>
			<input type="text" name="category">
			
			<div class="buttons">
				<button type="submit" name="DeleteEvents">Update</button>
			</div>
		</form>

	</div>

</body>
</html>
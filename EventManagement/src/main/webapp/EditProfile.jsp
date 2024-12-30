<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Settings</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-image: linear-gradient(to right,rgba(229, 137, 240,0.3),rgba(232, 206, 56,0.3));
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 900px;
            background-color: #f5f5f5;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar {
            width: 250px;
            background-color: #a3d5a5;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .sidebar h3 {
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 10px;
        }

        .sidebar a {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #82bd82;
        }

        .main {
            flex: 1;
            padding: 30px;
        }

        .main h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input[type="date"] {
            padding: 8px;
        }

        .buttons {
            display: flex;
            gap: 15px;
        }

        .buttons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .save-btn {
            background-color: #6fbf73;
            color: white;
        }

        .cancel-btn {
            background-color: #ccc;
            color: black;
        }
        .buttons a{
        text-decoration: none;
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
    <div class="container">
    
    		<% if(request.getAttribute("status")!=null){ %>
        	 <h2 class="msg"><%=request.getAttribute("status") %></h2>
         	<%} %>
         	
        <div class="sidebar">
            <h3>Profile / Password</h3>
            <a href="ViewProfile.jsp">Profile View</a>
            <a href="EditProfile.jsp">Update Profile</a>
            <a href="PasswordValidation.jsp">Password Reset</a>
            <a href="Home.jsp">Home</a>
        </div>
        <div class="main">
            <form action="events" method="POST">
                <h2>Profile Settings</h2>
                <div class="form-group">
                    <label ><i class="fa-solid fa-user-tie"></i> Full Name</label>
                    <input type="text" name="name" value="<%= session.getAttribute("uname") %>">
                </div>
                <div class="form-group">
                    <label ><i class="fa-solid fa-envelope"></i> Email</label>
                    <input type="email" name="email" value="<%= session.getAttribute("umail") %>">
                </div>
                <div class="form-group">
                    <label ><i class="fa-solid fa-phone"></i> Phone</label>
                    <input type="tel" name="phone" value="<%= session.getAttribute("uphone") %>">
                </div>
                <div class="form-group">
                    <label ><i class="fa-solid fa-calendar-days"></i> Date of Register</label>
                    <input type="text" value="<%= session.getAttribute("udate") %>" disabled>
                </div>
                <div class="buttons">
                    <button class="save-btn" type="submit" name="ProfileEditButton">Save Changes</button>
                    <button class="cancel-btn"><a href="ViewProfile.jsp">Cancel</a></button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

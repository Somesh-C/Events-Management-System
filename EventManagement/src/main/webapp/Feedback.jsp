<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction:column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            		padding-top:70px;
            
        }

        .feedback-form {
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .feedback-form h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .feedback-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .feedback-form input,
        .feedback-form textarea,
        .feedback-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .feedback-form textarea {
            resize: vertical;
            height: 100px;
        }

        .feedback-form button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .feedback-form button:hover {
            background-color: #0056b3;
        }

        .feedback-form .note {
            font-size: 12px;
            color: #777;
            text-align: center;
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

			<% if(request.getAttribute("status")!=null){ %>
        	 <h2 class="msg"><%=request.getAttribute("status") %></h2>
         	<%} %>

		

    <form class="feedback-form" action="events" method="POST">
        <h2>Feedback Form</h2>
        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="<%= session.getAttribute("uname") %>" >

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="<%= session.getAttribute("umail") %>" >
        <input type="hidden" value="<%=request.getParameter("BookingId")  %>"name="BookingID" >

        <label for="rating">Rating</label>
        <select id="rating" name="rating" required>
            <option value="">-- Select Rating --</option>
            <option value="excellent">Excellent</option>
            <option value="good">Good</option>
            <option value="average">Average</option>
            <option value="poor">Poor</option>
        </select>

        <label for="message">Feedback</label>
        <textarea id="message" name="message" placeholder="Write your feedback here..." required></textarea>

        <button type="submit" name="FeedbackButton">Submit</button>
        <p class="note">We appreciate your feedback!</p>
    </form>
</body>
</html>
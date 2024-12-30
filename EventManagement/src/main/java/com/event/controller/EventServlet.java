package com.event.controller;

import java.io.IOException;

import java.sql.PreparedStatement;
import com.event.DAO.Customer;
import com.event.DAO.Enquery;
import com.event.DAO.Events;
import com.event.module.EventModule;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/events")
public class EventServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        HttpSession Session= req.getSession();
        EventModule em=new EventModule(Session);
        
        
        if(req.getParameter("DeleteCustomer")!=null) {
        	
        	String cid=req.getParameter("CustomerId");
        	String status=em.DeleteCustomer(cid);
        	
        	if(status.equals("success")) {
        		req.setAttribute("status", "Customer deleted sccessfully");
        		RequestDispatcher rd=req.getRequestDispatcher("viewCustomer.jsp");
        		rd.forward(req, resp);
        	}
        	
        	if(status.equals("failure")) {
        		req.setAttribute("status", "Failed to delete Customer");
        		RequestDispatcher rd=req.getRequestDispatcher("viewCustomer.jsp");
        		rd.forward(req, resp);
        	}
        	
        }
        
        else if(req.getParameter("DeleteEnquery")!=null) {
        	
        	String eid=req.getParameter("EnqueryId");
        	String status=em.DeleteEnquery(eid);
        	
        	if(status.equals("success")) {
        		req.setAttribute("status", "Enquery deleted sccessfully");
        		RequestDispatcher rd=req.getRequestDispatcher("EnqueryList.jsp");
        		rd.forward(req, resp);
        	}
        	
        	if(status.equals("failure")) {
        		req.setAttribute("status", "Failed to delete Enquery");
        		RequestDispatcher rd=req.getRequestDispatcher("EnqueryList.jsp");
        		rd.forward(req, resp);
        	}
        	
        }
        
        else if(req.getParameter("BookEvent")!=null) {
        	
        	String eid=req.getParameter("eid");
        	String uname=req.getParameter("uname");
        	String email=req.getParameter("email");
        	String address=req.getParameter("address");
        	String edate=req.getParameter("edate");
        	
          String status=em.EventBooking(eid,uname,email,address,edate);
       
          
          if(status.equals("success")) {
      		req.setAttribute("status", "Event booked sccessfully");
      		RequestDispatcher rd=req.getRequestDispatcher("BookEvents.jsp");
      		rd.forward(req, resp);
      	}
      	
      	if(status.equals("failure")) {
      		req.setAttribute("status", "Failed to book event");
      		RequestDispatcher rd=req.getRequestDispatcher("BookEvents.jsp");
      		rd.forward(req, resp);
      	}
          

        }
        
        else if(req.getParameter("CancellEvent")!=null) {
        	
        	String Bid=req.getParameter("BookingId");
        	String status=req.getParameter("CancellEvent");
        	String resStatus=em.setStatus(status,Bid);
        	
        	
        	 if(resStatus.equals("success")) {
           		req.setAttribute("status", "Sccessfully updated");
           		RequestDispatcher rd=req.getRequestDispatcher("EventStatus.jsp");
           		rd.forward(req, resp);
           	}
           	
           	if(resStatus.equals("failure")) {
           		req.setAttribute("status", "Failed to update");
           		RequestDispatcher rd=req.getRequestDispatcher("EventStatus.jsp");
           		rd.forward(req, resp);
           	}   	
        
        }
        
        else if(req.getParameter("AcceptEvent")!=null) {
        	
        	String Bid=req.getParameter("BookingId");
        	String status=req.getParameter("AcceptEvent");
        	System.out.println(status);
        	String resStatus=em.setStatus(status,Bid);
        	
        	
        	 if(resStatus.equals("success")) {
           		req.setAttribute("status", "Sccessfully updated");
           		RequestDispatcher rd=req.getRequestDispatcher("Bookings.jsp");
           		rd.forward(req, resp);
           	}
           	
           	if(resStatus.equals("failure")) {
           		req.setAttribute("status", "Failed to update");
           		RequestDispatcher rd=req.getRequestDispatcher("Bookings.jsp");
           		rd.forward(req, resp);
           	}   	
        
        }
        
        else if(req.getParameter("Register")!=null &&  req.getParameter("password1").equals(req.getParameter("password2"))) {
        	
        	String name=req.getParameter("name");
        	String email=req.getParameter("email");
        	String phone=req.getParameter("phone");
        	String password=req.getParameter("password1");
        	
        	String status=em.userRegister(name,email,phone,password);
        	
        	if(status.equals("exists")) {
        		req.setAttribute("status", "Existing record found");
           		RequestDispatcher rd=req.getRequestDispatcher("Register.jsp");
           		rd.forward(req, resp);
        		
        	}
        	else if(status.equals("success")) {
        		req.setAttribute("status", "Sccussfully registered");
           		RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
           		rd.forward(req, resp);
        		
        	}
        	else if(status.equals("failure")) {
        		req.setAttribute("status", "Failed to register");
           		RequestDispatcher rd=req.getRequestDispatcher("Register.jsp");
           		rd.forward(req, resp);
        		
        	}
        

        }
        
        else if(req.getParameter("Login")!=null) {
        	String email=req.getParameter("email");
        	String password=req.getParameter("password");
        	
        	String status=em.userLogin(email,password);
        	
        	if(status.equals("success")) {
        		req.setAttribute("status", "Login Sccussfully");
           		RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
           		rd.forward(req, resp);
        		
        	}
        	else if(status.equals("failure")) {
        		req.setAttribute("status", "Failed to login");
           		RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
           		rd.forward(req, resp);
        		
        	}

        }
        
        else if(req.getParameter("EnqueryButton")!=null) {
        	
        	Enquery e= new Enquery();
        	
        	e.setName(req.getParameter("name"));
        	e.setEmail(req.getParameter("email"));
        	e.setPhno(req.getParameter("phone"));
        	e.setDescription(req.getParameter("message"));
        	e.setCatagory(req.getParameter("catagory"));
        	
        	String status= em.insertEnquery(e);
        	
        	if(status.equals("success")) {
        		req.setAttribute("Enquerystatus", "Enquery sent successfully");
           		RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
           		rd.forward(req, resp);
        		
        	}
        	else if(status.equals("failure")) {
        		req.setAttribute("Enquerystatus", "Failed send the enquery");
           		RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
           		rd.forward(req, resp);
        		
        	}
        	
        }
        
        else if(req.getParameter("AddEvents")!=null) {
        	
        	Events e= new Events();
        	e.setEventName(req.getParameter("ename"));
        	e.setEventCost(req.getParameter("ecost"));
        	e.setEventImg(req.getParameter("emage"));
        	e.setEventCategory(req.getParameter("ecategory"));
            e.setEventDetaile(req.getParameter("edetailes"));
        	
            String status=em.addEvents(e);
            
            if(status.equals("success")) {
        		req.setAttribute("status", "Event added successfully");
           		RequestDispatcher rd=req.getRequestDispatcher("AddEvents.jsp");
           		rd.forward(req, resp);
        		
        	}
        	else if(status.equals("failure")) {
        		req.setAttribute("status", "Failed to add event");
           		RequestDispatcher rd=req.getRequestDispatcher("AddEvents.jsp");
           		rd.forward(req, resp);
        		
        	}

        }
        
        else if(req.getParameter("DeleteEvents")!=null) {
        	String Category =req.getParameter("category");
        	String status=em.deleteEvents(Category);
        	
        	 if(status.equals("success")) {
         		req.setAttribute("status", "Event deleted successfully");
            		RequestDispatcher rd=req.getRequestDispatcher("DeleteEvents.jsp");
            		rd.forward(req, resp);
         		
         	}
         	else if(status.equals("failure")) {
         		req.setAttribute("status", "Failed to delete event");
            		RequestDispatcher rd=req.getRequestDispatcher("DeleteEvents.jsp");
            		rd.forward(req, resp);
         		
         	}
        	
        }
        
        else if(req.getParameter("ProfileEditButton")!=null) {
        	Customer c=new Customer();
        	c.setCname(req.getParameter("name"));
        	c.setCemail(req.getParameter("email"));
        	c.setCphone(req.getParameter("phone"));
        	
        	String status=em.editProfile(c);
        	
        	 if(status.equals("success")) {
          		req.setAttribute("status", "Profile Updated successfully");
             		RequestDispatcher rd=req.getRequestDispatcher("ViewProfile.jsp");
             		rd.forward(req, resp);
          		
          	}
          	else if(status.equals("failure")) {
          		req.setAttribute("status", "Failed to Update Profile");
             		RequestDispatcher rd=req.getRequestDispatcher("EditProfile.jsp");
             		rd.forward(req, resp);
          		
          	}
        	
        }
        
        else if(req.getParameter("PasswordValidationButton")!=null) {
        	
        	String password= req.getParameter("password1");
        	String status=em.passwordValidation(password);
        	
        	 if(status.equals("success")) {
           	
              		RequestDispatcher rd=req.getRequestDispatcher("PasswordChange.jsp");
              		rd.forward(req, resp);
           		
           	}
           	else if(status.equals("failure")) {
           			req.setAttribute("status", "Entered Worng Password");
              		RequestDispatcher rd=req.getRequestDispatcher("PasswordValidation.jsp");
              		rd.forward(req, resp);
           	}
        }
        
        else if(req.getParameter("PasswordChangeButton")!=null) {
        	String password=req.getParameter("password1");
        	String status=em.changePassword(password);
        	
        	if(status.equals("success")) {
       			req.setAttribute("status", "Successfully Changed Password");
          		RequestDispatcher rd=req.getRequestDispatcher("PasswordChange.jsp");
          		rd.forward(req, resp);
       		
        	}
        	else if(status.equals("failure")) {
       			req.setAttribute("status", "Failed to change Password");
          		RequestDispatcher rd=req.getRequestDispatcher("PasswordChange.jsp");
          		rd.forward(req, resp);
        	}
        	
        }
        
        else if(req.getParameter("FeedbackButton")!=null) {
        	String name=req.getParameter("name");
        	String email=req.getParameter("email");
        	String rating=req.getParameter("rating");
        	String message=req.getParameter("message");
        	String bid=req.getParameter("BookingID");
        	
        	System.out.println(bid);
        	
        	String status=em.saveFeedback(name,email,rating,message,bid);
        	
        	if(status.equals("success")) {
       			req.setAttribute("status", "Thank you for your valuable feedback");
          		RequestDispatcher rd=req.getRequestDispatcher("Feedback.jsp");
          		rd.forward(req, resp);
       		
        	}
        	else if(status.equals("failure")) {
       			req.setAttribute("status", "Failed to send the feedback");
          		RequestDispatcher rd=req.getRequestDispatcher("Feedback.jsp");
          		rd.forward(req, resp);
        	}

        }
         
        
        
		
	}

}

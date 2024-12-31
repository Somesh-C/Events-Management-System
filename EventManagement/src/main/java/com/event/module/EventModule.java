package com.event.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.event.DAO.Bookings;
import com.event.DAO.Customer;
import com.event.DAO.Enquery;
import com.event.DAO.Events;

import jakarta.servlet.http.HttpSession;

public class EventModule {
	
	private Connection con;
	HttpSession sn;
	
	public EventModule(HttpSession Session) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/EVENT_MANAGEMENT", "root", "tiger");
			sn=Session;

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Enquery> getEnquiryList() {
		ArrayList<Enquery> al = new ArrayList<Enquery>();

		try {
			
			Statement st =  con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from ENQUERY_LIST;";
			ResultSet rs = st.executeQuery(qry);
			while (rs.next()) {
				Enquery e = new Enquery(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				e.setId(rs.getString("id"));
				e.setName(rs.getString("name"));
				e.setEmail(rs.getString("email"));
				e.setPhno(rs.getString("phone"));
				e.setCatagory(rs.getString("category"));
				e.setDescription(rs.getString("message"));
				e.setDate(rs.getString("date1"));
				al.add(e);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	
	public ArrayList<Customer> getCostomerList() {
		
		ArrayList<Customer> al = new ArrayList<Customer>();

		try {
			
			Statement st =  con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from CUSTOMER;";
			ResultSet rs = st.executeQuery(qry);
			while (rs.next()) {
				
				Customer c = new Customer();
				c.setCid(rs.getString("cid"));
				c.setCname(rs.getString("cname"));
				c.setCemail(rs.getString("cemail"));
				c.setCphone(rs.getString("cphone"));
				c.setPassword(rs.getString("password"));
				c.setDate(rs.getString("date1"));
		
				al.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String DeleteCustomer(String cid) {

		String status="failure";
		try {
			PreparedStatement ps= con.prepareStatement("delete from customer where cid=?");
			ps.setString(1, cid);
			int res=ps.executeUpdate();
			
			if(res>0) {
				status="success";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return status;
	}
	
	
	public String DeleteEnquery(String eid) {

		String status="failure";
		try {
			PreparedStatement ps= con.prepareStatement("delete from ENQUERY_LIST where id=?");
			ps.setString(1, eid);
			int res=ps.executeUpdate();
			
			if(res>0) {
				status="success";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return status;
	}
	
	public ArrayList<Events> getEventList(){
		
		ArrayList<Events> al=new ArrayList<Events>();
		
		try {
			PreparedStatement ps=con.prepareStatement("select * from EVENTS");
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				Events e=new Events();
				e.setEventImg(rs.getString("EVENT_IMG"));
				e.setEventCategory(rs.getString("EVENT_CATEGORY"));
				e.setEventDetaile(rs.getString("EVENT_DETAIL"));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;	
	}

	public Events getEventDetails(String EventCategory) {
		Events e= new Events();
		
		try {
			PreparedStatement ps=con.prepareStatement("select * from events where EVENT_CATEGORY=?");
			ps.setString(1, EventCategory);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				e.setEventId(rs.getString("EVENT_ID"));
				e.setEventName(rs.getString("EVENT_NAME"));
				e.setEventCost(rs.getString("EVENT_COST"));
				e.setEventDetaile(rs.getString("EVENT_DETAIL"));
				e.setEventCategory(rs.getString("EVENT_CATEGORY"));
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		return e;
		
	}
	
	public Events getEventBookingDetaile(String eid) {
		Events e= new Events();
		 
		try {
			PreparedStatement ps=con.prepareStatement("select * from events where EVENT_ID=?");
			ps.setString(1, eid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				e.setEventId(rs.getString("EVENT_ID"));
				e.setEventName(rs.getString("EVENT_NAME"));
				e.setEventCost(rs.getString("EVENT_COST"));
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		return e;
		
	}
	
	public String EventBooking(String eid, String uname, String email, String address, String edate) {
		String status=null;
		 
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO BOOKINGS VALUES(0,?,?,?,?,?,?,now(),?)");
			ps.setString(1, eid);
			ps.setString(2, (String) sn.getAttribute("uid"));
			ps.setString(3, uname);
			ps.setString(4, email);
			ps.setString(5, address);
			ps.setString(6, "Pending");
			ps.setString(7, edate);
		

			int res=ps.executeUpdate();
			
			if(res>0) {
				status="success";
			}
			else {
				status="failure";

			}
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		return status;
		
	}
	
	
	public ArrayList<Bookings> getBookings(){
		
		ArrayList<Bookings> al=new ArrayList<Bookings>();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT *, date_format(EVENT_DATE,'%d %b,%Y') as date1,date_format(BOOKING_DATE,'%d %b,%Y') as date2  FROM BOOKINGS B INNER JOIN EVENTS E ON B.EVENT_ID=E.EVENT_ID;");
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				
				Bookings b=new Bookings();
				
				b.setBookingID(rs.getString("BOOKING_ID"));
				b.setEventImg(rs.getString("EVENT_IMG"));
				b.setEventName(rs.getString("EVENT_NAME"));
				b.setEventCost(rs.getString("EVENT_COST"));
				b.setEmail(rs.getString("EMAIL"));
				b.setBookingDate(rs.getString("date2"));
				b.setEventDate(rs.getString("date1"));
				b.setStatus(rs.getString("STATUS"));
				
				al.add(b);


				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
			
	}

	

	public String setStatus(String status, String bid) {
		String Result="failure";
		
		if(status.equals("Cancell")) {
			
			try {
				PreparedStatement ps=con.prepareStatement(" UPDATE BOOKINGS SET STATUS=? WHERE BOOKING_ID=?");
				ps.setString(1, "Cancelled");
				ps.setString(2, bid);
				int res=ps.executeUpdate();
				
				if(res>0) {
					Result="success";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else if(status.equals("Accept")) {
			try {
				PreparedStatement ps=con.prepareStatement("UPDATE BOOKINGS SET STATUS=? WHERE BOOKING_ID=? ");
				ps.setString(1, "Booked");
				ps.setString(2, bid);
				int res=ps.executeUpdate();
				
				if(res>0) {
					Result="success";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return Result;
		
		
	}

	public String userRegister(String name, String email, String phone, String password) {
		String status="failure";
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM CUSTOMER WHERE CEMAIL=? AND CPHONE=? ");
			ps.setString(1, email);
			ps.setString(2, phone);

			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				status="exists";
			}
			else {
				PreparedStatement ps1=con.prepareStatement("INSERT INTO CUSTOMER VALUES(0,?,?,?,?,NOW())");
				

				ps1.setString(1, name);
				ps1.setString(2, email);
				ps1.setString(3, phone);
				ps1.setString(4, password);
				
				int res=ps1.executeUpdate();
				
				if(res>0) {
					status="success";
				}
				
				else {
					status="failure";
					
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public String userLogin(String email, String password) {
		
		String status="failure";
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM CUSTOMER WHERE CEMAIL=? AND PASSWORD=? ");
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				sn.setAttribute("uid",    rs.getString("CID"));
				sn.setAttribute("uname", rs.getString("CNAME"));
				sn.setAttribute("umail", rs.getString("CEMAIL"));
				sn.setAttribute("uphone", rs.getString("CPHONE"));
				sn.setAttribute("upass", rs.getString("PASSWORD"));
				sn.setAttribute("udate", rs.getString("DATE"));
				status="success";
			}
			else {
				status="failure";

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public String insertEnquery(Enquery e) {
		String status="failure";
		
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO enquery_list values(0,?,?,?,?,?,now())");
			ps.setString(1, e.getName());
			ps.setString(2, e.getEmail());
			ps.setString(3, e.getPhno());
			ps.setString(4, e.getCatagory());
			ps.setString(5, e.getDescription());
			
			int res=ps.executeUpdate();
			if(res>0) {
				status="success";
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		return status;
	}

	public String addEvents(Events e) {
		String status="failure";
		
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO EVENTS VALUES(0,?,?,?,?,?,NOW())");
			ps.setString(1, e.getEventImg());
			ps.setString(2, e.getEventName());
			ps.setString(3, e.getEventCost());
			ps.setString(4, e.getEventDetaile());
			ps.setString(5, e.getEventCategory());
			
			int res=ps.executeUpdate();
			
			if(res>0) {
				status="success";
			}

			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return status;
	}

	public String deleteEvents(String category) {
		String status="failure";
		
		try {
			PreparedStatement ps=con.prepareStatement("delete from EVENTS where EVENT_CATEGORY=?");
			ps.setString(1, category);
			
            int res=ps.executeUpdate();
			
			if(res>0) {
				status="success";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return status;
	}
	
	
       public ArrayList<Bookings> getEventStatus(){
		
		ArrayList<Bookings> al=new ArrayList<Bookings>();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT *, date_format(EVENT_DATE,'%d %b,%Y') as date1,date_format(BOOKING_DATE,'%d %b,%Y') as date2  FROM BOOKINGS B INNER JOIN EVENTS E ON B.EVENT_ID=E.EVENT_ID WHERE UID=?;");
			ps.setString(1, (String) sn.getAttribute("uid"));
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				
				Bookings b=new Bookings();
				
				b.setBookingID(rs.getString("BOOKING_ID"));
				b.setEventImg(rs.getString("EVENT_IMG"));
				b.setEventName(rs.getString("EVENT_NAME"));
				b.setEventCost(rs.getString("EVENT_COST"));
				b.setEmail(rs.getString("EMAIL"));
				b.setBookingDate(rs.getString("date2"));
				b.setEventDate(rs.getString("date1"));
				b.setStatus(rs.getString("STATUS"));
				
				al.add(b);


				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
			
	}
       
       public String editProfile(Customer c) {
    	   String status="failure";
    	   
    	   try {
			PreparedStatement ps=con.prepareStatement("UPDATE CUSTOMER SET CNAME=?, CEMAIL=?, CPHONE=? WHERE CID=? ;");
			ps.setString(1, c.getCname());
			ps.setString(2, c.getCemail());
			ps.setString(3, c.getCphone());
			ps.setString(4, (String) sn.getAttribute("uid"));
			
			int res=ps.executeUpdate();
			if(res>0) {
				
				PreparedStatement ps1=con.prepareStatement("SELECT * FROM CUSTOMER WHERE CID=? ;" );
				ps1.setString(1, (String) sn.getAttribute("uid"));
				ResultSet rs= ps1.executeQuery();
				
				if(rs.next()) {
					sn.setAttribute("uname", rs.getString("CNAME"));
					sn.setAttribute("umail", rs.getString("CEMAIL"));
					sn.setAttribute("uphone", rs.getString("CPHONE"));
				}
						
				status="success";

			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	   
		return status;
		
	}

	public String passwordValidation(String password) {
		
		String status="failure";
		
		if(password.equals(sn.getAttribute("upass"))) {	
			status="success";
		}
		
		return status;
		
		
	}

	public String changePassword(String password) {
		String status="failure";
		
		try {
			PreparedStatement ps=con.prepareStatement("UPDATE CUSTOMER SET PASSWORD=? WHERE CID=? ;");
			ps.setString(1, password);
			ps.setString(2, (String) sn.getAttribute("uid"));
			int res=ps.executeUpdate();
			
			if(res>0) { 
				
				PreparedStatement ps1=con.prepareStatement("SELECT * FROM CUSTOMER WHERE CID=? ;" );
				ps1.setString(1, (String) sn.getAttribute("uid"));
				ResultSet rs= ps1.executeQuery();
				
				if(rs.next()) {
					sn.setAttribute("upass", rs.getString("PASSWORD"));
					
				}
						
				status="success";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return status;
	}

	public String saveFeedback(String name, String email, String rating, String message,String bid) {
		String status="failure";
		
		
		try {
			
			PreparedStatement ps1=con.prepareStatement("SELECT * FROM FEEDBACKS WHERE BID=?;");
			ps1.setString(1, bid);
			ResultSet rs= ps1.executeQuery();
			
			if(rs.next()) {
				
				status="exists";
				
			}
			
			else {
				PreparedStatement ps=con.prepareStatement("INSERT INTO FEEDBACKS VALUES(0,?,?,?,?,?,now());");
				ps.setString(1, bid);
				ps.setString(2, name);
				ps.setString(3, email);
				ps.setString(4, rating);
				ps.setString(5, message);
				
				int res=ps.executeUpdate();
				
				if(res>0) {
					status="success";
				}
				
			}
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	

	
	
	
	

}

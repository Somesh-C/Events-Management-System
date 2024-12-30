package com.event.DAO;

public class Customer {
	
	private String Cid;
	private String Cname;
	private String Cemail;
	private String Cphone;
	private String password;
	
	
	public String getCid() {
		return Cid;
	}
	public void setCid(String cid) {
		Cid = cid;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getCemail() {
		return Cemail;
	}
	public void setCemail(String cemail) {
		Cemail = cemail;
	}
	public String getCphone() {
		return Cphone;
	}
	public void setCphone(String cphone) {
		Cphone = cphone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private String date;

}

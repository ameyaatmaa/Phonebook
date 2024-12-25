package com.entity;

public class contact {
	private int id;
	private String name;
	private String email;
	private String phno;
	private String about;
	private int userId;
	public contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public contact(String name, String email, String phno, String about, int userId) {
		super();
		this.name = name;
		this.email = email;
		this.phno = phno;
		this.about = about;
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	
	
	

}

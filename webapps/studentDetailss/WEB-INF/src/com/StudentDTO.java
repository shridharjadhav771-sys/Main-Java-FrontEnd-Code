package com;

public class StudentDTO {
	String name = "";
	int phonenumber = 0;
	String address = "";
	String email = "";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(int phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public StudentDTO(String name, int phonenumber, String address, String email) {
		super();
		this.name = name;
		this.phonenumber = phonenumber;
		this.address = address;
		this.email = email;
	}
	

}

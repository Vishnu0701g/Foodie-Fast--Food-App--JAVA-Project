package com.app.model;

import java.sql.Timestamp;

public class User {
	private int userId;
	private String name;
	private String userName;
	private String password;
	private String email;
	private String phoneNumber;
	private String address;
	private String role;
	private Timestamp createDate;
	private Timestamp lastLoginDate;
	public User(int userId, String name, String userName, String password, String email, String phoneNumber,
			String address, String role) {
		super();
		this.userId = userId;
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.role = role;
	}
	public User(String name, String userName, String password, String email, String phoneNumber, String address,
			String role) {
		super();
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.role = role;
	}
	public User(String name, String userName, String password, String email, String phoneNumber, String address) {
		super();
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}
	public User() {
		super();
	}
	public User(int userId, String name, String userName, String password, String email, String phoneNumber,
			String address, String role, Timestamp createDate, Timestamp lastLoginDate) {
		super();
		this.userId = userId;
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.role = role;
		this.createDate = createDate;
		this.lastLoginDate = lastLoginDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUseId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	@Override
	public String toString() {
		return "User: ["+name+" "+ email+ " "+phoneNumber+lastLoginDate+" ]";
	}
	

}

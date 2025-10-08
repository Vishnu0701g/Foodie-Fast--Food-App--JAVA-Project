package com.app.dao;

import java.util.List;

import com.app.model.User;

public interface UserDAO {
	
	public List<User> getAllUsers();
	public User getUser(int userId);
	public int addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int userId);
	public String getUserPassword(String emailEntered);
	public boolean isEmailRegistered(String email);
	public User getUser(String emailEntered);
	
	

}

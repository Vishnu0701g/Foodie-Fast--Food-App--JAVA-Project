package com.app.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.app.dao.UserDAO;
import com.app.model.User;
import com.app.util.DBConnection;

public class UserDAOImpl implements UserDAO {
	

	private String INSERT_USER_QUERY="INSERT into `user` (`userid`,`name`,`username`,`password`,`email`,`phonenumber`,`address`,`role`,`createdate`,`lastlogindate`) values (?,?,?,?,?,?,?,?,?,?)";
	private String UPDATE_USER_QUERY="UPDATE `user` SET `name`=? ,`username`=?,`password`=?,`email`=?,`phonenumber`=?,`address`=?,`lastlogindate`=? WHERE `userid`=?";
	private String GET_USER_QUERY="SELECT * from `user` WHERE `userid`=?";
	private String GET_ALL_USER_QUERY="SELECT * from `user`";
	private String GET_USER_PASSWORD="SELECT * from `user` where `email`=?";

	
	@Override
	public List<User> getAllUsers() {
		User user=null;
		List<User> listUser=null;
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(GET_ALL_USER_QUERY);)
			{
				ResultSet resultSet  = preparedStatement.executeQuery();
				while(resultSet.next()) {
					int userId=resultSet.getInt("userid");
					String name = resultSet.getString("name");
					String userName = resultSet.getString("username");
					String password = resultSet.getString("password");
					String email = resultSet.getString("email");
					String phonenumber = resultSet.getString("phonenumber");
					String address = resultSet.getString("address");
					String role = resultSet.getString("role");
					Timestamp createDate = resultSet.getTimestamp("createdate");
					Timestamp lastlogindate = resultSet.getTimestamp("lastlogindate");
					user=new User(userId, name, userName, password, email, phonenumber, address, role, createDate, lastlogindate);
					listUser.add(user);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return listUser;
	}

	@Override
	public User getUser(int userId) {
		User user=null;
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(GET_USER_QUERY);)
			{
				preparedStatement.setInt(1,userId);
				
				
				ResultSet resultSet  = preparedStatement.executeQuery();
				while(resultSet.next()) {
					String name = resultSet.getString("name");
					String userName = resultSet.getString("username");
					String password = resultSet.getString("password");
					String email = resultSet.getString("email");
					String phonenumber = resultSet.getString("phonenumber");
					String address = resultSet.getString("address");
					String role = resultSet.getString("role");
					Timestamp createDate = resultSet.getTimestamp("createdate");
					Timestamp lastlogindate = resultSet.getTimestamp("lastlogindate");
					user=new User(userId, name, userName, password, email, phonenumber, address, role, createDate, lastlogindate);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}

	@Override
	public int addUser(User user) {
		int result=0;
		try(Connection connection=DBConnection.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USER_QUERY);)
		{
			preparedStatement.setInt(1,user.getUserId());
			preparedStatement.setString(2,user.getName());
			preparedStatement.setString(3,user.getUserName());
			preparedStatement.setString(4,user.getPassword());
			preparedStatement.setString(5,user.getEmail());
			preparedStatement.setString(6,user.getPhoneNumber());
			preparedStatement.setString(7,user.getAddress());
			preparedStatement.setString(8,user.getRole());
			preparedStatement.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
			result = preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
		
	}

	@Override
	public void updateUser(User user) {
		
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_USER_QUERY);)
			{
			System.out.println(12383);
				preparedStatement.setString(1,user.getName());
				preparedStatement.setString(2,user.getUserName());
				preparedStatement.setString(3,user.getPassword());
				preparedStatement.setString(4,user.getEmail());
				preparedStatement.setString(5,user.getPhoneNumber());
				preparedStatement.setString(6,user.getAddress());
				preparedStatement.setTimestamp(7,user.getLastLoginDate());
				preparedStatement.setInt(8,user.getUserId());
				
				
				int result = preparedStatement.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

	@Override
	public void deleteUser(int userId) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String getUserPassword(String emailEntered) {
		String password="";
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(GET_USER_PASSWORD);)
			{
				preparedStatement.setString(1,emailEntered);
				
				
				ResultSet resultSet  = preparedStatement.executeQuery();
				while(resultSet.next()) {
					
					password = resultSet.getString("password");
					
					
				}
			
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return password;
	}

	@Override
	public boolean isEmailRegistered(String email) {
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(GET_USER_PASSWORD);)
			{
				preparedStatement.setString(1,email);
				ResultSet resultSet  = preparedStatement.executeQuery();
				return resultSet.next();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}
	@Override
	public User getUser(String emailEntered) {
		User user=null;
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(GET_USER_PASSWORD);)
			{
				preparedStatement.setString(1,emailEntered);
				
				
				ResultSet resultSet  = preparedStatement.executeQuery();
				while(resultSet.next()) {
					int userId=resultSet.getInt("userid");
					String name = resultSet.getString("name");
					String userName = resultSet.getString("username");
					String password = resultSet.getString("password");
					String email = resultSet.getString("email");
					String phonenumber = resultSet.getString("phonenumber");
					String address = resultSet.getString("address");
					String role = resultSet.getString("role");
					Timestamp createDate = resultSet.getTimestamp("createdate");
					Timestamp lastlogindate = resultSet.getTimestamp("lastlogindate");
					user=new User(userId, name, userName, password, email, phonenumber, address, role, createDate, lastlogindate);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}

	
	
}

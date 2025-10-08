package com.app.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.RestaurantDAO;
import com.app.model.Restaurant;
import com.app.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {
	private Connection connection;
	private String INSERT_RESTAURANT_QUERY="INSERT into `restaurant` (Name, Address,phonenumber, CuisineType, DeliveryTime,  AdminuserID, Rating, IsActive,imagepath) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private String UPDATE_RESTAURANT_QUERY="UPDATE `Restaurant` SET `name`=? ,`CuisineType`=?,`DeliveryTime`=?,`Address`=?,`AdminuserID`=?,`Rating`=? ,`IsActive`=? ,`phonenumber`=? ,`imagepath`=? WHERE `RestaurantID`=?";
	private String GET_RESTAURANT_QUERY="SELECT * from `restaurant` WHERE `RestaurantID`=?";
	private String GET_ALL_RESTAURANTS_QUERY="SELECT * from `Restaurant`";	
	private String DELETE_RESTAURANT_QUERY="DELETE  from `Restaurant` WHERE `RestaurantID`=? ";	


	public RestaurantDAOImpl() throws ClassNotFoundException, SQLException{
		connection=DBConnection.getConnection();
	}

	@Override
	public List<Restaurant> getAllRestaurants() {
		List<Restaurant> restaurants =new ArrayList<>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(GET_ALL_RESTAURANTS_QUERY);)
		{
			ResultSet resultSet =preparedStatement.executeQuery();
			while (resultSet.next()) {
				Restaurant restaurant =new Restaurant();
				restaurant.setRestaurantId(resultSet.getInt("RestaurantID"));
				restaurant.setName(resultSet.getString("Name"));
				restaurant.setAddress(resultSet.getString("Address"));
				restaurant.setPhoneNumber(resultSet.getString("phonenumber"));
				restaurant.setCuisineType(resultSet.getString("CuisineType"));
				restaurant.setDeliveryTime(resultSet.getInt("deliverytime"));
				restaurant.setAdminUserId(resultSet.getInt("adminuserid"));
				restaurant.setRating(resultSet.getDouble("Rating"));
				restaurant.setRating(resultSet.getDouble("Rating"));
				restaurant.setIsActive(resultSet.getBoolean("isactive"));
				restaurant.setImagePath(resultSet.getString("ImagePath"));
				restaurants.add(restaurant);
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
			
	
		return restaurants;
	}
		

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		Restaurant restaurant=new Restaurant();
		try(PreparedStatement preparedStatement=connection.prepareStatement(GET_RESTAURANT_QUERY);)
		{
			preparedStatement.setInt(1, restaurantId);
			try (ResultSet resultSet=preparedStatement.executeQuery()) {
				while(resultSet.next()){
					restaurant.setRestaurantId(resultSet.getInt("RestaurantID"));
					restaurant.setName(resultSet.getString("Name"));
					restaurant.setAddress(resultSet.getString("Address"));
					restaurant.setPhoneNumber(resultSet.getString("phonenumber"));
					restaurant.setCuisineType(resultSet.getString("CuisineType"));
					restaurant.setDeliveryTime(resultSet.getInt("deliverytime"));
					restaurant.setAdminUserId(resultSet.getInt("adminuserid"));
					restaurant.setRating(resultSet.getDouble("Rating"));
					restaurant.setRating(resultSet.getDouble("Rating"));
					restaurant.setIsActive(resultSet.getBoolean("isactive"));
					restaurant.setImagePath(resultSet.getString("ImagePath"));
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}


	@Override
	public void addRestaurant(Restaurant restaurant) {
		 try(PreparedStatement preparedStatement=connection.prepareStatement(INSERT_RESTAURANT_QUERY);)
			{
			 preparedStatement.setString(1, restaurant.getName());
			 preparedStatement.setString(2, restaurant.getAddress());
			 preparedStatement.setString(3, restaurant.getPhoneNumber());
			 preparedStatement.setString(4, restaurant.getCuisineType());
			 preparedStatement.setInt(5, restaurant.getDeliveryTime());
			 preparedStatement.setInt(6, restaurant.getAdminUserId());
			 preparedStatement.setDouble(7, restaurant.getRating());
			 preparedStatement.setBoolean(8, restaurant.getIsActive());
			 preparedStatement.setString(9, restaurant.getImagePath());
			 int executeUpdate = preparedStatement.executeUpdate();
			 
			}
		 catch (SQLException e) {
			 throw new RuntimeException("Error adding restaurant", e);		
		 }
	
	}


	@Override
	public void updateRestaurant(Restaurant restaurant) {
		try(PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_RESTAURANT_QUERY);)
		{
			preparedStatement.setString(1,restaurant.getName());
			preparedStatement.setString(2, restaurant.getCuisineType());
			preparedStatement.setInt(3, restaurant.getDeliveryTime());
			preparedStatement.setString(4, restaurant.getAddress());
			preparedStatement.setInt(5, restaurant.getAdminUserId());
			preparedStatement.setDouble(6, restaurant.getRating());
			preparedStatement.setBoolean(7, restaurant.getIsActive());
			 preparedStatement.setString(8, restaurant.getPhoneNumber());
			 preparedStatement.setString(9, restaurant.getImagePath());
			preparedStatement.setInt(10, restaurant.getRestaurantId());
			int affectedRows =preparedStatement.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("Error updating restaurant", e);
		}

	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		
		try(PreparedStatement preparedStatement=connection.prepareStatement(DELETE_RESTAURANT_QUERY);)
		{
			preparedStatement.setInt(1, restaurantId);
			int affectedRows=preparedStatement.executeUpdate();
			if(affectedRows==0){
				throw new SQLException("Deleting restaurant falled, no rows affected.");	
			}

		}

		catch (SQLException e) {
			throw new RuntimeException("Error deleting restaurant", e);
		}
		
	}
}

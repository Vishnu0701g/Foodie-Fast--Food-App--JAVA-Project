package com.app.dao;

import java.util.List;

import com.app.model.Restaurant;

public interface RestaurantDAO {
	public List<Restaurant> getAllRestaurants();
	public Restaurant getRestaurant(int restaurantId);
	public void addRestaurant(Restaurant restaurant);
	public void updateRestaurant(Restaurant restaurant);
	public void deleteRestaurant(int restaurantId);
}

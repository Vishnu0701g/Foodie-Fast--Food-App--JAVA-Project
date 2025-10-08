package com.app.model;

public class Restaurant {
	private int restaurantId;
	private String name;
	private String address;
	private String phoneNumber;
	private String cuisineType;
	private int deliveryTime;
	private int adminUserId;
	private double rating;
	private boolean isActive;
	private String imagePath;

	public Restaurant() {
	}

	

	public Restaurant(int restaurantId, String name, String address, String phoneNumber, String cuisineType,
			int deliveryTime, int adminUserId, double rating, boolean isActive, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}
	



	public Restaurant(String name, String address, String phoneNumber, String cuisineType, int deliveryTime,
			int adminUserId, double rating, boolean isActive, String imagePath) {
		super();
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}



	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

	public int getAdminUserId() {
		return adminUserId;
	}

	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}



	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", address=" + address + ", phoneNumber="
				+ phoneNumber + ", cuisineType=" + cuisineType + ", deliveryTime=" + deliveryTime + ", adminUserId="
				+ adminUserId + ", rating=" + rating + ", isActive=" + isActive + ", imagePath=" + imagePath + "]";
	}
	

	

}

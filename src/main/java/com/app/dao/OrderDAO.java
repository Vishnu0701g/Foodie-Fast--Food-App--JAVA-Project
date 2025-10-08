 package com.app.dao;

import java.util.List;

import com.app.model.Order;

public interface OrderDAO {
	
	int addOrder(Order order);
	Order getOrder(int orderId);
	List<Order> getAllOrders();
	void updateOrderr(Order order);
	void deleteOrder(int  orderId);
	List<Order> getOrdersByUserId(int userId); 
}

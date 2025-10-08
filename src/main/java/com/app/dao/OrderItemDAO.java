package com.app.dao;

import java.util.List;

import com.app.model.OrderItem;

public interface OrderItemDAO {
	
	void addOrderItem(OrderItem orderItem);
	OrderItem getOrderItem(int orderItemId);
	List<OrderItem> getAllOrderItems();
	void updateOrderItem(OrderItem OrderItem);
	void deleteOrderItem(int  orderItemId);
	List<OrderItem> getOrderItemsByOrderId(int orderId);
}

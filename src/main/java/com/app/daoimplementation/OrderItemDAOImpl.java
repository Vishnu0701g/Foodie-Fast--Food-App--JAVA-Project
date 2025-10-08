package com.app.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.OrderItemDAO;
import com.app.model.OrderItem;
import com.app.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{

	private String INSERT_ORDER_ITEM_QUERY="INSERT INTO `orderitem` (orderId, menuId, quantity, totalAmount) VALUES (?, ?, ?, ?)";
	private String UPDATE_ORDER_ITEM_QUERY="UPDATE orderitem SET orderId = ?, menuId = ?, quantity = ?, totalAmount = ? WHERE orderItemId = ?";
	private String GET_ORDER_ITEM_QUERY="SELECT * FROM `orderitem` WHERE orderItemId = ?";
	private String GET_ALL_ORDER_ITEMS_QUERY="SELECT * FROM `orderitem`";
	private String DELETE_ORDER_ITEM_QUERY="DELETE FROM `orderitem` WHERE orderItemId = ?";
    private String GET_ORDER_ITEMS_BY_ORDER_ID_QUERY = "SELECT * FROM `orderitem` WHERE orderId = ?"; 

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        List<OrderItem> orderItems = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(GET_ORDER_ITEMS_BY_ORDER_ID_QUERY)) {

            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderItem item = new OrderItem(
                    rs.getInt("orderItemId"),
                    rs.getInt("orderId"),
                    rs.getInt("menuId"),
                    rs.getInt("quantity"),
                    rs.getInt("totalAmount")
                );
                orderItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return orderItems;
    }
	@Override
	public void addOrderItem(OrderItem orderItem) {
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(INSERT_ORDER_ITEM_QUERY)) {

			stmt.setInt(1, orderItem.getOderId());
			stmt.setInt(2, orderItem.getMenuId());
			stmt.setInt(3, orderItem.getQuantity());
			stmt.setInt(4, orderItem.getTotalAmount());

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {
		OrderItem item = null;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(GET_ORDER_ITEM_QUERY)) {

			stmt.setInt(1, orderItemId);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				item = new OrderItem(
						rs.getInt("orderItemId"),
						rs.getInt("orderId"),
						rs.getInt("menuId"),
						rs.getInt("quantity"),
						rs.getInt("totalAmount")
						);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return item;
	}

	@Override
	public List<OrderItem> getAllOrderItems() {
		List<OrderItem> orderItems = new ArrayList<>();
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(GET_ALL_ORDER_ITEMS_QUERY);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				OrderItem item = new OrderItem(
						rs.getInt("orderItemId"),
						rs.getInt("orderId"),
						rs.getInt("menuId"),
						rs.getInt("quantity"),
						rs.getInt("totalAmount")
						);
				orderItems.add(item);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return orderItems;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(UPDATE_ORDER_ITEM_QUERY)) {

			stmt.setInt(1, orderItem.getOderId());
			stmt.setInt(2, orderItem.getMenuId());
			stmt.setInt(3, orderItem.getQuantity());
			stmt.setInt(4, orderItem.getTotalAmount());
			stmt.setInt(5, orderItem.getOrderItemId());

			stmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(DELETE_ORDER_ITEM_QUERY)) {

			stmt.setInt(1, orderItemId);
			stmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}



}
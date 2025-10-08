package com.app.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.OrderDAO;
import com.app.model.Order;
import com.app.util.DBConnection;

public class OrderDAOImpl implements OrderDAO{
	private String INSERT_ORDER_QUERY="INSERT INTO `order` (restaurantId, userId, orderDate, totalAmount, status, paymentMode, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private String UPDATE_ORDER_QUERY="UPDATE `order` SET restaurantId = ?, userId = ?, orderDate = ?, totalAmount = ?, status = ?, paymentMode = ?, address = ? WHERE orderId = ?";
	private String GET_ORDER_QUERY="SELECT * FROM `order` WHERE orderId = ?";
	private String GET_ALL_ORDERS_QUERY="SELECT * FROM `order`";
	private String DELETE_ORDER_QUERY="DELETE FROM `order` WHERE orderId = ?";
	private int orderId;
    private String GET_ORDERS_BY_USER_ID_QUERY = "SELECT * FROM `order` WHERE userId = ? ORDER BY orderDate DESC, orderId DESC"; // Added query

    @Override
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(GET_ORDERS_BY_USER_ID_QUERY)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order(
                    rs.getInt("orderId"),
                    rs.getInt("restaurantId"),
                    rs.getInt("userId"),
                    rs.getDate("orderDate"),
                    rs.getInt("totalAmount"),
                    rs.getString("status"),
                    rs.getString("paymentMode"),
                    rs.getString("address")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return orders;
    }

	@Override
	public int addOrder(Order order) {
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(INSERT_ORDER_QUERY, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setInt(1, order.getRestaurantId());
			stmt.setInt(2, order.getUserId());
			stmt.setDate(3, order.getOrderDate());
			stmt.setInt(4, order.getTotalAmount());
			stmt.setString(5, order.getStatus());
			stmt.setString(6, order.getPaymentMode());
			stmt.setString(7, order.getAddress());

			int rowsAffected = stmt.executeUpdate();
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				orderId = rs.getInt(1);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}

		return orderId;
	}
	@Override
	public Order getOrder(int orderId) {
		Order order = null;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(GET_ORDER_QUERY)) {

			stmt.setInt(1, orderId);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				order = new Order(
						rs.getInt("orderId"),
						rs.getInt("restId"),
						rs.getInt("userId"),
						rs.getDate("orderDate"),
						rs.getInt("totalAmount"),
						rs.getString("status"),
						rs.getString("paymentMode"),
						rs.getString("address")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public List<Order> getAllOrders() {
		List<Order> orders = new ArrayList<>();
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(GET_ALL_ORDERS_QUERY);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				Order order = new Order(
						rs.getInt("orderId"),
						rs.getInt("restaurantId"),
						rs.getInt("userId"),
						rs.getDate("orderDate"),
						rs.getInt("totalAmount"),
						rs.getString("status"),
						rs.getString("paymentMode"),
						rs.getString("address")
						);
				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public void updateOrderr(Order order) {
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(UPDATE_ORDER_QUERY)) {

			stmt.setInt(1, order.getRestaurantId());
			stmt.setInt(2, order.getUserId());
			stmt.setDate(3, order.getOrderDate());
			stmt.setInt(4, order.getTotalAmount());
			stmt.setString(5, order.getStatus());
			stmt.setString(6, order.getPaymentMode());
			stmt.setString(7, order.getAddress());
			stmt.setInt(8, order.getOrderId());

			int rows = stmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteOrder(int orderId) {
		try (Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(DELETE_ORDER_QUERY)) {

			stmt.setInt(1, orderId);
			int rows = stmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}

	}
}

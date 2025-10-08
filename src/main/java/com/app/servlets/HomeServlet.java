package com.app.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.app.dao.RestaurantDAO;
import com.app.daoimplementation.RestaurantDAOImpl;
import com.app.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/home")
public class HomeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			RestaurantDAO impl = new RestaurantDAOImpl();
			List<Restaurant> allRestaurants = impl.getAllRestaurants();
			
			req.setAttribute("allRestaurants", allRestaurants);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("restaurant.jsp");
			requestDispatcher.forward(req, resp);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

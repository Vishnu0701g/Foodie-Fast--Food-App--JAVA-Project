package com.app.servlets;

import java.io.IOException;
import java.util.List;

import com.app.dao.MenuDAO;
import com.app.daoimplementation.MenuDAOImpl;
import com.app.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/menu")
public class MenuServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		MenuDAO impl = new MenuDAOImpl();
		List<Menu> menuByRestaurantID = impl.getMenuByRestaurantID(restaurantId);
		req.setAttribute("menuByRestaurantID", menuByRestaurantID);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("menu.jsp");
		requestDispatcher.forward(req, resp);
	}

}

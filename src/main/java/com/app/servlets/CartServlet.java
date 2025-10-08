package com.app.servlets;

import java.io.IOException;

import com.app.dao.MenuDAO;
import com.app.daoimplementation.MenuDAOImpl;
import com.app.model.Cart;
import com.app.model.CartItem;
import com.app.model.Menu;
import com.app.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		// Retrieve existing cart and oldRestaurantId from session
		Cart cart = (Cart) session.getAttribute("cart");
		Integer oldRestaurantId = (Integer) session.getAttribute("restaurantId"); // Use Integer for null check

		// Get raw parameter values
		String restaurantIdParam = req.getParameter("restaurantId");
		String action = req.getParameter("action");
		
		// Check if action parameters are present. If not, it's likely a direct view request.
		if (action == null || restaurantIdParam == null) {
		    // If no action or restaurantId parameter, just ensure cart exists (or create empty) and redirect to view cart
		    if (cart == null) {
		        cart = new Cart(); // Create an empty cart if none exists
		        session.setAttribute("cart", cart);
		        // No restaurantId is set in session if it's a direct cart view and no items are being added
		    }
		    resp.sendRedirect("cart.jsp"); // Redirect to display the cart
		    return; // Exit the method
		}

		// If action parameters ARE present, then proceed with cart modification logic
		int newRestaurantId = Integer.parseInt(restaurantIdParam);
		
		// Check if a new cart is needed (either no cart exists or the restaurant has changed)
		// oldRestaurantId check is crucial to prevent NPE if it was never set before
		if (cart == null || (oldRestaurantId != null && oldRestaurantId != newRestaurantId)) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newRestaurantId); // Set the new restaurant ID
		} else if (oldRestaurantId == null) { // If there was no oldRestaurantId set, but cart exists
            session.setAttribute("restaurantId", newRestaurantId); // Set it for the first time
        }


		// Handle cart actions
		if (action.equalsIgnoreCase("add")) {
			addItemToCart(req, cart);
		} else if (action.equalsIgnoreCase("update")) {
			updateItemToCart(req, cart);
		} else if (action.equalsIgnoreCase("delete")) {
			deleteItemFromCart(req, cart);
		}
		
		resp.sendRedirect("cart.jsp");
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter(("menuId")));
		int quantity = 1; 
		try {
		    String quantityParam = req.getParameter("quantity");
		    if (quantityParam != null && !quantityParam.isEmpty()) {
		        quantity = Integer.parseInt(quantityParam);
		    }
		} catch (NumberFormatException e) {
		    System.err.println("Invalid quantity parameter. Defaulting to 1.");
		}
		
		MenuDAO impl = new MenuDAOImpl();
		Menu menu = impl.getMenu(menuId); 
		
		if (menu != null) { 
		    int restaurantId = menu.getRestaurantId(); 
		    CartItem cartItem = new CartItem(menuId, restaurantId, menu.getItemName(), quantity, menu.getPrice());
		    cart.addItem(cartItem);
		} else {
		    System.err.println("Menu item with ID " + menuId + " not found. Cannot add to cart.");
		}
	}

	private void updateItemToCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter(("menuId")));
		int quantity = Integer.parseInt(req.getParameter(("quantity")));
		cart.updateItem(menuId, quantity);
	}

	private void deleteItemFromCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter(("menuId")));
		cart.removeItem(menuId);
	}
}









//package com.example.servlets;
//
//import java.io.IOException;
//
//import com.app.dao.MenuDAO;
//import com.app.daoimplementation.MenuDAOImpl;
//import com.app.model.Cart;
//import com.app.model.CartItem;
//import com.app.model.Menu;
//import com.app.model.User;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/cart")
//public class CartServlet extends HttpServlet{
//	int count;
//	Cart cart;
//	int oldRestaurantId;
//
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		HttpSession session = req.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
//        Integer oldRestaurantId = (Integer) session.getAttribute("restaurantId");
//        
//        // Get request parameters
//        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
//        String action = req.getParameter("action");
//        
//        
//        // Check if a new cart is needed (either no cart exists or the restaurant has changed)
//        if (cart == null || (oldRestaurantId != null && oldRestaurantId != restaurantId)) {
//            cart = new Cart();
//            session.setAttribute("cart", cart);
//            session.setAttribute("restaurantId", restaurantId);
//        }
//
//        // Handle cart actions
//        if (action.equalsIgnoreCase("add")) {
//            addItemToCart(req, cart);
//        } else if (action.equalsIgnoreCase("update")) {
//            updateItemToCart(req, cart);
//        } else if (action.equalsIgnoreCase("delete")) {
//            deleteItemFromCart(req, cart);
//        }
//        resp.sendRedirect("cart.jsp");
//	}
//
//	private void addItemToCart(HttpServletRequest req, Cart cart) {
//		int menuId = Integer.parseInt(req.getParameter(("menuId")));
//		int quantity = Integer.parseInt(req.getParameter(("quantity")));
//		MenuDAO impl = new MenuDAOImpl();
//		Menu menu = impl.getMenu(menuId);
//		int restaurantId = menu.getRestaurantId();
//		CartItem cartItem = new CartItem(menuId, restaurantId, menu.getItemName(), quantity, menu.getPrice());
//		cart.addItem(cartItem);
//	}
//
//	private void updateItemToCart(HttpServletRequest req, Cart cart) {
//		int menuId = Integer.parseInt(req.getParameter(("menuId")));
//		int quantity = Integer.parseInt(req.getParameter(("quantity")));
//		cart.updateItem(menuId, quantity);
//	}
//
//	private void deleteItemFromCart(HttpServletRequest req, Cart cart) {
//		int menuId = Integer.parseInt(req.getParameter(("menuId")));
//		cart.removeItem(menuId);
//	}
//
//}

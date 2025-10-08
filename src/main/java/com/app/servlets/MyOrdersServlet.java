package com.app.servlets;

import com.app.model.User;
import com.app.model.Order;
import com.app.model.OrderItem;
import com.app.dao.OrderDAO;
import com.app.dao.OrderItemDAO;
import com.app.daoimplementation.OrderDAOImpl;
import com.app.daoimplementation.OrderItemDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/orders")
public class MyOrdersServlet extends HttpServlet {

    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User loggedInUser = null;

        if (session != null) {
            loggedInUser = (User) session.getAttribute("user");
        }

        if (loggedInUser == null) {
            request.setAttribute("message", "Please log in to view your orders.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        int userId = loggedInUser.getUserId();
        
        Map<Order, List<OrderItem>> ordersWithItems = new HashMap<>();
        
        try {
            List<Order> userOrders = orderDAO.getOrdersByUserId(userId);

            if (userOrders != null && !userOrders.isEmpty()) {
                for (Order order : userOrders) {
                    List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(order.getOrderId());
                    ordersWithItems.put(order, orderItems);
                }
            }
            request.setAttribute("ordersWithItems", ordersWithItems);
            
        } catch (Exception e) {
            e.printStackTrace(); 
            request.setAttribute("message", "Error retrieving orders: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("myOrders.jsp");
        dispatcher.forward(request, response);
    }
}

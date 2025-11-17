<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.app.model.Order" %>
<%@ page import="com.app.model.OrderItem" %>
<%@ page import="com.app.model.Menu" %>
<%@ page import="com.app.model.Restaurant" %>
<%@ page import="com.app.daoimplementation.MenuDAOImpl" %>       
<%@ page import="com.app.daoimplementation.RestaurantDAOImpl" %>   
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - Foodie Fast</title>
    <!-- Link to the external CSS for orders page styling -->
    <link rel="stylesheet" href="orders.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

    <jsp:include page="navbar.jsp" />

    <main class="orders-container">
        <h1 class="orders-heading">My Past Orders</h1>

        <%
            // Retrieve orders with their items from request attribute
            Map<Order, List<OrderItem>> ordersWithItems = (Map<Order, List<OrderItem>>) request.getAttribute("ordersWithItems");
            String message = (String) request.getAttribute("message"); // For displaying errors/messages
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");

            // Initialize DAOs for fetching Menu and Restaurant details within JSP
            // This is done here for simplicity in JSP, but for better practice,
            // the servlet should prepare all necessary data (e.g., using DTOs).
            MenuDAOImpl menuDAO = new MenuDAOImpl();
            RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
        %>

        <% if (message != null && !message.isEmpty()) { %>
            <div class="message-box error">
                <p><%= message %></p>
            </div>
        <% } %>

        <% if (ordersWithItems == null || ordersWithItems.isEmpty()) { %>
            <div class="no-orders-message">
                <p>You haven't placed any orders yet. Start exploring delicious food!</p>
                <a href="restaurants.jsp" class="btn primary-btn">Explore Restaurants</a>
            </div>
        <% } else { %>
            <div class="order-list">
                <% 
                // Iterate through each Order in the map
                for (Map.Entry<Order, List<OrderItem>> entry : ordersWithItems.entrySet()) {
                    Order order = entry.getKey();
                    List<OrderItem> orderItems = entry.getValue();

                    // Fetch Restaurant Name
                    String restaurantName = "Unknown Restaurant";
                    if (order.getRestaurantId() != 0) { // Assuming 0 is an invalid ID
                        Restaurant restaurant = restaurantDAO.getRestaurant(order.getRestaurantId());
                        if (restaurant != null) {
                            restaurantName = restaurant.getName();
                        }
                    }
                %>
                    <div class="order-card">
                        <div class="order-header">
                            <div class="header-left">
                                <span class="order-id">Order ID: <strong>#<%= order.getOrderId() %></strong></span>
                                <span class="order-date"><i class="far fa-calendar-alt"></i> <%= dateFormat.format(order.getOrderDate()) %></span>
                                <span class="order-restaurant"><i class="fas fa-store"></i> <%= restaurantName %></span>
                            </div>
                            <div class="header-right">
                                <span class="order-status status-<%= order.getStatus().toLowerCase().replace(" ", "-") %>"><%= order.getStatus() %></span>
                            </div>
                        </div>

                        <div class="order-details">
                            <p><strong>Total Amount:</strong> ₹<%= String.format("%.2f", (double) order.getTotalAmount()) %></p>
                            <p><strong>Payment Mode:</strong> <%= order.getPaymentMode() %></p>
                            <p><strong>Delivery Address:</strong> <%= order.getAddress() %></p>
                        </div>

                        <div class="order-items">
                            <h4>Items in this Order:</h4>
                            <ul>
                                <% 
                                // Iterate through each OrderItem for the current Order
                                if (orderItems != null && !orderItems.isEmpty()) {
                                    for (OrderItem orderItem : orderItems) {
                                        // Fetch Menu Item Name and Image Path
                                        String itemName = "Unknown Item";
                                        String itemImage = "https://placehold.co/100x100/CCCCCC/FFFFFF?text=No+Img"; // Default placeholder
                                        if (orderItem.getMenuId() != 0) { // Assuming 0 is an invalid ID
                                            Menu menu = menuDAO.getMenu(orderItem.getMenuId());
                                            if (menu != null) {
                                                itemName = menu.getItemName();
                                                if (menu.getImagePath() != null && !menu.getImagePath().isEmpty()) {
                                                    itemImage = menu.getImagePath();
                                                }
                                            }
                                        }
                                %>
                                        <li>
                                            <img src="<%= itemImage %>" alt="<%= itemName %>" class="item-thumbnail">
                                            <span class="item-name"><%= itemName %></span>
                                            <span class="item-quantity">x<%= orderItem.getQuantity() %></span>
                                            <span class="item-price">₹<%= String.format("%.2f", (double) orderItem.getTotalAmount()) %></span>
                                        </li>
                                    <% 
                                    }
                                } else {
                                    // Fallback if no order items found for an order
                                %>
                                    <li><p class="no-items-in-order">No items found for this order.</p></li>
                                <%
                                }
                                %>
                            </ul>
                        </div>
                        <div class="order-footer">
                           <a href="menu?restaurantId=<%= order.getRestaurantId() %>" class="btn secondary-btn">Reorder from <%= restaurantName %></a>
                           <a href="help.jsp" class="btn primary-btn">Contact Support for Order #<%= order.getOrderId() %></a>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } %>
    </main>

    
    <jsp:include page="footer.jsp" />

</body>
</html>






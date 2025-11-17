
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.app.model.Cart" %>
<%@ page import="com.app.model.CartItem" %>
<%@ page import="com.app.model.Menu,com.app.model.Restaurant" %>
<%@ page import="com.app.daoimplementation.MenuDAOImpl,com.app.daoimplementation.RestaurantDAOImpl" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - Foodie Fast</title>
    <!-- Link to the external CSS for cart styling -->
    <link rel="stylesheet" href="cart.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
 <jsp:include page="navbar.jsp" />
    
    <main class="cart-container">
    <h1 class="cart-heading">Your Shopping Cart</h1>

     <%
            // Retrieve cart from session
            Cart cart2 = (Cart) session.getAttribute("cart");
            
            // Safely retrieve restaurantId from session, allowing it to be null
            Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId"); 

            double cartTotalPrice = 0.0;
        %>

    <div class="cart-items-wrapper">
        <%
            if (cart2 == null || cart2.getItems().isEmpty()) {
        %>
            <p class="empty-cart-message">Your cart is empty. Start adding some delicious food!</p>
            <div class="cart-actions">
                <a href="home" class="btn primary-btn">Explore Restaurants</a>
            </div>
        <%
            } else {
                Collection<CartItem> cartItems = cart2.getItems().values();
        %>
            <div class="cart-item-list">
                <%
                MenuDAOImpl menuDAO = new MenuDAOImpl();
                RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
                
                for (CartItem item : cartItems) {
                    double itemTotalPrice = item.getQuantity() * item.getPrice();
                    cartTotalPrice += itemTotalPrice;
                    
                    Menu menu = menuDAO.getMenu(item.getMenuId());
                    Restaurant restaurant = restaurantDAO.getRestaurant(item.getRestaurantId());		
                    String itemImagePath = (menu != null && menu.getImagePath() != null) ? menu.getImagePath() : "https://placehold.co/100x100/CCCCCC/FFFFFF?text=No+Img";
                    String restaurantName = (restaurant != null) ? restaurant.getName() : "N/A";
                %>
                    <div class="cart-item">
                        <img src="<%= itemImagePath %>" alt="<%= item.getName() %>" class="item-image">
                        
                        <div class="item-details">
                            <h3 class="item-name"><%= item.getName() %></h3>
                            <p class="item-restaurant">from <%= restaurantName %></p>
                            <p class="item-price">₹<%= String.format("%.2f", (double) item.getPrice()) %></p>
                        </div>
                        
                        <div>
                            <div class="item-quantity-controls">
                                <form action="cart" method="post" class="quantity-form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                                    <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                                    <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                                    <button type="submit" class="quantity-btn" <%= item.getQuantity() <= 1 ? "disabled" : "" %>>-</button>
                                </form>
                                <span class="item-quantity"><%= item.getQuantity() %></span>
                                <form action="cart" method="post" class="quantity-form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                                    <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                                    <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                                    <button type="submit" class="quantity-btn">+</button>
                                </form>
                            </div>
                            
                            <div class="item-actions-group">
                                <div class="item-total-price">
                                    ₹<%= String.format("%.2f", itemTotalPrice) %>
                                </div>
                                <div class="item-remove">
                                    <form action="cart" method="post" class="remove-form">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                                        <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                                        <button type="submit" class="remove-btn"><i class="fas fa-trash-alt"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                <%
                    }
                %>
            </div>

            <div class="cart-summary">
                <div class="total-price">
                    <strong>Total:</strong> 
                    <span>₹<%= String.format("%.2f", cartTotalPrice) %></span>
                </div>
                <div class="cart-actions">
                    <%
                        if (currentRestaurantId != null) {
                    %>
                        <a href="menu?restaurantId=<%= currentRestaurantId %>" class="btn secondary-btn">Add More Items</a>
                    <%
                        } else {
                    %>
                        <a href="home" class="btn secondary-btn">Explore Restaurants</a>
                    <%        
                        }
                    %>
                    <a href="checkout.jsp" class="btn primary-btn">Proceed to Checkout</a>
                </div>
            </div>
        <%
            }
        %>
    </div>
</main>

    <!-- Placeholder for Footer inclusion -->
    <jsp:include page="footer.jsp" />


</body>
</html>

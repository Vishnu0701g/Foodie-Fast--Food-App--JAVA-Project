<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.app.model.User" %>
<%@ page import="com.app.model.Cart,com.app.model.CartItem" %>
<%@ page import="java.util.Collection" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation</title>
    <!-- Link to the combined stylesheet for navbar and footer -->
    <link rel="stylesheet" href="navbar.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>


<%
    // Retrieve User and Cart objects from session
    User user = (User) session.getAttribute("user");
    Cart cart = (Cart) session.getAttribute("cart");
    boolean isLoggedIn = (user != null);
    String username = isLoggedIn ? user.getName() : "Guest"; // Assuming getUsername() method
    
    int cartItemCount = 0;
    if (cart != null && cart.getItems() != null) {
        // Calculate total items in cart
        for (CartItem item : cart.getItems().values()) {
            cartItemCount += item.getQuantity();
        }
    }
%>

<nav class="navbar">
    <div class="navbar-left">
        <!-- Logo and Site Name -->
        <a href="home" class="navbar-logo-text">
            <img src="https://placehold.co/40x40/6c63ff/ffffff?text=LOGO" alt="Foodie Fast Logo" class="navbar-logo-img">
            Foodie Fast
        </a>
    </div>

    <!-- Search Bar -->
    <div class="navbar-search">
        <form action="#" method="get">
            <input type="text" placeholder="Search for food, restaurants...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </form>
    </div>

    <div class="navbar-right">
        <a href="home" class="navbar-link">Home</a>
        <a href="help.jsp" class="navbar-link">Help</a>

        <% if (!isLoggedIn) { %>
            <!-- Show Login button if user is NOT logged in -->
            <a href="login.jsp" class="navbar-link auth-btn">Login</a>
        <% } else { %>
            <!-- Show username with dropdown if user IS logged in -->
            <div class="user-dropdown">
                <a href="#" class="navbar-link user-name-link"><%= username %> <i class="fas fa-caret-down"></i></a>
                <div class="dropdown-content">
                    <a href="profile.jsp">Profile</a>
                    <a href="orders">Orders</a>
                    <!-- Link to a logout servlet that invalidates the session -->
                    <a href="logout">Sign Out</a> 
                </div>
            </div>
        <% } %>
        
        <!-- Cart Link with optional item count -->
        <a href="cart" class="navbar-link cart-link">
            <i class="fas fa-shopping-cart"></i>
            <% if (cartItemCount > 0) { %>
                <span class="cart-item-count"><%= cartItemCount %></span>
            <% } %>
        </a>
    </div>
</nav>

</body>
</html>



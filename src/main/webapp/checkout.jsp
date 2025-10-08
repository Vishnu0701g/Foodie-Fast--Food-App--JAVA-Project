<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.app.model.User" %>
<%@ page import="com.app.model.Cart" %>
<%@ page import="com.app.model.CartItem" %>
<%@ page import="java.util.Collection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Foodie Fast</title>
    <link rel="stylesheet" href="checkout.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<jsp:include page="navbar.jsp" />

    <main class="checkout-container">
        <h1 class="checkout-heading">Complete Your Order</h1>

        <%
            // Retrieve User and Cart objects from session
            User user2 = (User) session.getAttribute("user");
            Cart cart2 = (Cart) session.getAttribute("cart");
            boolean isLoggedIn2 = (user2 != null);
            double totalCartAmount = 0.0;

            // Calculate total cart amount if cart exists and is not empty
            if (cart2 != null && !cart2.getItems().isEmpty()) {
                for (CartItem item : cart2.getItems().values()) {
                    totalCartAmount += item.getPrice() * item.getQuantity();
                }
            }
        %>

        <form action="checkout" method="post" class="checkout-form">
            <!-- Section 1: Account Information -->
            <div class="checkout-section account-section">
                <div class="section-header">
                    <i class="fas fa-user-circle section-icon"></i>
                    <h2>Account</h2>
                </div>
                <div class="section-content">
                    <% if (isLoggedIn2) { %>
                        <div class="user-info">
                            <p><%= user2.getUserName() != null ? user2.getUserName() : "N/A" %></p>
                            <p><%= user2.getPhoneNumber() != null ? user2.getPhoneNumber() : "N/A" %></p>
                            <!-- Assuming User model has getUsername() and getPhoneNumber() methods -->
                        </div>
                    <% } else { %>
                        <div class="login-prompt">
                            <p>To place your order, please log in or sign up.</p>
                            <div class="login-buttons">
                                <a href="login.jsp" class="btn secondary-btn">Log In</a>
                                <a href="registration.jsp" class="btn primary-btn">Sign Up</a>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>

            <!-- Section 2: Delivery Address -->
            <div class="checkout-section delivery-section">
                <div class="section-header">
                    <i class="fas fa-map-marker-alt section-icon"></i>
                    <h2>Delivery Address</h2>
                </div>
                <div class="section-content">
                    <div class="form-group">
                        <label for="deliveryAddress">Full Delivery Address</label>
                        <textarea id="deliveryAddress" name="deliveryAddress" rows="4" placeholder="Enter your complete delivery address including street, city." required></textarea>
                    </div>
                </div>
            </div>

            <!-- Section 3: Payment Method -->
            <div class="checkout-section payment-section">
                <div class="section-header">
                    <i class="fas fa-wallet section-icon"></i>
                    <h2>Payment Method</h2>
                </div>
                <div class="section-content">
                    <div class="form-group">
                        <label for="paymentMethod">Select Payment Method</label>
                        <select id="paymentMethod" name="paymentMethod" class="disabled-select" >
                            <option value=""disabled>-- Select Payment Method --</option>
                            <option value="debit_card">Debit Card</option>
                            <option value="credit_card">Credit Card</option>
                            <option value="upi">Pay through UPI</option>
                            <option value="cash_on_delivery" selected>Cash on Delivery</option>
                        </select>
                        <p class="disabled-message">Other payment methods are currently unavailable. Please choose Cash on Delivery.</p>
                    </div>
                </div>
            </div>

            <!-- Total Price Display -->
            <div class="order-summary">
                <h3>Order Summary</h3>
                <div class="summary-item">
                    <span>Cart Total:</span>
                    <span>₹<%= String.format("%.2f", totalCartAmount) %></span>
                </div>
                <div class="summary-item">
                    <span>Delivery Fee:</span>
                    <span>₹40.00</span> <%-- Example delivery fee --%>
                </div>
                <div class="summary-item total">
                    <span>Total Amount:</span>
                    <span>₹<%= String.format("%.2f", totalCartAmount + 40.00) %></span>
                </div>
            </div>

            <!-- Place Order Button -->
            <div class="place-order-section">
                <% if (isLoggedIn2 && cart2 != null && !cart2.getItems().isEmpty()) { %>
                    <button type="submit" class="btn primary-btn large-btn">Place Order</button>
                <% } else { %>
                    <p class="disabled-order-message">Please log in and ensure your cart is not empty to place an order.</p>
                    <button type="button" class="btn primary-btn large-btn disabled-btn" disabled>Place Order</button>
                <% } %>
            </div>
        </form>
    </main>

   
    <jsp:include page="footer.jsp" />

</body>
</html>


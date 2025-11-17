<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.app.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Foodie Fast</title>
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>  
    <jsp:include page="navbar.jsp" />

    <main class="profile-container">
        <h1 class="profile-heading">My Profile</h1>

        <%
            User user = (User) session.getAttribute("user");
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");

            if (user == null) {
        %>
            <div class="not-logged-in-message">
                <p>You are not logged in. Please <a href="login.jsp">log in</a> to view your profile.</p>
                <p>Don't have an account? <a href="registration.jsp">Sign up here</a>.</p>
            </div>
        <%
            } else {
        %>
            <!-- Optional: Success/Error Messages -->
            <% if (successMessage != null) { %>
                <div class="message-box success"><%= successMessage %></div>
            <% } %>
            <% if (errorMessage != null) { %>
                <div class="message-box error"><%= errorMessage %></div>
            <% } %>

            <form action="updateProfile" method="post" class="profile-form">
                <input type="hidden" name="userId" value="<%= user.getUserId() %>">

                <!-- Personal Information Section -->
                <div class="form-section">
                    <h2><i class="fas fa-user-edit section-icon"></i> Personal Information</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" value="<%= user.getName() != null ? user.getName() : "" %>" placeholder="Enter your full name" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" value="<%= user.getUserName() != null ? user.getUserName() : "" %>" placeholder="Choose a username" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" value="<%= user.getEmail() != null ? user.getEmail() : "" %>" placeholder="your.email@example.com" required>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="tel" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "" %>" placeholder="+91 98765 43210" required>
                        </div>
                    </div>
                </div>

                <!-- Password Update Section -->
                <div class="form-section">
                    <h2><i class="fas fa-key section-icon"></i> Change Password</h2>
                    <div class="form-group">
                        <label for="newPassword">New Password (Optional)</label>
                        <input type="password" id="newPassword" name="newPassword" placeholder="Leave blank to keep current password">
                    </div>
                </div>

                <!-- Address Information Section -->
                <div class="form-section">
                    <h2><i class="fas fa-map-marked-alt section-icon"></i> Delivery Address</h2>
                    <div class="form-group">
                        <label for="address">Complete Address</label>
                        <textarea id="address" name="address" rows="4" placeholder="Enter your complete delivery address with street, landmark, and city" required><%= user.getAddress() != null ? user.getAddress() : "" %></textarea>
                    </div>
                </div>

                <button type="submit" class="btn save-changes-btn">Save Changes</button>
            </form>
        <%
            }
        %>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>
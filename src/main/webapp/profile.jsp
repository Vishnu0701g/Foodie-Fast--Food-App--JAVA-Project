<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.app.model.User" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Foodie Fast</title>
    <!-- Link to the external CSS for profile styling -->
    <link rel="stylesheet" href="profile.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>  
<!-- Include the navigation bar -->
    <jsp:include page="navbar.jsp" />

    <main class="profile-container">
        <h1 class="profile-heading">My Profile</h1>

        <%
            // Retrieve User object from session
            User user = (User) session.getAttribute("user");

            // Check if user is logged in
            if (user == null) {
        %>
            <div class="not-logged-in-message">
                <p>You are not logged in. Please <a href="login.html">log in</a> to view your profile.</p>
                <p>Don't have an account? <a href="registration.html">Sign up here</a>.</p>
            </div>
        <%
            } else {
        %>
            <form action="updateProfile" method="post" class="profile-form">
                <!-- User ID (hidden field, useful for backend) -->
                <input type="hidden" name="userId" value="<%= user.getUserId() %>">

                <!-- Personal Information Section -->
                <div class="form-section">
                    <h2><i class="fas fa-user-edit section-icon"></i> Personal Information</h2>
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" value="<%= user.getName() != null ? user.getName() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<%= user.getUserName() != null ? user.getUserName() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" value="<%= user.getEmail() != null ? user.getEmail() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "" %>" required>
                    </div>
                </div>

                <!-- Password Update Section -->
                <div class="form-section">
                    <h2><i class="fas fa-key section-icon"></i> Change Password</h2>
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password (optional)">
                    </div>
                    <%-- Removed: Confirm New Password field --%>
                </div>

                <!-- Address Information Section -->
                <div class="form-section">
                    <h2><i class="fas fa-map-marked-alt section-icon"></i> Delivery Address</h2>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="4" required><%= user.getAddress() != null ? user.getAddress() : "" %></textarea>
                    </div>
                </div>

                <button type="submit" class="btn save-changes-btn">Save Changes</button>
            </form>
        <%
            }
        %>
    </main>

    <!-- Include the footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>





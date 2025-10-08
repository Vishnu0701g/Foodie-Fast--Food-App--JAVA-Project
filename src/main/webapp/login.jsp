<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Foodie Fast</title>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="main-container">
        <div class="info-panel">
            <div class="info-content">
                <h1>Foodie Fast</h1>
                <h2>Quick. Fresh. Delicious.</h2>
                <p>Welcome back! Get access to exclusive restaurants and fast delivery.</p>
            </div>
        </div>

        <div class="form-panel">
            <div class="card">
                <form action="callingLoginServlet" method="post" class="form">
                    <h3>Login</h3>
                    <p class="form-subtitle">Enter your email and password to continue.</p>
                    
                    <p class="error-message" style="color: red; text-align: center;">${errorMessage}</p>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email address" value="${emailEntered}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                    
                    <button type="submit" class="btn">Continue</button>
                </form>

                <p class="form-footer">
                    Don't have an account? <a href="registration.jsp">Sign Up here</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
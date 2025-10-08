<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account - Foodie Fast</title>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="main-container">
		<div class="info-panel">
			<div class="info-content">
				<h1>Foodie Fast</h1>
				<h2>Quick. Fresh. Delicious.</h2>
				<p>Join our community of food lovers and get your favorite meals delivered to your doorstep in minutes.</p>
			</div>
		</div>

		<div class="form-panel">
			<div class="card">
				<form action="callingRegisterServlet" method="post" class="form">
					<h3>Create Account</h3>
					<p class="form-subtitle">Let's get you started with the best food delivery experience.</p>

					<p class="error-message" style="color: red; text-align: center;">${errorMessage}</p>

					<div class="form-grid">
						<div class="form-group">
							<label for="name">Name</label> 
							<input type="text" id="name" name="name" placeholder="Enter your full name" value="${param.name}" required>
						</div>

						<div class="form-group">
							<label for="username">Username</label> 
							<input type="text" id="username" name="username" placeholder="Choose a username" value="${param.username}" required>
						</div>

						<div class="form-group">
							<label for="email">Email</label> 
							<input type="email" id="email" name="email" placeholder="Enter your email" value="${param.email}" required>
						</div>

						<div class="form-group">
							<label for="phone">Phone Number</label> 
							<input type="tel" id="phone" name="phonenumber" placeholder="Enter your phone number" value="${param.phonenumber}" required>
						</div>

						<div class="form-group">
							<label for="password">Password</label> 
							<input type="password" id="password" name="password" placeholder="Create a password" required>
						</div>

						<div class="form-group">
							<label for="confirm-password">Confirm Password</label> 
							<input type="password" id="confirm-password" name="confirm-password" placeholder="Re-enter your password" required>
						</div>
						
						<div class="form-group full-width">
							<label for="address">Address</label>
							<textarea id="address" name="address" rows="3" placeholder="Enter your full address" required>${param.address}</textarea>
						</div>
						
						<div class="form-group full-width">
							<label for="role">Role</label> 
							<select id="role" name="role" required>
								<option value="" disabled selected>-- Select Role --</option>
								<option value="Customer">Customer</option>
								<option value="RestaurantAdmin">Restaurant Admin</option>
								<option value="DeliveryAgent">Delivery Agent</option>
								<option value="SuperAdmin">Super Admin</option>
							</select>
						</div>
					</div>

					<button type="submit" class="btn">Register</button>
				</form>

				<p class="form-footer">
					Already have an account? <a href="login.jsp">Login here</a>
				</p>
			</div>
		</div>
	</div>

</body>
</html>
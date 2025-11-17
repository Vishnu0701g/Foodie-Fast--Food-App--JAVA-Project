<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.util.List,com.app.model.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurants - Foodie Fast</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="cards.css">
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="banner-container">
		<img 
			src="images/res-bg.jpeg"
			alt="Food Banner" class="banner-image">
	</div>

	<main class="content-wrapper">
		<h1 class="section-heading">Restaurants Near You</h1>

		<div class="card-grid">


			<% List<Restaurant> allRestaurants=(List<Restaurant>)request.getAttribute("allRestaurants"); 
        
          for(Restaurant restaurant:allRestaurants){  %>

			<!-- Restaurant Card -->
			<a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>"
				class="card restaurant-card"> <img
				src="<%= restaurant.getImagePath() %>"
				alt="<%= restaurant.getName() %>" class="card-image">
				<div class="card-content">
					<h3 class="card-title">
						<%= restaurant.getName() %>
						<span
							style="font-size: 13px; font-weight: 500; color: #686b78; white-space: nowrap;">
							🕐 <%= restaurant.getDeliveryTime() %> min
						</span>
					</h3>

					<p class="card-text"><%= restaurant.getAddress() %></p>

					<div class="card-info-row">
						<p class="card-text"><%= restaurant.getCuisineType() %></p>
						<p class="card-text">
							⭐
							<%= restaurant.getRating() %></p>
					</div>
				</div>
			</a>
			<%
          }
        
        %>





		</div>
	</main>

	<jsp:include page="footer.jsp" />

</body>
</html>




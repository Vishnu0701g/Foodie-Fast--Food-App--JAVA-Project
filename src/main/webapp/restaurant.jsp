<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.util.List,com.app.model.Restaurant" %>
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
        <img src="https://placehold.co/1200x300/6c63ff/ffffff?text=Delicious+Food+Delivered+To+You" alt="Food Banner" class="banner-image">
    </div>

    <main class="content-wrapper">
        <h1 class="section-heading">Restaurants Near You</h1>

        <div class="card-grid">
        
        
        <% List<Restaurant> allRestaurants=(List<Restaurant>)request.getAttribute("allRestaurants"); 
        
          for(Restaurant restaurant:allRestaurants){  %>
          
            <!-- Restaurant Card  -->
            <div class="card restaurant-card">
                <img src="<%= restaurant.getImagePath() %>" alt="Restaurant 1" class="card-image">
                <div class="card-content">
                    <h3 class="card-title"><%= restaurant.getName() %></h3>
                    <p class="card-text"><strong>Address:</strong> <%= restaurant.getAddress() %></p>
                    <p class="card-text"><strong>Cuisine:</strong> <%= restaurant.getCuisineType() %></p>
                    <p class="card-text"><strong>Review:</strong> <%= restaurant.getRating() %></p>
                    <p class="card-text"><strong>Delivery:</strong> <%= restaurant.getDeliveryTime() %> min</p>
                    <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>" class="card-button">View Menu</a>
                </div>
            </div>
       <%
          }
        
        %>
        
        
        

            
        </div>
    </main>

     <jsp:include page="footer.jsp" />

</body>
</html>




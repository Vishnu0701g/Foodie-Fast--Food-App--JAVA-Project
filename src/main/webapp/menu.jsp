<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List,com.app.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Foodie Fast</title>
    <!-- Link to the shared CSS for cards and general styling -->
    <link rel="stylesheet" href="cards.css">
</head>
<body>
  <jsp:include page="navbar.jsp" />

    <main class="content-wrapper">
        <h1 class="section-heading">Our Delicious Menu</h1>

        <div class="card-grid">
        
        
        <% List<Menu> menusByRestaurantId=(List<Menu>)request.getAttribute("menuByRestaurantID");
          for(Menu menu: menusByRestaurantId){ %>
        	  <!-- Menu Card 1 -->
            <div class="card menu-card">
                <img src="<%= menu.getImagePath() %>" alt="Pizza Margherita" class="card-image">
                <div class="card-content">
                    <h3 class="card-title"><%= menu.getItemName() %></h3>
                    <p class="card-description"><%= menu.getDescription() %></p>
                    <p class="card-price">₹<%= menu.getPrice()%></p>
                    <p class="card-rating"><%= menu.getRatings() %></p>
                    
                    <form action="cart">
                    <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                    <input type="hidden" name="quantity" value="1">
                    <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId()%>">
                    <input type="hidden" name="action" value="add">
                    <input class="card-button" type="submit" value="Add to Cart">
                    </form>
                    
                </div>
            </div>
          
        
         <% }
        %>
            

        </div>
    </main>

    <!-- Placeholder for Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    <!-- Link to the combined stylesheet for navbar and footer -->
    <link rel="stylesheet" href="navbar.css">
    <!-- Include Font Awesome for social media icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section about">
            <h3>Foodie Fast</h3>
            <p>Your ultimate destination for delicious food delivered right to your doorstep. Fast, fresh, and fantastic!</p>
        </div>
        <div class="footer-section links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="restaurants.jsp">Restaurants</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">My Account</a></li>
                <li><a href="#">Help & FAQs</a></li>
            </ul>
        </div>
        <div class="footer-section contact">
            <h3>Contact Us</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Food Street, Delicious City</p>
            <p><i class="fas fa-phone"></i> +123 456 7890</p>
            <p><i class="fas fa-envelope"></i> info@foodiefast.com</p>
        </div>
        <div class="footer-section social">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; <%= java.time.Year.now().getValue() %> Foodie Fast. All rights reserved.</p>
    </div>
</footer>

</body>
</html>


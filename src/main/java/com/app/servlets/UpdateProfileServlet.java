package com.app.servlets;

import com.app.model.User; // Assuming your User model is in this package
import com.app.dao.UserDAO; // Assuming your UserDAO interface is in this package
import com.app.daoimplementation.UserDAOImpl; // Your actual UserDAOImpl

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String newPassword = request.getParameter("newPassword"); 

        if (name == null || name.isEmpty() || userName == null || userName.isEmpty() ||
            email == null || email.isEmpty() || phoneNumber == null || phoneNumber.isEmpty() ||
            address == null || address.isEmpty()) {
            
            session.setAttribute("profileMessage", "All fields except New Password are required.");
            response.sendRedirect("profile.jsp");
            return;
        }

        try {
            currentUser.setName(name);
            currentUser.setUserName(userName);
            currentUser.setEmail(email);
            currentUser.setPhoneNumber(phoneNumber);
            currentUser.setAddress(address);

            if (newPassword != null && !newPassword.trim().isEmpty()) {
                currentUser.setPassword(newPassword); 
            }

            userDAO.updateUser(currentUser);

            session.setAttribute("user", currentUser);
            session.setAttribute("profileMessage", "Profile updated successfully!");

        } catch (Exception e) {
            e.printStackTrace(); 
            session.setAttribute("profileMessage", "Error updating profile: " + e.getMessage());
        }

        response.sendRedirect("profile.jsp");
    }
}


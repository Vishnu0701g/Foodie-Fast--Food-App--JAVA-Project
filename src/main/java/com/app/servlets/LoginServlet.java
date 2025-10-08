package com.app.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.app.daoimplementation.UserDAOImpl;
import com.app.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/callingLoginServlet")
public class LoginServlet extends HttpServlet{
	   private static final int MAX_ATTEMPTS = 3;

	    @Override
	    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        UserDAOImpl userImpl = new UserDAOImpl();
	        String emailEntered = req.getParameter("email");
	        String enteredPassword = req.getParameter("password");
	        String userPassword = userImpl.getUserPassword(emailEntered);
	        User user = userImpl.getUser(emailEntered);

	        HttpSession session = req.getSession();
	        Integer attempts = (Integer) session.getAttribute("loginAttempts");
	        if (attempts == null) {
	            attempts = MAX_ATTEMPTS;
	        }

	        resp.setContentType("text/html");

	        if (enteredPassword.equals(userPassword)) {
	            session.removeAttribute("loginAttempts");
	            session.setAttribute("user", user);
	            user.setLastLoginDate(new Timestamp(System.currentTimeMillis()));
                userImpl.updateUser(user);
	            RequestDispatcher rd = req.getRequestDispatcher("home");
	            rd.forward(req, resp);
	        } else {
	            attempts--;
	            
	            if (attempts > 0) {
	                session.setAttribute("loginAttempts", attempts);
	                String errorMessage = "Incorrect password. You have " + attempts + " attempts left.";
	                req.setAttribute("errorMessage", errorMessage);
	                req.setAttribute("emailEntered", emailEntered);
	                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	                rd.forward(req, resp);
	            } else {
	                session.invalidate(); 
	                
	                req.setAttribute("helpMessage", "You have been locked out after 3 failed attempts. Please contact support.");
	                
	                RequestDispatcher rd = req.getRequestDispatcher("help.jsp");
	                rd.forward(req, resp);
	            }
	        }
	    }
}

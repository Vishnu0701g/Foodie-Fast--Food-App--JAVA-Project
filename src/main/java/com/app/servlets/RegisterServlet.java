package com.app.servlets;

import java.io.IOException;

import com.app.dao.UserDAO;
import com.app.daoimplementation.UserDAOImpl;
import com.app.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callingRegisterServlet")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phonenumber");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirm-password");
		String address = req.getParameter("address");
		String role = req.getParameter("role");

		UserDAO impl = new UserDAOImpl();

		if (!password.equals(confirmPassword)) {
			req.setAttribute("errorMessage", "Error: Passwords do not match.");
			RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
			rd.forward(req, resp);
			return; 
		}

		if (impl.isEmailRegistered(email)) {
			req.setAttribute("errorMessage", "Error: An account with this email already exists.");
			RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
			rd.forward(req, resp);
			return; 
		}

		User user = new User(name, username, email, phonenumber, password, address, role );
		int result = impl.addUser(user);

		if (result == 1) {
			req.setAttribute("successMessage", "Registration Successful! Welcome, " + name + ".");
			session.setAttribute("user", user);
			RequestDispatcher rd = req.getRequestDispatcher("home");
			rd.forward(req, resp);
		} else {
			req.setAttribute("errorMessage", "Error: Registration failed. Please try again later.");
			RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
			rd.forward(req, resp);
		}
	}



}

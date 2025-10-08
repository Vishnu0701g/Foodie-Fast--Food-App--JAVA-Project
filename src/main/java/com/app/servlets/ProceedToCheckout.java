package com.app.servlets;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import com.app.dao.OrderDAO;
import com.app.daoimplementation.OrderDAOImpl;
import com.app.daoimplementation.OrderItemDAOImpl;
import com.app.model.Cart;
import com.app.model.CartItem;
import com.app.model.Order;
import com.app.model.OrderItem;
import com.app.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class ProceedToCheckout extends HttpServlet{
	private OrderDAO orderDAO;

	@Override
	public void init() throws ServletException {
		orderDAO=new OrderDAOImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		User user = (User)session.getAttribute("user");


		if(user==null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		}
		



		if(cart !=null &&user !=null&&!cart.getItems().isEmpty()) {
			String paymentMethod=req.getParameter("paymentMethod");
			String address=req.getParameter("deliveryAddress");

			Order order = new Order();
			order.setUserId(user.getUserId());
			order.setRestaurantId((int)session.getAttribute("restaurantId"));
			order.setOrderDate(Date.valueOf(LocalDate.now()));
			order.setPaymentMode(paymentMethod);
			order.setAddress(address);
			order.setStatus("Confirmed");

			int totalAmount=0;
			for(CartItem item:cart.getItems().values()) {
				totalAmount+=item.getPrice() * item.getQuantity();
			}
			order.setTotalAmount(totalAmount);

			int orderId = orderDAO.addOrder(order);
			


			for(CartItem item:cart.getItems().values()) {
				int menuId=item.getMenuId();
				int quantity=item.getQuantity();
				int totalPrice=item.getPrice()*quantity;

				OrderItem orderItem = new OrderItem(orderId,menuId,quantity,totalPrice);
				OrderItemDAOImpl impl = new OrderItemDAOImpl();
				impl.addOrderItem(orderItem);
	
			}
			RequestDispatcher dispatcher = req.getRequestDispatcher("orderPlaced.jsp");
			dispatcher.forward(req, resp);

		}



	}

}

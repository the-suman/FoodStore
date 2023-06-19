package com.foodstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.Role;
import com.foodstore.model.CartItem;
import com.foodstore.model.OrderDetails;
import com.foodstore.model.PaymentDetails;
import com.foodstore.service.impl.CartServiceImpl;
import com.foodstore.service.impl.OrderItemsServiceImpl;
import com.foodstore.service.impl.OrderServiceImpl;
import com.foodstore.service.impl.PaymentServiceImpl;
import com.foodstore.util.FoodUtil;

@WebServlet("/placeorder")
public class PlaceOrder extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PlaceOrder() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		FoodUtil.validateUserPageAccess(req, Role.CUSTOMER);
		String pageName = "paymentfailed.jsp";

		// read card details from the submitted form

		if (!validateCardDetails()) {
			res.sendRedirect(pageName);
			return;
		}
		

		String userId = FoodUtil.getCurrentUserId(req);
		
		List<CartItem> cartItems = (List<CartItem>) req.getAttribute("cartitems");

		PaymentDetails paymentDetails = new PaymentDetails();
		// Populate all the fields
		String paymentId = new PaymentServiceImpl().savePaymentDetailsAndGenerateId(paymentDetails);

		String orderId = new OrderItemsServiceImpl().createOrder(cartItems);
		
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setOrderId(orderId);
		//populate field
		
		String transactionId = new OrderServiceImpl().placeOrder(orderDetails);
		
		
		new CartServiceImpl().removeAlItemFromCart(userId);
		
		pageName = "orderplaced.jsp";
		//display the order details
		
		res.sendRedirect(pageName);
	}

	private boolean validateCardDetails() {
		// => Only allow valid card-> 4242424242424242 , 123, 01/12/25
		return true;
	}
}

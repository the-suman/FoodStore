package com.foodstore.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.OrderStatus;
import com.foodstore.enums.PaymentType;
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
		String pageName = "error.jsp";

		// read card details from the submitted form
		String cardHolderName= req.getParameter("CardHolderName");
		String cardNumber = req.getParameter("CardNumber");
		String dateOfExp= req.getParameter("DateOfExp");
		String cvvNumber = req.getParameter("cvvNumber");
		Double amount= Double.parseDouble(req.getParameter("amount"));
		
		if (!validateCardDetails(cvvNumber)) {
			res.sendRedirect(pageName+ "?errorMessage=Invalid CVV Number");
			return;
		}
		
		String userId = FoodUtil.getCurrentUserId(req);
		
		List<CartItem> cartItems = (List<CartItem>) req.getSession().getAttribute("cartitems");
		
		PaymentDetails paymentDetails = new PaymentDetails();
		// Populate all the fields
		paymentDetails.setCardNumber(cardNumber);
		paymentDetails.setAmount(amount);
		paymentDetails.setType(PaymentType.CREDIT_CARD);
		paymentDetails.setDate(new Date(System.currentTimeMillis()));
		paymentDetails.setTime("12:00:00");
		
		String paymentId = new PaymentServiceImpl().savePaymentDetailsAndGenerateId(paymentDetails);
		String orderId = FoodUtil.generateUniqueId();
		
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setOrderId(orderId);
		orderDetails.setPaymentId(paymentId);
		orderDetails.setTotalDiscount(0.00);
		orderDetails.setOrderStatus(OrderStatus.SUCCESS);
		orderDetails.setTotalAmount(amount);
		orderDetails.setUserId(userId);

		new OrderServiceImpl().placeOrder(orderDetails);
		new OrderItemsServiceImpl().createOrder(cartItems,orderId);

		
		new CartServiceImpl().removeAlItemFromCart(userId);
		
		pageName = "orders.jsp";
		//display the order details
		
//		res.sendRedirect(pageName+"?errorMessage=Order Placed successfully with transaction Id: "+orderId);
		res.sendRedirect(pageName+"?orderid="+orderId+"&transactionid="+paymentId);

	}

	private boolean validateCardDetails(String cvvNumber) {
		// => Only allow valid card-> 4242424242424242 , 123, 01/12/25
		if(cvvNumber.equals("123")) {
			return true;
		}
		return false;
	}
}

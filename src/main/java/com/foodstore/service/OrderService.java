package com.foodstore.service;

import java.util.List;

import com.foodstore.enums.OrderStatus;
import com.foodstore.model.OrderDetails;

public interface OrderService {
	
	public String placeOrder(OrderDetails orderDetails);

	public List<OrderDetails> getOrdersByUserId(String userId);

	public String updateOrderStatus(String orderId, OrderStatus status);
	
	public String paymentSuccess(String userName, double paidAmount);
	public int countSoldItem(String prodId);
	
//	public List<OrderDetails> getAllOrderDetailsByUserId(String userEmailId);
//	
//	public List<OrderDetails> getAllOrderDetails();
	
//	public boolean addOrder(OrderBean order);
//	public boolean addTransaction(TransactionBean transaction);
//	public List<OrderBean> getAllOrders();
//	public String shipNow(String orderId, String prodId);
}



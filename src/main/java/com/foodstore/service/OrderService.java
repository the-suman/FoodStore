package com.foodstore.service;

import java.util.List;

import com.foodstore.enums.OrderStatus;
import com.foodstore.model.OrderDetails;

public interface OrderService {

	public String createOrder(OrderDetails orderDetails);

	public List<OrderDetails> getOrdersByUserId(String userId);

	public String updateOrderStatus(String orderId, OrderStatus status);
}

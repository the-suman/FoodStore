package com.foodstore.service;

import java.util.List;

import com.foodstore.model.CartItem;

public interface OrderItemsService {
	
	public String createOrder(List<CartItem> cartItems, String orderId); //returns unique orderId

}

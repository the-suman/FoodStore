package com.foodstore.service.impl;

import java.util.List;

import com.foodstore.model.CartItem;
import com.foodstore.service.OrderItemsService;

public class OrderItemsServiceImpl implements OrderItemsService {

	@Override
	public String createOrder(List<CartItem> cartItems) {
		
		//generate unique orderId
		String orderId = "klsjdfds";
		
		for(CartItem cartItem : cartItems) {
			//orderid, itemid, item.qty, item.price, 
			
		}
		
		
		return orderId;
	}

}

package com.foodstore.service;

import java.util.List;

import com.foodstore.model.CartItem;

public interface CartService {

	public String addItemToCart(CartItem cartItem);

	public String removeItemFromCart(CartItem cartItem);

	public String updateCartItem(CartItem cartItem);

	public List<CartItem> getCartItemsByUserId(String userId);
}

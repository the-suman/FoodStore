package com.foodstore.service;

import java.util.List;

import com.foodstore.exception.FoodException;
import com.foodstore.model.CartItem;

public interface CartService {

	public String addItemToCart(CartItem cartItem) throws FoodException;

	public String removeItemFromCart(CartItem cartItem);

	public String updateCartItemQuantity(CartItem cartItem);

	public List<CartItem> getCartItemsByUserId(String userId) throws FoodException;

	public int getCartItemQuantity(String userId, String itemId);
}

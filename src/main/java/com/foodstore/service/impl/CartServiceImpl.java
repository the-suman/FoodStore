package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.CartItem;
import com.foodstore.service.CartService;
import com.foodstore.util.DBUtil;

public class CartServiceImpl implements CartService {

	@Override
	public String addItemToCart(CartItem cartItem) throws FoodException {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "INSERT INTO CART_ITEMS VALUES (?,?,?)";

		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, cartItem.getUserId());
			ps.setString(2, cartItem.getItemId());
			ps.setInt(3, cartItem.getQty());
			int k = ps.executeUpdate();
			if(k > 0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;

	}

	@Override
	public String removeItemFromCart(CartItem cartItem) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "DELETE FROM CART_ITEMS WHERE USERID=? AND ITEMID=?";

		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, cartItem.getUserId());
			ps.setString(2, cartItem.getItemId());

			int response = ps.executeUpdate();
			if (response > 0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		}

		catch (SQLException | FoodException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public String updateCartItemQuantity(CartItem cartItem) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "UPDATE CART_ITEMS SET QTY=? WHERE USERID=? AND ITEMID=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, cartItem.getQty());
			ps.setString(2, cartItem.getUserId());
			ps.setString(3, cartItem.getItemId());
			int response = ps.executeUpdate();
			if (response > 0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public List<CartItem> getCartItemsByUserId(String userId) throws FoodException {
		List<CartItem> cartItems = null;
		String query = "SELECT * FROM CART_ITEMS WHERE USERID=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			cartItems = new ArrayList<CartItem>();
			while (rs.next()) {
				CartItem cartItem = new CartItem();
				cartItem.setUserId(rs.getString("userId"));
				cartItem.setItemId(rs.getString("itemId"));
				cartItem.setQty(rs.getInt("qty"));

				cartItems.add(cartItem);
			}

			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return cartItems;
	}

	@Override
	public int getCartItemQuantity(String userId, String itemId) {
		int count = 0;
		String query = "SELECT * FROM CART_ITEMS WHERE USERID=? AND ITEMID=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, userId);
			ps.setString(2, itemId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt("qty");
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return count;
	}

}

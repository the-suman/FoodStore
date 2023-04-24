package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.WishList;
import com.foodstore.service.WishListService;
import com.foodstore.util.DBUtil;

public class WishListServiceImpl implements WishListService {

	@Override
	public String addItemToWishList(WishList cartItem) throws FoodException {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "INSERT INTO WISHLIST VALUES (?,?)";

		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, cartItem.getUserId());
			ps.setString(2, cartItem.getItemId());

		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;

	}

	@Override
	public String removeItemFromWishList(WishList cartItem) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "DELETE FROM WISHLIST WHERE USERID=? AND ITEMID=?";

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
	public List<WishList> getUsersWishList(String userId) throws FoodException {
		List<WishList> cartItems = null;
		String query = "SELECT * FROM WISHLIST WHERE USERID=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			cartItems = new ArrayList<WishList>();
			while (rs.next()) {
				WishList cartItem = new WishList();
				cartItem.setUserId(rs.getString("userId"));
				cartItem.setItemId(rs.getString("itemId"));

				cartItems.add(cartItem);
			}

			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return cartItems;
	}

}

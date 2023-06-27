package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.foodstore.exception.FoodException;
import com.foodstore.model.CartItem;
import com.foodstore.service.OrderItemsService;
import com.foodstore.util.DBUtil;

public class OrderItemsServiceImpl implements OrderItemsService {

	@Override
	public String createOrder(List<CartItem> cartItems, String orderId) {
		
		//generate unique orderId
		
		String query= "INSERT INTO Order_Items values(?,?,?,?,?)";
		String queryToGetPrice = "select item.price from Item, Cart_Items where Item.itemId= Cart_Items.itemId and Cart_Items.itemId=?";
		
		Connection conn = DBUtil.getConnection();
		
		try {
			PreparedStatement ps =conn.prepareStatement(query);
			PreparedStatement ps2 =conn.prepareStatement(queryToGetPrice);
			
			for(CartItem cartItem : cartItems) {
				ps2.setString(1, cartItem.getItemId());
				ResultSet rs= ps2.executeQuery();
				if(rs.next()) {
					ps.setDouble(4, rs.getDouble(1));
				}
				ps.setString(1, orderId);
				ps.setString(2, cartItem.getItemId());
				ps.setInt(3, cartItem.getQty());
				ps.setDouble(5, 0);
				ps.executeUpdate();	
			}
			ps.close();
			ps2.close();
		} catch(SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		
		return orderId;
	}

}

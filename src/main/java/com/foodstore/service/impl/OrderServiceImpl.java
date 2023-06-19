package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.OrderStatus;
import com.foodstore.enums.ResponseCode;
import com.foodstore.model.OrderDetails;
import com.foodstore.service.OrderService;
import com.foodstore.util.DBUtil;
import com.foodstore.util.FoodUtil;

public class OrderServiceImpl implements OrderService {

	@Override
	public String placeOrder(OrderDetails orderDetails) {
		String responseCode = ResponseCode.FAILURE.toString();
		Connection conn= DBUtil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("insert into OrderDetails values (?,?,?,?,?,?)");
			ps.setString(1, FoodUtil.generateUniqueId());
			ps.setString(2, orderDetails.getUserId());
			ps.setString(3, FoodUtil.generateUniqueId());
			ps.setDouble(4, orderDetails.getTotalDiscount());
			ps.setDouble(5, orderDetails.getTotalAmount());
			ps.setString(6, orderDetails.getOrderStatus().toString());
			
			int k= ps.executeUpdate();
			if(k>0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
		}
		catch(SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public List<OrderDetails> getOrdersByUserId(String userId) {
		List<OrderDetails> orderList= new ArrayList<OrderDetails>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("SELECT * FROM ");
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String updateOrderStatus(String orderId, OrderStatus status) {
		
		return null;
	}

	
  @Override 
  public String paymentSuccess(String userName, double paidAmount) {
//  String status = "Order Placement Failed!"; List<OrderDetails>orderDetails =
//  new ArrayList<OrderDetails>(); orderDetails = new OrderServiceImpl(). 
  return null; 
  }

@Override
public int countSoldItem(String prodId) {
	// TODO Auto-generated method stub
	return 0;
}
	 

	

}




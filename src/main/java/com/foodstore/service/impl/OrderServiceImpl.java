package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.OrderStatus;
import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.OrderDetails;
import com.foodstore.service.OrderService;
import com.foodstore.util.DBUtil;

public class OrderServiceImpl implements OrderService {

	@Override
	public String placeOrder(OrderDetails orderDetails) {
		String responseCode = ResponseCode.FAILURE.toString();
		Connection conn = DBUtil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("insert into OrderDetails values (?,?,?,?,?,?)");
			ps.setString(1, orderDetails.getOrderId());
			ps.setString(2, orderDetails.getUserId());
			ps.setString(3, orderDetails.getPaymentId());
			ps.setDouble(4, orderDetails.getTotalDiscount());
			ps.setDouble(5, orderDetails.getTotalAmount());
			ps.setString(6, orderDetails.getOrderStatus().toString());

			int k = ps.executeUpdate();
			if (k > 0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public List<OrderDetails> getOrdersByUserId(String userId) {
		List<OrderDetails> orderList = null;

		try {
			Connection conn = DBUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM OrderDetails where userId =?");
			ps.setString(1, userId);

			ResultSet rs = ps.executeQuery();
			orderList = new ArrayList<OrderDetails>();
			while (rs.next()) {
				OrderDetails orderDetail = new OrderDetails();
				orderDetail.setOrderId(rs.getString("orderId"));
				orderDetail.setUserId(rs.getString("userId"));
				orderDetail.setPaymentId(rs.getString("paymentId"));
				orderDetail.setTotalDiscount(rs.getDouble("totalDiscount"));
				orderDetail.setTotalAmount(rs.getDouble("totalAmount"));
				orderDetail.setOrderStatus(OrderStatus.valueOf(rs.getString("orderStatus")));
				orderList.add(orderDetail);
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return orderList;
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

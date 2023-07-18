package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.FoodType;
import com.foodstore.enums.OrderStatus;
import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.OrderDetails;
import com.foodstore.model.OrderHistory;
import com.foodstore.model.OrderItemHistory;
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

	

	@Override
	public List<OrderDetails> getAllOrderDetails() {
		List<OrderDetails> orderList = null;

		try {
			Connection conn = DBUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM OrderDetails");
			
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
	public List<OrderHistory> getAllOrderDetailsByUserId(String userEmailId) {
		List<OrderHistory> orderList = null;

		try {
			Connection conn = DBUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select  paymentdetails.paymentid as paymentid, orderid, totalAmount, orderStatus, date, time from OrderDetails, paymentdetails where OrderDetails.paymentId= paymentdetails.paymentId and OrderDetails.userId=?");
			ps.setString(1, userEmailId);
			ResultSet rs = ps.executeQuery();
			orderList = new ArrayList<OrderHistory>();
			while (rs.next()) {
				OrderHistory orderDetail = new OrderHistory();
				orderDetail.setOrderId(rs.getString("orderId"));
				orderDetail.setPaymentId(rs.getString("paymentId"));
				orderDetail.setTotalAmount(rs.getDouble("totalAmount"));
				orderDetail.setTime(rs.getString("TIME"));
				orderDetail.setDate(rs.getDate("DATE"));
				orderDetail.setOrderStatus(OrderStatus.valueOf(rs.getString("orderStatus")));
				PreparedStatement ps2 = conn.prepareStatement("select  order_items.itemid as itemid, Order_items.qty as qty,  order_items.unitprice as unitprice, name, description, vegeterian, image from order_items, item where order_items.itemid=item.itemid and order_items.orderid=?");
				ps2.setString(1, orderDetail.getOrderId());
				ResultSet rs2= ps2.executeQuery();
				List<OrderItemHistory> items= new ArrayList<OrderItemHistory>();
				while(rs2.next()) {
					OrderItemHistory item= new OrderItemHistory();
					item.setItemId(rs2.getString("itemId"));
					item.setName(rs2.getString("name"));
					item.setQty(rs2.getInt("qty"));
//					String types = rs.getString("type");
//					item.setType(FoodType.valueOf(types));
					item.setUnitPrice(rs2.getDouble("unitPrice"));
					item.setVegeterian(rs2.getInt("vegeterian"));
					item.setDescription(rs2.getString("description"));
					item.setImage(rs2.getBytes("image"));
					items.add(item);
				}
				orderDetail.setItems(items);
				orderList.add(orderDetail);
				
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return orderList;
	}

}

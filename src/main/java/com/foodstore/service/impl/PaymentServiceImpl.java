package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.foodstore.enums.PaymentType;
import com.foodstore.exception.FoodException;
import com.foodstore.model.PaymentDetails;
import com.foodstore.service.PaymentService;
import com.foodstore.util.DBUtil;
import com.foodstore.util.FoodUtil;

public class PaymentServiceImpl implements PaymentService{

	@Override
	public String savePaymentDetailsAndGenerateId(PaymentDetails paymentDetails) {
		String paymentId="";
		String query= "INSERT INTO PAYMENTDETAILS values(?,?,?,?,?, CURDATE(),CURRENT_TIMESTAMP())";
		paymentId= FoodUtil.generateUniqueId();
		
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, paymentId);
			ps.setString(2, paymentDetails.getType().toString());
			ps.setString(3, paymentDetails.getUPI());
			ps.setString(4, paymentDetails.getCardNumber());
			ps.setDouble(5, paymentDetails.getAmount());
			ps.executeUpdate();
		}catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return paymentId;
	}
	
	@Override
	public PaymentDetails getPaymentByUserId(String userId) {
		PaymentDetails paymentDetails = null;
		String query = "select * from paymentdetails where userid=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				paymentDetails = new PaymentDetails();
				paymentDetails.setPaymentId(rs.getString("paymentId"));
				paymentDetails.setType(PaymentType.valueOf(rs.getString("type")));
				paymentDetails.setUPI(rs.getString("UPI"));
				paymentDetails.setCardNumber(rs.getString("cardNumber"));
				paymentDetails.setAmount(rs.getDouble("amount"));
				paymentDetails.setDate(rs.getDate("DATE"));
				paymentDetails.setTime(rs.getString("TIME"));
				
			}
			ps.close();
		}catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return paymentDetails;
	}

}





package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.User;
import com.foodstore.service.UserService;
import com.foodstore.util.DBUtil;

public class UserServiceImpl implements UserService {

	@Override
	public String registerUser(User user) throws FoodException {
		// Take the variable responseMessage to return as response
		String responseMessage = ResponseCode.FAILURE.toString();

		// Get Database Connection
		Connection connection = DBUtil.getConnection();

		// Write the query to insert the user into the user database
		String query = "insert into user values(?,?,?,?,?,?,?)";

		// Create the prepared statement object
		try {
			PreparedStatement ps = connection.prepareStatement(query);

			// Update the ? values in the query
			ps.setString(1, user.getUserId());
			ps.setString(2, user.getAddressId());
			ps.setString(3, user.getfName());
			ps.setString(4, user.getlName());
			ps.setLong(5, user.getMob());
			ps.setString(6, user.getEmail());
			ps.setString(7, user.getPassword());

			// Execute the query or update the query

			int result = ps.executeUpdate();
			if (result > 0) {
				responseMessage = "SUCCESS";
			}

		} catch (SQLException e) {

			// Update the response Message with error message if exists
			responseMessage += " : " + e.getMessage();
		}

		// Return the response Message
		return responseMessage;
	}

	@Override
	public User loginUser(String userId, String password) throws FoodException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserById(String userId) {
		// TODO Auto-generated method stub

		return null;
	}

}

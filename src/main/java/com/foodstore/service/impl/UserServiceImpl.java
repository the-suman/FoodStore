package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.foodstore.enums.ResponseCode;
import com.foodstore.enums.Role;
import com.foodstore.exception.FoodException;
import com.foodstore.model.User;
import com.foodstore.service.UserService;
import com.foodstore.util.DBUtil;

public class UserServiceImpl implements UserService {

	@Override
	public String registerUser(User user, Role role) throws FoodException {
		// Take the variable responseMessage to return as response
		String responseMessage = ResponseCode.FAILURE.toString();

		// Get Database Connection
		Connection connection = DBUtil.getConnection();

		// Write the query to insert the user into the user database
		String query = "INSERT INTO USER VALUES(?,?,?,?,?,?,?)";

		// Create the prepared statement object
		try {
			connection.setAutoCommit(false);
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
				String query2 = "INSERT INTO USER_ROLES VALUES(?,?)";
				PreparedStatement ps2 = connection.prepareStatement(query2);
				ps2.setString(1, user.getUserId());
				ps2.setString(2, role.toString().toUpperCase());
				int result2 = ps2.executeUpdate();
				if (result2 > 0) {
					responseMessage = "SUCCESS";
					connection.commit();
				} else {
					connection.rollback();
				}
			} else {
				connection.rollback();
			}
		} catch (SQLException e) {

			// Update the response Message with error message if exists
			responseMessage += " : " + e.getMessage();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		// Return the response Message
		return responseMessage;
	}

	@Override
	public User loginUser(String userId, String password, Role role) throws FoodException {
		User user = null;
		String query = "select * from user inner join user_roles on user.userId = user_roles.userId where user.userId = ?  AND PASSWORD=? and role=?";

		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, userId);
			ps.setString(2, password);
			ps.setString(3, role.toString().toUpperCase());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setfName(rs.getString("fname"));
				user.setlName(rs.getString("lname"));
				user.setAddressId(rs.getString("addressId"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setMob(rs.getLong("mob"));
				user.setUserId(rs.getString("userId"));

			} else {
				throw new FoodException(ResponseCode.UNAUTHORIZED);
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return user;
	}

	@Override
	public User getUserById(String userId) throws FoodException {
		User user = null;
		String query = "SELECT * FROM USER WHERE USERID = ?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, userId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setfName(rs.getString("fname"));
				user.setlName(rs.getString("lname"));
				user.setAddressId(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setMob(rs.getLong("mob"));
				user.setUserId(rs.getString("userId"));
			} else {
				throw new FoodException(ResponseCode.UNAUTHORIZED);
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return user;

	}
}
package com.foodstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;

public class DBUtil {
	private static Connection con;

	static {

		ResourceBundle rb = ResourceBundle.getBundle("application");

		try {
			Class.forName(rb.getString("driverName"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			System.out.println(rb.getString("connectionString"));
			System.out.println(rb.getString("username"));
			System.out.println(rb.getString("password"));
			con = DriverManager.getConnection(rb.getString("connectionString"), rb.getString("username"),
					rb.getString("password"));
			System.out.println("Connection Success!!");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws FoodException {
		if (con == null)
			throw new FoodException(ResponseCode.DATABASE_CONNECTION_FAILURE);
		try {
			con.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	
}

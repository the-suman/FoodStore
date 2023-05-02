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
			Class.forName(rb.getString("db.driverName"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			System.out.println(rb.getString("db.connectionString"));
			System.out.println(rb.getString("db.username"));
			System.out.println(rb.getString("db.password"));
			con = DriverManager.getConnection(rb.getString("db.connectionString"), rb.getString("db.username"),
					rb.getString("db.password"));
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

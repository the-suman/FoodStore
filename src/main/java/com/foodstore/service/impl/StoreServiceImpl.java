package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.Store;
import com.foodstore.service.StoreService;
import com.foodstore.util.DBUtil;
import com.foodstore.util.FoodUtil;

public class StoreServiceImpl implements StoreService {

	@Override
	public Store getStoreById(String storeId) throws FoodException {
		Store store = null;
		String query = "SELECT * FROM STORE WHERE STOREID = ?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, storeId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				store = new Store();
				store.setStoreId(rs.getString("storeId"));
				store.setAddressId(rs.getString("addressId"));
				store.setAdminId(rs.getString("adminId"));
				store.setName(rs.getString("name"));
				store.setDescription(rs.getString("description"));
				store.setImage(rs.getAsciiStream("image"));
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return store;
	}

	@Override
	public List<Store> getAllStores() throws FoodException {
		List<Store> stores = null;
		String query = "SELECT * FROM STORE";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			stores = new ArrayList<Store>();
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getString("storeId"));
				store.setAddressId(rs.getString("addressId"));
				store.setAdminId(rs.getString("adminId"));
				store.setName(rs.getString("name"));
				store.setDescription(rs.getString("description"));
				store.setImage(rs.getAsciiStream("image"));
				stores.add(store);
			}

			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return stores;
	}

	@Override
	public String addStore(Store store) throws FoodException {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "INSERT INTO STORE VALUES (?,?,?,?,?)";

		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, FoodUtil.generateUniqueId());
			ps.setString(2, store.getAddressId());
			ps.setString(3, store.getAdminId());
			ps.setString(4, store.getName());
			ps.setString(5, store.getDescription());
			ps.setBlob(6, store.getImage());
		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public String updateStore(Store store) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "UPDATE ITEM SET ADDRESSID=?, ADMINID=?, NAME=?, DESCRIPTION=? WHERE STOREID=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, store.getAddressId());
			ps.setString(2, store.getAdminId());
			ps.setString(3, store.getName());
			ps.setString(4, store.getDescription());
			ps.setString(5, store.getStoreId());
			// ps.setBlob(6, store.getImage());
			int response = ps.executeUpdate();
			if (response > 0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

}

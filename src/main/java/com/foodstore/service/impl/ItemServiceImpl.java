package com.foodstore.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodstore.enums.FoodType;
import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;
import com.foodstore.model.Item;
import com.foodstore.service.ItemService;
import com.foodstore.util.DBUtil;
import com.foodstore.util.FoodUtil;

public class ItemServiceImpl implements ItemService {

	@Override
	public List<Item> getAllItems() throws FoodException {
		List<Item> items = null;
		String query = "SELECT * FROM ITEM";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			items = new ArrayList<Item>();
			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getString("itemId"));
				item.setStoreId(rs.getString("storeId"));
				item.setName(rs.getString("name"));
				String types = rs.getString("type");
				item.setType(FoodType.valueOf(types));
				item.setDescription(rs.getString("description"));
				item.setPrice(rs.getDouble("price"));
				item.setQty(rs.getInt("qty"));
				item.setVegeterian(rs.getInt("vegeterian"));
				item.setImage(rs.getAsciiStream("image"));
				items.add(item);
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return items;
	}

	@Override
	public Item getItemById(String itemId) throws FoodException {
		Item item = null;
		String query = "SELECT * FROM ITEM WHERE ITEMID = ?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, itemId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				item = new Item();
				item.setItemId(rs.getString("itemId"));
				item.setStoreId(rs.getString("storeId"));
				item.setName(rs.getString("name"));
				item.setType(FoodType.valueOf(rs.getString("type")));
				item.setDescription(rs.getString("description"));
				item.setPrice(rs.getDouble("price"));
				item.setQty(rs.getInt("qty"));
				item.setVegeterian(rs.getInt("vegeterian"));
				item.setImage(rs.getAsciiStream("image"));
			}
			ps.close();
		} catch (SQLException | FoodException e) {
			System.out.println(e.getMessage());
			throw new FoodException(e.getMessage());
		}
		return item;
	}

	@Override
	public String addItem(Item item) throws FoodException {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "INSERT INTO ITEM VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, FoodUtil.generateUniqueId());
			ps.setString(2, item.getStoreId());
			ps.setString(3, item.getName());
			ps.setString(4, item.getType().toString());
			ps.setString(5, item.getDescription());
			ps.setDouble(6, item.getPrice());
			ps.setInt(7, item.getQty());
			ps.setInt(8, item.getVegeterian());
			ps.setBlob(9, item.getImage());

		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public String deleteItemById(String itemId) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "DELETE FROM ITEM WHERE ITEMID = ?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, itemId);

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

	@Override
	public String updateItem(Item item) throws FoodException {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "UPDATE ITEM SET STOREID=?, NAME=?, TYPE=?, DESCRIPTION=?, PRICE=?, QTY=?, VEGETERIAN=? WHERE ITEMID=?";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setString(1, item.getStoreId());
			ps.setString(2, item.getName());
			ps.setString(3, item.getType().toString());
			ps.setString(4, item.getDescription());
			ps.setDouble(5, item.getPrice());
			ps.setInt(6, item.getQty());
			ps.setInt(7, item.getVegeterian());
			// ps.setBlob(9, item.getImage());
			ps.setString(8, item.getItemId());

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

package com.foodstore.model;

import java.io.InputStream;
import java.io.Serializable;

public class Store implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String storeId;
	private String addressId;
	private String adminId;
	private String name;
	private String description;
	private InputStream image;

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}

}

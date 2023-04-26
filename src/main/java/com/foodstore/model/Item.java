package com.foodstore.model;

import java.io.InputStream;
import java.io.Serializable;

import com.foodstore.enums.FoodType;

public class Item implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String itemId;
	private String storeId;
	private String name;
	private FoodType type;
	private String description;
	private Double price;
	private Integer qty;
	private Integer vegeterian;
	private InputStream image;

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public FoodType getType() {
		return type;
	}

	public void setType(FoodType type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}

	public Integer getVegeterian() {
		return vegeterian;
	}

	public void setVegeterian(Integer vegeterian) {
		this.vegeterian = vegeterian;
	}
}

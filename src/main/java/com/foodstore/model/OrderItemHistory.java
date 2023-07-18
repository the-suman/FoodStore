package com.foodstore.model;

import java.io.Serializable;
import java.sql.Date;

import com.foodstore.enums.FoodType;
import com.foodstore.enums.OrderStatus;

public class OrderItemHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String itemId;
	private Integer qty;
	private String name;
	private Double unitPrice;
	private String description;
	private FoodType type;
	private Integer vegeterian;
	private byte[] image;
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public FoodType getType() {
		return type;
	}
	public void setType(FoodType foodType) {
		this.type = foodType;
	}
	public Integer getVegeterian() {
		return vegeterian;
	}
	public void setVegeterian(Integer vegeterian) {
		this.vegeterian = vegeterian;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] bs) {
		this.image = bs;
	}
	
}

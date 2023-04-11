package com.foodstore.service;

import java.util.List;

import com.foodstore.exception.FoodException;
import com.foodstore.model.Item;

public interface ItemService {
	
	//List of all items retrieval
	public  List<Item>  getAllItems() throws FoodException;
	
	//Get individual Item by Id
	public Item getItemById(String itemId) throws FoodException;
	
	//Add Item 
	public String addItem(Item item) throws FoodException;
	
	//delete Item
	public String deleteItemById(String itemId);
	
	//update Item
	public String updateItem(Item item) throws FoodException;
	
	
}

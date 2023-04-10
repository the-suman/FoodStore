package com.foodstore.service;

import java.util.List;

import com.foodstore.model.Item;

public interface ItemService {
	
	//List of all items retrieval
	public  List<Item>  getAllItems();
	
	//Get individual Item by Id
	public Item getItemById(String itemId);
	
	//Add Item 
	public String addItem(Item item);
	
	//delete Item
	public String deleteItemById(String itemId);
	
	//update Item
	public String updateItem(Item item);
	
	
}

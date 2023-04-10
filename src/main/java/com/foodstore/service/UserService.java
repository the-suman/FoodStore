package com.foodstore.service;

import com.foodstore.exception.FoodException;
import com.foodstore.model.User;

public interface UserService {

	//Register User
	public String registerUser(User user) throws FoodException;
	
	//Login User
	public User loginUser(String userId, String password) throws FoodException;
	
	//Add User
	public User getUserById(String userId);
	

}

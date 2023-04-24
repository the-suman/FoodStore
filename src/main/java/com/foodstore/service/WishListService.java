package com.foodstore.service;

import java.util.List;

import com.foodstore.exception.FoodException;
import com.foodstore.model.WishList;

public interface WishListService {

	public String addItemToWishList(WishList wishList) throws FoodException;

	public String removeItemFromWishList(WishList wishList);

	public List<WishList> getUsersWishList(String userId) throws FoodException;
}

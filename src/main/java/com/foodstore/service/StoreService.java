package com.foodstore.service;

import java.util.List;

import com.foodstore.exception.FoodException;
import com.foodstore.model.Store;

public interface StoreService {

	public Store getStoreById(String storeId) throws FoodException;

	public List<Store> getAllStores() throws FoodException;

	public String addStore(Store store) throws FoodException;

	public String updateStore(Store store);

}

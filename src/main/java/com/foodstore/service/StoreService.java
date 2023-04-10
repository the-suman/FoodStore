package com.foodstore.service;

import java.util.List;

import com.foodstore.model.Store;

public interface StoreService {

	public Store getStoreById(String storeId);

	public List<Store> getAllStores();

	public String addStore(Store store);

	public String updateStore(Store store);

}

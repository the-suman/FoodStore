package com.foodstore.service;

import com.foodstore.model.Address;

public interface AddressService {

	public Address getAddressById(String addressId);

	public String addAddress(Address address);

	public String removeAddressById(String addressId);

	public Address updateAddress(Address address);
}

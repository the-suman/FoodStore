package com.foodstore.model;

import java.io.Serializable;

public class OrderDetailedInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Item item;
	private PaymentDetails paymentDetails;
	private String orderId;

}

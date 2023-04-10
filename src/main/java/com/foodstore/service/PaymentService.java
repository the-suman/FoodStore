package com.foodstore.service;

import com.foodstore.model.PaymentDetails;

public interface PaymentService {

	public String addPayment(PaymentDetails paymentDetails);

	public PaymentDetails getPaymentByUserId();
}

package com.foodstore.service;

import com.foodstore.model.PaymentDetails;

public interface PaymentService {

	public String savePaymentDetailsAndGenerateId(PaymentDetails paymentDetails);

	public PaymentDetails getPaymentByUserId();
}

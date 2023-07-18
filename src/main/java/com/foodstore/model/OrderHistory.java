package com.foodstore.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import com.foodstore.enums.OrderStatus;

public class OrderHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String orderId;
	private String paymentId;
	private Double totalAmount;
	private Date date;
	private String time;
	private OrderStatus orderStatus;
	private List<OrderItemHistory> items;
	
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}


	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	 
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public List<OrderItemHistory> getItems() {
		return items;
	}

	public void setItems(List<OrderItemHistory> items) {
		this.items = items;
	}

}

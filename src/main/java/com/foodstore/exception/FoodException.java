package com.foodstore.exception;

import com.foodstore.enums.ResponseCode;

public class FoodException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String errorCode;
	private String errorMessage;
	private int statusCode;

	public FoodException(ResponseCode responseCode) {
		super(responseCode.getMessage());
		this.statusCode = responseCode.getCode();
		this.errorMessage = responseCode.getMessage();
		this.setErrorCode(responseCode.name());
	}

	public FoodException(String errorMessage) {
		super(errorMessage);
		this.errorCode = "BAD_REQUEST";
		this.setStatusCode(400);
		this.errorMessage = errorMessage;
	}

	public FoodException(int statusCode, String errorCode, String errorMessage) {
		super(errorMessage);
		this.statusCode = statusCode;
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

}

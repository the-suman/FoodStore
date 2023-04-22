package com.foodstore.servlet;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.ResponseCode;
import com.foodstore.exception.FoodException;

public class ErrorHandlerServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");

		// Fetch the exceptions
		Throwable throwable = (Throwable) req.getAttribute("javax.servlet.error.exception");
		Integer statusCode = (Integer) req.getAttribute("javax.servlet.error.status_code");
		String servletName = (String) req.getAttribute("javax.servlet.error.servlet_name");
		String requestUri = (String) req.getAttribute("javax.servlet.error.request_uri");
		String errorMessage = ResponseCode.INTERNAL_SERVER_ERROR.getMessage();
		String errorCode = ResponseCode.INTERNAL_SERVER_ERROR.name();

		if (statusCode == null)
			statusCode = 0;
		Optional<ResponseCode> errorCodes = ResponseCode.getMessageByStatusCode(statusCode);
		if (errorCodes.isPresent()) {
			errorMessage = errorCodes.get().getMessage();
			errorCode = errorCodes.get().name();
		}

		if (throwable != null) {
			FoodException foodException = null;
			if (throwable instanceof FoodException) {
				foodException = (FoodException) throwable;
			}
			if (throwable.getCause() instanceof FoodException) {
				foodException = (FoodException) throwable.getCause();
			}
			if (foodException != null) {
				errorMessage = foodException.getMessage();
				statusCode = foodException.getStatusCode();
				errorCode = foodException.getErrorCode();
				foodException.printStackTrace();
			} else {
				errorMessage = throwable.getMessage();
				errorCode = throwable.getLocalizedMessage();
			}

		}

		System.out.println("======ERROR TRIGGERED========");
		System.out.println("Servlet Name: " + servletName);
		System.out.println("Request URI: " + requestUri);
		System.out.println("Status Code: " + statusCode);
		System.out.println("Error Code: " + errorCode);
		System.out.println("Error Message: " + errorMessage);
		System.out.println("=============================");

		if (statusCode == 401) {
			req.getRequestDispatcher("login.jsp?errorMessage=" + errorMessage).forward(req, res);
			return;

		} else {
			req.getRequestDispatcher("error.jsp?errorMessage=" + errorMessage).forward(req, res);
			return;
		}

	}

}

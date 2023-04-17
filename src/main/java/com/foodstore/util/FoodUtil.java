package com.foodstore.util;

import java.util.Arrays;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.ResponseCode;
import com.foodstore.enums.Role;
import com.foodstore.exception.FoodException;
import com.foodstore.model.User;
import com.foodstore.service.UserService;
import com.foodstore.service.impl.UserServiceImpl;

public class FoodUtil {
	public static String generateUniqueId() {

		return UUID.randomUUID().toString();

	}

	public static Optional<String> readCookie(HttpServletRequest request, String key) {
		if (request == null || request.getCookies() == null) {
			return Optional.empty();
		}
		Cookie[] cookies = request.getCookies();
		return Arrays.stream(cookies).filter(c -> key.equals(c.getName())).map(Cookie::getValue).findAny();
	}

	public static String login(HttpServletRequest request, HttpServletResponse response, Role userRole, String username,
			String password) {
		UserService userService = new UserServiceImpl();
		String responseCode = ResponseCode.UNAUTHORIZED.toString();
		try {
			User user = userService.loginUser(username, password, userRole);

			// Add the user details to the ServletContext with key as role name
			request.getSession().setAttribute(userRole.toString(), user);

			// Store the user firstName and mailId in the http session
			request.getSession().setAttribute("uname", user.getfName());
			request.getSession().setAttribute("userid", user.getUserId());

			// Add the sessionId to the cookie with key as sessionId
			Cookie cookie = new Cookie("sessionIdFor" + userRole.toString(), UUID.randomUUID().toString());

			// set the max age for the cookie
			cookie.setMaxAge(600); // Expires after 10 MIN

			// add the cookie to the response
			response.addCookie(cookie);

			// set the responseCode to success
			responseCode = ResponseCode.SUCCESS.toString();
			System.out.println("Login Success");

		} catch (FoodException e) {
			responseCode += " : " + e.getMessage();
		}

		return responseCode;
	}

	public static boolean isLoggedIn(HttpServletRequest request, Role userRole) {
		Optional<String> sessionId = readCookie(request, "sessionIdFor" + userRole.toString());
		return sessionId != null && sessionId.isPresent();
	}

	public static boolean logout(HttpServletResponse response) {

		// Set the max age to 0 for the admin and customer cookies
		Cookie cookie = new Cookie("sessionIdFor" + Role.ADMIN.toString(), UUID.randomUUID().toString());
		cookie.setMaxAge(0);

		Cookie cookie2 = new Cookie("sessionIdFor" + Role.CUSTOMER.toString(), UUID.randomUUID().toString());
		cookie2.setMaxAge(0);

		response.addCookie(cookie);
		response.addCookie(cookie2);

		return true;
	}

	public static void validateUserAuthorization(HttpServletRequest request, Role userRole) throws FoodException {
		if (!isLoggedIn(request, userRole)) {
			throw new FoodException(ResponseCode.SESSION_EXPIRED);
		}
	}

	public static String getCurrentUserName(HttpServletRequest req) {
		return (String) req.getSession().getAttribute("uname");
	}

	public static String getCurrentUserId(HttpServletRequest req) {
		return (String) req.getSession().getAttribute("userid");
	}

	public static User getCurrentCustomer(HttpServletRequest req) {
		return (User) req.getSession().getAttribute(Role.CUSTOMER.toString());
	}
}

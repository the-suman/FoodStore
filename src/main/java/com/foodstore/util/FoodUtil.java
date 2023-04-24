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
			request.getSession().setAttribute("USER", user);
			request.getSession().setAttribute("ROLE", userRole.toString());

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

		} catch (FoodException e) {
			responseCode = e.getMessage();
		}

		return responseCode;
	}

	public static boolean isLoggedIn(HttpServletRequest request, Role userRole) {
		Optional<String> sessionId = readCookie(request, "sessionIdFor" + userRole.toString());
		return sessionId != null && sessionId.isPresent();
	}

	public static boolean logout(HttpServletRequest request, HttpServletResponse response) {

		// Set the max age to 0 for the admiN and customer cookies
		Cookie cookie = new Cookie("sessionIdFor" + Role.ADMIN.toString(), UUID.randomUUID().toString());
		cookie.setMaxAge(0);

		Cookie cookie2 = new Cookie("sessionIdFor" + Role.CUSTOMER.toString(), UUID.randomUUID().toString());
		cookie2.setMaxAge(0);

		response.addCookie(cookie);
		response.addCookie(cookie2);

		// delete everything from the session
		request.getSession().invalidate();
		return true;
	}

	public static void validateUserPageAccess(HttpServletRequest request, Role userRole) throws FoodException {
		if (!isLoggedIn(request, userRole)) {
			request.getSession().removeAttribute("currentpage");
			throw new FoodException(ResponseCode.SESSION_EXPIRED);
		}
	}

	public static void validateCommonPageAccess(HttpServletRequest request) throws FoodException {
		if (!isLoggedIn(request, getCurrentUserRole(request))) {
			throw new FoodException(ResponseCode.SESSION_EXPIRED);
		}
	}

	public static String getCurrentUserName(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("uname");
	}

	public static String getCurrentUserId(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("userid");
	}

	public static Role getCurrentUserRole(HttpServletRequest request) {
		String role = (String) request.getSession().getAttribute("ROLE");
		if (role == null || role.isBlank()) {
			role = Role.CUSTOMER.toString();
		}
		return Role.valueOf(role);
	}

	public static User getCurrentUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("USER");
	}
}

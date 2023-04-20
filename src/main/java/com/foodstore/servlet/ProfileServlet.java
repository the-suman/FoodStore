package com.foodstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.ResponseCode;
import com.foodstore.enums.Role;
import com.foodstore.util.FoodUtil;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ProfileServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String userName = req.getParameter("username");
		String passWord = req.getParameter("password");
		String userType = req.getParameter("usertype");
		String rememberMe = req.getParameter("rememberme");
		System.out.println(rememberMe);
		res.setContentType("text/html");
		String statusMessage = FoodUtil.login(req, res, Role.valueOf(userType), userName, passWord);

		if (statusMessage.equalsIgnoreCase(ResponseCode.SUCCESS.toString())) {
			res.sendRedirect("index.jsp");
		} else {
			res.sendRedirect("login.jsp?errorMessage=" + statusMessage);
		}
	}
}

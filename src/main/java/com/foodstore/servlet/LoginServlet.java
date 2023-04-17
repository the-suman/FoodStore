package com.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.ResponseCode;
import com.foodstore.enums.Role;
import com.foodstore.util.FoodUtil;

import javax.servlet.annotation.WebServlet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String userName = req.getParameter("username");
		String passWord = req.getParameter("password");
		String userType = req.getParameter("usertype");
		String rememberMe = req.getParameter("rememberme");
		System.out.println(rememberMe);
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String statusMessage = FoodUtil.login(req, res, Role.valueOf(userType), userName, passWord);

		
		if (statusMessage.equalsIgnoreCase(ResponseCode.SUCCESS.toString())) {
			System.out.println("Loggedin!!");
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.include(req, res);
			pw.println("Login Successed");
		} else {
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.include(req, res);
			pw.println(statusMessage);
		}
	}
}

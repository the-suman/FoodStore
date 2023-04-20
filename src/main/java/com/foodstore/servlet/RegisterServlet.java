package com.foodstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.ResponseCode;
import com.foodstore.enums.Role;
import com.foodstore.model.User;
import com.foodstore.service.UserService;
import com.foodstore.service.impl.UserServiceImpl;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		UserService userService = new UserServiceImpl();
		
		//String userName= req.getParameter("email");
		//String addressId = req.getParameter("addressid");
		String fName = req.getParameter("fname");
		String lName = req.getParameter("lname");
		String mobNo = req.getParameter("mob");
		String email = req.getParameter("email");
		String userType = req.getParameter("usertype");
		String passWord = req.getParameter("password");
		String passwordConfirmation = req.getParameter("password_confirmation");
		
		User user = new User();
		
		
		user.setfName(fName);
		user.setlName(lName);
		user.setUserId(email);
		user.setEmail(email);
		user.setMob(Long.parseLong(mobNo));
		user.setPassword(passWord);
		
		if(! passWord.equals(passwordConfirmation)) {
			res.sendRedirect("register.jsp?errorMessage=Password Not Matched!");
			return;
		}
		
		String responseCode = userService.registerUser(user, Role.valueOf(userType));
		System.out.println("success: "+responseCode);
		if(ResponseCode.SUCCESS.name().equalsIgnoreCase(responseCode)) {
			res.sendRedirect("login.jsp?successMessage=User Registered Successfully!");
		}
		else {
			res.sendRedirect("register.jsp?errorMessage=" + responseCode);
			
		}
	}
}

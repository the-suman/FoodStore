package com.foodstore.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.foodstore.model.User;
import com.foodstore.service.impl.UserServiceImpl;

@WebServlet("/uploadProfilePhoto")
@MultipartConfig(maxFileSize = 16177215)
public class UploadProfilePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = (String) request.getParameter("userid");
		Part part = request.getPart("image");
		InputStream inputStream = part.getInputStream();

		String message = new UserServiceImpl().updateProfilePhoto(userId, inputStream.readAllBytes());
		if ("SUCCESS".equalsIgnoreCase(message)) {
			User user = (User) request.getSession().getAttribute("USER");
			user.setImage(part.getInputStream().readAllBytes());
			request.getSession().setAttribute("USER", user);
		}
		response.sendRedirect("profile.jsp?message=" + message);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

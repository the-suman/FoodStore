package com.foodstore.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.foodstore.enums.ResponseCode;
import com.foodstore.enums.Role;
import com.foodstore.service.impl.ItemServiceImpl;
import com.foodstore.util.FoodUtil;

@WebServlet("/AddItemServlet")
@MultipartConfig(maxFileSize = 16177215)
public class AddItemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AddItemServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//		String userName = req.getParameter("username");
//		String passWord = req.getParameter("password");
//		String userType = req.getParameter("usertype");
//		String statusMessage = FoodUtil.login(req, res, Role.valueOf(userType), userName, passWord);

//		String pagename = (String) req.getSession().getAttribute("currentpage");
//		if (pagename == null) {
//			pagename = "index.jsp";
//		}
//
//		if (statusMessage.equalsIgnoreCase(ResponseCode.SUCCESS.toString())) {
//			res.sendRedirect(pagename);
//		} else {
//			res.sendRedirect("login.jsp?errorMessage=" + statusMessage);
//		}
//		
		String status = "Product Registration Failed!";
		String itemName = req.getParameter("name");
		String itemType = req.getParameter("type");
		String description = req.getParameter("description");
		Double unitPrice = Double.parseDouble(req.getParameter("price"));
		Integer quantity = Integer.parseInt(req.getParameter("qty"));
		Integer vegeterian = Integer.parseInt(req.getParameter("vegeterian"));
		
		Part part = req.getPart("image");

		InputStream itemImage = part.getInputStream();
		byte[] image = itemImage.readAllBytes();
		ItemServiceImpl item = new ItemServiceImpl();
		status = item.addItem(itemName, itemType, description, unitPrice, quantity, vegeterian, image);
		
		RequestDispatcher rd = req.getRequestDispatcher("additem.jsp?message=" + status);
		rd.forward(req, res);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doPost(req, res);
	}
}

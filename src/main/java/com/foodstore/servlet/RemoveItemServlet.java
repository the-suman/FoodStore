package com.foodstore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.service.impl.ItemServiceImpl;

@WebServlet("/RemoveItemServlet")
public class RemoveItemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RemoveItemServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String userName = req.getParameter("username");
		String passWord = req.getParameter("password");
		String userType = req.getParameter("usertype");
		String itemId = req.getParameter("itemid");
		ItemServiceImpl item = new ItemServiceImpl();
		
		String status = item.deleteItemById(itemId);
		RequestDispatcher rd = req.getRequestDispatcher("removeitem.jsp?message=" + status);
		rd.forward(req, res);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doPost(req, res);
	}
}

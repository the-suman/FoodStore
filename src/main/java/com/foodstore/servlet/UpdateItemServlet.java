package com.foodstore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.enums.FoodType;
import com.foodstore.model.Item;
import com.foodstore.model.User;
import com.foodstore.service.impl.ItemServiceImpl;
import com.foodstore.util.FoodUtil;

@WebServlet("/updateitem")
public class UpdateItemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UpdateItemServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		User user = FoodUtil.getCurrentUser(req);
		String userId = user.getUserId();
		String password = user.getPassword();

		// Login Success
		String itemId = req.getParameter("itemid");
		String storeId= req.getParameter("storeid");
		String itemName = req.getParameter("name");
		String itemType = req.getParameter("type").toString();
		String description = req.getParameter("description");
		Double itemPrice = Double.parseDouble(req.getParameter("price"));
		Integer itemQty = Integer.parseInt(req.getParameter("qty"));
		Integer vegetarian = Integer.parseInt(req.getParameter("vegeterian"));
		
//		System.out.println(itemQty);
//		System.out.println(itemId);
		Item item = new Item();
		item.setItemId(itemId);
		item.setStoreId(storeId);
		item.setName(itemName);
		item.setType(FoodType.valueOf(itemType));
		item.setDescription(description);
		item.setPrice(itemPrice);
		item.setQty(itemQty);
		item.setVegeterian(vegetarian);
		
		ItemServiceImpl items = new ItemServiceImpl();
		String status = items.updateItem(item);
		RequestDispatcher rd = req.getRequestDispatcher("updateitem.jsp?id=" + itemId + "&message=" + status);
		rd.forward(req, res);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doPost(req, res);
	}
}

package com.foodstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodstore.model.CartItem;
import com.foodstore.service.CartService;
import com.foodstore.service.impl.CartServiceImpl;
import com.foodstore.util.FoodUtil;

@WebServlet("/cartupdate")
public class CartUpdateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CartUpdateServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String action = req.getParameter("action");
		String id = req.getParameter("id");
		String cartQty = req.getParameter("cartQty");
		if(cartQty == null) {
			cartQty = "0";
		}
		int currentQty = (Integer.parseInt(cartQty));
		CartService cartService = new CartServiceImpl();
		CartItem cartItem = new CartItem();
		cartItem.setItemId(id);
		cartItem.setQty(currentQty);
		cartItem.setUserId(FoodUtil.getCurrentUserId(req));
		String pageName = "items.jsp";
		if ("add".equalsIgnoreCase(action)) {
			System.out.println("Not addedd");
			cartService.addItemToCart(cartItem);
			
		} else if ("remove".equalsIgnoreCase(action)) {
			cartService.removeItemFromCart(cartItem);
		} else if ("minus".equalsIgnoreCase(action)) {
			cartItem.setQty(currentQty - 1);
			cartService.updateCartItemQuantity(cartItem);
		} else if ("plus".equalsIgnoreCase(action)) {
			cartItem.setQty(currentQty + 1);
			cartService.updateCartItemQuantity(cartItem);
		}

		res.sendRedirect(pageName);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doPost(req, res);
	}
}

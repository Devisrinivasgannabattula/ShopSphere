package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProductBean;
import com.dao.ViewProductDAO;

@WebServlet("/view1")
public class ViewProductServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	HttpSession	session=req.getSession(false);
	if(session==null)
	{
		throw new RuntimeException("Session Expired!");
	}
	else
	{
		ArrayList<ProductBean> al=new ViewProductDAO().reteriveProductInfo();
		session.setAttribute("productList", al);
		req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
	}
	}
}

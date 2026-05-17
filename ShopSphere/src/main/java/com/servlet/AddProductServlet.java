package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProductBean;
import com.dao.AddProductDAO;

@WebServlet("/addproduct")
public class AddProductServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		
	
		try 
		{
			HttpSession session=req.getSession(false);
			if(session==null)
			{
				throw new RuntimeException("User Session is Expired!!!");
			}
			else
			{
				ProductBean pbean=new ProductBean();
				pbean.setA_pcode(req.getParameter("pcode"));
				pbean.setA_pname(req.getParameter("pname"));
				pbean.setA_pcompany(req.getParameter("pcmpny"));
				pbean.setA_pprice(req.getParameter("pprice"));
				pbean.setA_pqty(req.getParameter("pqty"));
				
				int rowCount=new AddProductDAO().insertProduct(pbean);
				if(rowCount>0)
				{
					req.setAttribute("msg", "Product Data inserted successfully!...");
					req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
				}
			}
		}
		catch(Exception e)
		{
			req.setAttribute("msg", "Duplicate Product Id's are not allowed!!<br><br>");
			req.getRequestDispatcher("Error.jsp").forward(req, res);
		}
		
	}
}

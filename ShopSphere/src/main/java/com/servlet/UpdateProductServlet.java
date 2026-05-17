/*package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProductBean;
import com.dao.UpdateProductDAO;

@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub

		HttpSession session=req.getSession(false);
		if(session==null)
		{
			throw new RuntimeException("Session Expired");
		}
		else
		{
			String pcode=(String)req.getAttribute("p_code");
			ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
			ProductBean pb=null;
			Iterator<ProductBean> i=al.iterator();
			while(i.hasNext())
			{
				pb=i.next();
				if(pcode.equals(pb.getA_pcode()))
				{
					break;
				}
			}
				pb.setA_pprice(req.getParameter("p_price"));
				pb.setA_pqty(req.getParameter("p_qty"));
				int rowCount=new UpdateProductDAO().UpdateProduct(pb);
				if(rowCount==0)
				{
					throw new RuntimeException("Program disconnected!!");
				}
				else
				{
					req.setAttribute("msg", "Products Updated");
					req.getRequestDispatcher("UpdateProduct.jsp").forward(req, resp);
				}
			
		}
	}
}*/


package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProductBean;
import com.dao.UpdateProductDAO;

@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet
{
   @Override
   protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
	   HttpSession session=req.getSession(false);
		  if(session==null)
			  throw new RuntimeException("Session Expired!!!");
		  else
		  {
			  String pcode=req.getParameter("p_code");
			  ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
			  ProductBean pb=null;
			  Iterator<ProductBean> i=al.iterator();
			  while(i.hasNext())
			  {
				  pb=i.next();
				  if(pcode.equals(pb.getA_pcode()))
				  {
					  break;
				  }
			  }
			  pb.setA_pprice(req.getParameter("p_price"));
			  pb.setA_pqty(req.getParameter("p_qty"));
			  int rowCount=new UpdateProductDAO().UpdateProduct(pb);
			  if(rowCount==0)
				  throw new RuntimeException("Program Disconnected !!!");
			  else
			  {
				  req.setAttribute("msg","Products Updated !!!");
				  req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);  
			  }
		  }
   }
}
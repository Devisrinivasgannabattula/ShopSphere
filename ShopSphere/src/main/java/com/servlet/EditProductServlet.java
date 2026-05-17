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

@WebServlet("/edit")
public class EditProductServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		HttpSession session=req.getSession(false);
		if(session==null)
		{
			throw new RuntimeException("Session Expired");
		}
		else
		{
			String pcode=req.getParameter("pcode");	
			ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
			ProductBean pb=null;
			Iterator<ProductBean> i=al.iterator();
			while(i.hasNext())
			{	
				pb=i.next();
				if(pcode.equals(pb.getA_pcode()))
				{					
					System.out.println("pcode : "+pcode);
					System.out.println("pb.getA_pcode() : "+pb.getA_pcode());
					break;
				}
				
			}
			req.setAttribute("pbean", pb);
			req.setAttribute("p_code", pcode);
			req.getRequestDispatcher("EditProduct1.jsp").forward(req, res);
			
		}
	}
}
*/

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

@WebServlet("/edit")
public class EditProductServlet extends HttpServlet
{
   @Override
   protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
   {
	  HttpSession session=req.getSession(false);
	  if(session==null)
		  throw new RuntimeException("Session Expired!!!");
	  else
	  {
		  String pcode=req.getParameter("pcode");
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
		  req.setAttribute("pbean",pb);
		  req.setAttribute("p_code",pcode);
		  req.getRequestDispatcher("EditProduct1.jsp").forward(req, res);
	  }
   }
}
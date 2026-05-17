package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.bean.CustomerBean;
import com.customer.dao.CustomerLoginDAO;

@WebServlet("/customerlogin")
public class CustomerLoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomerBean cbean=new CustomerLoginDAO().CheckCustomerLogin(req.getParameter("uname"),req.getParameter("upwd")) ;
		if(cbean==null)
		{
			req.setAttribute("msg", "Session Expired");
			resp.sendRedirect("CustomerLogin.html?msg=invalid");		}
		else
		{
			HttpSession session=req.getSession();
			session.setAttribute("CustomerBean", cbean);
			req.getRequestDispatcher("CustomerHome.jsp").forward(req, resp);
		}
	}

}



/*package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.bean.CustomerBean;
import com.customer.dao.CustomerLoginDAO;
@WebServlet("/clog")
public class CustomerLoginServlet extends HttpServlet
{
	@Override
  protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {
	  CustomerBean cb=new CustomerLoginDAO().reteriveData(req.getParameter("cname"),req.getParameter("cpwd"));
	  if(cb==null)
	  {
		  req.setAttribute("msg","Login Failed!!");
		  req.getRequestDispatcher("CustomerRegister.jsp").forward(req, res);
	  }
	  else
	  {
		  HttpSession session=req.getSession();
		  session.setAttribute("cbean",cb);
		  req.getRequestDispatcher("CustomerHome.jsp").forward(req, res);
	  }
  }
}
*/
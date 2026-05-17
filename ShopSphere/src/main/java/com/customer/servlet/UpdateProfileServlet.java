package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.bean.CustomerBean;
import com.customer.dao.UpdateProfileDAO;


@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		HttpSession hs = req.getSession(false);

		if(hs == null)
		{
			res.sendRedirect("CustomerLogin.jsp");
			return;
		}

		CustomerBean cb = (CustomerBean) hs.getAttribute("CustomerBean");

		String fname = req.getParameter("fname");
		String mail = req.getParameter("mail");

		cb.setA_FNAME(fname);
		cb.setA_MID(mail);

		int rowCount = new UpdateProfileDAO().updateProfile(cb);

		if(rowCount > 0)
		{
			hs.setAttribute("CustomerBean", cb);

			req.setAttribute("msg", "Profile Updated Successfully");

			req.getRequestDispatcher("CustomerHome.jsp")
			.forward(req, res);
		}
		else
		{
			req.setAttribute("msg", "Profile Update Failed");

			req.getRequestDispatcher("CustomerHome.jsp")
			.forward(req, res);
		}
	}
}
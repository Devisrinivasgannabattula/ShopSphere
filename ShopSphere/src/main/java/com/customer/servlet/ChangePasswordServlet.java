package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.bean.CustomerBean;
import com.customer.dao.ChangePasswordDAO;


@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req,
			HttpServletResponse res)
			throws ServletException, IOException
	{
		HttpSession hs = req.getSession(false);

		if(hs == null)
		{
			res.sendRedirect("CustomerLogin.jsp");
			return;
		}

		CustomerBean cb =
		(CustomerBean)hs.getAttribute("CustomerBean");

		String oldPwd =
		req.getParameter("oldpwd");

		String newPwd =
		req.getParameter("newpwd");

		/* OLD PASSWORD CHECK */

		if(!cb.getA_PWORD().equals(oldPwd))
		{
			req.setAttribute("msg",
			"Old Password Incorrect");

			req.getRequestDispatcher("CustomerHome.jsp")
			.forward(req, res);

			return;
		}

		/* SET NEW PASSWORD */

		cb.setA_PWORD(newPwd);

		int rowCount =
		new ChangePasswordDAO()
		.changePassword(cb);

		if(rowCount > 0)
		{
			/* UPDATE SESSION */

			hs.setAttribute("CustomerBean", cb);

			req.setAttribute("msg",
			"Password Changed Successfully");

			req.getRequestDispatcher("CustomerHome.jsp")
			.forward(req, res);
		}
		else
		{
			req.setAttribute("msg",
			"Password Change Failed");

			req.getRequestDispatcher("CustomerHome.jsp")
			.forward(req, res);
		}
	}
}
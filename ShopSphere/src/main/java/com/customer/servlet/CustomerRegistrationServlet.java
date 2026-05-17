
package com.customer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.bean.CustomerBean;
import com.customer.dao.CustomerRegisterDAO;



@WebServlet("/reg")
public class CustomerRegistrationServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		CustomerBean cb = new CustomerBean();

		cb.setA_UNAME(req.getParameter("uname"));
		cb.setA_PWORD(req.getParameter("pwd"));
		cb.setA_FNAME(req.getParameter("fname"));
		cb.setA_LNAME(req.getParameter("lname"));
		cb.setA_ADDR(req.getParameter("addr"));
		cb.setA_MID(req.getParameter("mid"));
		cb.setA_PHNO(req.getParameter("phone"));

		CustomerRegisterDAO crd = new CustomerRegisterDAO();

		int rowCount = crd.Registration(cb);

		res.setContentType("text/html");

		PrintWriter pw = res.getWriter();

		if(rowCount > 0)
		{
			pw.println("<html>");
			pw.println("<head>");

			// Auto Redirect After 3 Seconds
			pw.println("<meta http-equiv='refresh' content='3;URL=CustomerLogin.html'>");

			pw.println("<style>");
			pw.println("body{");
			pw.println("margin:0;");
			pw.println("display:flex;");
			pw.println("justify-content:center;");
			pw.println("align-items:center;");
			pw.println("height:100vh;");
			pw.println("background:linear-gradient(135deg,#0f172a,#2563eb);");
			pw.println("font-family:Poppins,sans-serif;");
			pw.println("}");

			pw.println(".box{");
			pw.println("background:rgba(255,255,255,0.12);");
			pw.println("padding:40px;");
			pw.println("border-radius:20px;");
			pw.println("color:white;");
			pw.println("text-align:center;");
			pw.println("backdrop-filter:blur(15px);");
			pw.println("box-shadow:0 10px 25px rgba(0,0,0,0.3);");
			pw.println("}");

			pw.println("h1{");
			pw.println("color:#4ade80;");
			pw.println("margin-bottom:10px;");
			pw.println("}");

			pw.println("p{");
			pw.println("font-size:16px;");
			pw.println("}");
			pw.println("</style>");

			pw.println("</head>");

			pw.println("<body>");

			pw.println("<div class='box'>");
			pw.println("<h1>Registration Successful 🎉</h1>");
			pw.println("<p>Redirecting to Login Page...</p>");
			pw.println("</div>");

			pw.println("</body>");
			pw.println("</html>");
		}
		else
		{
			pw.println("<h1>Registration Failed...</h1>");
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

import com.customer.bean.CustomerBean;
import com.customer.dao.CustomerRegisterDAO;



@WebServlet("/reg")
public class CustomerRegistrationServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		CustomerBean cb = new CustomerBean();

		cb.setA_UNAME(req.getParameter("uname"));
		cb.setA_PWORD(req.getParameter("pwd"));
		cb.setA_FNAME(req.getParameter("fname"));
		cb.setA_LNAME(req.getParameter("lname"));
		cb.setA_ADDR(req.getParameter("addr"));
		cb.setA_MID(req.getParameter("mid"));
		cb.setA_PHNO(req.getParameter("phone"));

		CustomerRegisterDAO crd = new CustomerRegisterDAO();

		int rowCount = crd.Registration(cb);

		if(rowCount > 0)
		{
			// Redirect to Login Page
			
			res.sendRedirect("CustomerLogin.html");
		}
		else
		{
			res.getWriter().println("Registration Failed...");
		}
	}
}*/

/*package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.bean.CustomerBean;
import com.customer.dao.CustomerRegisterDAO;


@WebServlet("/reg")
public class CustomerRegistrationServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomerBean cbean=new CustomerBean();
		
		cbean.setA_UNAME(req.getParameter("uname"));
		cbean.setA_PWORD(req.getParameter("pwd"));
		cbean.setA_FNAME(req.getParameter("fname"));
		cbean.setA_LNAME(req.getParameter("lname"));
		cbean.setA_ADDR(req.getParameter("addr"));
		cbean.setA_MID(req.getParameter("mid"));
		cbean.setA_PHNO(req.getParameter("phone"));
		
		

		int rowCount=new CustomerRegisterDAO().Registration(cbean);
		if(rowCount==0)
		{
			throw new RuntimeException("Registration Failed !!!");
		}
		else
		{
			req.setAttribute("msg","Registration Success !");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req, res);
		}
	}
}*/




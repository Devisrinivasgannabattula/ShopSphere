package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.dao.OrderDAO;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int customerId = Integer.parseInt(request.getParameter("customerId"));

        String[] products = request.getParameterValues("product");
        String[] qtys = request.getParameterValues("qty");
        String[] totals = request.getParameterValues("total");

        OrderDAO dao = new OrderDAO();

        try {

            for (int i = 0; i < products.length; i++) {

                dao.placeOrder(
                        customerId,
                        products[i],
                        Integer.parseInt(qtys[i]),
                        Double.parseDouble(totals[i])
                );
            }

            response.sendRedirect("CustomerHome.jsp?msg=Order Placed Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDAO {

    public int placeOrder(int customerId, String productName, int quantity, double total) {

        int status = 0;

        try {
            Connection con = DBConnect.getCon();

            String sql = "INSERT INTO customer_orders "
                    + "(CUSTOMER_ID, PRODUCT_NAME, QUANTITY, TOTAL, ORDER_DATE, ORDER_TIME, STATUS) "
                    + "VALUES (?, ?, ?, ?, SYSDATE, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            // Current time (HH:mm:ss)
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            String orderTime = sdf.format(new Date());

            ps.setInt(1, customerId);
            ps.setString(2, productName);
            ps.setInt(3, quantity);
            ps.setDouble(4, total);
            ps.setString(5, orderTime);
            ps.setString(6, "Paid");

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.customer.bean.CustomerBean;

public class ChangePasswordDAO
{
	public int changePassword(CustomerBean cb)
	{
		int rowCount = 0;

		try
		{
			Connection con = DBConnect.getCon();

			PreparedStatement pstmt =
			con.prepareStatement(
			"update customer set PWORD=? where UNAME=?");

			pstmt.setString(1, cb.getA_PWORD());
			pstmt.setString(2, cb.getA_UNAME());

			rowCount = pstmt.executeUpdate();

			System.out.println("Password Updated : "+rowCount);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return rowCount;
	}
}
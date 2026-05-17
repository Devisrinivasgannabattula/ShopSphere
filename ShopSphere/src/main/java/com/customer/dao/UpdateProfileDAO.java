package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.customer.bean.CustomerBean;

public class UpdateProfileDAO
{
	public int updateProfile(CustomerBean cb)
	{
		int rowCount = 0;

		try
		{
			Connection con = DBConnect.getCon();

			PreparedStatement pstmt =
			con.prepareStatement(
			"update customer set FNAME=?, MID=? where UNAME=?");

			pstmt.setString(1, cb.getA_FNAME());
			pstmt.setString(2, cb.getA_MID());
			pstmt.setString(3, cb.getA_UNAME());

			rowCount = pstmt.executeUpdate();

			System.out.println("Updated Rows : "+rowCount);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return rowCount;
	}
}
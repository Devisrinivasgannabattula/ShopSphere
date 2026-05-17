
package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.customer.bean.CustomerBean;

public class CustomerRegisterDAO 
{
	public int Registration(CustomerBean cb)
	{
		int rowcount=0;
		try
		{
			Connection con=DBConnect.getCon();
			PreparedStatement pstmt=con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
			
			pstmt.setString(1, cb.getA_UNAME());
			pstmt.setString(2, cb.getA_PWORD());
			pstmt.setString(3, cb.getA_FNAME());
			pstmt.setString(4,cb.getA_LNAME());
			pstmt.setString(5,cb.getA_ADDR());
			pstmt.setString(6, cb.getA_MID());
			pstmt.setString(7, cb.getA_PHNO());
			
			rowcount =pstmt.executeUpdate();
			
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowcount;
	}
}





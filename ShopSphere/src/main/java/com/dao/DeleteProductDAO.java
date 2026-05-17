package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.ProductBean;

public class DeleteProductDAO 
{
	public int deleteproduct(String pcode)
	{
		int rowCount=0;
		try
		{
			Connection con=DBConnect.getCon();
			PreparedStatement pstmt=con.prepareStatement("Delete from Product where pcode=?");
			
			pstmt.setString(1, pcode);
			
			rowCount=pstmt.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return rowCount;
	}
}

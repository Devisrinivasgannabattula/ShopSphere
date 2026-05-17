package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.ProductBean;

public class AddProductDAO 
{
	public int insertProduct(ProductBean pb)throws Exception
	{
		int rowCount=0;
		try
		{
			Connection	con=DBConnect.getCon();
			PreparedStatement pstmt=con.prepareStatement("insert into Product values(?,?,?,?,?)");
			
			pstmt.setString(1, pb.getA_pcode());
			pstmt.setString(2, pb.getA_pname());
			pstmt.setString(3, pb.getA_pcompany());
			pstmt.setString(4, pb.getA_pprice());
			pstmt.setString(5, pb.getA_pqty());
			
			rowCount=pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			throw e;
		}
		return rowCount;
	}
}



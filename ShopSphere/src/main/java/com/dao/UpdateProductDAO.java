package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.ProductBean;

public class UpdateProductDAO 
{
	public int UpdateProduct(ProductBean pb)
	{
		int rowCount=0;
		try
		{
			Connection con=DBConnect.getCon();
			PreparedStatement pstmt=con.prepareStatement("Update Product set pprice=?,pqty=? where pcode=?");
			
			pstmt.setString(1, pb.getA_pprice());
			pstmt.setString(2, pb.getA_pqty());
			pstmt.setString(3, pb.getA_pcode());
			
			rowCount=pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return rowCount;
	}
	
}

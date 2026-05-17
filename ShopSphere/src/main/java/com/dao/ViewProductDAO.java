package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bean.ProductBean;

public class ViewProductDAO 
{
	ArrayList<ProductBean> al=new ArrayList<ProductBean>();
	public  ArrayList<ProductBean> reteriveProductInfo()
	{
		try
		{
			Connection con=DBConnect.getCon();
			PreparedStatement pstmt=con.prepareStatement("select * from Product");
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				ProductBean pb=new ProductBean();
				pb.setA_pcode(rs.getString(1));
				pb.setA_pname(rs.getString(2));
				pb.setA_pcompany(rs.getString(3));
				pb.setA_pprice(rs.getString(4));
				pb.setA_pqty(rs.getString(5));
				
				al.add(pb);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}
}

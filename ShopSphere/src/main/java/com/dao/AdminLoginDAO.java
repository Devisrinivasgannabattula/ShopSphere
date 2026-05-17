package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.AdminBean;


public class AdminLoginDAO 
{
	public AdminBean CheckAdminLogin(String uname,String pwd)
	{
		//AdminBean ab=new AdminBean();
		AdminBean ab=null;
		try
		{
			Connection con=DBConnect.getCon();
			PreparedStatement pstmt=con.prepareStatement("select * from Admin where uname=? and pword=?");
			
			pstmt.setString(1, uname);
			pstmt.setString(2, pwd);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				ab= new AdminBean();
				ab.setA_UNAME(rs.getString(1));;
				ab.setA_PWORD(rs.getString(2));
				ab.setA_FNAME(rs.getString(3));
				ab.setA_LNAME(rs.getString(4));
				ab.setA_ADDR(rs.getString(5));
				ab.setA_MID(rs.getString(6));
				ab.setA_PHNO(rs.getString(7));
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ab;
	}

}

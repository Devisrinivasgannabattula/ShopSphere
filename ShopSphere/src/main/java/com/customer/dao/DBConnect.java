package com.customer.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{
	private static Connection con=null;
	
	private DBConnect() {}
	
	static
	{
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection(DBInfo.db_url,DBInfo.db_uname,DBInfo.db_pwd);
			System.out.println("Database Connection achieved!!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
		public static Connection getCon()
		{
			return con;
		}
	}

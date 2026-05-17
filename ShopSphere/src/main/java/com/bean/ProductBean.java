package com.bean;

import java.io.Serializable;

public class ProductBean implements Serializable
{
	private String a_pcode,a_pname,a_pcompany,a_pprice,a_pqty;

	public String getA_pcode() {
		return a_pcode;
	}

	public void setA_pcode(String a_pcode) {
		this.a_pcode = a_pcode;
	}

	public String getA_pname() {
		return a_pname;
	}

	public void setA_pname(String a_pname) {
		this.a_pname = a_pname;
	}

	public String getA_pcompany() {
		return a_pcompany;
	}

	public void setA_pcompany(String a_pcompany) {
		this.a_pcompany = a_pcompany;
	}

	public String getA_pprice() {
		return a_pprice;
	}

	public void setA_pprice(String a_pprice) {
		this.a_pprice = a_pprice;
	}

	public String getA_pqty() {
		return a_pqty;
	}

	public void setA_pqty(String a_pqty) {
		this.a_pqty = a_pqty;
	}
	
	public ProductBean() {}
	
}

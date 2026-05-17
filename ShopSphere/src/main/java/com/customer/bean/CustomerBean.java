package com.customer.bean;

import java.io.Serializable;

public class CustomerBean implements Serializable{

	private String a_UNAME,a_PWORD,a_FNAME,a_LNAME,a_ADDR,a_MID,a_PHNO;

	public String getA_UNAME() {
		return a_UNAME;
	}

	public void setA_UNAME(String a_UNAME) {
		this.a_UNAME = a_UNAME;
	}

	public String getA_PWORD() {
		return a_PWORD;
	}

	public void setA_PWORD(String a_PWORD) {
		this.a_PWORD = a_PWORD;
	}

	public String getA_FNAME() {
		return a_FNAME;
	}

	public void setA_FNAME(String a_FNAME) {
		this.a_FNAME = a_FNAME;
	}

	public String getA_LNAME() {
		return a_LNAME;
	}

	public void setA_LNAME(String a_LNAME) {
		this.a_LNAME = a_LNAME;
	}

	public String getA_ADDR() {
		return a_ADDR;
	}

	public void setA_ADDR(String a_ADDR) {
		this.a_ADDR = a_ADDR;
	}

	public String getA_MID() {
		return a_MID;
	}

	public void setA_MID(String a_MID) {
		this.a_MID = a_MID;
	}

	public String getA_PHNO() {
		return a_PHNO;
	}

	public void setA_PHNO(String a_PHNO) {
		this.a_PHNO = a_PHNO;
	}
	private int customerId;

	public int getCustomerId() {
	    return customerId;
	}
	public CustomerBean() {}
}

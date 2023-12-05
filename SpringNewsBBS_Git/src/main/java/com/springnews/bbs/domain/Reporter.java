package com.springnews.bbs.domain;

import java.sql.Timestamp;

public class Reporter {

	private String writer, name, office, pass, email, mobile;
	private String category;
	private String  zipcode, address1, address2;
	private Timestamp regDate;
	
	public Reporter(){ }

	public Reporter(String writer, String name, String office, String pass, String email, String mobile,
			String category, String zipcode, String address1, String address2, Timestamp regDate) {
		super();
		this.writer = writer;
		this.name = name;
		this.office = office;
		this.pass = pass;
		this.email = email;
		this.mobile = mobile;
		this.category = category;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.regDate = regDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
	
	
}
package com.springnews.bbs.domain;

import java.sql.Timestamp;

public class Board {
	
	private int no;
	private String writer;
	private String name;
	private String email;
	private String office;
	private String subject;
	private String title;
	private String summary;
	private String content;	
	private Timestamp regDate;
	private String pass;
	private String file1;
	private int readCount;
	private String category;
	private int recommend;
	private int thank;
	
	
	public Board() { }


	public Board(int no, String writer, String name, String email, String office, String subject, String title,
			String summary, String content, Timestamp regDate, String pass, String file1, int readCount,
			String category, int recommend, int thank) {
		super();
		this.no = no;
		this.writer = writer;
		this.name = name;
		this.email = email;
		this.office = office;
		this.subject = subject;
		this.title = title;
		this.summary = summary;
		this.content = content;
		this.regDate = regDate;
		this.pass = pass;
		this.file1 = file1;
		this.readCount = readCount;
		this.category = category;
		this.recommend = recommend;
		this.thank = thank;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getOffice() {
		return office;
	}


	public void setOffice(String office) {
		this.office = office;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getSummary() {
		return summary;
	}


	public void setSummary(String summary) {
		this.summary = summary;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Timestamp getRegDate() {
		return regDate;
	}


	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getFile1() {
		return file1;
	}


	public void setFile1(String file1) {
		this.file1 = file1;
	}


	public int getReadCount() {
		return readCount;
	}


	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getRecommend() {
		return recommend;
	}


	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}


	public int getThank() {
		return thank;
	}


	public void setThank(int thank) {
		this.thank = thank;
	}


	
	
	
}

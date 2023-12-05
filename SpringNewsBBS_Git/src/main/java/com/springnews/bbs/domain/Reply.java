package com.springnews.bbs.domain;

import java.sql.Timestamp;

public class Reply {

	private int no;
	private String id;
	private int bbsNo;
	private String replyContent;	
	private Timestamp regDate;
	
	public Reply() { }
	public Reply(int no, String id, int bbsNo, String replyContent, Timestamp regDate) {
		super();
		this.no = no;
		this.id = id;
		this.bbsNo = bbsNo;
		this.replyContent = replyContent;
		this.regDate = regDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
	
}
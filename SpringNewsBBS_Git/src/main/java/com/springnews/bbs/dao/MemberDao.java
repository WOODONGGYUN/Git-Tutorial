package com.springnews.bbs.dao;

import com.springnews.bbs.domain.Member;

public interface MemberDao {
	
	public abstract String memberPassCheck(String id);
		
	public abstract void updateMember(Member m);
	
	public abstract void addMember(Member m);	
	
	public abstract Member getMember(String id);
}

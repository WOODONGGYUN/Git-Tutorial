package com.springnews.bbs.service;

import com.springnews.bbs.domain.Member;

public interface MemberService {
	
	public abstract boolean memberPassCheck(String id, String pass);
		
	public abstract void updateMember(Member m);
	
	public abstract void addMember(Member m);
	
	public abstract int login(String id, String pass);
	
	public abstract Member getMember(String id);
	
	public boolean overlapIdCheck(String id);
}

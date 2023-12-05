package com.springnews.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springnews.bbs.dao.MemberDao;
import com.springnews.bbs.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public boolean memberPassCheck(String id, String pass) {
		
		String dbpass = memberDao.memberPassCheck(id);
		
		boolean result = false;
		if(passwordEncoder.matches(pass, dbpass)) {
			result = true;
		}
		
		return result;
	}

	@Override
	public void updateMember(Member m) {
		
		m.setPass(passwordEncoder.encode(m.getPass()));
		
		memberDao.updateMember(m);

	}

	@Override
	public void addMember(Member m) {
		
		m.setPass(passwordEncoder.encode(m.getPass()));
		
		memberDao.addMember(m);

	}

	@Override
	public int login(String id, String pass) {
		
		Member m = memberDao.getMember(id);
		int result = -1;
		
		if(m == null) {
			return result;
		}
		
	
		if(passwordEncoder.matches(pass, m.getPass())) {
			result = 1;
			
		} else { 
			result = 0;
		}
		
		return result;
	}

	@Override
	public Member getMember(String id) {

		return memberDao.getMember(id);
	}

	@Override
	public boolean overlapIdCheck(String id) {
		
		Member m = memberDao.getMember(id);
		
		if( m == null) {
			return false;
		}		
		return true;
	}
}

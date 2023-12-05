package com.springnews.bbs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springnews.bbs.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private final String NAME_SPACE="com.springnews.bbs.mapper.MemberMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String memberPassCheck(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".memberPassCheck", id);
	}

	@Override
	public void updateMember(Member m) {
		
		sqlSession.update(NAME_SPACE + ".updateMember", m);

	}

	@Override
	public void addMember(Member m) {
		
		sqlSession.insert(NAME_SPACE + ".addMember" , m);
		
	}

	@Override
	public Member getMember(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}

}

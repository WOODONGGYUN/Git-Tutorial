package com.springnews.bbs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springnews.bbs.domain.Reporter;

@Repository
public class ReporterDaoImpl implements ReporterDao {
	
	private final String NAME_SPACE="com.springnews.bbs.mapper.ReporterMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Reporter getReporter(String id) {

		return sqlSession.selectOne(NAME_SPACE + ".getReporter", id);
	}

}

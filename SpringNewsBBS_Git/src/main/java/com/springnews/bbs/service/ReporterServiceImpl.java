package com.springnews.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springnews.bbs.dao.ReporterDao;
import com.springnews.bbs.domain.Reporter;

@Service
public class ReporterServiceImpl implements ReporterService {

	@Autowired
	private ReporterDao reporterDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	@Override
	public int login(String id, String pass) {

		Reporter r = reporterDao.getReporter(id);
		
		int result = -1;
		
		if( r == null) {
			return result;
		} 
		
		if( passwordEncoder.matches(pass, r.getPass())) {
			result = 1;			
		} else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public Reporter getReporter(String id) {
		
		return reporterDao.getReporter(id);
	}


}

package com.springnews.bbs.service;

import com.springnews.bbs.domain.Reporter;

public interface ReporterService {
	
	public abstract int login(String id, String pass);
	
	public abstract Reporter getReporter(String id);
	

}

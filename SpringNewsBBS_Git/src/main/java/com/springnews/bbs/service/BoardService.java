package com.springnews.bbs.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.springnews.bbs.domain.Board;
import com.springnews.bbs.domain.Reply;

public interface BoardService {	
		
	public abstract void deleteReply(int no);	
	
	public abstract void updateReply(Reply reply);
	
	public abstract void addReply(Reply reply);
	
	public abstract Board updateRecommend(int no, String recommend);
	
	//댓글
	public abstract List<Reply> replyList(int bbsNo);
	
	//게시판
	public abstract Map<String, Object> pBoardList(
			int pageNum, String type, String keyword);
	
	public abstract Board getBoard(int no, boolean isCount);
	
	public abstract void insertBoard(Board board);

	public boolean isPassCheck(int no, String pass);
	
	public abstract void updateBoard(Board board);
	
	public abstract void deleteBoard(int no);

	public abstract Map<String, Object> boardList(
			int pageNum, String type, String keyword ,String category) 
					throws IOException;

}

package com.springnews.bbs.dao;

import java.util.List;

import com.springnews.bbs.domain.Board;
import com.springnews.bbs.domain.Reply;

public interface BoardDao {
	
	public abstract void deleteReply(int no);
	
	public abstract void updateReply(Reply reply);
	
	public abstract void addReply(Reply reply);
	
	public abstract void updateRecommend(int no, String recommend);
	
	public abstract Board getRecommend(int no);
	
	// 댓글
	public abstract List<Reply> replyList(int bbsNo);
	
	//게시판
	public abstract List<Board> pBoardList(
			int start, int num, String type, String keyword);
	
	public abstract void incrementReadCount(int no);
	
	public abstract int getBoardCount(String type, String keyword);
	
	public abstract List<Board> boardList(
			int startRow, int num, String type, String keyword,String category);
	
	public abstract Board getBoard(int no);

	public abstract void insertBoard(Board board);
	
	public String isPassCheck(int no, String pass);
	
	public abstract void updateBoard(Board board);
	
	public abstract void deleteBoard(int no);
}

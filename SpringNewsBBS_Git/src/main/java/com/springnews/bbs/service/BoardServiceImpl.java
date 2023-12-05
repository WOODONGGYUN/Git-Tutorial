package com.springnews.bbs.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springnews.bbs.dao.BoardDao;
import com.springnews.bbs.domain.Board;
import com.springnews.bbs.domain.Reply;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static final int PAGE_SIZE = 5;
	
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private BoardDao boardDao;
	
	
	
	
	
	@Override
	public void deleteReply(int no) {
		
		boardDao.deleteReply(no);
		
	}
	
	@Override
	public void updateReply(Reply reply) {
		
		boardDao.updateReply(reply);
	}
	
	@Override
	public void addReply(Reply reply) {
		
		boardDao.addReply(reply);
	}
	
	@Override
	public Board updateRecommend(int no, String recommend) {
		
		boardDao.updateRecommend(no, recommend);
		return boardDao.getRecommend(no);
		
	}

	//댓글
	@Override
	public List<Reply> replyList(int bbsNo) {
		
		return boardDao.replyList(bbsNo);
		
	}
	
	//게시판
	@Override
	public Map<String, Object> pBoardList(int pageNum, 
				String type, String keyword){
	
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		int listCount = boardDao.getBoardCount(type, keyword);
		
		List<Board> pBoardList = boardDao.pBoardList(startRow, PAGE_SIZE,type, keyword);
		
		int pageCount =
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
			}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("pBList", pBoardList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
			
		return modelMap;	
		
	}

	@Override
	public Map<String, Object> boardList(int pageNum, String type, 
				String keyword,String category)throws IOException{
		
		String url ="https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=101";
		Document doc = Jsoup.connect(url).get();
		
		Elements headlines  = doc.select("a.sh_text_headline");
		
	
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		int listCount = boardDao.getBoardCount(type, keyword);
		
		List<Board> boardList = boardDao.boardList(startRow, PAGE_SIZE, type, keyword, category);
		
		int pageCount =
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
			}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("bList", boardList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("category", category);
		modelMap.put("headlines", headlines);
		
		System.out.println(headlines);
	
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		modelMap.put("searchOption", searchOption);
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}
			
		return modelMap;	
	}

	@Override
	public Board getBoard(int no, boolean isCount) {
		
		if(isCount) {
			boardDao.incrementReadCount(no);
			
		}

		return boardDao.getBoard(no);
	}

	@Override
	public void insertBoard(Board board) {
		
		boardDao.insertBoard(board);
	}

	@Override
	public boolean isPassCheck(int no, String pass) {
		
		boolean result = false;
		
		String dbPass = boardDao.isPassCheck(no, pass);
		if(dbPass.equals(pass)) {
			result = true;
		}
		
		return result;
	}

	@Override
	public void updateBoard(Board board) {

		boardDao.updateBoard(board);

	}

	@Override
	public void deleteBoard(int no) {
	
		boardDao.deleteBoard(no);

	}

}

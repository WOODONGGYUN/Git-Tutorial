package com.springnews.bbs.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springnews.bbs.domain.Board;
import com.springnews.bbs.domain.Reply;
import com.springnews.bbs.service.BoardService;

@Controller
public class BoardController {
	
	private static final String DEFAULT_PATH = "/resources/img/";
	
	@Autowired
	private BoardService service;
	
	private BoardService service2;

	@RequestMapping(value="/deleteProcess")
	public String deleteBoard(HttpServletResponse response,PrintWriter out, 
			int no, String pass,
			@RequestParam(required=false, defaultValue="1") int pageNum){
				
		boolean result = service.isPassCheck(no, pass);	
		if(!result) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert ('비밀번호가 맞지 않음'); ");
			out.println("history.back(); ");
			out.println("</script>");	
		}
		
		service.deleteBoard(no);
		
		return "redirect:boardList?pageNum=" + pageNum;
	}
	
	
	
	
	@RequestMapping(value="/updateProcess", method=RequestMethod.GET)
	public String updateBoard(Model model, HttpServletResponse response, 
			PrintWriter out, int no, String pass,
			@RequestParam(required=false, defaultValue="1")
			int pageNum){
		
		boolean result = service.isPassCheck(no, pass);	
		
		if(!result) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert ('비밀번호가 맞지 않음..'); ");
			out.println("history.back(); ");
			out.println("</script>");
			
			return null;
		}
		
		Board board = service.getBoard(no, false);
		
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "updateForm";
	}
	
	
	
	@RequestMapping(value="/updateProcess", method=RequestMethod.POST)
	public String updateBoard(HttpServletRequest request, int no,  
			String writer, String name, String email, String office, String title,
			String summary, String content, String pass,
			@RequestParam(value="file1", required=false) MultipartFile multipartFile) 
				throws IOException {
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		Board board = new Board();
		board.setNo(no);
		board.setTitle(title);
		board.setSummary(summary);
		board.setContent(content);
		board.setPass(pass);		
		
		System.out.println("update before - file1 : " + board.getFile1());

		if(! multipartFile.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("newName : " + file.getName());
			
			multipartFile.transferTo(file);

			board.setFile1(saveName);
			
			System.out.println("saveName : "+ saveName);
			
		} else {
			board.setFile1(null);
		}
		
		System.out.println("update after - file1 : " + board.getFile1());
		
		
		service.updateBoard(board);
		
		return "redirect:boardList";
	}
	
	
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(HttpServletRequest request, 
			String writer, String name, String email, String office, String title,
			String summary, String content, String pass, String category,			
			@RequestParam(value="file1", required=false) MultipartFile multipartFile) 
				throws IOException {
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		Board board = new Board();
		board.setWriter(writer);
		board.setName(name);
		board.setEmail(email);
		board.setOffice(office);
		board.setTitle(title);
		board.setSummary(summary);
		board.setContent(content);
		board.setPass(pass);		
		board.setCategory(category);

		System.out.println("category : " + category);
		
		if(! multipartFile.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("newName : " + file.getName());
			
			multipartFile.transferTo(file);
			
			board.setFile1(saveName);
		}
			
		service.insertBoard(board);		
		
		return "redirect:boardList";
	}

	
	@RequestMapping(value= {"/boardList"}, method=RequestMethod.GET)
	public String boardList(Model model, 
			@RequestParam(value="pageNum", 
			required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", 
			required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", 
			required=false, defaultValue="null") String keyword,
			@RequestParam(value="category", 
			required=false, defaultValue="null") String category) throws IOException {	
		
		
		
		
		model.addAllAttributes(service.boardList(pageNum, type, keyword,category));
		
		
		model.addAllAttributes(service.pBoardList(pageNum, type, keyword));
		
		System.out.println("카테고리"+category); 
		System.out.println("페이지"+pageNum); 
		return "boardList";
	}
	
	
	
	@RequestMapping("boardDetail")
	public String boardDetail(Model model, int no, 
			@RequestParam(required=false, defaultValue="1") int pageNum) {
		
		Board board = service.getBoard(no, true);
		List<Reply> replyList = service.replyList(no);
		

		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("replyList", replyList);

		return "boardDetail";
	}
	
	
	
}

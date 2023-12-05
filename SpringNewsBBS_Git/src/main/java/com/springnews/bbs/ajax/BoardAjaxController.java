package com.springnews.bbs.ajax;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springnews.bbs.domain.Board;
import com.springnews.bbs.domain.Reply;
import com.springnews.bbs.service.BoardService;

@Controller
public class BoardAjaxController {
	
	private final static String DEFAULT_PATH = "/resources/img/";

	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/imgUpload.ajax")
	@ResponseBody
	public Map<String,String> imgUpload(@RequestParam(value="file1") 
		MultipartFile multipartFile,HttpServletRequest request) 
			throws IOException {

		
		Map<String,String> result = new HashMap<>();
		
		
		if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);

			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			
			multipartFile.transferTo(file);
			
			result.put("fileName",saveName);
			
		}
	System.out.println(result);
	
		return result;

	}
	
	
	
	@RequestMapping("/replyDelete.ajax")
	@ResponseBody
	public List<Reply> deleteReply(int no, int bbsNo) {
	
	boardService.deleteReply(no);
	
	return boardService.replyList(bbsNo);
	}
	
	
	@RequestMapping("/replyUpdate.ajax")
	@ResponseBody
	public List<Reply> updateReply(Reply reply) {
		boardService.updateReply(reply);
		
		return boardService.replyList(reply.getBbsNo());
	}	
	
	
	
	@RequestMapping("/replyWrite.ajax")
	@ResponseBody
	public List<Reply> addReply(Reply reply) {
		boardService.addReply(reply);

		return boardService.replyList(reply.getBbsNo());
	}
	
	
	
	@RequestMapping("/recommend.ajax")
	@ResponseBody
	public Board recommend(int no, String recommend) {
			
		return boardService.updateRecommend(no, recommend);
	}
	
}

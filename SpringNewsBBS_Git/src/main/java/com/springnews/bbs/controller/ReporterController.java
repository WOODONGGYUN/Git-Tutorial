package com.springnews.bbs.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springnews.bbs.domain.Reporter;
import com.springnews.bbs.service.ReporterService;

@Controller
@SessionAttributes("reporter")
public class ReporterController {
	
	@Autowired
	private ReporterService rService;
	
	@RequestMapping(value="/reporterLogin" , method=RequestMethod.POST)
	public String login(Model model, @RequestParam("writer") String writer, String pass,
			HttpSession session, HttpServletResponse response, PrintWriter out){
				
		int result = rService.login(writer, pass);
		if(result == -1) { 
			response.setContentType("text/html; charset=utf-8");
			out.println("<scri-pt>");
			out.println("	alert('회원 아이디가 존재하지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
			
		} else if(result == 0) { 
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("	alert('비밀번호가 틀립니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		} 
		
		Reporter reporter = rService.getReporter(writer);
		session.setAttribute("isLogin", true);
		
		model.addAttribute("reporter", reporter);
		
		return "redirect:boardList";		
	}
	
	@RequestMapping("/reporterLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:boardList";
	}
	
	@RequestMapping(value="/customerService")
	public String customerService() {
		
		
		return "customerServiceForm";
	}
	
}

package com.springnews.bbs.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springnews.bbs.service.MemberService;
import com.springnews.bbs.domain.Member;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	

	@RequestMapping(value="/memberUpdateResult", method=RequestMethod.POST)	
	public String memberUpdateResult(Model model, Member m, String pass1,
			String emailId, String emailDomain, 
			String mobile1, String mobile2, String mobile3) {
		
		m.setPass(pass1);
		m.setEmail(emailId + "@" + emailDomain);
		m.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		memberService.updateMember(m);
		model.addAttribute("member", m);
		
		return "redirect:boardList";
	}
	
	
	
	@RequestMapping("/memberUpdateForm")
	public String updateForm(Model model, HttpSession session) {
		
		return "member/memberUpdateForm";
	}

	
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, String id) {
		
		boolean overlap = memberService.overlapIdCheck(id);
		model.addAttribute("id", id);		
		model.addAttribute("overlap", overlap);		
		
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}
	
	
	
	@RequestMapping(value="/memberJoinResult", method=RequestMethod.POST)	
	public String memberJoinResult(Member m, String pass1, 
			String emailId, String emailDomain, 
			String mobile1, String mobile2, String mobile3) {
		
		m.setPass(pass1);
		m.setEmail(emailId + "@" + emailDomain);
		m.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		memberService.addMember(m);
		
		return "redirect:memberLoginForm";
	}
	
	
	
	@RequestMapping(value="/memberLogin" , method=RequestMethod.POST)
	public String login(Model model,
			@RequestParam("id") String id, String pass,
			HttpSession session, HttpServletResponse response,
			PrintWriter out) {
		
		int result = memberService.login(id, pass);
		
		if(result == -1) { 
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
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
		

		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);
		
		model.addAttribute("member", member);
		
		return "redirect:boardList";
	}
	

	@RequestMapping("/memberLogout")
	public String logout(HttpSession session) {
		

		session.setAttribute("member", null);
		session.invalidate();
		
		return "redirect:boardList";
	}

}

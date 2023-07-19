package com.traveltogether.view.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.traveltogether.biz.member.MemberService;
import com.traveltogether.biz.member.MemberVO;
import com.traveltogether.biz.member.impl.MemberServiceimpl;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberServiceimpl memberService;
	
	@RequestMapping(value = "/views/insertMember.do")
	public String insertMember(MemberVO vo)throws IOException {
		memberService.insertMember(vo);
		
		return "/main.jsp";
	}
	
	@RequestMapping("/updateMember.do")
	public String updateMember(@ModelAttribute("member") MemberVO vo) {
		memberService.updateMember(vo);
		return "getMemberList.do";
	}
	
	@RequestMapping("/getMember.do")
	public String getMember(MemberVO vo, Model model) {
		model.addAttribute("member",memberService.getMember(vo));
<<<<<<< HEAD
		return "마이페이지";
=======
		return "留덉씠�럹�씠吏�";
>>>>>>> KHS
	}
	
	@RequestMapping("/deleteMember.do")
	public String deleteMember(MemberVO vo) {
		memberService.deleteMember(vo);
		return "main.jsp";
	}
	
	@RequestMapping("/getMemberList.do")
	public String getMemberList(MemberVO vo, Model model) {
		model.addAttribute("memberList",memberService.getMemberList(vo));
		return "admin_memberList.jsp";
	}
	
	@RequestMapping(value="/views/login.do", method=RequestMethod.GET)
	public String loginMember(MemberVO vo) {
		vo.setMember_id("admin@test.com");
		vo.setMember_password("1234");
		
		return "/views/login.jsp";
	}
	
	@RequestMapping(value="/views/login.do", method=RequestMethod.POST)
	public String loginMember(MemberVO vo, HttpSession session)throws IllegalAccessException {
		
		if(vo.getMember_id()==null || vo.getMember_id()=="") {
<<<<<<< HEAD
			throw new IllegalAccessException("아이디는 반드시입력해야합니다.");
=======
			throw new IllegalAccessException("�븘�씠�뵒�뒗 諛섎뱶�떆�엯�젰�빐�빞�빀�땲�떎.");
>>>>>>> KHS
		}
		if(memberService.loginMember(vo) != null) {
			session.setAttribute("userNickname", memberService.loginMember(vo).getMember_nickname());
			session.setAttribute("userId", memberService.loginMember(vo).getMember_id());
<<<<<<< HEAD
=======
		
			
>>>>>>> KHS
			return "/main.jsp";
		} else {
			return "/views/login.jsp";
		}
		
	}
	
	@RequestMapping("/views/logout.do")
	public String logoutMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main.jsp";
	}
	
	
}

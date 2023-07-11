package com.traveltogether.view.member;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.traveltogether.biz.member.MemberService;
import com.traveltogether.biz.member.MemberVO;
import com.traveltogether.biz.member.impl.MemberServiceimpl;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberServiceimpl memberService;
	
	@RequestMapping(value = "/insertMember.do")
	public String insertMember(MemberVO vo)throws IOException {
		memberService.insertMember(vo);
		
		return "main.jsp";
	}
	
	@RequestMapping("/updateMember.do")
	public String updateMember(@ModelAttribute("member") MemberVO vo) {
		memberService.updateMember(vo);
		return "getMemberList.do";
	}
	
	@RequestMapping("/getMember.do")
	public String getMember(MemberVO vo, Model model) {
		model.addAttribute("member",memberService.getMember(vo));
		return "마이페이지";
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
	
	
}

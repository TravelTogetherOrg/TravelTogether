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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.traveltogether.biz.common.utill.FileUtills;
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
	
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("member") MemberVO vo	
		, @RequestParam(value = "member_profile_image") MultipartFile member_profile_url) throws IOException {
		
		String path = FileUtills.serverUploadFile(member_profile_url);
		vo.setMember_profile_url(path);
		memberService.updateMember(vo);
		
		System.out.println(vo.getMember_profile_url());
		return "/views/mypage_main.jsp";
	}
	
	@RequestMapping("/getMember.do")
	public String getMember(MemberVO vo, HttpServletRequest request, Model model) {
//		HttpSession session = request.getSession();
//		vo.setMember_id(session.getAttribute("userId").toString());  // 세션으로 넘길떄 
		model.addAttribute("member", memberService.getMember(vo));
		
		return "/views/mypage_main.jsp";
	}
	
	@RequestMapping("/deleteMember.do")
	public String deleteMember(MemberVO vo, HttpServletRequest request) {
		memberService.deleteMember(vo);
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main.jsp";
	}
	//관리자용
	@RequestMapping("/views/getMemberList.do")
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
	public String loginMember(MemberVO vo, HttpSession session, Model model)throws IllegalAccessException {
		if(vo.getMember_id() == null || vo.getMember_id() == "") {
			throw new IllegalAccessException("아이디는 반드시 입력해야합니다.");
		}
		
		if(memberService.loginMember(vo) != null) {
			session.setAttribute("userNickname", memberService.loginMember(vo).getMember_nickname());
			session.setAttribute("userId", memberService.loginMember(vo).getMember_id());
			session.setAttribute("userProfile", memberService.loginMember(vo).getMember_profile_url());
			
			model.addAttribute("member",memberService.getMember(vo));
			
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

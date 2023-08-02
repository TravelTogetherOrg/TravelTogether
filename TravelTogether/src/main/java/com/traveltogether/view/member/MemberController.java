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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.traveltogether.biz.common.utill.FileUtills;
import com.traveltogether.biz.member.MemberService;
import com.traveltogether.biz.member.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/memberAgreement")
	public String memberAgreement(MemberVO vo)throws IOException {
		return "/memberAgreement";
	}
	
	@RequestMapping(value = "/findId")
	public String findId(MemberVO vo)throws IOException {
		return "/findId";
	}
	
	@RequestMapping(value = "/findPassword")
	public String findPassword(MemberVO vo)throws IOException {
		return "/findPassword";
	}
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.GET)
	public String insertMember1(MemberVO vo) {
		return "/join";
	}
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember2(MemberVO vo)throws IOException {
		memberService.insertMember(vo);
		
		return "/main";
	}
	
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("member") MemberVO vo	
		, @RequestParam(value = "member_profile_image") MultipartFile member_profile_url, HttpSession session) throws IOException {
		
		String path = FileUtills.serverUploadFile(member_profile_url);
		vo.setMember_profile_url(path);
		memberService.updateMember(vo);
		session.setAttribute("userNickname", memberService.getMember(vo).getMember_nickname());
		session.setAttribute("userProfile", memberService.getMember(vo).getMember_profile_url());
		
		System.out.println(vo.getMember_profile_url()); //파일경로 확인
		return "redirect:/main";
	}
	
	@RequestMapping("/getMember")
	public String getMember(MemberVO vo, HttpServletRequest request, Model model) {
//		HttpSession session = request.getSession();
//		vo.setMember_id(session.getAttribute("userId").toString());  // 세션으로 넘길떄 
		
		HttpSession session = request.getSession();
  	    String userId = (String) session.getAttribute("userId");
  	    
  	   if (userId != null && userId.equals("admin@test.com")) {
  		   return "forward:/AdminGetMemberList";
 	    }
		
		model.addAttribute("member", memberService.getMember(vo));
		model.addAttribute("memberBoardList",memberService.memberBoardList(vo));
		model.addAttribute("memberCommentList",memberService.memberCommentList(vo));
		model.addAttribute("memberLikeList", memberService.memberLikeList(vo));
		return "/mypage_main";
	}
	
	@RequestMapping("/deleteMember")
	public String deleteMember(MemberVO vo, HttpServletRequest request) {
		memberService.deleteMember(vo);
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main";
	}
	
	//회원게시물 조회
	@RequestMapping("/memberBoardList")
	public String memberBoardList(MemberVO vo, Model model) {
		model.addAttribute("memberBoardList",memberService.memberBoardList(vo));
		
		return "/mypage_main"; //테스트용
	}
	//회원댓글 조회
	@RequestMapping("/memberCommentList")
	public String memberCommentList(MemberVO vo, Model model) {
		model.addAttribute("memberCommentList",memberService.memberCommentList(vo));
		
		return "/mypage_main"; //테스트용
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginMember(MemberVO vo) {
		vo.setMember_id("admin@test.com");
		vo.setMember_password("1234");
		
		return "/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginMember(MemberVO vo, HttpSession session, Model model)throws IllegalAccessException {
		if(vo.getMember_id() == null || vo.getMember_id() == "") {
			throw new IllegalAccessException("아이디는 반드시 입력해야합니다.");
		}
/*
		String a = vo.getMember_id();
		if (a != null && a.equals("admin@test.com")) {
  		   
			return "/AdminPage.jsp?type=M";
		}
	*/	
		if(memberService.loginMember(vo) != null) {
			session.setAttribute("userNickname", memberService.loginMember(vo).getMember_nickname());
			session.setAttribute("userId", memberService.loginMember(vo).getMember_id());
			session.setAttribute("userProfile", memberService.loginMember(vo).getMember_profile_url());
			// session.setMaxInactiveInterval(60*60); 세션 유지시간 지정(단위:초)- 우선순위가 제일 높은 방법 
			
			model.addAttribute("member",memberService.getMember(vo));
			
			return "redirect:main";
		} else {
			return "/login";
		}
	}
	
	//아이디 찾기
	@RequestMapping("/findMemberId")
	@ResponseBody
	public String findMemberId(MemberVO vo, Model model) {
		String id = memberService.findMemberId(vo);
		
		if(id == null) {
			return null;
		} else {
			return id;
		}
	}
	
	//비밀번호 찾기
	@RequestMapping("/findMemberPassword")
	@ResponseBody
	public String findMemberPassword(MemberVO vo) {
		String password = memberService.findMemberPassword(vo);
		
		if(password == null) {
			return null;
		} else {
			return password;
		}
	}
	
	/*--------------유효성---------------------*/
	
	//아이디 중복체크
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(MemberVO vo) {
		
		int cnt = memberService.checkId(vo);
		return cnt;
	}
	//핸드폰 중복체크
	@RequestMapping("/checkPhoneNumber")
	@ResponseBody
	public int checkPhoneNumber(MemberVO vo) {
		
		int cnt = memberService.checkPhoneNumber(vo);
		return cnt;
	}
	//닉네임 중복체크 
	@RequestMapping("/checkNickname")
	@ResponseBody
	public int checkNickname(MemberVO vo) {
		
		int cnt = memberService.checkNickname(vo);
		return cnt;
	}
	
	//비밀번호 로그인 체크
	@RequestMapping("/checkPassword")
	@ResponseBody
	public int checkPassword(MemberVO vo) {
		
		int cnt = memberService.checkPassword(vo);
		return cnt;
	}

}
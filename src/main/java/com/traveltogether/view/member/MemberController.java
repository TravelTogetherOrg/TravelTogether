package com.traveltogether.view.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.common.utill.FileUtills;
import com.traveltogether.biz.festival.FestivalVO;
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
		
		return "/main.do";
	}
	
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("member") MemberVO vo	
		, @RequestParam(value = "member_profile_image") MultipartFile member_profile_url) throws IOException {
		
		String path = FileUtills.serverUploadFile(member_profile_url);
		vo.setMember_profile_url(path);
		memberService.updateMember(vo);
		
		System.out.println(vo.getMember_profile_url()); //파일경로 확인
		return "/views/mypage_main.jsp";
	}

	/* 로그인 처리(admin) */
	@RequestMapping("/getMember.do")
	public String getMember(MemberVO vo, HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");

	    // 로그인한 사용자가 관리자(admin)인 경우에는 AdminPage로 이동
	    if (userId != null && userId.equals("admin@test.com")) {
	        return "redirect:/views/AdminPage.jsp";
	    }

	    // 일반 사용자인 경우에는 mypage_main.jsp로 이동
	    model.addAttribute("member", memberService.getMember(vo));
	    return "/views/mypage_main.jsp";
	}

	   
	 //관리자용 
	
	 //회원삭제
	@RequestMapping("/AdminDeleteMember.do")
	public String AdminDeleteMember(MemberVO vo, HttpServletRequest request) {
	    memberService.AdminDeleteMember(vo);
	    HttpSession session = request.getSession();
	    session.invalidate();
	    
	    // 삭제 후에 그대로 회원 리스트 페이지로 이동
	    return "redirect:/views/getMemberList.do";
	}
	
	//축제삭제 
	@RequestMapping("/AdminDeleteFestival.do")
	public String AdminDeleteFestival(FestivalVO vo, HttpServletRequest request) {
	    memberService.AdminDeleteFestival(vo);
	    HttpSession session = request.getSession();
	    session.invalidate();
	    
	    // 삭제 후에 그대로 회원 리스트 페이지로 이동
	    return "redirect:/views/festivalList.do";
	}
	
	//게시판삭제
	@RequestMapping("/AdminDeleteBoard.do")
	public String AdminDeleteBoard(BoardVO vo, HttpServletRequest request) {
	    memberService.AdminDeleteBoard(vo);
	    HttpSession session = request.getSession();
	    session.invalidate();
	    
	    // 삭제 후에 그대로 회원 리스트 페이지로 이동
	    return "redirect:/views/memberBoardList.do";
	}
	
	// 회원리스트조회(관리자계정 노출X)
	@RequestMapping("/views/getMemberList.do")
	public String getMemberList(MemberVO vo, Model model) {
	    model.addAttribute("type", "M");
	    List<MemberVO> memberList = memberService.getMemberList(vo);

	    // "admin@test.com" 계정은 자기 자신의 정보를 삭제함으로 표시되면 안됨
	    // 따라서, "admin@test.com" 계정의 정보를 제외하고 리스트에 추가
	    List<MemberVO> filteredList = new ArrayList<>();
	    for (MemberVO member : memberList) {
	        if (!member.getMember_id().equals("admin@test.com")) {
	            filteredList.add(member);
	        }
	    }

	    model.addAttribute("memberList", filteredList);
	    return "AdminPage.jsp?type=M";
	}
		
			
	
	//축제리스트조회
	@RequestMapping("/views/festivalList.do")
	public String festivalList(MemberVO vo, Model model) {
		model.addAttribute("type", "F");
		model.addAttribute("festivalList",memberService.festivalList(vo));
		return "AdminPage.jsp?type=F";
	
	}
	
	//회원게시물 조회
	@RequestMapping("/views/memberBoardList.do")
	public String memberBoardList(MemberVO vo, Model model) {
		model.addAttribute("type", "B");
		model.addAttribute("memberBoardList",memberService.memberBoardList(vo));
		return "AdminPage.jsp?type=B";     
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
			
			return "/main.do";
		} else {
			return "/views/login.jsp";
		}
	}
	
	@RequestMapping("/views/logout.do")
	public String logoutMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main.do";
	}
	
	
}

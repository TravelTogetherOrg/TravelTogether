package com.traveltogether.view.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.admin.AdminService;
import com.traveltogether.biz.admin.AdminVO;
import com.traveltogether.biz.member.MemberService;
import com.traveltogether.biz.member.MemberVO;

@Controller
@SessionAttributes("admin")
public class AdminController {
	
		     @Autowired 
			  private AdminService adminService;

		
		     
		 	/*
		 	  
		 	// MemberController 에서 실행하면 잘됨 ㅠㅠ
		 	@RequestMapping("/getMember")
		 	public String getMember(MemberVO vo, HttpServletRequest request, Model model) {
		 		HttpSession session = request.getSession();
		  	    String userId = (String) session.getAttribute("userId");
		  	    
		  	   if (userId != null && userId.equals("admin@test.com")) {
		 	        return "redirect:/views/AdminPage.jsp";
		 	    }
//		 		HttpSession session = request.getSession();
//		 		vo.setMember_id(session.getAttribute("userId").toString());  // 세션으로 넘길떄 
		 		model.addAttribute("member", memberService.getMember(vo));
		 		model.addAttribute("memberBoardList",memberService.memberBoardList(vo));
		 		model.addAttribute("memberCommentList",memberService.memberCommentList(vo));
		 		model.addAttribute("memberLikeList", memberService.memberLikeList(vo));
		 		return "/views/mypage_main.jsp";
		 	}

		 	*/	    
	
		     
		/*
		     //로그인부분 (MemberController 로그인 부분이랑 header에서 충돌부분 확인해야됨)
		     @RequestMapping("/adminLogin")
		     public String adminLogin(AdminVO vo, HttpServletRequest request) {
		         HttpSession session = request.getSession();
		         String userId = (String) session.getAttribute("userId");

		         if (userId != null && userId.equals("admin@test.com")) {
		             return "redirect:/biz/views/AdminPage.jsp";
		       
		         	} else {
		             // 일반 사용자인 경우에는 로그인 페이지로 리다이렉트
		             return "redirect:/login.jsp";
		         }
		     }
	
		 */   
		     
		     // 회원리스트조회
		 		@RequestMapping("/adminGetMemberList.do")
				public String AdminGetMemberList(AdminVO vo, Model model) {
				    model.addAttribute("type", "M");
				    List<AdminVO> memberList = adminService.AdminGetMemberList(vo);

				    // "admin@test.com" 계정은 자기 자신의 정보를 삭제함으로 표시되면 안됨
				    // 따라서, "admin@test.com" 계정의 정보를 제외하고 리스트에 추가
				    List<AdminVO> filteredList = new ArrayList<>();
				    for (AdminVO member : memberList) {
				        if (!member.getMember_id().equals("admin@test.com")) {
				            filteredList.add(member);
				        }
				    }

				    model.addAttribute("memberList", filteredList);
				    System.out.println(vo.toString());
				    return "views/AdminPage.jsp?type=M";
				}
					
						
				
				//축제리스트조회
				@RequestMapping("/AdminFestivalList.do")
				public String AdminFestivalList(AdminVO vo, Model model) {
					model.addAttribute("type", "F");
					model.addAttribute("AdminFestivalList",adminService.AdminFestivalList(vo));
					return "/views/AdminPage.jsp?type=F";
				
				}
				
				//회원게시물 조회
				@RequestMapping("/AdminMemberBoardList.do")
				public String AdminMemberBoardList(AdminVO vo, Model model) {
					model.addAttribute("type", "B");
					model.addAttribute("AdminMemberBoardList",adminService.AdminMemberBoardList(vo));
					return "/views/AdminPage.jsp?type=B";     
				}
			
				
				//회원삭제 
				@RequestMapping("/AdminDeleteMember.do")
				public String AdminDeleteMember(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteMember(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "/adminGetMemberList.do";
				}
				
				//축제삭제 
				@RequestMapping("/AdminDeleteFestival.do")
				public String AdminDeleteFestival(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteFestival(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "redirect:/views/festivalList.do";
				}
				
				//게시판삭제
				@RequestMapping("/AdminDeleteBoard.do")
				public String AdminDeleteBoard(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteBoard(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "redirect:/views/memberBoardList.do";
				}

}
				
	


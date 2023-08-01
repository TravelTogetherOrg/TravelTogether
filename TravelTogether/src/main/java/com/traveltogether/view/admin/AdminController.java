package com.traveltogether.view.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.admin.AdminService;
import com.traveltogether.biz.admin.AdminVO;

@Controller
@SessionAttributes("admin")
public class AdminController {
	
		     @Autowired 
			  private AdminService adminService;
			  
		      private List<AdminVO> memberList;

		
		     
		 	/*
		 	  
		 	// MemberController 에서 실행
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
		 		@RequestMapping("/AdminGetMemberList")
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
				    return "AdminPage.jsp?type=M";
				}
					
						
				
				//축제리스트조회
				@RequestMapping("/AdminFestivalList")
				public String AdminFestivalList(AdminVO vo, Model model) {
					model.addAttribute("type", "F");
					model.addAttribute("AdminFestivalList",adminService.AdminFestivalList(vo));
					return "AdminPage.jsp?type=F";
				
				}
				
				//회원게시물 조회
				@RequestMapping("/AdminMemberBoardList")
				public String AdminMemberBoardList(AdminVO vo, Model model) {
					model.addAttribute("type", "B");
					model.addAttribute("AdminMemberBoardList",adminService.AdminMemberBoardList(vo));
					return "AdminPage.jsp?type=B";     
				}
				
				
				
			
				/*--------------------------------------------------------*/
				
				
				
				
				//회원삭제 
				@RequestMapping("/AdminDeleteMember")
				public String AdminDeleteMember(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteMember(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "redirect:/AdminGetMemberList";
				}
				
				//축제삭제 
				@RequestMapping("/AdminDeleteFestival")
				public String AdminDeleteFestival(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteFestival(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "redirect:/AdminFestivalList";
				}
				
				//게시판삭제
				@RequestMapping("/AdminDeleteBoard")
				public String AdminDeleteBoard(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteBoard(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "redirect:/AdminMemberBoardList";
				}
				
				
				/*------------------페이지네이션-----------------*/
				
				@GetMapping("/AdminPage")
				public String showProductManagement(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int itemsPerPage, @RequestParam(required = false) String keyword, Model model, HttpSession session) {
				    // ... 이전 코드 생략 ...

				    // 검색어가 있을 경우, 해당 검색어로 필터링된 목록을 가져옴
				    if (keyword != null && !keyword.trim().isEmpty()) {
				        memberList = filterMemberListByKeyword(memberList, keyword);
				    }

				    // 전체 페이지 수 계산
				    int totalPages = (int) Math.ceil((double) memberList.size() / itemsPerPage);

				    // 요청한 페이지 번호가 유효하지 않은 경우 기본값으로 설정
				    if (page <= 0) {
				        page = 1;
				    } else if (page > totalPages) {
				        page = totalPages;
				    }

				    // 페이징을 위한 회원 리스트
				    int startIndex = (page - 1) * itemsPerPage;
				    int endIndex = Math.min(startIndex + itemsPerPage, memberList.size());
				    List<AdminVO> pagedMemberList = memberList.subList(startIndex, endIndex);

				    // 총 회원 수를 JSP에 전달
				    model.addAttribute("totalMember", memberList.size());

				    // 페이징된 회원 리스트를 JSP에 전달
				    model.addAttribute("memberList", pagedMemberList);
				    model.addAttribute("totalPages", totalPages);
				    model.addAttribute("currentPage", page);

				    return "/AdminPage";
				}

				// 회원 목록에 검색어로 필터링하는 메서드
				@SuppressWarnings("unused")
				private List<AdminVO> filterMemberListByKeyword(List<AdminVO> memberList, String keyword) {
				    List<AdminVO> filteredList = new ArrayList<>();
				    for (AdminVO member : memberList) {
				        // 검색어로 회원 아이디 또는 회원명에 포함되는지 확인
				        if (member.getMember_id().contains(keyword) || member.getMember_name().contains(keyword)) {
				            filteredList.add(member);
				        }
				    }
				    return filteredList;
				}
				
			


}
				
	


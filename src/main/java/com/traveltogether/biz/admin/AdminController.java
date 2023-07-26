/*
package com.traveltogether.biz.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

 
@Controller 
public class AdminController {
	
		     @Autowired 
			  private AdminServiceimpl adminService;
		 
			 
			// 회원리스트조회
				@RequestMapping("getMemberList.do")
				public String getMemberList(AdminVO vo, Model model) {
				    model.addAttribute("type", "M");
				    List<AdminVO> memberList = adminService.getMemberList(vo);

				    // "admin@test.com" 계정은 자기 자신의 정보를 삭제함으로 표시되면 안됨
				    // 따라서, "admin@test.com" 계정의 정보를 제외하고 리스트에 추가
				    List<AdminVO> filteredList = new ArrayList<>();
				    for (AdminVO member : memberList) {
				        if (!member.getMember_id().equals("admin@test.com")) {
				            filteredList.add(member);
				        }
				    }

				    model.addAttribute("memberList", filteredList);
				    return "AdminPage?type=M";
				}
					
						
				
				//축제리스트조회
				@RequestMapping("/views/festivalList.do")
				public String festivalList(AdminVO vo, Model model) {
					model.addAttribute("type", "F");
					model.addAttribute("festivalList",adminService.festivalList(vo));
					return "AdminPage.jsp?type=F";
				
				}
				
				//회원게시물 조회
				@RequestMapping("/views/memberBoardList.do")
				public String memberBoardList(AdminVO vo, Model model) {
					model.addAttribute("type", "B");
					model.addAttribute("memberBoardList",adminService.memberBoardList(vo));
					return "AdminPage.jsp?type=B";     
				}
			
				
				//회원삭제 
				@RequestMapping("/AdminDeleteMember.do")
				public String AdminDeleteMember(AdminVO vo, HttpServletRequest request) {
				    adminService.AdminDeleteMember(vo);
				    HttpSession session = request.getSession();
				    session.invalidate();
				    
				    // 삭제 후에 그대로 회원 리스트 페이지로 이동
				    return "redirect:/views/getMemberList.do";
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
				
	

*/
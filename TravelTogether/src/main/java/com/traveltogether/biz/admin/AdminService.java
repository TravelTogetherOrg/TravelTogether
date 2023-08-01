package com.traveltogether.biz.admin;

import java.util.List;

public interface AdminService {

	// 회원조회(관리자용)
	List<AdminVO> AdminGetMemberList(AdminVO vo);
	
	//회원 게시글 조회
	List<AdminVO> AdminMemberBoardList(AdminVO vo);
	
	//축제 리스트 조회
	List<AdminVO> AdminFestivalList(AdminVO vo);
	
	void AdminDeleteMember(AdminVO vo);
	
	void AdminDeleteFestival(AdminVO vo);
	
	void AdminDeleteBoard(AdminVO vo);

	AdminVO getMember(AdminVO vo);
	
	boolean adminLogin(AdminVO vo);

	

}


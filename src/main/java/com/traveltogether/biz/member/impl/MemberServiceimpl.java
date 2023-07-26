package com.traveltogether.biz.member.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.member.MemberVO;

@Service
public class MemberServiceimpl {
	
	@Autowired
	private MemberDAO_mybatis memberDAO;

	
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}


	public void AdminDeleteMember(MemberVO vo) {
		memberDAO.AdminDeleteMember(vo);
	}
	
	public void AdminDeleteFestival(FestivalVO vo) {
		memberDAO.AdminDeleteFestival(vo);
	}

	public void AdminDeleteBoard(BoardVO vo) {
		memberDAO.AdminDeleteBoard(vo);
	}
	
	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}
	
	public List<MemberVO> memberBoardList(MemberVO vo) {
		return memberDAO.memberBoardList(vo);
	}
	
	public List<MemberVO> festivalList(MemberVO vo){
		return memberDAO.festivalList(vo);
	}
	
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	
	
	public MemberVO loginMember(MemberVO vo) {
		return memberDAO.loginMember(vo);
	}
	
	


	public int selectMemberAllCount() {
		// TODO Auto-generated method stub
		return 0;
	}


	public Object selectMemberAll(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}


	public Object selectOne(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}


	


}	

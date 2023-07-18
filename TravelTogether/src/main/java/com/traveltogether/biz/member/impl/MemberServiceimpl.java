package com.traveltogether.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.member.MemberService;
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


	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	
	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}
	
	public MemberVO loginMember(MemberVO vo) {
		return memberDAO.loginMember(vo);
	}
	
	public List<MemberVO> memberBoardList(MemberVO vo) {
		return memberDAO.memberBoardList(vo);
	}
}	

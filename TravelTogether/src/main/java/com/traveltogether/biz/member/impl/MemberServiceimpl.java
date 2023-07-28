package com.traveltogether.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.member.MemberService;
import com.traveltogether.biz.member.MemberVO;

@Service
public class MemberServiceimpl implements MemberService {
	
	@Autowired
	private MemberDAO_mybatis memberDAO;

	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}
	
	@Override
	public MemberVO loginMember(MemberVO vo) {
		return memberDAO.loginMember(vo);
	}
	
	@Override
	public List<MemberVO> memberBoardList(MemberVO vo) {
		return memberDAO.memberBoardList(vo);
	}
	
	@Override
	public List<MemberVO> memberCommentList(MemberVO vo) {
		return memberDAO.memberCommentList(vo);
	}
	
	@Override
	public int checkId(MemberVO vo) {
		return memberDAO.checkId(vo);
	}
	
	@Override
	public int checkPhoneNumber(MemberVO vo) {
		return memberDAO.checkPhoneNumber(vo);
	}
	
	@Override
	public int checkNickname(MemberVO vo) {
		return memberDAO.checkNickname(vo);
	}
	
	@Override
	public int checkPassword(MemberVO vo) {
		return memberDAO.checkPassword(vo);
	}
	
	//  KHS 추가 멤버별 like 리스트
	@Override
	public List<MemberVO> memberLikeList(MemberVO vo){
	    return memberDAO.memberLikeList(vo);
	}
	
	@Override
	public String findMemberId(MemberVO vo) {
		return memberDAO.findMemberId(vo);
	}
	
	@Override
	public String findMemberPassword(MemberVO vo) {
		return memberDAO.findMemberPassword(vo);
	}
	
}	
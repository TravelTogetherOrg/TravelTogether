package com.traveltogether.biz.member.impl;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.member.MemberVO;

@Repository
public class MemberDAO_mybatis { 
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberDAO.insertMember",vo);
	}
	
	//회원 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember",vo);
	}
	
	//회원삭제
	public void AdminDeleteMember(MemberVO vo) {
		mybatis.delete("MemberDAO.AdminDeleteMember",vo);
	}
	
	//축제삭제
	public void AdminDeleteFestival(FestivalVO vo) {
		mybatis.delete("MemberDAO.AdminDeleteFestival",vo);
	}
	
	//게시판 글 삭제
	public void AdminDeleteBoard(BoardVO vo) {
		mybatis.delete("MemberDAO.AdminDeleteBoard",vo);
	}
	
	//회원 게시글
	public List<MemberVO> memberBoardList(MemberVO vo){
		return mybatis.selectList("MemberDAO.memberBoardList",vo);
	}

	public List<MemberVO> festivalList(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MemberDAO.festivalList",vo);
	}
	
	//회원리스트
	public List<MemberVO> getMemberList(MemberVO vo){
		return mybatis.selectList("MemberDAO.getMemberList",vo);
	}

	
	//회원정보
	public MemberVO getMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getMember",vo);
	}
	
	//로그인
	public MemberVO loginMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.loginMember",vo);
	}
	
	
}

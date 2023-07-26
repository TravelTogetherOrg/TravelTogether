package com.traveltogether.biz.member;

import java.util.List;

public interface MemberService {
	
	//로그인
	MemberVO loginMember(MemberVO vo);
	
	//회원등록
	void insertMember(MemberVO vo);
	
	//회원수정
	void updateMember(MemberVO vo);
	
	//회원 삭제,탈퇴
	void deleteMember(MemberVO vo);
	
	//회원 상세 조회
	MemberVO getMember(MemberVO vo);
	
	// 회원조회(관리자용)
	List<MemberVO> getMemberList(MemberVO vo);
	
	//회원 게시글 조회
	List<MemberVO> memberBoardList(MemberVO vo);
	
	//회원 댓글 조회
	List<MemberVO> memberCommentList(MemberVO vo);
	
    // KHS 추가 좋아요 조회
    List<MemberVO> memberLikeList(MemberVO vo);
	
	//아이디 중복체크
	int checkId(MemberVO vo);
	
	//아이디 중복체크
	int checkPhoneNumber(MemberVO vo);
	
	//닉네임 중복체크 
	int checkNickname(MemberVO vo);
	
	//비밀번호 유효성
	int checkPassword(MemberVO vo);
	
	//아이디 찾기
	String findMemberId(MemberVO vo);
	
	//비밀번호 찾기 
	String findMemberPassword(MemberVO vo);
}

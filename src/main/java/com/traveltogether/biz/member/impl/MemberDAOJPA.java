package com.traveltogether.biz.member.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.traveltogether.biz.member.MemberVO;

@Repository
public class MemberDAOJPA {
	
	@PersistenceContext
	private EntityManager em;
	
	//회원가입
	public void insertMember(MemberVO vo) {
		System.out.println("===insertMember");
		em.persist(vo);
	}
	
	//회원 수정
	public void updateMember(MemberVO vo) {
		System.out.println("===updateMember");
		em.merge(vo);
	}
	//삭제
	public void deletemMember(MemberVO vo) {
		System.out.println("===deleteMember");
		em.remove(em.find(MemberVO.class, vo.getMember_id()));
	}
	//상세정보
	public MemberVO getMember(MemberVO vo) {
		System.out.println("===getMember");
		return em.find(MemberVO.class, vo.getMember_id());
	}
	//전체조회
	public List<MemberVO> getMemberList(MemberVO vo){
		System.out.println("===getMemberList");
		return em.createQuery("from MemberVO b order by b.member_id desc").getResultList();
		
	//회원 게시글 조회
		
	//회원 댓글 조회
	}
}

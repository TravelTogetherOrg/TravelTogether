/*
package com.traveltogether.biz.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO_mybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
		//회원 게시글
		public List<AdminVO> memberBoardList(AdminVO vo){
			return mybatis.selectList("AdminDAO.memberBoardList",vo);
		}
		
		//축제리스트
		public List<AdminVO> festivalList(AdminVO vo) {
			// TODO Auto-generated method stub
			return mybatis.selectList("AdminDAO.festivalList",vo);
		}
		
		//회원리스트
		public List<AdminVO> getMemberList(AdminVO vo){
			return mybatis.selectList("AdminDAO.getMemberList",vo);
		}
	
		
		//회원삭제
		public void AdminDeleteMember(AdminVO vo) {
			mybatis.delete("AdminDAO.AdminDeleteMember",vo);
		}
		
		//축제삭제
		public void AdminDeleteFestival(AdminVO vo) {
			mybatis.delete("AdminDAO.AdminDeleteFestival",vo);
		}
		
		//축제삭제
		public void AdminDeleteBoard(AdminVO vo) {
			mybatis.delete("AdminDAO.AdminDeleteBoard",vo);
		}
		
		
}

*/
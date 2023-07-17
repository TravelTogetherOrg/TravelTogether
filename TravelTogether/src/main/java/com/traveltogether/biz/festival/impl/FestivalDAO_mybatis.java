package com.traveltogether.biz.festival.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.member.MemberVO;


@Repository
public class FestivalDAO_mybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * //��� public void insertFestival(FestivalVO vo) {
	 * mybatis.insert("FestivalDAO.insertBoard",vo); } //���� public void
	 * updateFestival(FestivalVO vo) { mybatis.update("FestivalDAO.updateBoard",vo);
	 * } //���� public void deleteFestival(FestivalVO vo) {
	 * mybatis.delete("FestivalDAO.deleteBoard",vo); }
	 * 
	 * //������ public FestivalVO getFestival(FestivalVO vo) { return
	 * mybatis.selectOne("FestivalDAO.getBoard",vo); }
	 */
	
	public FestivalVO getFestival(FestivalVO vo) {
		return mybatis.selectOne("FestivalDAO.getFestival",vo); 
	}
	
	//7���� ����Ʈ ��ȸ
	public List<FestivalVO> getFestivalList_Month_All(FestivalVO vo) {	
		return mybatis.selectList("FestivalDAO.getFestivalList_Month_All",vo);
	}
	
	// 7���� ���ּ� ��ȸ
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		
		return mybatis.selectList("FestivalDAO.getFestivalList_Month",vo);
	}
	
	// 7���� �ش����� ����Ʈ�� ��ȸ
	
	// ���ƿ� ����
	public void festival_Like(FestivalVO vo) {
		mybatis.insert("FestivalDAO.festival_Like", vo);
	}
	
	public void festival_Delete_Like(FestivalVO vo) {
		mybatis.delete("FestivalDAO.festival_Delete_Like", vo);
	}
	
	// ���ƿ� �ߴ��� ���ߴ��� Ȯ��
	public FestivalVO isFestival_Liked(FestivalVO vo) {
		return mybatis.selectOne("FestivalDAO.isFestival_Liked", vo);
		
	}
	
    // Ư�� �佺Ƽ���� ���ƿ� �� ��������
    public int getFestivalLikeCount(FestivalVO vo) {
        return mybatis.selectOne("FestivalDAO.getFestivalLikeCount", vo);
    }

}

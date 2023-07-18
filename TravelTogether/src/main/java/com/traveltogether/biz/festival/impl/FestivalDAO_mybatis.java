package com.traveltogether.biz.festival.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.traveltogether.biz.festival.FestivalVO;


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
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		return mybatis.selectList("FestivalDAO.getFestivalList_Month",vo);
	}
	
	/* 김초율 추가 */
	public List<FestivalVO> getRegionFestivals(String region){
		return mybatis.selectList("FestivalDAO.getRegionFestivals", region);
	}

}

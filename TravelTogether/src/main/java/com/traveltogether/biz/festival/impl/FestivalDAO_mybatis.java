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
	 * //등록 public void insertFestival(FestivalVO vo) {
	 * mybatis.insert("FestivalDAO.insertBoard",vo); } //수정 public void
	 * updateFestival(FestivalVO vo) { mybatis.update("FestivalDAO.updateBoard",vo);
	 * } //삭제 public void deleteFestival(FestivalVO vo) {
	 * mybatis.delete("FestivalDAO.deleteBoard",vo); }
	 * 
	 * //상세정보 public FestivalVO getFestival(FestivalVO vo) { return
	 * mybatis.selectOne("FestivalDAO.getBoard",vo); }
	 */
	
	public FestivalVO getFestival(FestivalVO vo) {
		return mybatis.selectOne("FestivalDAO.getFestival",vo); 
	}
	
	//7월달 리스트 조회
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		return mybatis.selectList("FestivalDAO.getFestivalList_Month",vo);
	}

}

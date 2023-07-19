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
	public List<FestivalVO> getFestivalList_Month_All(FestivalVO vo) {	
		return mybatis.selectList("FestivalDAO.getFestivalList_Month_All",vo);
	}
	
	// 7월달 상세주소 조회
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		
		return mybatis.selectList("FestivalDAO.getFestivalList_Month",vo);
	}
	
    // 메인에 보여질 좋아요 수에 따른 축제들
    public List<FestivalVO> getFestivalLikeList(FestivalVO vo){
    	
    	return mybatis.selectList("FestivalDAO.mainFestivalLikeCount",vo);
    }
    
    //
    public List<FestivalVO> getFestivalRandomList(FestivalVO vo){
    	return mybatis.selectList("FestivalDAO.getFestivalRandomList", vo);
    }
	
	// 7월달 해당지역 리스트만 조회
	
	// 좋아요 구현
	public void festival_Like(FestivalVO vo) {
		mybatis.insert("FestivalDAO.festival_Like", vo);
	}
	
	public void festival_Delete_Like(FestivalVO vo) {
		mybatis.delete("FestivalDAO.festival_Delete_Like", vo);
	}
	
	// 좋아요 했는지 안했는지 확인
	public FestivalVO isFestival_Liked(FestivalVO vo) {
		return mybatis.selectOne("FestivalDAO.isFestival_Liked", vo);
		
	}
	
    // 특정 페스티벌의 좋아요 수 가져오기
    public int getFestivalLikeCount(FestivalVO vo) {
        return mybatis.selectOne("FestivalDAO.getFestivalLikeCount", vo);
    }
    

	/* 김초율 추가 */
	public List<FestivalVO> getRegionFestivals(String region){
		return mybatis.selectList("FestivalDAO.getRegionFestivals", region);
	}

}

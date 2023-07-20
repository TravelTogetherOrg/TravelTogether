package com.traveltogether.biz.festival.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.festival.FestivalVO;

@Service
public class FestivalServiceimpl {
	
	@Autowired
	private FestivalDAO_mybatis festivalDAO;
	
	public void festival_Like(FestivalVO vo) {
		festivalDAO.festival_Like(vo);
	}
	
	public void festival_Delete_Like(FestivalVO vo) {
		festivalDAO.festival_Delete_Like(vo);
	}
	
	public boolean isFestivalLiked(FestivalVO vo) {
	    FestivalVO result = festivalDAO.isFestival_Liked(vo);
	    return result != null;
	}
	
	
	public int getLikeCount(FestivalVO vo) {
		return festivalDAO.getFestivalLikeCount(vo);
	}
	
	
	public FestivalVO getFestival(FestivalVO vo) { 
		return festivalDAO.getFestival(vo); 
		}
	
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		if (vo.getFestival_address() == null || vo.getFestival_address().isEmpty()) {
			return festivalDAO.getFestivalList_Month_All(vo);
		}
		
		return festivalDAO.getFestivalList_Month(vo);
	}

	public List<FestivalVO> getFestivalLikeList(FestivalVO vo){
		return festivalDAO.getFestivalLikeList(vo);
	}
	
	public List<FestivalVO> getFestivalRandomList(FestivalVO vo){
		return festivalDAO.getFestivalRandomList(vo);
	}
	
	/* 김초율 추가 */
	public List<FestivalVO> getRegionFestivals(String region){
		return festivalDAO.getRegionFestivals(region);
	}


}

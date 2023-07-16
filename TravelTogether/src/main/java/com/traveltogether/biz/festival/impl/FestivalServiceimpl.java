package com.traveltogether.biz.festival.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.festival.FestivalVO;

@Service
public class FestivalServiceimpl {
	
	@Autowired
	private FestivalDAO_mybatis festivalDAO;
	
	/*
	 * public void insertFestival(FestivalVO vo) { festivalDAO.insertFestival(vo); }
	 * 
	 * public void updateFestival(FestivalVO vo) { festivalDAO.updateFestival(vo); }
	 * 
	 * public void deleteFestival(FestivalVO vo) { festivalDAO.deleteFestival(vo); }
	 * 
	 * 
	 */
	
	public void festival_Like(FestivalVO vo) {
		festivalDAO.festival_Like(vo);
	}
	
	public void festival_Delete_Like(FestivalVO vo) {
		festivalDAO.festival_Delete_Like(vo);
	}
	
	public boolean isFestivalLiked(String userId, String festivalName) {
	    FestivalVO vo = new FestivalVO();
	    vo.setMember_id(userId);
	    vo.setFestival_name(festivalName);
	    boolean isLiked = festivalDAO.isFestival_Liked(vo);
	    return isLiked;
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
	
	
	
	

}

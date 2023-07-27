package com.traveltogether.biz.festival.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.festival.FestivalService;
import com.traveltogether.biz.festival.FestivalVO;

@Service
public class FestivalServiceimpl implements FestivalService {
	
	@Autowired
	private FestivalDAO_mybatis festivalDAO;
	
	@Override
	public void festival_Like(FestivalVO vo) {
		festivalDAO.festival_Like(vo);
	}
	
	@Override
	public void festival_Delete_Like(FestivalVO vo) {
		festivalDAO.festival_Delete_Like(vo);
	}
	
	@Override
	public boolean isFestivalLiked(FestivalVO vo) {
	    FestivalVO result = festivalDAO.isFestival_Liked(vo);
	    return result != null;
	}
	
	@Override
	public int getLikeCount(FestivalVO vo) {
		return festivalDAO.getFestivalLikeCount(vo);
	}
	
	@Override
	public FestivalVO getFestival(FestivalVO vo) { 
		return festivalDAO.getFestival(vo); 
		}
	
	@Override
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		if (vo.getFestival_address() == null || vo.getFestival_address().isEmpty()) {
			return festivalDAO.getFestivalList_Month_All(vo);
		}
		
		return festivalDAO.getFestivalList_Month(vo);
	}
	
	@Override
	public List<FestivalVO> getFestivalLikeList(FestivalVO vo){
		return festivalDAO.getFestivalLikeList(vo);
	}
	
	@Override
	public List<FestivalVO> getFestivalRandomList(FestivalVO vo){
		return festivalDAO.getFestivalRandomList(vo);
	}
	
	@Override
	/* 김초율 추가 */
	public List<FestivalVO> getRegionFestivals(String region){
		return festivalDAO.getRegionFestivals(region);
	}


}

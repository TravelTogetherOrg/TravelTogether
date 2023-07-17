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
	
	public FestivalVO getFestival(FestivalVO vo) { 
		return festivalDAO.getFestival(vo); 
		}
	
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo){
		return festivalDAO.getFestivalList_Month(vo);
	}
	
	public List<FestivalVO> getRegionFestivals(String region){
		return festivalDAO.getRegionFestivals(region);
	}
	

}

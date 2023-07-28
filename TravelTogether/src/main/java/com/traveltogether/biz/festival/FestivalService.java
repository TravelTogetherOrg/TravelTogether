package com.traveltogether.biz.festival;

import java.util.List;

public interface FestivalService {
	
	public void festival_Like(FestivalVO vo);
	public void festival_Delete_Like(FestivalVO vo);
	public boolean isFestivalLiked(FestivalVO vo);
	public int getLikeCount(FestivalVO vo);
	public FestivalVO getFestival(FestivalVO vo);
	public List<FestivalVO> getFestivalList_Month(FestivalVO vo);
	public List<FestivalVO> getFestivalLikeList(FestivalVO vo);
	public List<FestivalVO> getFestivalRandomList(FestivalVO vo);
	public List<FestivalVO> getRegionFestivals(String region);
}

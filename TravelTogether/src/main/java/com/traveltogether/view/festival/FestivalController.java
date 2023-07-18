package com.traveltogether.view.festival;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.festival.impl.FestivalServiceimpl;

@Controller
@SessionAttributes("festival")
public class FestivalController {
	
	@Autowired
	private FestivalServiceimpl festivalService;
	
	
	
	@RequestMapping("/getFestival.do")
	public String getFestival(FestivalVO vo, Model model) {
		
		model.addAttribute("festival", festivalService.getFestival(vo));
		return "views/festivalDetail.jsp";
		
	}
	
	@RequestMapping("/getFestivalList_Month.do")
	public String getFestivalList_Month(FestivalVO vo, Model model){
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo));
		return "views/festivalList.jsp";
	}
	
	/* 김초율 추가 */
	@RequestMapping("/getRegionFestivals.do")
	@ResponseBody
	public Map<Object,Object> getRegionFestivals(@RequestBody String region) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("festivals", festivalService.getRegionFestivals(region));
		
		return map;
	}
	
}

package com.traveltogether.view.festival;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
}

package com.traveltogether.view.festival;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.festival.impl.FestivalServiceimpl;
import com.traveltogether.biz.member.MemberVO;

@Controller
@SessionAttributes("festival")
public class FestivalController {
	
	@Autowired
	private FestivalServiceimpl festivalService;
	
	
	@RequestMapping(value = "/festivalLike.do", method = RequestMethod.GET)
	public String getFestivalLike(FestivalVO vo, HttpSession session, Model model) {
	    String encodedFestivalName = URLEncoder.encode(vo.getFestival_name(), StandardCharsets.UTF_8);
	    String userId = (String) session.getAttribute("userId");

	    boolean isLiked = festivalService.isFestivalLiked(vo);
	    
	    if (isLiked) {
	    	festivalService.festival_Delete_Like(vo);	    	
	    } else {
	    	festivalService.festival_Like(vo);
	    }
	    return "redirect:getFestival.do?festival_name=" + encodedFestivalName + "&member_Id=" + userId;
	}
    
  
    
	
	@RequestMapping("/getFestival.do")
	public String getFestival(FestivalVO vo, Model model, HttpSession session) {
		
	    String encodedFestivalName = URLEncoder.encode(vo.getFestival_name(), StandardCharsets.UTF_8);
	    String decodedFestivalName = URLDecoder.decode(encodedFestivalName, StandardCharsets.UTF_8);
	    String userId = (String) session.getAttribute("userId");
	    
	    vo.setFestival_name(decodedFestivalName);
	    vo.setMember_id(userId);
	    
	    boolean isLiked = festivalService.isFestivalLiked(vo);
	    
	    model.addAttribute("isLiked", isLiked);
    	model.addAttribute("festivalCount", festivalService.getLikeCount(vo));
		model.addAttribute("festival", festivalService.getFestival(vo));
		
		return "views/festivalDetail.jsp";
		
	}
	
	
	@RequestMapping("/getFestivalList_Month.do")
	public String getFestivalList_Month(FestivalVO vo, Model model){
	
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo));
		return "views/festivalList.jsp";
	}
	
	@RequestMapping("/main.jsp")
	public String main(FestivalVO vo, Model model){
	
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo));
		return "main.jsp";
	}
	
	
}

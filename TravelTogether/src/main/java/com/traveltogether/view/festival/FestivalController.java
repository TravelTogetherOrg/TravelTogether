package com.traveltogether.view.festival;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.festival.FestivalService;
import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.festival.impl.FestivalServiceimpl;
import com.traveltogether.biz.member.MemberVO;

@Controller
@SessionAttributes("festival")
public class FestivalController {
	
	@Autowired
	private FestivalService festivalService;
	
	
	@RequestMapping(value = "/festivalLike", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFestivalLike(FestivalVO vo, HttpSession session, Model model) {
	    String encodedFestivalName = URLEncoder.encode(vo.getFestival_name(), StandardCharsets.UTF_8);
		/* String userId = (String) session.getAttribute("userId"); */

	    boolean isLiked = festivalService.isFestivalLiked(vo);
	    
	    if (isLiked) {
	    	festivalService.festival_Delete_Like(vo);	    	
	    } else {
	    	festivalService.festival_Like(vo);
	    }
        // JSON 응답 데이터 생성
        Map<String, Object> response = new HashMap<>();
        response.put("isLiked", isLiked);
        response.put("festivalCount", festivalService.getLikeCount(vo));
        return response;
    }
    
  
    
	
	@RequestMapping("/getFestival")
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
		
		return "festivalDetail";
		
	}
	
	
	@RequestMapping("/getFestivalList_Month")
	public String getFestivalList_Month(FestivalVO vo, Model model){
	
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo));
		return "festivalList";
	}

	/* 김초율 추가 */
	@RequestMapping("/getRegionFestivals")
	@ResponseBody
	public Map<Object,Object> getRegionFestivals(@RequestBody String region) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("festivals", festivalService.getRegionFestivals(region));
		
		return map;
	}
	
}

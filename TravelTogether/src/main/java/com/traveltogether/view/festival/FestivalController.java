package com.traveltogether.view.festival;

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
	public String getFestivalLike(FestivalVO vo, HttpSession session) {
	    String encodedFestivalName = URLEncoder.encode(vo.getFestival_name(), StandardCharsets.UTF_8);
	    String userId = (String)session.getAttribute("userId");
	    

	    
	    boolean isLiked = festivalService.isFestivalLiked(userId, vo.getFestival_name());
	    if (isLiked) {
	        festivalService.festival_Delete_Like(vo);
	    } else {
	        festivalService.festival_Like(vo);
	    }
	    
	    return "redirect:getFestival.do?festival_name=" + encodedFestivalName;
	}
		
	
    @RequestMapping(value = "/isFestivalLiked.do", method = RequestMethod.GET)
    @ResponseBody
    public Integer isFestivalLiked(@RequestParam("festival_name") String festivalName,
                                   @RequestParam("member_id") String memberId) {
        return festivalService.isFestivalLiked(memberId, festivalName) ? 1 : 0;
    }
    
    
//    ÁÁ¾Æ¿ä °¹¼ö
    @RequestMapping(value = "/getLikeCount.do", method = RequestMethod.GET)
	public String getLikeCount(FestivalVO vo, Model model) {
    	String encodedFestivalName = URLEncoder.encode(vo.getFestival_name(), StandardCharsets.UTF_8);  	
    	
    	System.out.println(festivalService.getLikeCount(vo));

    	return "redirect:getFestival.do?festival_name=" + encodedFestivalName;
    
    }
    
	
	@RequestMapping("/getFestival.do")
	public String getFestival(FestivalVO vo, Model model) {
    	model.addAttribute("festivalCount", festivalService.getLikeCount(vo));
		model.addAttribute("festival", festivalService.getFestival(vo));
		
		return "views/festivalDetail.jsp";
		
	}
	
	@RequestMapping("/getFestivalList_Month.do")
	public String getFestivalList_Month(FestivalVO vo, Model model){
	    //String encodedFestivalName = URLEncoder.encode(vo.getFestival_address(), StandardCharsets.UTF_8);
	    	
		//vo.setFestival_address(encodedFestivalName);
	
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo));
		return "views/festivalList.jsp";
	}
	

	
	
}

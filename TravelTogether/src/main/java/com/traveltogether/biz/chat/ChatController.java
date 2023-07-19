package com.traveltogether.biz.chat;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/ChatRoomList.do", method = RequestMethod.GET)
	public String login() {
		/* return "<c:out value='${context}'/>/views/chatRoomList.jsp"; */
		return "/views/chatRoomList.jsp";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	 * public String loginProcess(@RequestParam String id, HttpServletRequest
	 * request) {
	 * 
	 * logger.info("Welcome "+id); HttpSession session = request.getSession();
	 * session.setAttribute("id", id); return "chat.jsp"; }
	 */
	
	@RequestMapping(value = "/ChatRoom.do", method = RequestMethod.GET)
	public String loginProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String NickName = (String) session.getAttribute("userNickname");
    	session.setAttribute("NickName", NickName);
		return "/views/chatRoom.jsp";
	}
	
}
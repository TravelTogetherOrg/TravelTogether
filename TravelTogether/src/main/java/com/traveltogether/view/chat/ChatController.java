package com.traveltogether.view.chat;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.board.BoardPageCreate;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.Criteria;
import com.traveltogether.biz.chat.ChatCountVO;
import com.traveltogether.biz.chat.ChatRoomVO;
import com.traveltogether.biz.chat.impl.ChatRoomServiceImpl;
import com.traveltogether.biz.festival.FestivalService;
import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.festival.impl.FestivalServiceimpl;
import com.traveltogether.biz.member.MemberVO;
import com.traveltogether.biz.member.impl.MemberServiceimpl;

@Controller
public class ChatController {
	
	@Autowired
	private ChatRoomServiceImpl chatService;
	
	@Autowired
	private FestivalService festivalService;
	
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value = "ChatRoomList", method = RequestMethod.GET)
	public String roomList(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo, Model model)  {
		HttpSession session = request.getSession();
		if(session.getAttribute("chatNumber") != null) {
			int roomNumber = (int) session.getAttribute("chatNumber");
			String userId = (String)session.getAttribute("userId");
			vo.setMember_id(userId);
			chatService.deleteChatUser(vo);
			voo.setChat_number(roomNumber);
			
			if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
				chatService.deleteChatRoom(voo); 
		}	
	}
		model.addAttribute("chatRoomList",chatService.getChatList(vo));
		model.addAttribute("NumberOfPeople", chatService.getNumberOfPeople(voo)); 
		return "chatRoomList";
	}
	
	@RequestMapping(value = "insertChat", method = RequestMethod.GET)
	public String insertChatRoom(HttpServletRequest request, ChatRoomVO vo,ChatCountVO voo, Model model)throws IOException {
		chatService.createChat(vo);
		chatService.chatRoomUserInsert(voo);
	    HttpSession session = request.getSession();
	    session.setAttribute("chatTitle", vo.getChat_title());
		session.setAttribute("chatNumber", voo.getChat_number());
		return "chatRoom";
	}

	@RequestMapping(value = "ChatRoom", method = RequestMethod.GET)
	public String joinChatRoom(HttpServletRequest request, ChatRoomVO vo, @RequestParam("chat_number") int chatNumber,  
								@RequestParam("chat_title") String chatTitle, @RequestParam("member_id") String memeberID,
								Model model, ChatCountVO voo) {
		chatService.chatRoomUserInsert(voo);
		HttpSession session = request.getSession();
		session.setAttribute("chatNumber", vo.getChat_number());
		session.setAttribute("chatTitle", vo.getChat_title());
		return "chatRoom";
	}
	
	@RequestMapping(value = "deleteChatUser", method = RequestMethod.GET)
	public String deleteChatUser(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo, Model model) throws IOException{
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String chatTitle = (String) session.getAttribute("chatTitle");
		int roomNumber = (int) session.getAttribute("chatNumber");

		vo.setMember_id(userId);
		chatService.deleteChatUser(vo);
		voo.setChat_number(roomNumber);

		if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
			chatService.deleteChatRoom(voo); 
		}
		return "redirect:ChatRoomList";
	}
	
	@RequestMapping(value = "/main")
	public String main(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo, Model model, FestivalVO vo2) throws IOException{
		

		model.addAttribute("festivalLikeList", festivalService.getFestivalLikeList(vo2));
		model.addAttribute("festivalRandomList", festivalService.getFestivalRandomList(vo2));
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("chatNumber") != null) {
		int roomNumber = (int) session.getAttribute("chatNumber");
		String userId = (String)session.getAttribute("userId");
		vo.setMember_id(userId);
		chatService.deleteChatUser(vo);
		voo.setChat_number(roomNumber);
		
		if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
			chatService.deleteChatRoom(voo); 
	}
	
}
		return "main";
	}
	
	@RequestMapping(value = "/boardList")
	public String boardList(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo, Model model, Criteria criteria, ModelMap model2) throws IOException{
		HttpSession session = request.getSession();
		
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalBoardCount());
		
		model.addAttribute("boardList", boardService.getBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		model.addAttribute("comments", boardService.getTotalCommentCount());
		
		if(session.getAttribute("chatNumber") != null) {
			int roomNumber = (int) session.getAttribute("chatNumber");
			String userId = (String)session.getAttribute("userId");
			vo.setMember_id(userId);
			chatService.deleteChatUser(vo);
			voo.setChat_number(roomNumber);
			
			if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
				chatService.deleteChatRoom(voo); 
		}
	}
	return "boardList";
}
	
	@RequestMapping(value = "/getFestivalList_Month", method = RequestMethod.GET)
	public String getFestivalList_Month(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo, FestivalVO vo2, Model model) throws IOException{
		HttpSession session = request.getSession();
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo2));
		if(session.getAttribute("chatNumber") != null) {
			int roomNumber = (int) session.getAttribute("chatNumber");
			String userId = (String)session.getAttribute("userId");
			vo.setMember_id(userId);
			chatService.deleteChatUser(vo);
			voo.setChat_number(roomNumber);
			
			if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
				chatService.deleteChatRoom(voo); 
		}
	}
	return "festivalList";
}
	
	@RequestMapping("/logout")
	public String logoutMember(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("chatNumber") != null) {
			int roomNumber = (int) session.getAttribute("chatNumber");
			String userId = (String)session.getAttribute("userId");
			vo.setMember_id(userId);
			chatService.deleteChatUser(vo);
			voo.setChat_number(roomNumber);
			
			if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
				chatService.deleteChatRoom(voo); 
		}
		
	}
		session.invalidate();
		return "/main";
	}
	
	
	
	
	
	
}
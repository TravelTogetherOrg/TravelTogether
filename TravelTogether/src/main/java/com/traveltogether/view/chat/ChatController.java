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
import com.traveltogether.biz.chat.ChatCountDTO;
import com.traveltogether.biz.chat.ChatRoomDTO;
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
	
	@RequestMapping(value = "ChatRoomList", method = RequestMethod.GET)
	public String roomList(HttpServletRequest request, ChatRoomDTO dto, ChatCountDTO dto2, Model model)throws IOException  {
		HttpSession session = request.getSession();
		if(session.getAttribute("chatNumber") != null) {
			deleteChat(request, dto, dto2);
		}
		model.addAttribute("chatRoomList",chatService.getChatList(dto));
		model.addAttribute("NumberOfPeople", chatService.getNumberOfPeople(dto2)); 
		return "chatRoomList";
	}
	
	@RequestMapping(value = "insertChat", method = RequestMethod.GET)
	public String insertChatRoom(HttpServletRequest request, ChatRoomDTO dto, ChatCountDTO dto2, Model model)throws IOException {
		chatService.createChat(dto);
		chatService.chatRoomUserInsert(dto2);
		HttpSession session = request.getSession();
		session.setAttribute("chatNumber", dto2.getChatNumber());
		model.addAttribute("chatRoom", chatService.getChatRoom(dto2.getChatNumber()));
		return "chatRoom";
	}

	@RequestMapping(value = "ChatRoom", method = RequestMethod.GET)
	public String joinChatRoom(HttpServletRequest request, ChatRoomDTO dto, ChatCountDTO dto2, Model model)throws IOException {
		chatService.chatRoomUserInsert(dto2);
		HttpSession session = request.getSession();
		session.setAttribute("chatNumber", dto2.getChatNumber());
		model.addAttribute("chatRoom", chatService.getChatRoom(dto2.getChatNumber()));
		return "chatRoom";
	}
	
	@RequestMapping(value = "deleteChatUser")
	public String deleteChatUser(HttpServletRequest request, ChatRoomDTO dto, ChatCountDTO dto2, Model model) throws IOException{
		HttpSession session = request.getSession();
		if(session.getAttribute("chatNumber") != null) {
			deleteChat(request, dto, dto2);
		}
		return "redirect:ChatRoomList";
	}
	
	/* header */	
	@RequestMapping(value = "/main")
	public String main(HttpServletRequest request, ChatRoomDTO dto, ChatCountDTO dto2, Model model, FestivalVO vo2) throws IOException{
		model.addAttribute("festivalLikeList", festivalService.getFestivalLikeList(vo2));
		model.addAttribute("festivalRandomList", festivalService.getFestivalRandomList(vo2));
		HttpSession session = request.getSession();
	
		return "main";
	}
		
	@RequestMapping(value = "/boardList")
	public String boardList(HttpServletRequest request, ChatRoomDTO vo, ChatCountDTO voo, Model model, Criteria criteria, ModelMap model2) throws IOException{
		HttpSession session = request.getSession();
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalBoardCount());
		model.addAttribute("boardList", boardService.getBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		model.addAttribute("comments", boardService.getTotalCommentCount());
		if(session.getAttribute("chatNumber") != null) {
			deleteChat(request, vo, voo);
		}
		return "boardList";
	}
	
	@RequestMapping(value = "/getFestivalList_Month", method = RequestMethod.GET)
	public String getFestivalList_Month(HttpServletRequest request, ChatRoomDTO vo, ChatCountDTO voo, FestivalVO vo2, Model model) throws IOException{
		HttpSession session = request.getSession();
		model.addAttribute("festivalList", festivalService.getFestivalList_Month(vo2));
		if(session.getAttribute("chatNumber") != null) {
			deleteChat(request, vo, voo);
		}
	return "festivalList";
	}
	
	@RequestMapping("/logout")
	public String logoutMember(HttpServletRequest request, ChatRoomDTO vo, ChatCountDTO voo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("chatNumber") != null) {
			deleteChat(request, vo, voo);
		}
		session.invalidate();
		return "redirect:main";
	}
	
	public void deleteChat(HttpServletRequest request, ChatRoomDTO dto, ChatCountDTO dto2) {
		HttpSession session = request.getSession();
		int roomNumber = (int) session.getAttribute("chatNumber");
		String userId = (String)session.getAttribute("userId");
		dto.setMemberId(userId);
		dto2.setChatNumber(roomNumber);
		chatService.deleteChatUser(dto);
		if(chatService.getChatRoomUser(dto2) == null || chatService.getChatRoomUser(dto2) == 0) {
			chatService.deleteChatRoom(dto2); 
		}
	}
}
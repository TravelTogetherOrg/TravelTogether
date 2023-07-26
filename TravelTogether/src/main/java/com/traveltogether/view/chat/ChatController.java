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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.traveltogether.biz.chat.ChatCountVO;
import com.traveltogether.biz.chat.ChatRoomVO;
import com.traveltogether.biz.chat.impl.ChatRoomServiceImpl;
import com.traveltogether.biz.member.MemberVO;
import com.traveltogether.biz.member.impl.MemberServiceimpl;

@Controller
public class ChatController {
	
	@Autowired
	private ChatRoomServiceImpl chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value = "/ChatRoomList.do", method = RequestMethod.GET)
	public String roomList(ChatRoomVO vo, ChatCountVO voo, Model model)  {
		model.addAttribute("chatRoomList",chatService.getChatList(vo));
		model.addAttribute("NumberOfPeople", chatService.getNumberOfPeople(voo)); 
		return "/views/chatRoomList.jsp";
	}
	
	@RequestMapping(value = "/insertChat.do", method = RequestMethod.GET)
	public String insertChatRoom(HttpServletRequest request, ChatRoomVO vo,ChatCountVO voo, Model model)throws IOException {
		chatService.createChat(vo);
		chatService.chatRoomUserInsert(voo);
	    HttpSession session = request.getSession();
	    session.setAttribute("chatTitle", vo.getChat_title());
		session.setAttribute("chatNumber", voo.getChat_number());
		return "/views/chatRoom.jsp";
	}

	@RequestMapping(value = "/ChatRoom.do", method = RequestMethod.GET)
	public String joinChatRoom(HttpServletRequest request, ChatRoomVO vo, @RequestParam("chat_number") int chatNumber,  
								@RequestParam("chat_title") String chatTitle, @RequestParam("member_id") String memeberID,
								Model model, ChatCountVO voo) {
		chatService.chatRoomUserInsert(voo);
		HttpSession session = request.getSession();
		session.setAttribute("chatNumber", vo.getChat_number());
		session.setAttribute("chatTitle", vo.getChat_title());
		return "/views/chatRoom.jsp";
	}
	
	@RequestMapping(value = "/deleteChatUser.do", method = RequestMethod.GET)
	public String deleteChatUser(HttpServletRequest request, ChatRoomVO vo, ChatCountVO voo, Model model) throws IOException{
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String chatTitle = (String) session.getAttribute("chatTitle");
		int roomNumber = (int) session.getAttribute("chatNumber");

	    System.out.println("2번입니다");
		vo.setMember_id(userId);
		chatService.deleteChatUser(vo);
		/* voo.setChat_title(chatTitle); */
		voo.setChat_number(roomNumber);

		if(chatService.getChatRoomUser(voo) == null || chatService.getChatRoomUser(voo) == 0) {
			chatService.deleteChatRoom(voo); 
		}
		  System.out.println("3번입니다");
		return "/ChatRoomList.do";
	}
}
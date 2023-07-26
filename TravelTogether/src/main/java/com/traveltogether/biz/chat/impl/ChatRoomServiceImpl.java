package com.traveltogether.biz.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.chat.ChatCountVO;
import com.traveltogether.biz.chat.ChatRoomService;
import com.traveltogether.biz.chat.ChatRoomVO;
import com.traveltogether.biz.member.impl.MemberDAO_mybatis;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	@Autowired
	private ChatRoomDAO chatRoomDAO;


	public void createChat(ChatRoomVO vo) {
		chatRoomDAO.CreateChat(vo);
		
	}


	
	public List<ChatRoomVO> getChatList(ChatRoomVO vo) {
		return chatRoomDAO.getChatList(vo);
	}
	
	
	public void chatRoomUserInsert (ChatCountVO vo) {
		 chatRoomDAO.chatRoomUserInsert(vo);
	}
	
	
	public List<ChatCountVO> getNumberOfPeople(ChatCountVO vo) {
		 return chatRoomDAO.getNumberOfPeople(vo);
		 
	}
	 
	
	public Integer getChatRoomUser(ChatCountVO vo){
		 return chatRoomDAO.getChatRoomUser(vo);
	}
	 
	
	public void deleteChatRoom(ChatCountVO vo) {
		chatRoomDAO.deleteChatRoom(vo);
	}
	
	public void deleteChatUser(ChatRoomVO vo) {
		chatRoomDAO.deleteChatUser(vo);
	}





}
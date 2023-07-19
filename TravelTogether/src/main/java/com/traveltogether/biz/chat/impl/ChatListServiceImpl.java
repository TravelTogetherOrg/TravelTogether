package com.traveltogether.biz.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.chat.ChatListDAO;
import com.traveltogether.biz.chat.ChatListDTO;
import com.traveltogether.biz.member.impl.MemberDAO_mybatis;

@Service
public class ChatListServiceImpl {

	@Autowired
	private ChatListDAO chatListDAO;
	
	public void insertChat(ChatListDTO dto) {
		chatListDAO.insertChat(dto);
	}
	public void deleteChat(ChatListDTO dto) {
		chatListDAO.deleteChat(dto);
	}
	public List<ChatListDTO> getChatList(ChatListDTO dto){
		return chatListDAO.getChatList(dto);
	}
	
	
}

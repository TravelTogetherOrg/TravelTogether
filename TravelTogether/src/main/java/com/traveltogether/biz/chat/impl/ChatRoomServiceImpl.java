package com.traveltogether.biz.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.chat.ChatCountDTO;
import com.traveltogether.biz.chat.ChatRoomService;
import com.traveltogether.biz.chat.ChatRoomDTO;
import com.traveltogether.biz.member.impl.MemberDAO_mybatis;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	@Autowired
	private ChatRoomDAO chatRoomDAO;

	public void createChat(ChatRoomDTO dto) {
		chatRoomDAO.CreateChat(dto);
	}
	
	public List<ChatRoomDTO> getChatList(ChatRoomDTO dto) {
		return chatRoomDAO.getChatList(dto);
	}
	
	public void chatRoomUserInsert (ChatCountDTO dto) {
		 chatRoomDAO.chatRoomUserInsert(dto);
	}
	
	public List<ChatCountDTO> getNumberOfPeople(ChatCountDTO dto) {
		 return chatRoomDAO.getNumberOfPeople(dto);
		 
	}
	 
	public Integer getChatRoomUser(ChatCountDTO dto){
		 return chatRoomDAO.getChatRoomUser(dto);
	}
	 
	public void deleteChatRoom(ChatCountDTO dto) {
		chatRoomDAO.deleteChatRoom(dto);
	}
	
	public void deleteChatUser(ChatRoomDTO dto) {
		chatRoomDAO.deleteChatUser(dto);
	}

	public ChatRoomDTO getChatRoom(int number) {
		return chatRoomDAO.getChatRoom(number);
	}
	
}
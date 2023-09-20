package com.traveltogether.biz.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveltogether.biz.chat.ChatCountDTO;
import com.traveltogether.biz.chat.ChatRoomDTO;

@Repository
public class ChatRoomDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void CreateChat(ChatRoomDTO dto) {
		mybatis.insert("ChatRoomDAO.createChat", dto);
	}
	
	public List<ChatRoomDTO> getChatList(ChatRoomDTO dto) {
		return mybatis.selectList("ChatRoomDAO.getChatList", dto);
	}
	
	public void chatRoomUserInsert(ChatCountDTO dto) {
		mybatis.insert("ChatRoomDAO.chatRoomUserInsert", dto);
	}
	
	public void deleteChatUser(ChatRoomDTO dto) {
		mybatis.delete("ChatRoomDAO.deleteChatUser", dto);
	}

	public List<ChatCountDTO> getNumberOfPeople(ChatCountDTO dto) { 
		return mybatis.selectList("ChatRoomDAO.getNumberOfPeople", dto);
	}

	public Integer getChatRoomUser(ChatCountDTO dto){
		return mybatis.selectOne("ChatRoomDAO.getChatRoomUser", dto);
	}
	
	public void deleteChatRoom(ChatCountDTO dto) {
		 mybatis.delete("ChatRoomDAO.deleteChatRoom", dto);
	}
	 
	public ChatRoomDTO getChatRoom(int number){
		return mybatis.selectOne("ChatRoomDAO.getChatRoom", number);
	}
	
}

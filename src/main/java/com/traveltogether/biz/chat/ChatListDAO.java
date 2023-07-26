package com.traveltogether.biz.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatListDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertChat(ChatListDTO dto) {
		mybatis.insert("ChatListDAO.insertChat",dto);
	}
	
	public List<ChatListDTO> getChatList(ChatListDTO dto) {
		return mybatis.selectList("ChatListDAO.getChatList",dto);
	}
	
	public void deleteChat(ChatListDTO dto) {
		mybatis.delete("ChatListDAO.deleteChat",dto);
	}

}

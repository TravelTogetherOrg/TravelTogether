package com.traveltogether.biz.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveltogether.biz.chat.ChatCountVO;
import com.traveltogether.biz.chat.ChatRoomVO;



@Repository
public class ChatRoomDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	public void CreateChat(ChatRoomVO vo) {
		mybatis.insert("ChatRoomDAO.createChat", vo);
	}

	public List<ChatRoomVO> getChatList(ChatRoomVO vo) {
		return mybatis.selectList("ChatRoomDAO.getChatList", vo);
	}

	public void chatRoomUserInsert(ChatCountVO vo) {
		mybatis.insert("ChatRoomDAO.chatRoomUserInsert", vo);
	}

	public void deleteChatUser(ChatRoomVO vo) {
		mybatis.delete("ChatRoomDAO.deleteChatUser", vo);
	}

	 public List<ChatCountVO> getNumberOfPeople(ChatCountVO vo) { 
		 return mybatis.selectList("ChatRoomDAO.getNumberOfPeople", vo);
		 }
	 
	
	 public Integer getChatRoomUser(ChatCountVO vo){
		 return mybatis.selectOne("ChatRoomDAO.getChatRoomUser", vo);
	 }
	 public void deleteChatRoom(ChatCountVO vo) {
		 mybatis.delete("ChatRoomDAO.deleteChatRoom", vo);
	 }
	 
	
	
}

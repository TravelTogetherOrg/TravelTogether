package com.traveltogether.biz.chat;

public interface ChatListService {

	void insertChat(ChatListDTO dto);
	void getChatList(ChatListDTO dto);
	void deleteChat(ChatListDTO dto);
	
}

package com.traveltogether.biz.chat;

import java.util.List;

public interface ChatRoomService {

	 void createChat(ChatRoomVO vo);
	 List<ChatRoomVO> getChatList(ChatRoomVO vo);
	 void deleteChatUser(ChatRoomVO vo);
	 void chatRoomUserInsert(ChatCountVO vo);
	 List<ChatCountVO> getNumberOfPeople(ChatCountVO vo); 
	 Integer getChatRoomUser(ChatCountVO vo);
	 void deleteChatRoom(ChatCountVO vo);
	
}

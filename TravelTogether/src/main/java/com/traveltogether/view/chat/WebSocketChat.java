package com.traveltogether.view.chat;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.traveltogether.biz.chat.ChatCountDTO;
import com.traveltogether.biz.chat.ChatRoomDTO;
import com.traveltogether.biz.chat.impl.ChatRoomServiceImpl;

import java.nio.ByteBuffer;

@Controller
@ServerEndpoint(value="/echo/{userNickName}/{roomNumber}/{userId}")
public class WebSocketChat {
    private static final Map<String, String> nickNames = new HashMap<>();
    private static final Map<String, List<Session>> chatRooms = new HashMap<>();
    private static List<Session> targetSessions = new ArrayList<Session>();
    private List<String> roomNickNames = new ArrayList<>();
    
    @Autowired
	private ChatRoomServiceImpl chatService;
    @OnOpen
	public void onOpen(Session session, @PathParam("userNickName") String nickName,
    					@PathParam("roomNumber") String roomNumber) throws IOException {
    	nickNames.put(session.getId(), nickName);
        if(!chatRooms.containsKey(roomNumber)) {
        	chatRooms.put(roomNumber, new ArrayList<>());  // 해당 방 번호가 없을 경우 chatRooms에 추가.
        }
        chatRooms.get(roomNumber).add(session);
        targetSessions = chatRooms.get(roomNumber); //chatRooms맵에서 roomNumber에 해당하는 세션 목록을 가져옵니다. 
        for(Session targetSession : targetSessions) {
            if(!session.getId().equals(targetSession.getId())) { // 현재 클라이언트를 제외한 다른 모든 클라이언트에게 메시지를 보냄. 
                Basic basic = session.getBasicRemote();
                targetSession.getBasicRemote().sendText("NOTICE"+ nickName +"님이 입장하셨습니다");
            }
        }
        for(Session targetSession : targetSessions) {
        	roomNickNames.add(nickNames.get(targetSession.getId())); // roomNumber에 해당하는 세션의 nickName목록을 가져온 가져온 다음, 새로운 roomNickNames배열에 추가함.
        }for(Session sessions : targetSessions) {
            sessions.getBasicRemote().sendText("NICKNAMES:" + new Gson().toJson(roomNickNames)); // 채팅방 접속 유저 리스트 업데이트 
        }   
        getRoomSize(roomNumber);
    }
    
    @OnMessage
    public void onMessage(String message,Session session, @PathParam("userNickName") String nickName,
    					@PathParam("roomNumber") String roomNumber) throws IOException {
    	if(message.startsWith("/w")) { // 귓속말(/w로 시작하는 메시지)일경우
    		String targetNickName = message.split(",")[0];
           	String messageContext = message.split(",")[1];
         	targetNickName = targetNickName.substring("/w".length());
         	onlyOneMessage(nickName, targetNickName, messageContext, roomNumber);
        }else{
        	String sender = message.split(",")[1];
        	message = message.split(",")[0];
            Basic basic=session.getBasicRemote();
            basic.sendText(sender+":"+message);  
            sendAllSessionToMessage(session, sender, message, roomNumber);
        }
    }
       
    @OnClose
    public String onClose(Session session, @PathParam("userNickName") String nickName,
    					@PathParam("roomNumber") String roomNumber,
    					@PathParam("userId") String userId) throws IOException {
    	
    	roomNickNames.remove(nickName);
    	targetSessions = chatRooms.get(roomNumber);
    	if(targetSessions != null && targetSessions.contains(session)) { // 퇴장 후 채팅방 인원이 0명이 아닐경우 실행
    		targetSessions.remove(session);
    		for(Session targetSession : targetSessions) {
	        	if(!session.getId().equals(targetSession.getId())) {  // 나머지 클라이언트들에게 퇴장 알림 보내기
	        		targetSession.getBasicRemote().sendText("NOTICE" + nickName + "님이 퇴장하셨습니다");
	                for (Session s : targetSessions) {
	                	roomNickNames.add(nickNames.get(s.getId()));
	                }
	                targetSession.getBasicRemote().sendText("NICKNAMES:" + new Gson().toJson(roomNickNames));  //채팅방 접속 유저 리스트 업데이트 
	                getRoomSize(roomNumber);  // 채팅방 접속 인원 업데이트
	            } 	               
	        } 
    		chatRooms.remove(session);
	    }  
    	return "deleteChatUser";
    }

    private static void getRoomSize(String roomNumber) throws IOException { 
        if(chatRooms.containsKey(roomNumber)) { // 현재 채팅방 접속 인원 업데이트
            targetSessions = chatRooms.get(roomNumber);
            int roomSize = targetSessions.size();
            for (Session session : targetSessions) {
            	session.getBasicRemote().sendText("ROOM_SIZE:" + roomSize);
            }
        }
    }
 
	private void sendAllSessionToMessage(Session self, String sender, String message, String roomNumber) throws IOException {
		targetSessions = chatRooms.get(roomNumber);  // 모든 유저에게 메시지 보내기
			for(Session targetSession : targetSessions) {
	        	if(!self.getId().equals(targetSession.getId())) {
	                targetSession.getBasicRemote().sendText(sender+" : "+message);	                	
	        	}
	        }
	}

    private void onlyOneMessage(String nickName, String targetNickName, String messageContext, String roomNumber) throws IOException {
    	 targetSessions = chatRooms.get(roomNumber);  // 귓속말 보내기 기능(아이디 체크)
    	 for(Session targetSession : targetSessions) { 
    		 String targetNickName_1 = nickNames.get(targetSession.getId());
    		 if(targetNickName_1.equals(targetNickName)) {
    			 targetSession.getBasicRemote().sendText("$귓속말"+":"+nickName + ":" + messageContext+":"+targetNickName);
    		 }
    	 }
    }
}
    
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
import com.traveltogether.biz.chat.impl.ChatRoomServiceImpl;

import java.nio.ByteBuffer;

@Controller
@ServerEndpoint(value="/echo/{userNickName}/{roomNumber}/{userId}")
public class WebSocketChat {
	private static final String MESSAGE_PREFIX_ROOM_SIZE = "ROOM_SIZE:";
    private static final Map<String, String> nicknames = new HashMap<>();
    private static final Map<String, List<Session>> chatRooms = new HashMap<>();

    @Autowired
	private ChatRoomServiceImpl chatService;
	
    private static List<String> getAllNicknames() {
    	return new ArrayList<>(nicknames.values());
    }
    
    @OnOpen
    public void onOpen(Session session, @PathParam("userNickName") String nickName,
    					@PathParam("roomNumber") String roomNumber) throws IOException {
        nicknames.put(session.getId(), nickName);
        if(!chatRooms.containsKey(roomNumber)) {
            chatRooms.put(roomNumber, new ArrayList<>());
        }
        chatRooms.get(roomNumber).add(session);
        List<Session> targetSessions = chatRooms.get(roomNumber);
        for(Session targetSession : targetSessions) {
            if(!session.getId().equals(targetSession.getId())) {
                final Basic basic=session.getBasicRemote();
                targetSession.getBasicRemote().sendText("NOTICE"+ nickName +"님이 입장하셨습니다");
            }
        }
        List<String> roomNicknames = new ArrayList<>();
        	List<String> allNicknames = getAllNicknames();
        	for(Session targetSession : targetSessions) {
        		roomNicknames.add(nicknames.get(targetSession.getId()));
                }
        	for(Session sessions : targetSessions) {
        		sessions.getBasicRemote().sendText("NICKNAMES:" + new Gson().toJson(roomNicknames));
        		}      
        	broadcastRoomSize(roomNumber);
    	}
            
    private static void broadcastRoomSize(String roomNumber) throws IOException {
        if(chatRooms.containsKey(roomNumber)) {
            List<Session> targetSessions = chatRooms.get(roomNumber);
            int roomSize = targetSessions.size();
            String roomSizeStr = String.valueOf(roomSize);
            for (Session session : targetSessions) {
            	session.getBasicRemote().sendText(MESSAGE_PREFIX_ROOM_SIZE + roomSizeStr);
            }
        }
    }
 
	private void sendAllSessionToMessage(Session self, String sender, String message, String roomNumber) throws IOException {
		List<Session> targetSessions = chatRooms.get(roomNumber);
	        for(Session targetSession : targetSessions) {
	            if(!self.getId().equals(targetSession.getId())) {
	                targetSession.getBasicRemote().sendText(sender+" : "+message);	                	
	                }
                }
	}

    private void onlyOneMessage(String nickName, String targetNickName, String messagecontext, String roomNumber) throws IOException {
    	 List<Session> targetSessions = chatRooms.get(roomNumber);
    	 for(Session targetSession : targetSessions) {
    		 String targetNickName_1 = nicknames.get(targetSession.getId());
    		 if(targetNickName_1.equals(nickName)|| targetNickName_1.equals(targetNickName)) {
    			 targetSession.getBasicRemote().sendText("$귓속말"+":"+nickName + ":" + messagecontext+":"+targetNickName);
    		 }
    	 }
    		 
    }
    
    @OnMessage
    public void onMessage(String message,Session session, @PathParam("userNickName") String nickName,
    					@PathParam("roomNumber") String roomNumber) throws IOException {
    	if(message.startsWith("/w")) {
    		String targetNickName = message.split(",")[0];
           	String messagecontext = message.split(",")[1];
         	targetNickName = targetNickName.substring("/w".length());
         	onlyOneMessage(nickName, targetNickName, messagecontext, roomNumber);
        }else{
        	String sender = message.split(",")[1];
        	message = message.split(",")[0];
            final Basic basic=session.getBasicRemote();
            basic.sendText(sender+":"+message);  
            sendAllSessionToMessage(session, sender, message, roomNumber);
        }
    }
       
    @OnClose
    public String onClose(Session session, @PathParam("userNickName") String nickName,
    					@PathParam("roomNumber") String roomNumber,
    					@PathParam("userId") String userId) throws IOException {
    	    nicknames.remove(session.getId());
    	    List<Session> targetSessions = chatRooms.get(roomNumber);
    	    if(targetSessions != null && targetSessions.contains(session)) {
    	        targetSessions.remove(session);
    	        for(Session targetSession : targetSessions) {
    	        	if(!session.getId().equals(targetSession.getId())) {
    	        		targetSession.getBasicRemote().sendText("NOTICE" + nickName + "님이 퇴장하셨습니다");
    	                
    	                List<String> roomNicknames = new ArrayList<>();
    	                for (Session s : targetSessions) {
    	                    roomNicknames.add(nicknames.get(s.getId()));
    	                }
    	                targetSession.getBasicRemote().sendText("NICKNAMES:" + new Gson().toJson(roomNicknames));
    	                
    	                int roomSize = targetSessions.size();
    	                String roomSizeStr = String.valueOf(roomSize);
    	                targetSession.getBasicRemote().sendText(MESSAGE_PREFIX_ROOM_SIZE + roomSizeStr);   
    	            } 	               
    	        }    
    	        chatRooms.remove(session);
    	    }  
    	    return "deleteChatUser";
    	}
}
    
 

    

package com.traveltogether.biz.chat;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import java.nio.ByteBuffer;

@Controller
@ServerEndpoint(value="/echo.do/{userNickName}")
public class WebSocketChat {
	private static final String MESSAGE_PREFIX_ROOM_SIZE = "ROOM_SIZE:";
    private static final List<Session> sessionList=new ArrayList<Session>();
    private static final Map<String, String> nicknames = new HashMap<>();
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    
    public WebSocketChat() {
    	System.out.println("웹소켓(서버) 객체생성");
    }

    private static void broadcastMessage(String message) throws IOException {
        for (Session session : sessionList) {
        	session.getBasicRemote().sendText(message);   
        }
    }
  
    private static List<String> getAllNicknames() {
    	return new ArrayList<>(nicknames.values());
    }
    
    @OnOpen
    public void onOpen(Session session, @PathParam("userNickName") String nickName) throws IOException {
        logger.info("Open session id:"+session.getId());
        sessionList.add(session);
        nicknames.put(session.getId(), nickName);
       
            final Basic basic=session.getBasicRemote();
            sessionList.removeIf(s -> !s.isOpen());
            for(Session sessions : WebSocketChat.sessionList) {
            	if(!session.getId().equals(sessions.getId())){
            		sessions.getBasicRemote().sendText("NOTICE"+ nickName +"님이 입장하셨습니다");
            	}
            }
            List<String> allNicknames = getAllNicknames();
            for (Session sessions : WebSocketChat.sessionList) {
                    // JSON 형식으로 닉네임 목록을 전송 (닉네임 목록을 배열로 만들어 전송)
            	sessions.getBasicRemote().sendText("NICKNAMES:" + new Gson().toJson(allNicknames));
            }
            broadcastMessage(MESSAGE_PREFIX_ROOM_SIZE + sessionList.size());
    }
    
    private void sendAllSessionToMessage(Session self, String sender, String message) throws IOException {
            for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
    }
    
    private void onlyOneMessage(String nickName, String targetNickName, String messagecontext) throws IOException {
            for(Session sessions : WebSocketChat.sessionList) {
            	String targetNickName_1 = nicknames.get(sessions.getId());
            	if (targetNickName_1.equals(nickName)|| targetNickName_1.equals(targetNickName)) {
            		sessions.getBasicRemote().sendText("$귓속말"+":"+nickName + ":" + messagecontext+":"+targetNickName);
                    logger.info("2호 출력");
                    logger.info( "보낸사람: " + nickName);
                    logger.info(" 받는사람 : " + targetNickName);
                    logger.info("내용: "+messagecontext);
                    }
            	}
    }
       
    @OnMessage
    public void onMessage(String message,Session session, @PathParam("userNickName") String nickName) throws IOException {
    	if (message.startsWith("/w")) {
    		String targetNickName = message.split(",")[0];
           	String messagecontext = message.split(",")[1];
         	targetNickName = targetNickName.substring("/w".length());
         	logger.info( " 받는사람 : " + targetNickName);
         	logger.info("보낸사람: " + nickName);
         	logger.info("내용: "+messagecontext);
         	onlyOneMessage(nickName, targetNickName, messagecontext);
        }else{
        	String sender = message.split(",")[1];
        	message = message.split(",")[0];
        	logger.info("Message From "+sender + " : "+message);
            final Basic basic=session.getBasicRemote();
            basic.sendText(sender+":"+message);  
            sendAllSessionToMessage(session, sender, message);
        }
    }
       
    @OnClose
    public String onClose(Session session, @PathParam("userNickName") String nickName) throws IOException {
        	nicknames.remove(session.getId());
            final Basic basic=session.getBasicRemote();
            List<String> allNicknames = getAllNicknames();
            for(Session sessions : WebSocketChat.sessionList) {
            	if(!session.getId().equals(sessions.getId())){
            		sessions.getBasicRemote().sendText("NOTICE"+ nickName +"님이 퇴장하셨습니다");    	
            		sessions.getBasicRemote().sendText("NICKNAMES:" + new Gson().toJson(allNicknames));
            		sessionList.remove(session);
            		broadcastMessage(MESSAGE_PREFIX_ROOM_SIZE + sessionList.size());
            		break;
            	}
            }
            return "";
    }
}
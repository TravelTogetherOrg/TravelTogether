package com.traveltogether.biz.chat;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

@Controller
@ServerEndpoint(value="/echo.do/{userID}")
public class WebSocketChat {
	 private static final String MESSAGE_PREFIX_ROOM_SIZE = "ROOM_SIZE:";
	private HttpSession httpSession;
	public void setHttpSession(HttpSession httpSession) {
	    this.httpSession = httpSession;
	}
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    private static void broadcastChatRoomSize() {
        String message = MESSAGE_PREFIX_ROOM_SIZE + sessionList.size();
        broadcastMessage(message);
    }
    
    
    private static void broadcastMessage(String message) {
    	
        for (Session session : sessionList) {
            try {
                session.getBasicRemote().sendText(message);
              
            } catch (IOException e) {
                // 처리 중에 발생한 예외 처리
            }
        }
    }
  
    @OnOpen
    public void onOpen(Session session, @PathParam("userID") String ab) {
  
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            for(Session sessions : WebSocketChat.sessionList) {
            	if(!session.getId().equals(sessions.getId())){
            		
            		System.out.println("자바입니다");
            		sessions.getBasicRemote().sendText(ab +"님이 입장하셨씁니다");
            	}
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    
		broadcastChatRoomSize();
        
    }
    
    public static int getSessionCount() {
        return sessionList.size();
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    //첫번째 문제, 빌드패스 (톰캣 서버)
    // 두번째 문제 세션값 넘기고 받기(@PathParam 사용)
    
    
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    
    @OnClose
    public String onClose(Session session, @PathParam("userID") String ab) {
        logger.info("Session "+session.getId()+" has ended");
        try {
            final Basic basic=session.getBasicRemote();
            for(Session sessions : WebSocketChat.sessionList) {
            	if(!session.getId().equals(sessions.getId())){
            		sessions.getBasicRemote().sendText(ab +"님이 퇴장하셨습니다");
            		
            		  sessionList.remove(session);
            	   
            			broadcastChatRoomSize();
            	        
            	}
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
            
            
        }
      
        return "redirect:login.jsp";
    }
}
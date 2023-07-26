<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" session="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://kit.fontawesome.com/cd8f90f87a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${context}/resources/css/chatRoom.css">
<% String userNickName = (String)session.getAttribute("userNickname"); %>
<% int roomNumber = (int)session.getAttribute("chatNumber");%>
<% String userId = (String)session.getAttribute("userId"); %>
<% String chatTitle = (String)session.getAttribute("chatTitle"); %>

<title>박종권</title>
</head>
<body>
  <jsp:include page="header.jsp"/>
	<div id="container">
	  	<div id="main">
			<div id="chatMain">
		   		<div class="chatHeader">
		    		<div>
		    			<i class="fa-solid fa-angles-left" style="margin-left: 20px;" onclick="historyBack()"></i>
		    		</div>
		    			<p><%=chatTitle %></p>
		    		 <div>
		    			<i class="fa-solid fa-xmark 1.5x" style="margin-right: 20px;"></i>
		    		</div>  
		   		</div>
	  			<div class="inputContainer">
	     			<input type="text" id="sender" value="<%=userNickName %>" style="display: none;">
	   			</div>
				<div id="messages">
	      			<div class="notice" ></div>
	               	<div class="anotherMsg">
	                   <span class="anotherName"></span>
	                   <div class="anotherCurrentTime">
	                   		<span class="anotherText" class="msg"></span>
	                   </div>
					</div>
					<div class="myMsg">
	                	<span class="myName"></span>
	                  	<div class="myCurrentTime">
	                   		<span class="myText" class="msg"></span>
						</div>
					</div>
				</div>
	 			<div id="chatForm">
	     			<input type="text" id="messageInput" placeholder="메시지를 입력하세요">
	     			<button type="button" id="removeButton" onclick="clearText()">전체 지우기</button>
	     			<input type="submit" id="textSend" value="보내기" style="cursor: pointer">
				</div>  
			</div>
	  		<div id="memberWrap">
				<div id="memberList">
					<div id="memberHeader" >채팅방 인원 &nbsp;:&nbsp;&nbsp;
						<p id="roomSizeElement"></p>
	        		</div>
	                <div id="memberSelect">
						<div class="memberEl"></div> 
	                </div>
				</div>
				<div id="chatButton"></div>
			</div>
		</div>
	</div>
  <!-- websocket javascript -->
  <script type="text/javascript">
  
	history.pushState(null, null, location.href);
	window.onpopstate = function () {
	 	history.go(1);
	};
  
	document.onkeydown = doNotReload;
	function doNotReload(){
		if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116)){
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
		} 
	};
  
    var ws;
    var messages = document.getElementById("messages");
    var notice = document.querySelector(".notice")
    
    window.onload = function() {
        openSocket();
        notice.textContent = "채팅방에 입장하셨습니다.";
	};
    
    function openSocket() {	
		var url = "ws://localhost:8080/echo.do/"
		var userNickName = '<%=userNickName%>';
		var roomNumber = '<%=roomNumber%>';
		var userId = '<%=userId %>';
		
		url += userNickName + "/" + roomNumber + "/" + userId;
		
		ws = new WebSocket(url);
		ws.onmessage = onMessage;
		ws.onopen = onOpen;
		ws.onclose = onClose;
	};
    
   	function onMessage(event){
   		var message = event.data;
   		var nickname="";	
   		console.log(message);
	   	if(message.startsWith("ROOM_SIZE:")){
	   		var roomSize = message.substring(10);
	   		var formattedRoomSize = roomSize + "명";
	   		document.getElementById("roomSizeElement").textContent = formattedRoomSize;
  		}else if (message.startsWith("NICKNAMES:")) {
     		var nicknames = JSON.parse(message.substring(10));
      	    var memberListDiv = document.getElementById("memberSelect");
			memberListDiv.innerHTML = "";
      		var uniqueNicknames = new Set();
       		nicknames.forEach(function (nickname) {
            	if (nickname !== null) {
              	uniqueNicknames.add(nickname);
           		}
        	});
      		uniqueNicknames.forEach(function (nickname) {
				var memberDiv = document.createElement('div');
				memberDiv.classList.add("memberEl");
				memberDiv.textContent = nickname;
				memberListDiv.appendChild(memberDiv);
          	});
		}else if (message.startsWith("NOTICE")){
			var notice = message.substring(6);
    	    var noticeElement = document.createElement('div');
    	    noticeElement.classList.add('notice');
    	    noticeElement.textContent = notice;
    	    messages.appendChild(noticeElement);
  			scrollToBottom();
		} else {
			writeResponse(event.data);
      		scrollToBottom();
      	}
	};
    
	function onClose(){
   		window.location.href='/ChatRoomList.do';
	}
   	 
    function scrollToBottom() {
    	messages.scrollTop = messages.scrollHeight;
    };

    var messageInput = document.getElementById("messageInput");
    messageInput.addEventListener("keyup", function(event){
        if (event.keyCode === 13 || event.key === "Enter"){
			sendMessage();
      	}});
    
    var sendButton = document.getElementById('textSend');
    sendButton.addEventListener('click', function() {
    	sendMessage(); 
	});
    

    function sendMessage() {
		event.preventDefault(); // 기본 동작인 줄바꿈 방지
		var text = messageInput.value.trim(); // 입력된 메시지에서 양 끝 공백 제거
        if(text.startsWith("/w")){
        	 var tokens = text.split(" ");
             if (tokens.length >= 3) {
               targetNickname = tokens[1].trim();
               messageContent = tokens.slice(2).join(" ");
             } else {
               alert("잘못된 메시지 형식입니다.\n귓속말을 보내시려면 /w 닉네임 할말 형식으로 입력하세요.");
               return;
               messageInput.value = "";
             }
			var combinedMessage = "/w"+ targetNickname + "," + messageContent;
            ws.send(combinedMessage);
       }else if(text !== "") { // 메시지가 공백이 아닌 경우에만 전송
        	var sender = document.getElementById("sender").value;
        	ws.send(text + "," + sender);
       }
       messageInput.value = ""; // 메시지 전송 후 입력 필드를 비워줌
	};
    
    function closeSocket() {
		ws.close();
    }
    
    function clearText(){
		var messagesContainer = document.getElementById("messages");
			if (!confirm("대화내용을 삭제하시겠습니까?")) {
				return;
    	    }else {
    	    	while (messagesContainer.firstChild) {
    	        messagesContainer.removeChild(messagesContainer.firstChild);
    	   		}
       		}};
       		
    function historyBack(){
			if (!confirm("채팅방 목록으로 가시겠습니까?    (대화내용은 모두 삭제됩니다.)")){
				return;
    	    }else {
    			window.location.href='/deleteChatUser.do';
    	    }};
     
    function writeResponse(text) {
    	if(text.startsWith("$귓속말")){
	        var whisper_Container = text.split(':');
	        var whisper_Nickname = whisper_Container[1];
	     	var whisper_Message = whisper_Container[2];
	     	var whisper_TargetNickname = whisper_Container[3];
			var whisper_Sender = whisper_Nickname+"("+whisper_TargetNickname+"님에게 보낸 귓속말입니다)"
			var whisper_Receiver = whisper_Nickname+"("+whisper_Nickname+"님에게 받은 귓속말입니다)"
   		}
    	var messages = document.getElementById("messages");
    	var msgContainer = text.split(':');
 		var name = msgContainer[0];
 		var messageText = msgContainer[1];
      	var currentDate = new Date();
      	var formattedTime = currentDate.toLocaleString('ko-KR', {
      	    hour: 'numeric',
      	    minute: 'numeric',
      	    hour12: true,
		});
      	if(whisper_Nickname === '<%= userNickName%>' || name === '<%= userNickName%>'){
			var myMsgContainer = document.createElement('div');
      	    myMsgContainer.classList.add('myMsg');
      	    var myNameSpan = document.createElement('span');
     	    myNameSpan.classList.add('myName');
     	    var myTextSpan = document.createElement('span');
    	    myTextSpan.classList.add('myText', 'msg');
      	    if(text.startsWith("$귓속말")){
      	    	myNameSpan.style.color = "purple";
       	  		myNameSpan.textContent = whisper_Sender;	
				myTextSpan.textContent = whisper_Message;
      	    }else{
				myNameSpan.textContent = name;	
				myTextSpan.textContent = messageText;
			}
		var myProfileImage = document.createElement('img');
		myProfileImage.src = "${context}/resources/image/chatRoom/chatProfill.jpg";
		myProfileImage.style.width = "40px"; // 이미지의 너비 설정
		myProfileImage.style.height = "40px"; // 이미지의 높이 설정
		myProfileImage.style.borderRadius = "100px";
		var myCurrentTime = document.createElement('div');
		myCurrentTime.classList.add('myMsg');
		myCurrentTime.textContent = formattedTime;
 		
    	myNameSpan.appendChild(myProfileImage);	 
    	myCurrentTime.appendChild(myTextSpan);
      	myMsgContainer.appendChild(myNameSpan);
      	myMsgContainer.appendChild(myCurrentTime);
      	messages.appendChild(myMsgContainer);
      	scrollToBottom();
		}else{
			var anotherMsgContainer = document.createElement('div');
			anotherMsgContainer.classList.add('anotherMsg');
	      	var anotherNameSpan = document.createElement('span');
	     	anotherNameSpan.classList.add('anotherName');
	     	var anotherTextSpan = document.createElement('span');
		    anotherTextSpan.classList.add('anotherText', 'msg');
	      	if(text.startsWith("$귓속말")){
	      		anotherNameSpan.style.color = "purple";
	      		anotherNameSpan.textContent = whisper_Receiver;
		 	 	anotherTextSpan.textContent = whisper_Message;
	     	}else{
	    		anotherNameSpan.textContent = name;
	 	 		anotherTextSpan.textContent = messageText;
	      	}
	    var anotherProfileImage = document.createElement('img');
	    anotherProfileImage.src = "${context}/resources/image/chatRoom/chatProfill_2.jpg";
	    anotherProfileImage.style.width = "40px"; // 이미지의 너비 설정
	    anotherProfileImage.style.height = "40px"; // 이미지의 높이 설정
	    anotherProfileImage.style.borderRadius = "100px";
		var anotherCurrentTime = document.createElement('div');
		anotherCurrentTime.classList.add('anotherMsg'); 
		anotherCurrentTime.textContent = formattedTime;

		anotherCurrentTime.insertAdjacentElement('afterbegin', anotherTextSpan); 
		/* anotherMsgContainer.appendChild(anotherProfileImage); */
		anotherMsgContainer.appendChild(anotherNameSpan);
	  	anotherMsgContainer.appendChild(anotherCurrentTime);
		messages.appendChild(anotherMsgContainer);
	    scrollToBottom();
	    }
    }

  </script>
</body>
</html>


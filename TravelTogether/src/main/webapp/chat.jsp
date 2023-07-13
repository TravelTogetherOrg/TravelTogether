<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://kit.fontawesome.com/cd8f90f87a.js"crossorigin="anonymous"></script>
  <%
String att = (String)session.getAttribute("id");
%>

  
  
  <title>박종권</title>
  <style>
  @font-face {
  font-family: 'SUITE-Regular';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
  font-weight: 400;
  font-style: normal;
}
body {
	list-style: none;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}

#container {
   width: 600px;
    border: 1px solid #ddd;

}

.button-container {
	text-align: center;
	margin-bottom: 20px;
}

.input-container {
	display: flex;
	align-items: center;
}

.message-input {
	   display: block;
    width: 100%;
    height: 50px;
    border-top: 2px solid #f0f0f0;
}

.chat-button {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#messages {
	  height: 700px;
    overflow-y: auto;
    padding: 10px;
	overflow-y: auto;
	-ms-overflow-style: none;
	 
 
 }
::-webkit-scrollbar {
  display: none;
}

.chat-header {
	margin: 0px;
	padding: 0px;
 height: 60px;
    text-align: center;
    line-height: 60px;
    font-size: 25px;
      border-bottom: 1px solid #ddd;

        display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
   
   
}


.let {

	  list-style:none;
   padding-left:0px;
   margin-top: 5px;
   
}

li {
list-style: none;

border-bottom: 1px solid black;


line-height: 40px;
word-wrap: break-word;
}
i{

font-size: 30px;
}
p{
font-size: 20px;
font-weight: 200;
margin-top: 0px;
}
#chat-alarm{
background-color: yellow;
border-radius: 50px;
text-align: center;
font-size:15px;
font-weight:bold;
text-align: center;
line-height: 25px;
}
#my-chat{
padding: 10px;
    display: flex;
    width: 221px;
    max-width: 221px;
    height: 0px;
    text-align: start;
    line-height: 22px;
    font-weight: 400;
    font-size: 15px;
    border-radius: 20px;
    resize: none;
    outline: none;
    border: 0px;
    margin-right: 7px;
    background-color: rgb(0, 206, 124);
    color: rgb(255, 255, 255);}
    
#chatLog {
    height: 700px;
    overflow-y: auto;
    padding: 10px;
}

.myMsg {
    text-align: right;
}

.anotherMsg {
    text-align: left;
    margin-bottom: 5px;
}

.msg {
    display: inline-block;
    border-radius: 15px;
    padding: 7px 15px;
    margin-bottom: 10px;
    margin-top: 5px;

}

.anotherMsg > .msg {
    background-color: red;

}

.myMsg > .msg {
    background-color: #0084FF;
    color: #fff;
}

.anotherName {
    font-size: 12px;
    display: block;
}
.myName {
    font-size: 12px;
    display: block;
}

</style>
</head>
<body>
  <div id="container">

    <div class="chat-header">
    	<div>
    	<i class="fa-solid fa-angles-left"></i>
    		</div>
    	<div>
    		<p>채팅방 제목들어갈 자리입니다~~~<p>
    	</div>
    	<div>
    		<i class="fa-solid fa-xmark 1.5x"></i>
    	</div>
    		
    
    </div>
    <div class="button-container">
   <!--    <button class="chat-button" onclick="openSocket();">대화방 참여</button> -->

    </div>
    <div class="input-container">
      <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
    </div>
    <div id="messages">
    
   
                <div class="anotherMsg">
                    <span class="anotherName"></span>
                    <span class="anotherText" class="msg"></span>
                </div>
                <div class="myMsg">
                  <span class="myName"></span>
                    <span class="myText" class="msg"></span>
                </div>
           
    
    

    <ul class="let">
    	<li class="first">
    	<div id="chat-alarm"></div>
    	<div id="roomSizeElement">ddd</div>
    	</li>
    </ul>	
    </div>
      <input type="text" id="messageinput" class="message-input" onkeydown="handleKeyDown(event)">
         <button class="chat-button" onclick="send();">메세지 전송</button>
          <button class="chat-button" onclick="onClose();">대화방 나가기</button>
  </div>

  <!-- websocket javascript -->
  <script type="text/javascript">
  
    var ws;

    var messages = document.getElementById("messages");
    var alarm = document.getElementById("chat-alarm");
    var chat = document.getElementById("my-chat");
    window.onload = function() {
        openSocket();
        alarm.textContent = '채팅방에 연결 되었습니다.';
   
    };
    
    function openSocket() {
    	
      var url = "ws://localhost:8080/echo.do/"
      url += '<%=att%>';
      ws = new WebSocket(url);
      console.log("스크립트입니다");
      ws.onmessage = onMessage;
	  ws.onopen = onOpen;
	  ws.onclose = onClose;
	
	  
  
    };
    
   	function onMessage(event){
   		var message = event.data;
   		
   	if(message.startsWith("ROOM_SIZE:")){
   	var roomSize = message.substring(10);
   	document.getElementById("roomSizeElement").textContent = roomSize;
   	}else{
   	 writeResponse(event.data);
     scrollToBottom();
   	}
    
   	};
   	function onOpen(event){
   	/* 	var at = '${sessionScope.id}'+(event.data);
   	 writeResponse(at); */
   	};
	function onClose(){
   		
   		window.location.href='login.jsp';
   	};
    function scrollToBottom() {
    	messages.scrollTop = messages.scrollHeight;
      }

    function send() {
      var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
      ws.send(text);
      text = "";
    }

    function closeSocket() {
      ws.close();
    }

    function writeResponse(text) {
    	var messages = document.getElementById("messages");
        var isMyMessage = text.startsWith("<나>");

        var msgContainer = document.createElement('div');
        var msgText = document.createElement('span');
        msgText.textContent = text.substring(4); // 메시지에서 발신자 태그(<나>)를 제외한 부분

        if (isMyMessage) {
          msgContainer.classList.add('myMsg');
        } else {
          var msgSender = document.createElement('span');
          msgSender.classList.add('anotherName');
          msgSender.textContent = text.split(":")[0]; // 발신자 이름
          msgContainer.appendChild(msgSender);
          msgContainer.classList.add('anotherText');
        }

        var msgBubble = document.createElement('span');
        msgBubble.classList.add('msg');
        msgBubble.appendChild(msgText);
        msgContainer.appendChild(msgBubble);

        messages.appendChild(msgContainer);
        scrollToBottom();
      }
    
    

    function clearText() {
      messages.innerHTML = "";
    }
    function handleKeyDown(event) {
        if (event.key === "Enter") {
        	 var text = document.getElementById("messageinput");
        	 if(text.value == ""){
        		   event.preventDefault();
        	 }else{
        		   send();
        	 }
      
          text.value = "";
          event.preventDefault();
        }
      }
  </script>
</body>
</html>
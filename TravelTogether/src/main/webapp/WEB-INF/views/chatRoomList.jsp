<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${context}/resources/css/chatRoomList.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TT_채팅방목록</title>
</head>
<link rel="icon" type="image/png" sizes="16x16" href="${context}/resources/image/favi/favicon-16x16.png">
<body>
<div id="container" style="background: url(../image/main/main_middle_background.png) 50% center no-repeat rgb(237, 245, 212);">
	<div class="box">
		<jsp:include page="header.jsp"/>
	<!-- ---------------------------modal----------------------------- -->
		<div id="myModal" class="modal">
    	<div class="modal-content">
  			<span class="close" id="closeModal">&times;</span>
			<form action="insertChat" method="get">
				<label id="roomCreate">채팅방 만들기</label><br>
       			<label for="chat_regionlist">지역 선택</label>
            	<select id="chat_regionlist" name="chatRegion">
					<option value="전체">전체</option>
                	<option value="서울">서울</option>
               	 	<option value="경기도">경기도</option>
                	<option value="인천광역시">인천광역시</option>
                	<option value="강원도">강원도</option>
	               	<option value="대전광역시">대전광역시</option>
                	<option value="충청북도">충청북도</option>
                	<option value="충청남도">충청남도</option>
                	<option value="세종특별시">세종특별시</option>
                	<option value="부산광역시">부산광역시</option>
                	<option value="울산광역시">울산광역시</option>
                	<option value="경상북도">경상북도</option>
                	<option value="경상남도">경상남도</option>
                	<option value="전라북도">전라북도</option>
                	<option value="전라남도">전라남도</option>
                	<option value="광주광역시">광주광역시</option>
                	<option value="제주도">제주도</option>
           		</select><br>
            	<label for="roomTitle">채팅방 제목</label>
            	<input type="text" id="roomTitle" name="chatTitle" required><br>
           		<label for="passwordCheckbox">비밀번호 설정
           			<input type="checkbox" id="passwordCheckbox" name="hasPassword" onclick="showPasswordInput()">
           		</label>
 				<div id="passwordInput" style="display:none;">
					<input type="password" id="roomPassword" name="chatPassword">
            	</div><br>
				<input type="submit" value="생성">
           		<input type="hidden" name="memberId" value="${sessionScope.userId}"> 
			</form>
		</div>
		</div>
		<!-- ---------------------------chatRoom----------------------------- -->
		<div class="chatListBox">
	    	<h1>채팅방 목록 </h1>
			<table>
				<tr>
					<th>번호</th>
	            	<th style="width: 50%;">제목</th>
	            	<th>채팅방 인원</th>
	            	<th>생성 시간</th>
				</tr>
				<c:choose>
	            	<c:when test="${empty chatRoomList}">
						<tr>
	                    	<td colspan="5" style="height: 580px; text-align: center; background-image:url('${context}/resources/image/chatRoom/chatRoomEmpty.png');
	                 		   background-repeat: no-repeat; background-position: center;"></td>
						</tr>
	            	</c:when>
					<c:otherwise>
						<c:forEach items="${chatRoomList}" var="chatRoomList"><tr>
	      	  				<td>${chatRoomList.chatNumber}</td>
	       					<td>
	           					<c:choose>
	               					<c:when test="${empty chatRoomList.chatPassword}">
	                  					<a href="ChatRoom?chatNumber=${chatRoomList.chatNumber}&chatTitle=${chatRoomList.chatTitle}&memberId=${sessionScope.userId}">
	 										<span class="region-button">${chatRoomList.chatRegion}</span>
	 										${chatRoomList.chatTitle}
	                    				</a> 
									</c:when>
									<c:otherwise>
										<a href="#" data-chat-number="${chatRoomList.chatNumber}" data-chat-password="${chatRoomList.chatPassword}"
	        							data-chat-title="${chatRoomList.chatTitle}" data-chat-member_id="${sessionScope.userId}">
											<span class="region-button">${chatRoomList.chatRegion}</span>
											${chatRoomList.chatTitle}
											<span class="lock-icon">&#128274;</span>
										</a>
									</c:otherwise> 
	   							</c:choose>
							</td>  
							<td class="d"> 
								<c:forEach items="${NumberOfPeople}" var="numberOfPeople">
									<c:if test="${chatRoomList.chatNumber eq numberOfPeople.chatNumber}">
	                    				${numberOfPeople.count}명
									</c:if>
								</c:forEach>
							</td>
							<td>
								<fmt:formatDate value="${chatRoomList.chatCreateDate}" pattern="MM월 dd일 a HH시 mm분" />
							</td>
						</c:forEach> 
					</c:otherwise>
				</c:choose>
			</table>
			<a href="#" id="createChatRoomBtn">채팅방 만들기</a>
		</div>
	</div>
</div>
</body>
<script>
function refreshPage() {
    location.reload();
}
setInterval(refreshPage, 12000); 

document.addEventListener("DOMContentLoaded", function(){
	const passwordElements = document.querySelectorAll("[data-chat-number][data-chat-password][data-chat-title][data-chat-member_id]");
	passwordElements.forEach(function(element){
		element.addEventListener("click", function(){
			const chatNumber = element.getAttribute("data-chat-number");
			const chatPassword = element.getAttribute("data-chat-password");
			const chatTitle = element.getAttribute("data-chat-title");
			const memberId = element.getAttribute("data-chat-member_id");
			handlePassword(chatNumber, chatPassword, chatTitle, memberId);
		});
	});
});

function handlePassword(chatNumber, chatPassword, chatTitle, memberId){
	const enteredPassword = prompt("비밀번호를 입력하세요:");
	if(enteredPassword === chatPassword){
		const loginURL = "ChatRoom.do?chatNumber=" + chatNumber + "&chatTitle=" + chatTitle + "&memberId=" + memberId;
		location.href = loginURL;
	}else{
		alert("비밀번호가 다릅니다.");
		return;
	}
};

function showPasswordInput(){
	const passwordCheckbox = document.getElementById("passwordCheckbox");
	const passwordInput = document.getElementById("passwordInput");
	if(passwordCheckbox.checked){
		passwordInput.style.display = "block";
	}else{
    	passwordInput.style.display = "none";
  	}
}

// 모달 표시 버튼 클릭 시 이벤트
document.getElementById("createChatRoomBtn").onclick = function(){
	document.getElementById("myModal").style.display = "block";
};

// 닫기 버튼 클릭 시 모달 닫기
document.getElementById("closeModal").onclick = function(){
	document.getElementById("myModal").style.display = "none";
};

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event){
	const modal = document.getElementById("myModal");
	if(event.target == modal){
		modal.style.display = "none";
	}
};
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat Room List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }

    .container {
        max-width: 700px;
  
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
         position: relative;

	  top: 50%;

	  left: 50%;

	  transform: translate(-50%, -50%);

    }
    
     .box{
   
    height: calc(100vh - 188px);
    }

    h1 {
        color: #0066cc;
        text-align: center;
        margin-bottom: 30px;
    }

    h3 {
        color: #333;
        text-align: center;
        margin-bottom: 10px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align:center;
    }

    th {
        background-color: #ffa500;
        color: #fff;
        font-weight: bold;
        text-align: center;
        font-size : 19px;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #e0e0e0;
    }

    a {
        color: #0066cc;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    form {
        margin-bottom: 20px;
    }

    select, input[type="text"], input[type="submit"] {
        padding: 5px;
        margin-right: 10px;
    }

    select {
        width: 150px;
    }

    input[type="text"] {
        width: 100%;
    }

    input[type="submit"] {
        background-color: #0066cc;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #004c99;
    }

    

  .modal {
    display: none;
    position: absolute;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
  
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
  }

  /* 모달 내용 */
  .modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 400px;
    border-radius: 5px;
  }

  /* 닫기 버튼 */
  .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }

  .close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
  }
  
  #createChatRoomBtn{

        display: block;
        text-align: center;
        background-color: #0066cc;
        color: #fff;
        padding: 10px;
        margin-top: 20px;
        border-radius: 5px;
        text-decoration: none;

        background-color: #004c99;
    
  }
   
</style>
</head>
<body>

<div class="box">
 <jsp:include page="header.jsp"/>
<div class="container">
    <h1>채팅방 목록 </h1>
    <a href="/ChatRoom.do">채팅방으로 가기</a>
    <h3>${sessionScope.username}</h3>

    <!-- 검색 시작 -->
  <!--   <form action="getBoardList.do" method="post">
        <input name="searchKeyword" type="text" placeholder="Search...">
        <input type="submit" value="Search">
    </form> -->
    <!-- 검색 종료 -->

    <table>
        <tr>
            <th>번호</th>
            <th  style="width: 50%;">제목</th>

            <th>채팅방 인원</th>
          
        </tr>
  <%--       <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.seq}</td>
                <td>
                    <a href="getBoard.do?seq=${board.seq}">
                        ${board.title}
                    </a>
                </td>
                <td>${board.writer}</td>
                <td>${board.content}</td>
            </tr>
        </c:forEach> --%>
 
            <tr>
                <td>sdsdsdsdsd</td>
                <td>
                    <a href="getBoard.do?seq=${board.seq}">
                  sdsd
                    </a>
                </td>
    
                <td>sdsdsdsdsdsd</td>
            </tr>
  
    </table>
      <a href="#" id="createChatRoomBtn">채팅방 만들기</a>
      <div id="myModal" class="modal">
    <!-- 모달 내용 -->
    <div class="modal-content">
      <!-- 닫기 버튼 -->
      <span class="close" id="closeModal">&times;</span>
      <!-- 채팅방 생성 폼 -->
      <form action="createChatRoom.do" method="post">
        <label for="roomTitle">채팅방 제목:</label>
        <input type="text" id="roomTitle" name="roomTitle" required>
        <input type="submit" value="생성">
      </form>
    </div>
  </div>

  	
</div>


</div>
<%@ include file="footer.jsp" %> 

</body>
<script>
  // 모달 표시 버튼 클릭 시 이벤트
  document.getElementById("createChatRoomBtn").onclick = function () {
    document.getElementById("myModal").style.display = "block";
  };

  // 닫기 버튼 클릭 시 모달 닫기
  document.getElementById("closeModal").onclick = function () {
    document.getElementById("myModal").style.display = "none";
  };

  // 모달 외부 클릭 시 모달 닫기
  window.onclick = function (event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
</script>
</html>
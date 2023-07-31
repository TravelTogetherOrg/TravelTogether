<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 게시물에 접속할 수 없습니다.</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>
<script src="/js/date-picker.js"></script>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css?asdaddd">

<!-- icon-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />



<style>
@import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
.navbar__logo{
    font-family: 'Fira Sans', sans-serif;
    font-weight: bolder;
    font-size: 2.6em;
    text-align: center;
    margin-top: 150px;
  }
  .navbar__logo span {
    color: orange;
    padding-left: 0;
  }
  a{
    text-decoration: none;
    color: black;
  }
  .function a{
   font-size: 0.8em; 
   color: gray;
  }
  input[type="submit"]:hover,
  input[type="submit"]:active {
  color: orange;
}


 .container {
   width: 50%;
 }





#mbutton {
        font-size: 1em;
        cursor: pointer;
        text-decoration: underline;
        color: blue;
      }
 

</style>
</head>
<body>
<br>
<br> 
		<div class="navbar__logo">
			<a href="${path}/main" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
		</div>
		<br>
	
		<div class="container" style="margin-top: 50px">
		  <div class="row" style="border-bottom: solid 1px;">
		    <div class="col-8">
		    
		    
		    <h2>해당 게시물을 찾을 수 없습니다.</h2>
		    <br>
		    <br>
		     	요청하신 페이지가 사용자 및 관리자에 의해 제거 되었거나,<br>
		     	이름이 변경되었거나,<br>
		    	일시적으로 사용이 중단되었습니다.
		    	<br>
		    	<br>
		    	<button class="btn btn-outline-secondary" onclick="window.location.href='${path}/main'">메인페이지</button> &nbsp;&nbsp;
		    	<button class="btn btn-outline-secondary" onclick="goBack()">이전페이지</button>
		    <br>
		    <br>
		    </div>
		    	    
		    <div class="col-4">
		    	<img src="${path}/resources/image/main/main_top_symbol.png" style="max-width: 300px; max-height: 300px;" />
	    	</div>
		  </div>
		  
		  	<br>
		  	
		  <div class="row">
			    <div class="col-12">
			        <div id="mbutton" onclick="toggleMessage()">오류로그 확인</div>
			        <div id="mMessage" style="display: none; font-size: 1em; white-space: pre-wrap; max-width: 100%; margin-top: -50px;">
			            <p><h3>Exception</h3> <strong>${exception.getClass().getSimpleName()}</strong></p>
			            <p style="margin-top: -50px;"><h3>Message</h3> <strong>${exception.message }</strong></p>
			            <p style="margin-top: -50px;"><h3>Cause</h3> <strong>${exception.getCause()}</strong></p>
			        </div>
			    </div>
			</div>
			 
		</div>


<!-- 이전페이지 구현 -->
<script>
	function goBack(){
		location.reload();
		history.go(-2);
	}
</script>


<!-- 관리자 오류메시지 뜨게하기 -->
<script>
  let isMessageVisible = false;

  function toggleMessage() {
    const mMessage = document.getElementById('mMessage');
    isMessageVisible = !isMessageVisible;

    if (isMessageVisible) {
      mMessage.style.display = 'block';
      document.getElementById('mbutton').classList.add('clicked');
    } else {
      mMessage.style.display = 'none';
      document.getElementById('mbutton').classList.remove('clicked');
    }
  }
</script>





</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favi/favicon-16x16.png?ddd">
<meta charset="UTF-8">
<title>TT_비밀번호찾기</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/findPassword.css?ddd">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
	
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  .navbar__logo{
	margin-top : 50px;
    font-family: 'Fira Sans', sans-serif;
    font-weight: bolder;
    font-size: 1.6em;
   }
   
  .navbar__logo span {
    color: orange;
    padding-left: 0;
  }
  
  a{
    text-decoration: none;
    color: black;
  }
	
  select option[value=""][disabled] {
	display: none;
  }
 
  input[type="submit"]{
 	font-weight:bolder;
 	color: black;
  }
 
  input[type="button"]:active {
  font-weight:bolder;
  color: orange;
  }
  
  /* 유효성 스타일 */
  .user_id_ok{
  font-weight : bolder;
  color: blue;
  display: none;
  }
  .user_id_already{
  font-weight : bolder;
  color: orange;
  display: none;
  }
  .user_nickname_ok{
  font-weight : bolder;
  color: blue;
  display: none;
  }
  .user_nickname_already{
  font-weight : bolder;
  color: orange;
  display: none;
  }
  .user_tel_ok{
  font-weight : bolder;
  color: blue;
  display: none;
  }
  .user_tel_already{
  font-weight : bolder;
  color: orange;
  display: none;
  }
  
  .find{
  padding-top: 30px;
  text-align: center;
  font-size: 1.1em;
  font-family: 'GmarketSansMedium';
  font-weight: bolder;
  display: none;
  }
  .find .rs{
  color: blue;
  font-size: 1.1em;
  font-family: 'GmarketSansMedium';
  font-weight: bolder;
  }
  .notFind{
  padding-top: 30px;
  font-size: 1.1em;
  font-family: 'GmarketSansMedium';
  font-weight: bolder;
  color: orange;
  display: none;
  } 
 
</style>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" 
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" 
		crossorigin="anonymous" 
		referrerpolicy="no-referrer">
</script>
<script type="text/javascript">

function findPassword(){
	var name = form.member_name.value;
	var id = form.member_id.value;
	
	$.ajax({
	    url:"<c:url value='/findMemberPassword'/>", 
	    type:'post',
	    data:{'member_name':name,'member_id':id},
	    success:function(password){ 
	        if(password === ""){ 
	           $('.notFind').css("display", "inline-block");
	           $('.find').css("display", "none");
	            
	        } else { 
	        	$('.rs').empty().append(password);
	        	$('.find').css("display", "inline-block");
	        	$('.notFind').css("display", "none");
	        }
	    },
	    error:function(){
	    	alert("에러입니다.");
	    }
	});    
}; 

</script>
<body>
    <div class="navbar__logo" align="center">
   	 	<a href="${path}/main.do" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
	</div>
	<div class="join" align="center">
 	 	<h4 style="font-family:'GmarketSansMedium'">비밀번호 찾기</h4>
	</div>
	<div class="member">
        <h4>* 회원가입 시 입력하신 <span style="color: orange;">이름</span>과 <span style="color: orange;">이메일</span>로 찾을 수 있습니다.</h4>
        <form id="form" action="" method="post">
	      <div id="container">
	        <div class="input_control">
	            <input id="name" type="text" placeholder="이름" name="member_name" required>
	            <div class="user_name"></div>
	        </div>
	       <div class="input_control">
	            <span class="placehold-text"><input id="id" type="email" placeholder="이메일 주소" name="member_id"  required></span>
	        </div>
	         <input type="button" value="확 인" onclick="findPassword()" style="font-size:20px;">
	 	  </div>
  	</form>
	  	<div class="find">
			회원님의 비밀번호는 <span class="rs"></span> 입니다.
		</div>
		<div class="notFind">
			비빌번호를 찾지 못하였습니다. 다시 확인해 주세요.
		</div>
  </div>
</body>
</html>
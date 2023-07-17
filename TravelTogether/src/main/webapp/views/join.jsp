<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/join.css?">
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
 
  input[type="submit"]:hover,
  input[type="submit"]:active {
  font-weight:bolder;
  color: orange;
  }
</style>
</head>
<body>
	<div class="member">
        <div class="navbar__logo" align="center">
       	 	<a href="${path}/main.jsp" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
		</div>
		<div class="join" align="center">
       	 	<h4 style="font-family:'GmarketSansMedium'">회원가입</h4>
		</div>
		
        <h4>입력사항 <span style="color:orange;">(필수)</span></h4>

        <!-- 2. 필드 -->
        <form action="insertMember.do" method="post">
	      <div id="container">
	        <div class="field">
	            <span class="placehold-text">
	           		<input type="text" placeholder="이메일 주소" name="member_id" required>
	            </span>
	        </div>
	                
	        <div class="field">
	            <input class="userpw" type="password" name="member_password" placeholder="비밀번호(8~12자, 영문+숫자+특수문자 사용)" required>
	        </div>
	        <div class="field">
	            
	            <input class="userpw-confirm" type="password" placeholder="비밀번호 재확인" required>
	        </div>
	        
	        <div class="field">
	            <input type="text" placeholder="이름" name="member_name" required>
	        </div>
	
	        <!-- 3. 필드(생년월일) -->
	        <div class="field birth">
	            <input type="date" name="member_birthday"> 
	        </div>
	
	        <!-- 4. 필드(성별) -->
	        <div class="field gender">
	         
	             <select name="member_gender" required="required">
	             	<option value="" disabled selected>성별</option>
	     			<option value="남">남</option>
	       			<option value="여">여</option>
	   			 </select>
	   			  <!-- <input type="text" name="member_gender">  -->
	        </div>
	        
	        <!-- 닉네임 설정 -->
	        <div class="field">
	            <span class="placehold-text"><input type="text" name="member_nickname" placeholder="닉네임" required></span>
	        </div>
	         <input type="submit" value="가입하기" style="font-size:20px;">
	 	 </div>
  	</form>
  </div>
</body>
</html>
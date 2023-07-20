<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/reset.css" media="all">
<link rel="stylesheet" href="${path}/resources/css/header.css?s">
<script src="https://kit.fontawesome.com/4d0517937c.js" crossorigin="anonymous"></script>
<style type="text/css">
   @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
   .rounded-image {            /* 사진파일 동그랗게 편집 */
	    border-radius: 50%;
	    overflow: hidden;
	    border:1px solid darkgray; 
	  }
</style>
</head>
<body>
 <nav class="navbar">
       <div class="navbar__logo">
         <a href="${path}/main.do" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
       </div>
       <ul class="navbar__menu">
         <li><a href="${path}/main.do">홈</a></li>
         <li><a href="${path}/getFestivalList_Month.do">축제소개</a></li>
         <li><a href="${path}/boardList.do">동행게시판</a></li>
       </ul>
        <ul class="navbar__icons">
           <c:if test="${empty sessionScope.userId and empty sessionScope.userNickname }"> 
           		<li class="icon"><a href="${path}/login.do"><i class="fa-solid fa-circle-user fa-xl"></i></a></li>
           		<li class="text"><a class="login_text" style="font-family: 'GmarketSansMedium';" href="${path}/login.do">로그인</a>&nbsp;</li>
           </c:if>
           <c:if test="${!empty sessionScope.userId and !empty sessionScope.userNickname and empty member.member_profile_url }"> 
           		<li><a href="${path}/getMember.do?member_id=${member.member_id}"><i class="fa-regular fa-circle-user fa-xl"></i></a></li>
           		<li><a href="#"><input type="text" name="user" value="${member.member_nickname}" readonly><span> 님</span></a></li>
           		&nbsp;<li><a href="${path}/logout.do"><i class="fa-solid fa-right-from-bracket fa-lg"></i></a></li>
           </c:if>
           <c:if test="${!empty sessionScope.userId and !empty sessionScope.userNickname and !empty member.member_profile_url}"> <!-- 로그인 시 --> 
           		<li class="profile_image"><a href="${path}/getMember.do?member_id=${member.member_id}" ><img id="img" src="${path}${member.member_profile_url}" class="rounded-image" height="35" width="35"></a></li>
           		<li class="user_info"><a href="#"><input type="text" name="user" value="${member.member_nickname}" readonly><span> 님</span></a></li>
           		&nbsp;<li class="logout_icon"><a href="${path}/logout.do"><i class="fa-solid fa-right-from-bracket fa-lg"></i></a></li>
           </c:if>
       </ul>
       <a href="#" class="navbar__toggleBtn">
           <i class="fa-solid fa-bars fa-2xl"></i>
       </a>
   </nav>
   <script src="${path}/resources/js/header.js"></script>
 
</body>
</html>
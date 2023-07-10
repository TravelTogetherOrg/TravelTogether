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
<link rel="stylesheet" href="${path}/resources/css/header.css">
<script src="https://kit.fontawesome.com/4d0517937c.js" crossorigin="anonymous"></script>
<style type="text/css">
   @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
</style>
</head>
<body>
 <nav class="navbar">
       <div class="navbar__logo">
         <a href="${path}/main.jsp" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
       </div>
       <ul class="navbar__menu">
         <li><a href="${path}/main.jsp">홈</a></li>
         <li><a href="${path}/views/festivalList.jsp">축제소개</a></li>
         <li><a href="${path}/views/boardList.jsp">동행게시판</a></li>
       </ul>
       <ul class="navbar__icons">
           <!-- <li><a href="#"><i class="fa-regular fa-bell fa-xl"></i></a></li>  로그인시 노출-->
           <li><a href="#"><i class="fa-regular fa-circle-user fa-xl"></i></a></li>
           <li><a href="#"><input type="text" name="user" value="user" readonly>님</a></li>
       </ul>
       <a href="#" class="navbar__toggleBtn">
           <i class="fa-solid fa-bars fa-2xl"></i>
       </a>
   </nav>
   <script src="${path}/resources/js/header.js"></script>
 
</body>
</html>
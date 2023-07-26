<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목을 입력하세요</title>
</head>
<body>


		<button type="button" class="btn btn-outline-primary"
		    style="font-family: 'SUITE-Regular', sans-serif;
		    <c:if test="${isLiked}">
		        background-color: rgb(192, 228, 255);
		    </c:if>"
		    onclick="checkSessionAndLike(event)"
		    id="likeButton">
		    <i class="bi bi-heart-fill text-primary"></i> 좋아요 : <span id="likeCount">${festivalCount}</span>
		</button>















	<form method="post" action="${context}/main.do">
		<input type="submit" value="메인으로">
		<input type="button" value="축제리스트로" onclick="goToList()">
	</form>

	<script>
	function checkId(){
		var id = $('#id').val();
		$.ajax({
		    url:"<c:url value='/checkId.do'/>", 
		    type:'post',
		    data:{'member_id':id},
		    success:function(cnt){ 
		        if(cnt == 0){ 
		            $('.user_id_already').css("display","inline-block");
		            /* alert("아이디와 비밀번호를 확인해주세요"); */
		            return false;
		        } else { 
		        	$('.user_id_already').css("display", "none");
		        	return false;
		        }
		    },
		    error:function(){
		    	alert("에러입니다.");
		    }
		});    
		}; 
	</script>

</body>
</html>

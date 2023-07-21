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

	<form method="post" action="${context}/main.do">
		<input type="submit" value="메인으로">
		<input type="button" value="축제리스트로" onclick="goToList()">
	</form>

	<script>
		function goToList() {
			location.href = "${context}/getFestivalList_Month.do";
		}
	</script>

</body>
</html>

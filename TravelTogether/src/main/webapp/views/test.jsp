<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<table border="1" cellpadding="0" cellspacing="0" width="700">
			<%-- <tr>
				<th width="100">${memberBoardList.member_id}</th> 
				<th width="200">${memberBoardList.festival_name}</th>
				<th width="150">${memberBoardList.board_start_date}</th>
				<th width="150">${memberBoardList.board_end_date}</th>
				<th width="150">${memberBoardList.board_total_people}</th>
				<th width="100">${memberBoardList.board_write_date}</th>
			</tr> --%>
			<c:forEach items="${memberBoardList}" var="board">
				<tr>
					<td>${board.member_id}</td>
					<td>${board.festival_name}</td>				
					<td>${board.board_title}</td>
					<td>${board.board_start_date}</td>
					<td>${board.board_end_date}</td>
					<td>${board.board_total_people}</td>
					<td>${board.board_write_date}</td>
				</tr>			
			</c:forEach>
		</table>
	</div>
</body>
</html>
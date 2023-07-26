<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>관리자페이지</title> 
<style>

* { 
	outline: none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse: collapse;
	box-sizing: border-box;
	text-decoration: none;
}

html {
	height: 100%;
}

body {
	height: 100%;
}

.wrap {
	position: relative;
}


.boardtype {
	display: flex;
	justify-content: center;
	flex-direction: column;
	font-size: 20px;
	
}

.imgtextbox {
	display: flex;
}

.gocontent {
	cursor: pointer;
}


.rd {
	display: none;
}

.commentCount {
	font-size: 14px;
	color: gray;
}


section {
	 flex: 1;
}

.boardtype-1 {
	display: flex;
	font-weight: bolder;
}

.typeimg {
	width: 300px;
	height: 300px;
	margin-bottom: 10px;
}

.board-wrap {
	width: 1500px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	margin-top: 30px;
	margin-bottom: 30px;
}

.boardtype-1 {
	margin: 20px;
	font-size: 25px;
}

.boardtype {
	width: 20%;
	display: contents;
}

.Board {
	display: flex;
	border-bottom: 2px solid #ccc;       /* 메뉴탭 밑줄 */
	justify-content: space-around;
	color:black;
}


label {
	cursor: pointer;
}

.imgtextbox {
	flex-direction: inherit;
}

#boardtext {
	margin: auto;
	font-size: 50px;
	font-weight: bold;
	color: darkgrey;
	margin-left: 50px;
}

#maintable {
	width: 1500px;
}

#serchbar {
	display: flex;
	justify-content: center;
	flex-direction: column;
}

table {                            /* 하단 페이지 넘버 표시 */
	border-collapse: collapse;
	border: 1px solid #0000003b;
	width: 1500px;
}

.board_wrap {
	display: flex;
	justify-content: center;
}

table {
	text-align: center;
	width: 1500px;
}

td {
	border: 0px;
	border-bottom: 1px inset;
	padding: 15px;
}

#hotviewtable {
	background: aliceblue;
}

.boardlisttr {
	
}

#hotviewdiv {
	width: 100%;
}

.hotviewtr {
	background-color: antiquewhite;
	color: blue;
	border-bottom: 1px solid gainsboro;
	color: lightcoral;
	font-weight: bold;
}

#boardip {
	background-color: white;
	font-weight: bolder;
	font-size: 18px;
}

.check {
	display: none;
}

.pagenumber {
	margin-left: 5px;
}

#BoardPagig {
	justify-content: center;
	display: flex;
	margin-top: 20px;
}

#srearhinput {
	display: flex;
	justify-content: center;
	margin-left: 40px;
}

#writeBoard {
	justify-content: flex-end;
	display: flex;
}

#menuwrap {
	margin-bottom: 0;
	display: flex;
	justify-content: center;
	
}

.boardlisttr {
	background-color: white;
}

.lockimg {
	width: 15px;
}

#writePage {
	display: flex;
	justify-content: flex-end;
}

* a {
	text-decoration: none;
}

.lase {
	background-color: #bbe889;
	border: none;
	border-radius: 25px;
	font-size: 20px;
	padding: 10px;
	margin: 10px;
}

.scretnumbertext {
	border: ridge;
	outline: none;
}

#trborder {
	border-bottom: 1px solid brown;
}

.lasc {
	background-color: #bbe889;
	border: none;
	border-radius: 25px;
	font-size: 14px;
	padding: 10px;
}

#searchbar {
	padding-left: 10px;
	width: 350px;
	outline: none;
	border-radius: 20px;
	height: 30px;
	border: 1px solid brown;
}

.adminform {
	display: none;
}

.typelink:link {
	text-decoration: none;
	color: black;;						  /* 상단메뉴 색깔 */ 
}

.typelink:visited {  
	text-decoration: none;
	color: black;;                        /* 상단메뉴 색깔 */
}

a:visited {
	text-decoration: none;
	color: black;
}

a:link {
	text-decoration: none;
	color: black;
}
</style>

<script
	src="${pageContext.request.contextPath }/js/jquery-3.5.1.js">
</script>

  <script type="text/javascript">
    function AdminDeleteMember(member_id) {
        var memberId = member_id;
        if (confirm(memberId + "님의 계정을 정말 삭제 하시겠습니까?")) {
            // 삭제 성공 시 메시지 출력
            alert("삭제 완료");
            location.href = "/biz/AdminDeleteMember.do?member_id=" + member_id;
        } else {
            // 삭제 실패 시 메시지 출력
            alert("삭제 실패");
        }
    }

    function AdminDeleteFestival(festival_number) {
        var festivalId = festival_number;
        if (confirm(festivalId + " 축제를 정말 삭제 하시겠습니까?")) {
            // 삭제 성공 시 메시지 출력
            alert("축제 삭제 완료");
            location.href = "/biz/AdminDeleteFestival.do?festival_number=" + festival_number;
        } else {
            // 삭제 실패 시 메시지 출력
            alert("축제 삭제 실패");
        }
    }

    function AdminDeleteBoard(board_title) {
        var boardId = board_title;
        if (confirm(boardId + " 글을 정말 삭제 하시겠습니까?")) {
            // 삭제 성공 시 메시지 출력
            alert("게시판 삭제 완료");
            location.href = "/biz/AdminDeleteBoard.do?board_title=" + board_title;
        } else {
            // 삭제 실패 시 메시지 출력
            alert("게시판 삭제 실패");
        }
    }
</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp" />
		<div style="display:flex;justify-content: center;">
		<section>
			<div
				style="display: flex; justify-content: center; margin-bottom: 50px;">
				<h1 style="font-size: 40px; margin-top: 100px;">관리자페이지</h1>
			</div>
			<div id="menuwrap">
				<div class="Board" style="width: 500px;">
					<div class="boardtype">
						
						<div class="boardtype-1">
							<a href="getMemberList.do" class="typelink" id="typeM">회원관리</a>
						</div>
					
						<div class="boardtype-1">
							<a href="festivalList.do" class="typelink" id="typeF">축제정보</a>
						</div>
						
						<div class="boardtype-1">
							<a href="memberBoardList.do" class="typelink" id="typeB">동행게시판</a>
						</div>
						
					</div>
				</div>
			</div>
			
			
			
		
	<div class="board_wrap">
		<div class="board-wrap">
			<c:if test="${type eq 'M'}">
		<table>
			<tr>
				<td>번호</td>                                  <!-- 번호부여 -->
				<td>계정</td>
				<td>비밀번호</td>
				<td>회원명</td>
				<td>닉네임</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>가입일</td>
				<td>회원관리</td>
			</tr>
			<c:if test="${not empty memberList }">            <!-- 번호부여 -->
				<c:forEach items="${memberList }" var="ml" varStatus="status">
			
				 <tr>
					<td>${status.index + 1}</td>              <!-- 번호부여 -->
				 	<td>${ml.member_id}</td>
					<td>${ml.member_password}</td>
		            <td>${ml.member_name}</td>
		            <td>${ml.member_nickname}</td>
		            <td>${ml.member_gender}</td>
		            <td>${ml.member_phone_number}</td>
		            <fmt:formatDate value="${ml.member_create_date}" 
		            				pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />   <!-- 날짜 표기 조정 -->                               
	                <td>${formattedDate}</td>
	                <td> 
	            		<%-- <c:if test="${ml.deleteMember eq 'N'.charAt(0)}"> </c:if>  --%>
	            			<input type="text" style="border:1px solid #lightgray" class="btn btn-default" placeholder="삭제사유를 입력해주세요" required="required">
	            			<input type="button" class="btn btn-default" onclick="AdminDeleteMember('${ml.member_id}')" value="회원삭제" />
							<input type="hidden" value="${mb.member_id}"  class="btn btn-default" name="member_id">
		               <!--   <form action="deleteMember.do" method="post" class="outform" style="display: none;"> </form>  -->
	                 
		                 </td> 
		         	</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty memberList}">
				<tr>
					<td colspan='10'>검색결과가 없습니다</td>
				</tr>
			</c:if>
		</table>
	
	</c:if>	

					
					
	<c:if test="${type eq 'F'}">
		<table>
			<tr>
				<td>축제명</td>
				<td>축제시작일</td>
				<td>축제종료일</td>
				<td>지역</td>
				<td>축제정보</td>
				<td>축제장소</td>
				<td>축제번호</td>
				<td>축제관리</td>
			</tr>
			<c:if test="${not empty festivalList }">
				<c:forEach items="${festivalList }" var="fl">
				 <tr>
				 	<td>${fl.festival_name}</td>
					<td>${fl.festival_startdate}</td>
		            <td>${fl.festival_enddate}</td>
		            <td>${fl.festival_address}</td>
		            <td>${fl.festival_detail_information}</td>
		            <td>${fl.festival_showaddress}</td>
		            <td>${fl.festival_number}</td>
		            <td> 
	            		<%-- <c:if test="${fl.deleteFestival eq 'N'.charAt(0)}"> </c:if>  --%>
	            			<input type="text" style="border:1px solid #lightgray" class="btn btn-default" placeholder="삭제사유를 입력해주세요" required="required">
	            			<input type="button" class="btn btn-default" onclick="AdminDeleteFestival('${fl.festival_number}')" value="축제삭제" />
							<input type="hidden" value="${mb.member_id}"  class="btn btn-default" name="member_id">
		               <!--   <form action="deleteMember.do" method="post" class="outform" style="display: none;"> </form>  -->
	                </td>
	              </tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty festivalList}">
				<tr>
					<td colspan='10'>검색결과가 없습니다</td>
				</tr>
			</c:if>
		</table>
	
	</c:if>	
					
	<c:if test="${type eq 'B'}">
		<table>
			<tr>
				<td>축제명</td>
				<td>회원계정</td>
				<td>작성일</td>
				<td>참여최대인원</td>
				<td>시작일</td>
				<td>종료일</td>
				<td>제목</td>
				<td>내용</td>
				<td>조회수</td>
				<td>수정시간</td>
				<td>게시판관리</td>
				
			</tr>
			<c:if test="${not empty memberBoardList }">
				<c:forEach items="${memberBoardList }" var="mb">
			
				 <tr>
				 	<td>${mb.festival_name}</td>
					<td>${mb.member_id}</td>
		            <td>${mb.board_write_date}</td>
		            <td>${mb.board_total_people}</td>
		            <td>${mb.board_start_date}</td>
		            <td>${mb.board_end_date}</td>
		            <td>${mb.board_title}</td>
		            <td>${mb.board_content}</td>
		            <td>${mb.board_view_count}</td>
		            <td>${mb.board_update_date}</td>
		            <td> 
	            		  <%-- <c:if test="${mb.deleteMember eq 'N'.charAt(0)}"></c:if> --%>
	                    <input type="text" style="border:1px solid #lightgray" class="btn btn-default" placeholder="삭제사유를 입력해주세요" required="required">
	            			<input type="button" class="btn btn-default" onclick="AdminDeleteBoard('${mb.board_title}')" value="축제삭제" />
							<input type="hidden" value="${mb.member_id}"  class="btn btn-default" name="member_id">
		                 
		                  <!-- <form action="deleteMember.do" method="post" class="outform" style="display: none;">  </form> -->
	                 
		                 </td> 
		         	</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty memberBoardList}">
				<tr>
					<td colspan='10'>검색결과가 없습니다</td>
				</tr>
			</c:if>
		</table>
	
	</c:if>	
						
							
	<table>

		<tr align="center" height="20">
			<td colspan="6"
				style="padding-top: 20px; color: #0AC5A8;">
				
			<c:if test="${currentPage <= 1}"> [이전]&nbsp;
					</c:if> 
					
					<c:if test="${currentPage > 1}">
				<c:url var="blistST" value="AdminPage.jsp">
					<c:param name="page" value="${currentPage-1}" />
					<c:param name="type" value="${type}" />
					<c:if test="${not empty keyword}">
						<c:param name="keyword" value="${keyword }"></c:param>
					</c:if>
				</c:url>
				<a href="${blistST}"
					style="color: #0AC5A8;">[이전]</a>
			</c:if> 
	
	<!-- 끝 페이지 번호 처리  -->
	<c:forEach var="p" begin="${startPage}"
		end="${endPage }">
		<c:if test="${p <= maxPage}">
			<c:if test="${p eq currentPage}">
				<font color="cornflowerblue" size="4"><b>[${p}]</b></font>
			</c:if>
			<c:if test="${p ne currentPage}">
				<c:url var="blistchk" value="AdminPage.do">
					<c:param name="page" value="${p}" />
					<c:param name="type" value="${type}" />
					<c:if test="${not empty keyword}">
						<c:param name="keyword" value="${keyword }"></c:param>
					</c:if>
				</c:url>
				<a href="${blistchk}">${p}</a>
			</c:if>
		</c:if>
	</c:forEach> <c:if test="${currentPage >= maxPage}">
				 [다음]
				 </c:if> 
				 <c:if test="${currentPage < maxPage}">
		<c:url var="blistEND" value="AdminPage.do">
			<c:param name="page" value="${currentPage+1}" />
			<c:param name="type" value="${type}" />
			<c:if test="${not empty keyword}">
				<c:param name="keyword" value="${keyword }"></c:param>
			</c:if>
		</c:url>
		<a href="${blistEND}"
			style="color: #0AC5A8;">[다음]</a>
	</c:if>
	</td>
	</tr>
</table>
		
			</div>
		</div>	
	</section>
</div>
		 
		
<jsp:include page="footer.jsp" />
</div>
	

</body>
</html>

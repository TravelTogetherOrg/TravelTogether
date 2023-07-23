<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${context}/resources/css/base.css">
<link rel="stylesheet" href="${context}/resources/css/board.css">

<title>축제 동행 찾기</title>
</head>
<jsp:include page="header.jsp"/>
<body>
    <div class="container">
        <section id="festivalSearch">  <!-- 드롭다운 축제 -->
            <div>
                <p>축제 동행 찾기</p><br> &nbsp;&nbsp;
                <form action="findFestivalBoard.do" method="post" name="findForm">
                <select id="findRegion">
                    <option disabled selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지역 검색</option>
                    <option value="서울">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울</option>
                    <option value="경기도">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경기도</option>
                    <option value="인천">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인천</option>
                    <option value="부산">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부산</option>
                    <option value="제주">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제주도</option>
                    <option value="강원">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강원도</option>
                    <option value="세종">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세종</option>
                    <option value="충청">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;충정도</option>
                    <option value="경상">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경상도</option>
                    <option value="전라">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전라도</option>
                    <option value="광주광역시">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;광주광역시</option>
                    <option value="대전">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대전</option>
                    <option value="대구">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대구</option>
                    <option value="울산">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;울산</option>
                </select>
                <select name="festival_name" id="findFestivals">
                	<option disabled selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어떤 축제를 찾으시나요?</option>
                </select>
                <button type="button" onclick="nullcheck()"><img src="${context}/resources/image/board/search.svg"></button>
                </form>
                <!-- 검색 아이콘 누르면 submit(검색) -->
                <!--옵션아이콘(드롭박스)-최신순/모집중 표시 -->
            </div>
            <div id="boardWriteButton" align="right">
            <button type="button" onclick="location.href='insertBoard.do'">글쓰기</button>
            </div>
        </section>
        <section id="boardList" >  <!-- 동행 게시글 리스트 -->
            <div class="row">
        	<c:forEach var="board" items="${boardList}" begin="0" end="3">
	            <div class="col" onclick="location.href='board.do?no=${board.board_number}'">
	                <div class="top">
	                    <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
	                    <div class="topInfo memberInfo">
	                        <p>${board.member_nickname}</p>
	                        <div class="ageandgender">
	                            <p>${board.member_age}0대 </p>
	                            <div>·</div>
	                            <p>${board.member_gender}성</p>
	                        </div> 
	                    </div>
	                    <div class="line">|</div>
	                    <div class="topInfo festivalName">
	                    	<p>참여일</p> <!-- 원래 축제명 있었음 -->
	                    	<p>${board.board_start_date}</p>
	                    </div>
	                </div>
	                <div class="middle"><!-- /board/boardImage/ -->
	                    <img class="thumnail" src="${context}/resources/image/${board.board_image_file_path}/${board.board_image_file}">
	                    <div class="middleHover">
	                        <div class="state">모집중</div>
	                        <div class="viewandchat">
	                            <div class="view">
	                                <img src="${context}/resources/image/board/eye.svg">
	                                <p>${board.board_view_count}</p>
	                            </div>
	                            <div class="view">
	                                <img src="${context}/resources/image/board/chat.svg">
	                                <p>2</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="bottom">
	                	<p class="listFestival">${board.festival_name}</p>
	                    <p class="listTitle">${board.board_title}</p>
	                    <p class="listContent">${board.board_content}</p>
	                </div>
	            </div>
            </c:forEach>
            </div>
            <div class="row">
        	<c:forEach var="board" items="${boardList}" begin="4" end="7">
	            <div class="col" onclick="location.href='board.do?no=${board.board_number}'">
	                <div class="top">
	                    <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
	                    <div class="topInfo memberInfo">
	                        <p>${board.member_nickname}</p>
	                        <div class="ageandgender">
	                            <p>${board.member_age}0대 </p>
	                            <div>·</div>
	                            <p>${board.member_gender}성</p>
	                        </div> 
	                    </div>
	                    <div class="line">|</div>
	                    <div class="topInfo festivalName">
	                    	<p>${board.festival_name}</p>
	                    	<p>${board.board_start_date}</p>
	                    </div>
	                </div>
	                <div class="middle"><!-- /board/boardImage/ -->
	                    <img class="thumnail" src="${context}/resources/image/${board.board_image_file_path}/${board.board_image_file}">
	                    <div class="middleHover">
	                        <div class="state">모집중</div>
	                        <div class="viewandchat">
	                            <div class="view">
	                                <img src="${context}/resources/image/board/eye.svg">
	                                <p>${board.board_view_count}</p>
	                            </div>
	                            <div class="view">
	                                <img src="${context}/resources/image/board/chat.svg">
	                                <p>2</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="bottom">
	                    <p class="listTitle">${board.board_title}</p>
	                    <p class="listContent">${board.board_content}</p>
	                </div>
	            </div>
            </c:forEach>
            </div>
            <div class="row">
        	<c:forEach var="board" items="${boardList}" begin="8" end="11">
	            <div class="col" onclick="location.href='board.do?no=${board.board_number}'">
	                <div class="top">
	                    <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
	                    <div class="topInfo memberInfo">
	                        <p>${board.member_nickname}</p>
	                        <div class="ageandgender">
	                            <p>${board.member_age}0대 </p>
	                            <div>·</div>
	                            <p>${board.member_gender}성</p>
	                        </div> 
	                    </div>
	                    <div class="line">|</div>
	                    <div class="topInfo festivalName">
	                    	<p>${board.festival_name}</p>
	                    	<p>${board.board_start_date}</p>
	                    </div>
	                </div>
	                <div class="middle"><!-- /board/boardImage/ -->
	                    <img class="thumnail" src="${context}/resources/image/${board.board_image_file_path}/${board.board_image_file}">
	                    <div class="middleHover">
	                        <div class="state">모집중</div>
	                        <div class="viewandchat">
	                            <div class="view">
	                                <img src="${context}/resources/image/board/eye.svg">
	                                <p>${board.board_view_count}</p>
	                            </div>
	                            <div class="view">
	                                <img src="${context}/resources/image/board/chat.svg">
	                                <p>2</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="bottom">
	                    <p class="listTitle">${board.board_title}</p>
	                    <p class="listContent">${board.board_content}</p>
	                </div>
	            </div>
            </c:forEach>
            </div>
            <div class="row">
        	<c:forEach var="board" items="${boardList}" begin="12" end="15">
	            <div class="col" onclick="location.href='board.do?no=${board.board_number}'">
	                <div class="top">
	                    <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
	                    <div class="topInfo memberInfo">
	                        <p>${board.member_nickname}</p>
	                        <div class="ageandgender">
	                            <p>${board.member_age}0대 </p>
	                            <div>·</div>
	                            <p>${board.member_gender}성</p>
	                        </div> 
	                    </div>
	                    <div class="line">|</div>
	                    <div class="topInfo festivalName">
	                    	<p>${board.festival_name}</p>
	                    	<p>${board.board_start_date}</p>
	                    </div>
	                </div>
	                <div class="middle"><!-- /board/boardImage/ -->
	                    <img class="thumnail" src="${context}/resources/image/${board.board_image_file_path}/${board.board_image_file}">
	                    <div class="middleHover">
	                        <div class="state">모집중</div>
	                        <div class="viewandchat">
	                            <div class="view">
	                                <img src="${context}/resources/image/board/eye.svg">
	                                <p>${board.board_view_count}</p>
	                            </div>
	                            <div class="view">
	                                <img src="${context}/resources/image/board/chat.svg">
	                                <p>2</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="bottom">
	                    <p class="listTitle">${board.board_title}</p>
	                    <p class="listContent">${board.board_content}</p>
	                </div>
	            </div>
            </c:forEach>
            </div>
        </section>
        <section>
            <div>
            <form action="boardList.do" name="pageForm" id="pageChevrons" method="post">
                <button class="chevron" id="firstPage" type="button"><img src="${context}/resources/image/board/chevron-double-left.svg"></button>
                <button class="chevron" id="prevPage" type="button" value="${pageCreate.beginPage-1}"><img src="${context}/resources/image/board/chevron-left.svg"></button>
                <div id="pageNumbers">
                	<c:forEach var="page" begin="${pageCreate.beginPage}" end="${pageCreate.endPage}">
                		<button type="button" class="${pageCreate.criteria.pageNumber == page ? 'pageItemActive' : 'pageItem'}">${page}</button>
                	
                	</c:forEach>
                     <input type="hidden" name="pageNumber" value="${pageCreate.criteria.pageNumber}">
                     <input type="hidden" name="amount" value="${pageCreate.criteria.amount}">
                     <input type="hidden" name="endPage" value="${pageCreate.endPage}">
                </div>
                <button class="chevron" id="nextPage" type="button" value="${pageCreate.endPage+1}"><img src="${context}/resources/image/board/chevron-right.svg"></button>
                <button class="chevron" id="lastPage"><img src="${context}/resources/image/board/chevron-double-right.svg"></button>
            </form>
            </div>
        </section>
    </div>
<jsp:include page="footer.jsp"/>
<script src="${context}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript" src="${context}/resources/js/board.js"></script>
</body>
</html>
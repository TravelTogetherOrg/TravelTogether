<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css">
    <link rel='stylesheet' type='text/css' media='all' href='${context}/resources/css/base.css'>
    <link rel='stylesheet' type='text/css' media='all' href='${context}/resources/css/board.css?'>
    <title>동행 게시글</title>
</head>
<body>
<jsp:include page="header.jsp"/>
    <main class="container-md boardMain">
        <section> <!--배경으로 이미지container-->
            <div class="boardImageAndMap"><!--  -->
                <img id="boardImage" alt="이미지" src="${context}/resources/image/${board.board_image_file_path}/${board.board_image_file}">
                <div id="boardMap">
                    <iframe id="boardMapIframe"></iframe>
                </div>
            </div>
            
        </section>
        <div class="boardContents">
            <div class="boardContent"><!--게시글 내용-->
                <div class="boardTitle">
                    <p>${board.board_title}</p>
                </div>
                <div class="writerInfo"><!--작성자 프로필-->
                    <div>
                        <img src="${context}/resources/image/board/vector_profile_willy.svg">
                    </div>
                    <div class="writerInfoInner">
                        <span>${board.member_nickname}</span>
                        <span>${board.member_age}0대 · ${board.member_gender}성</span>
                    </div>
                </div>
                <div class="boardInfo">
                    <div class="boardFestivalAndPeople">
                        <div class="boardFestival">
                            <p>축제</p>
                            <span>${board.festival_name}</span>
                        </div>
                        <div class="boardPeople"> 
                            <p>모집인원</p>
                            <span>${board.board_total_people}명</span>
                        </div>
                    </div>
                    <div class="boardDate">
                        <svg width="14" height="14" viewBox="0 0 14 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="display: inline-block;">
                            <path d="M13.8828 4.3846C13.8829 4.10977 13.8294 3.83763 13.7256 3.58372C13.6218 3.32981 13.4696 3.09909 13.2777 2.90475C13.0858 2.7104 12.858 2.55624 12.6072 2.45106C12.3565 2.34588 12.0878 2.29175 11.8164 2.29175H2.08262C1.53477 2.29215 1.00949 2.51283 0.622273 2.90528C0.235052 3.29773 0.0175774 3.82983 0.0176569 4.3846V5.9756H0V13.806C0 14.3879 0.228278 14.946 0.634616 15.3575C1.04095 15.7689 1.59206 16.0001 2.16671 16.0001H11.6988C12.2734 15.9999 12.8244 15.7687 13.2307 15.3573C13.637 14.9459 13.8653 14.3879 13.8655 13.806V6.21561H13.8828V4.3846Z" fill="#9A9A9A"></path>
                            <path d="M3.22294 3.04927C2.98173 3.04927 2.75041 2.95348 2.57985 2.78298C2.40929 2.61249 2.31348 2.38124 2.31348 2.14012V0.909143C2.31348 0.668024 2.40929 0.436779 2.57985 0.266282C2.75041 0.0957845 2.98173 0 3.22294 0C3.46414 0 3.69547 0.0957845 3.86602 0.266282C4.03658 0.436779 4.1324 0.668024 4.1324 0.909143V2.14012C4.1324 2.38124 4.03658 2.61249 3.86602 2.78298C3.69547 2.95348 3.46414 3.04927 3.22294 3.04927Z" fill="#9A9A9A"></path>
                            <path d="M10.8584 3.04927C10.6172 3.04927 10.3859 2.95348 10.2153 2.78298C10.0448 2.61249 9.94897 2.38124 9.94897 2.14012V0.909143C9.94897 0.668024 10.0448 0.436779 10.2153 0.266282C10.3859 0.0957845 10.6172 0 10.8584 0C11.0996 0 11.331 0.0957845 11.5015 0.266282C11.6721 0.436779 11.7679 0.668024 11.7679 0.909143V2.14012C11.7679 2.38124 11.6721 2.61249 11.5015 2.78298C11.331 2.95348 11.0996 3.04927 10.8584 3.04927Z" fill="#9A9A9A"></path>
                            <path d="M14 5.57568H0.117188V6.82461H14V5.57568Z" fill="white"></path>
                        </svg>
                        <span>${board.board_start_date} <c:if test="${not empty board.board_end_date}">~ ${board.board_end_date}</c:if> </span>
                    </div>
                </div>
                <p class="boardSubstance">${board.board_content}</p>
            </div>
            <div class="boardSub"><!--날짜/조회수/댓글-->
                <div>
                    <p>
	                <c:choose>
	                	<c:when test="${not empty board.board_update_date}">
	                		수정일: ${board.board_update_date}
	                	</c:when>
	                	<c:otherwise>
		                    ${board.board_write_date}
	                	</c:otherwise>
	                </c:choose>
	                · 조회수 ${board.board_view_count} </p>
                    <button>신고하기</button> &nbsp;
                    <p><a href="${context}/updateBoard.do?no=${board.board_number}">수정</a></p>&nbsp;
                    <p><a href="${context}/deleteBoard.do?no=${board.board_number}">삭제</a></p>
                </div>
                <div class="comment">
                        <div id="commentWrite">
                        <div style="display: none;">
                        	<input type="hidden" id="board_number" value="${board.board_number}">
                        	<input type="hidden" id="member_id" value="xbj3812@gmail.com">
                        </div>
                            <textarea placeholder="댓글을 입력해주세요." id="comment_content"></textarea>
                            <button type="button" id="writeComment">게시</button>
                        </div>
                    <div id="commentList"> <!--댓글 리스트-->
                        <div id="eachComment">
                        	<div class="userCommentDiv">
	                            <div class="commentUserInfo"><!--프로필사진/닉네임/작성한 날짜,시간-->
	                                <div >
	                                    <img src="${context}/resources/image/board/vector_profile_willy.svg">
	                                </div>
	                                <div class="commentUserInfoInner">
	                                    <span class="commentUserName">댓글닉네임</span>
	                                    <span>${board.board_write_date}</span>
	                                </div>
	                            </div>
	                            <div class="userComment"><!--작성한 댓글-->
	                                <span>동행하고 싶어요</span>
	                            </div>
	                            <div class="recommentAndDelete"><!--답글달기 삭제하기-->
	                                <button class="recommentWrite">답글달기</button>
	                                <span>|</span>
	                                <button class="commentDelete">삭제하기</button>
	                            </div>
                            </div>
                            <div class="recomment"><!--답글-->
                                <div class="commentUserInfo"><!--프로필사진/닉네임/작성한 날짜,시간-->
                                    <div>
                                        <img src="${context}/resources/image/board/vector_profile_willy.svg">
                                    </div>
                                    <div class="commentUserInfoInner">
                                        <span class="commentUserName">답글닉네임</span>
                                        <span>2023.06.30 09:10:33</span>
                                    </div>
                                </div>
                                <div class="userComment"><!--작성한 댓글-->
                                    <span>답글 예시</span>
                                </div>
                                <div class="recommentAndDelete"><!--답글달기 삭제하기-->
                                    <button class="recommentWrite">답글달기</button>
                                    <span>|</span>
                                    <button class="commentDelete">삭제하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
<jsp:include page="footer.jsp"/>
    <script src="${context}/resources/js/jquery-3.6.4.js"></script>
    <script type="text/javascript" src="${context}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${context}/resources/js/board.js"></script>
</body>
</html>
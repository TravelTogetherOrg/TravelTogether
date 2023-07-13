<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${context}/resources/css/base.css">
<link rel="stylesheet" href="${context}/resources/css/board.css">
<!-- 
    <link rel="stylesheet" href="bootstrap.min.css">
-->

<title>축제 동행 찾기</title>
</head>
<jsp:include page="header.jsp"/>
<body class="stst">
    <div class="container">
        <section id="festivalSearch">  <!-- 드롭다운 축제 -->
            <form action="#" method=""> 
                <div>
                    <p>축제 동행 찾기</p><br> &nbsp;&nbsp;
                    
                    <select name="festival">
                        <option disabled selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어떤 축제를 찾으시나요?</option>
                        <option value="">축제1</option>
                        <option value="">축제2</option>
                    </select>
                    <button type="submit"><img src="${context}/resources/image/board/search.svg"></button>
                    
                    <!-- 검색 아이콘 누르면 submit(검색) -->
                    <!--옵션아이콘(드롭박스)-최신순/모집중 표시 -->
                </div>
            </form>
            <div id="boardWriteButton" align="right">
            <button type="button" onclick="location.href='boardWrite.jsp'">글쓰기</button>
            </div>
        </section>
        <section id="boardList" >  <!-- 동행 게시글 리스트 -->
            <div class="row"> 
               <!--  <a href="board.jsp"> -->
                    <div class="col" onclick="location.href='board.jsp'">
                        <div class="top">
                            <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                            <div class="topInfo">
                                <p>닉네임</p>
                                <div class="ageandgender">
                                    <p>20대</p>
                                    <div>·</div>
                                    <p>여성</p>
                                </div> 
                            </div>
                            <div class="line">|</div>
                            <div class="topInfo">주류박람회<br>2023-06-23</div>
                        </div>
                        <div class="middle">
                            <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                            <div class="middleHover">
                                <div class="state">모집중</div>
                                <div class="viewandchat">
                                    <div class="view">
                                        <img src="${context}/resources/image/board/eye.svg">
                                        <p>30</p>
                                    </div>
                                    <div class="view">
                                        <img src="${context}/resources/image/board/chat.svg">
                                        <p>2</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom">
                            <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                            <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                        </div>
                    </div>
                <!-- </a> -->
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
                <div class="col" onclick="location.href='board.jsp'">
                    <div class="top">
                        <img class="profileImage" src="${context}/resources/image/board/vector_profile_willy.svg">
                        <div class="topInfo">
                            <p>닉네임</p>
                            <div class="ageandgender">
                                <p>20대</p>
                                <div>·</div>
                                <p>여성</p>
                            </div> 
                        </div>
                        <div class="line">|</div>
                        <div class="topInfo">주류박람회<br>2023-06-23</div>
                    </div>
                    <div class="middle">
                        <img class="thumnail" src="${context}/resources/image/board/IMG_2359.JPG">
                        <div class="middleHover">
                            <div class="state">모집중</div>
                            <div class="viewandchat">
                                <div class="view">
                                    <img src="${context}/resources/image/board/eye.svg">
                                    <p>30</p>
                                </div>
                                <div class="view">
                                    <img src="${context}/resources/image/board/chat.svg">
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <p class="listTitle">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,</p>
                        <p class="listContent">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                    </div>
                </div>
            </div>
        </section>
        <section>  <!-- 페이 넘기기 아님 전체 다 보이기 -->
            <div id="pageChevrons">
                <button class="chevron"><img src="${context}/resources/image/board/chevron-double-left.svg"></button>
                <button class="chevron"><img src="${context}/resources/image/board/chevron-left.svg"></button>
                <div id="pageNumbers">
                    <button type="button">1</button>
                    <button type="button">2</button>
                    <button type="button">3</button>
                    <button type="button">4</button>
                    <button type="button">5</button>
                </div>
                <button class="chevron"><img src="${context}/resources/image/board/chevron-right.svg"></button>
                <button class="chevron"><img src="${context}/resources/image/board/chevron-double-right.svg"></button>
            </div>
        </section>
    </div>
<jsp:include page="footer.jsp"/>
<script src="${context}/resources/js/jquery-3.6.4.js"></script>
<!--<script type="text/javascript" src="/WebContent/js/bootstrap.min.js"></script>-->
<script type="text/javascript" src="${context}/resources/js/board.js"></script>
</body>
</html>
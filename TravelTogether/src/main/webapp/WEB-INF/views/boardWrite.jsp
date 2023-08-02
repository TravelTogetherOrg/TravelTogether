<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="${context}/resources/image/favi/favicon-16x16.png">
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css">
    <link rel='stylesheet' type='text/css' media='all' href='${context}/resources/css/base.css'>
    <link rel='stylesheet' type='text/css' media='all' href='${context}/resources/css/board.css'>
    <title>TT_동행 게시글 작성</title>
</head>
<body>
<jsp:include page="header.jsp"/>
    <section class="intro">
        <div>
            <p>나와 맞는 축제 동행과 이야기를 나누어 보아요!</p>
            <p>축제 동행 찾기</p>
        </div>
    </section>
    <main class="container-md">
        <section>
            <form action="insertBoard" id="form" name="boardForm" method="post" enctype="multipart/form-data">
            <div style="display: none;">
            <input type="hidden" name="id" id="inputId" value="${sessionScope.userId}">
            <input type="hidden" name="festival_name" id="festival_name">
            </div>
            <section>
                <div class="chooseDetail">
                    <div id="selectFestivalByRegion">
                        <div>
                            <table id="regions">
                                <tr><td id="서울">서울</td></tr>
                                <tr><td id="경기도">경기도</td></tr>
                                <tr><td id="인천">인천</td></tr>
                                <tr><td id="부산">부산</td></tr>
                                <tr><td id="제주">제주도</td></tr>
                                <tr><td id="강원">강원도</td></tr>
                                <tr><td id="세종">세종</td></tr>
                                <tr><td id="충청">충청도</td></tr>
                                <tr><td id="경상">경상도</td></tr>
                                <tr><td id="전라">전라도</td></tr>
                                <tr><td id="광주광역시">광주</td></tr>
                                <tr><td id="대전">대전</td></tr>
                                <tr><td id="대구">대구</td></tr>
                                <tr><td id="울산">울산</td></tr>
                            </table>
                        </div>
                    </div>
                    <div class="peopleAndDate"><!--인원수/날짜-->
                        <div class="people">
                            <select id="board_total_people" name="board_total_people" required>
                                <option disabled selected>인원수</option>
                                <option value=1>1명</option>
                                <option value=2>2명</option>
                                <option value=3>3명</option>
                                <option value=4>4명</option>
                            </select>
                        </div>
                        <div class="date">
                            <div>
                                <label for="moreDays">
                                <input type="checkbox" id="moreDays">
                                1박 이상</label>
                            </div>
                            <input type="date" name="board_start_date" id="start_date" required>
                            <div id="lastDay">
                                <span>~</span>
                                <input type="date" name="board_end_date" id="end_date">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div><!--이미지/내용 입력-->
                <div class="writeImage">
                    <div class="writeImageInfo">
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" style="display: inline-block;">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M0 6.54397C0 2.92984 2.93584 0 6.55738 0H43.4426C47.0642 0 50 2.92983 50 6.54397V43.456C50 47.0702 47.0642 50 43.4426 50H6.55738C2.93584 50 0 47.0702 0 43.456V6.54397ZM6.55738 2.86299C4.52026 2.86299 2.86885 4.51102 2.86885 6.54397V43.456C2.86885 45.489 4.52026 47.137 6.55738 47.137H9.23315L32.1003 23.5656C34.6482 20.9392 38.8581 20.9052 41.4483 23.4901L47.1311 29.1613V6.54397C47.1311 4.51102 45.4797 2.86299 43.4426 2.86299H6.55738ZM43.4426 47.137H13.2262L34.1615 25.557C35.5947 24.0796 37.9627 24.0605 39.4197 25.5145L47.1311 33.2102V43.456C47.1311 45.489 45.4797 47.137 43.4426 47.137ZM11.5779 17.1268C11.5779 14.1056 14.032 11.6564 17.0594 11.6564C20.0868 11.6564 22.541 14.1056 22.541 17.1268C22.541 20.148 20.0868 22.5971 17.0594 22.5971C14.032 22.5971 11.5779 20.148 11.5779 17.1268ZM17.0594 8.79346C12.4476 8.79346 8.70902 12.5244 8.70902 17.1268C8.70902 21.7292 12.4476 25.4601 17.0594 25.4601C21.6712 25.4601 25.4098 21.7292 25.4098 17.1268C25.4098 12.5244 21.6712 8.79346 17.0594 8.79346Z" fill="#DBDBDB"></path>
                        </svg>
                        <div>
                            <p>배경사진을 선택해주세요</p>
                            <div style="width: 0.875em; height: 0.875em; background-color: rgba(0, 0, 0, 0.2); border-radius: 0.4375em; display: inline-flex; align-items: center; justify-content: center; margin-top: 1em;">
                                <svg width="2" height="8" viewBox="0 0 2 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M0.493506 5.23368H1.49351L1.7013 1.57833L1.75325 0.5H0.246753L0.285714 1.57833L0.493506 5.23368ZM0.987013 7.5C1.55844 7.5 2 7.19843 2 6.76893C2 6.33943 1.55844 6.01958 0.987013 6.01958C0.428571 6.01958 0 6.33943 0 6.76893C0 7.19843 0.428571 7.5 0.987013 7.5Z" fill="#FFF"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <input id="inputImage" name="uploadFile" type="file" accept="image/bmp,image/jpg,image/jpeg,image/png" style="display: none; margin: 0px; padding: 0px;">
                </div>
                <div class="writeTitle">
                    <input type="text" name="board_title" id="board_title" placeholder="ex) 8월 펜타포트 같이 갈 동행 3명 구해요" maxlength="50" required>
                </div>
                <div class="writeContent">
                	<textarea name="board_content" id="board_content" maxlength="1000" placeholder="1. 현재 동행이 있나요? 
ex) 혼자에요 / 동행 1명이 있어요 

2.어떤 동행을 찾고 있나요? 
ex) 음악을 좋아하는 20대 여성 동행을 찾아요!

(1000자 이내) " required></textarea>
                </div>
            </div>
            <div class="buttons">
                <button class="resetButton" type="button" onclick="location.href='boardList'">취소</button>
                <button class="submitButton" type="button" onclick="limitCheck()">작성완료</button>
            </div>
        </form>
        </section>
    </main>
<jsp:include page="footer.jsp"/>
    <script src="${context}/resources/js/jquery-3.6.4.js"></script>
    <script type="text/javascript" src="${context}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='${context}/resources/js/board.js'></script>
</body>
</html>
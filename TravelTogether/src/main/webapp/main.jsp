<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

  <link rel='stylesheet' type='text/css' media='all' href='${context}/resources/css/main.css?hhh'>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://kit.fontawesome.com/cd8f90f87a.js"crossorigin="anonymous"></script>
  </head>
  <body>
    <div id="container">
      
      	<%@ include file="./views/header.jsp" %>
      
      <div class="chat-icon">
        <ul class="chat-icon-inner">
          <li><i class="fa-solid fa-comment-dots"></i></li>
        </ul>
        <!-- <div class="chat-box-container">
          <div>
            에오오
        </div>
      </div> -->
      <!-- ---------------------------image swiper----------------------------- -->
      <div id="main-top-section" style="background-color: rgb(192, 228, 255)">
        <img src="${context}/resources/image/main/main_top_symbol.png" id="main-top-img" />
        <div class="swiper mySwiper gallery-top">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img src="${context}/resources/image/main/swiper_info_1.png" />
            </div>
            <div class="swiper-slide">
               <img src="${context}/resources/image/main/swiper_info_2.png" />
            </div>
            <div class="swiper-slide">
                <img src="${context}/resources/image/main/swiper_info_3.png" />
            </div>
            <div class="swiper-slide">
                <img src="${context}/resources/image/main/swiper_info_4.png" />
            </div>
          </div>
        </div>
        <!-- ---------------------------text swiper-------------------------------- -->
        <div class="wrap_thumb_layout">
          <div class="swiper-container gallery-thumbs">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="swiper-slide-container">
                  <em>오감만족</em>
                  <p> 보기만 해도 시원한<br /> 목포 여행 🏄 </p>
                  <a href="getFestival.do?festival_name=2023%20목포해상W쇼">자세히 보기</a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="swiper-slide-container">
                  <em>여름 꽃 여행</em>
                  <p>몽글몽글 피어난 <br />전국 수국 명소 💐</p>
                  <a href="getFestival.do?festival_name=휴애리%20여름%20수국축제">자세히 보기</a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="swiper-slide-container">
                  <em>노을 명소</em>
                  <p> 저녁에 즐기는 <br />  알록달록 인천 명소🌆 </p>
                  <a href="getFestival.do?festival_name=영덕문화재%20야행">자세히 보기</a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="swiper-slide-container">
                  <em>가족여행</em>
                  <p> 낭만이 있는 그곳,<br /> 강릉으로 떠나요🌈</p>
                  <a href="getFestival.do?festival_name=강릉문화재야행">자세히 보기</a>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-navi">
            <div class="swiper-button-prev">
              <i class="fa-solid fa-circle-arrow-left"></i>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next">
              <i class="fa-solid fa-circle-arrow-right"></i>
            </div>
          </div>
          <div class="pagination_progress"></div>
        </div>  
      </div>
    


<!-- ---------------------------middle section-------------------------------- -->

   <div class="middle-blank"></div>
      <!--  <div id="main-middle-section">
        <div id="middle-inner-box">
          <em class="middle-box-tag">여행가는 달</em>
          <h2>2023 여행가는 달</h2>
          <p>여행이 활짝! 일상이 반짝!<br>대한민국은 절찬여행중</p>
          <span>2023. 6. 1. ~ 2023. 6. 30.</span>
          <div class="middle-list-box">
            <div id="list-text-box">
              <p id="list-title"> 여행가는달 혜택 및 이벤트</p>
            </div>
            <div id="list-image-box">
              <div class="list-inner-image" style="background-image:url(../image/main/list_tag_1.png);"></div>
              <div class="list-inner-image" style="background-image:url(../image/main/list_tag_2.png);"></div>
              <div class="list-inner-image" style="background-image:url(../image/main/list_tag_3.png);"></div>
            </div>
          </div>
          <img src="../image/main/main_middle_text.png"style="position: absolute; right:-5%; top:0%;"/>
        </div>
      </div> -->
      <!-- ---------------------------main-middle-banner-------------------------------- -->
      <div id ="main-middle-banner">
        <div id="banner-top-box"> 
          <h2>여행콕콕</h2>
          <p>빅데이터 정보를 기반으로 이번달 가장 핫🔥한 여행지를 추천해드려요</p>
        </div>
        <div id="banner-bottom-box">
          <ul id="banner-bottom-inner">
            <li class="banner-inner-button" id="button_1" type="button"> TT 추천 여행지<i class="fa-solid fa-forward" style="color: black;"></i></li>
            <li class="banner-inner-button" id="button_2" type="button">이번 달 인기 동행 여행지<i class="fa-solid fa-forward" style="color: black;"></i></li>
          </ul>
        </div>
      </div>
      
      
      
      
      <!-- ---------------------------main-bottom-grid-------------------------------- -->
      <div class="main-bottom-section">
      
        <div id="bottom-grid" class="bottom-grid1">
          <div class="grid">
           <c:set var="imagePath" value="${context}/resources/image/festival/구팔일 올데이 페스티벌/구팔일 올데이 페스티벌_1_공공3유형" />      
            <div class="grid-img" onclick="rcd1()" style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');"></div>
              <p class="grid-text-p">구팔일 올데이 페스티벌</p>
              <span class="grid-text-span">제주도 제주시</span>
            </div>
            
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/광주비엔날레/광주비엔날레_1_공공3유형" />
            <div class="grid-img" onclick="rcd2()"  style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');" background-position: 50%;"></div>
              <p class="grid-text-p">광주비엔날레</p>
              <span class="grid-text-span">광주광역시 북구</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/둥실둥실해양페스타/둥실둥실해양페스타_1_공공3유형" />
            <div class="grid-img"  onclick="rcd3()" style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');"></div>
              <p class="grid-text-p">둥실둥실해양페스타</p>
              <span class="grid-text-span">인천광역시 연수구</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/무안연꽃축제/무안연꽃축제_1_공공3유형" />
            <div class="grid-img"  onclick="rcd4()" style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');" background-position: 50%;"></div>
              <p class="grid-text-p">무안연꽃축제</p>
              <span class="grid-text-span">전라남도 무안군</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/시흥거북섬해양축제/시흥거북섬해양축제_1_공공3유형" />
            <div class="grid-img"  onclick="rcd5()" style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');" background-position: 20%;"></div>
              <p class="grid-text-p">시흥거북섬해양축제</p>
              <span class="grid-text-span">경기도 시흥시</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/이월드 퍼플 아일랜드/이월드 퍼플 아일랜드_1_공공3유형" />
            <div class="grid-img"  onclick="rcd6()" style="background-image:url('${imagePath}.jpg" onerror="this.onerror=null; this.src='${imagePath}.jpg'');"></div>
              <p class="grid-text-p">이월드 퍼플 아일랜드</p>
              <span class="grid-text-span">대구 달서구</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/양평물빛축제/양평물빛축제_1_공공3유형" />
            <div class="grid-img" onclick="rcd7()" style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');"></div>
              <p class="grid-text-p">양평물빛축제</p>
              <span class="grid-text-span">경기도 양평군</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/평창더위사냥축제/평창더위사냥축제_1_공공3유형" />
            <div class="grid-img" onclick="rcd8()" style="background-image:url('${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'');"></div>
              <p class="grid-text-p">평창더위사냥축제</p>
              <span class="grid-text-span">강원특별자치도 평창군</span>
            </div>
          </div>
        </div>
        
        
        
        
        
        
        <!-- TT 추천 -->
        <div id="bottom-grid" class="bottom-grid2" style="display: none;">
          <div class="grid">
           <c:set var="imagePath" value="${context}/resources/image/festival/허브아일랜드 라벤더축제/허브아일랜드 라벤더축제_1_공공3유형" />
            <div class="grid-img" onclick="rcd3()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
              <p class="grid-text-p">허브아일랜드 라벤더축제</p>
              <span class="grid-text-span">제주도 제주시</span>
            </div>
            
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/서울프린지페스티벌/서울프린지페스티벌_1_공공3유형" />
            <div class="grid-img" onclick="rcd2()"  style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');" background-position: 50%;"></div>
              <p class="grid-text-p">광주비엔날레</p>
              <span class="grid-text-span">광주광역시 북구</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/물총축제/물총축제_1_공공3유형" />
            <div class="grid-img"  onclick="rcd3()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
              <p class="grid-text-p">둥실둥실해양페스타</p>
              <span class="grid-text-span">인천광역시 연수구</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/대전 0시 축제/대전 0시 축제_1_공공3유형" />
            <div class="grid-img"  onclick="rcd4()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');" background-position: 50%;"></div>
              <p class="grid-text-p">무안연꽃축제</p>
              <span class="grid-text-span">전라남도 무안군</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/시흥거북섬해양축제/시흥거북섬해양축제_1_공공3유형" />
            <div class="grid-img"  onclick="rcd5()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');" background-position: 20%;"></div>
              <p class="grid-text-p">시흥거북섬해양축제</p>
              <span class="grid-text-span">경기도 시흥시</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/양평메기수염축제/양평메기수염축제_1_공공3유형" />
            <div class="grid-img"  onclick="rcd6()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
              <p class="grid-text-p">이월드 퍼플 아일랜드</p>
              <span class="grid-text-span">대구 달서구</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/좀비런 부산/좀비런 부산_1_공공3유형" />
            <div class="grid-img" onclick="rcd7()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
              <p class="grid-text-p">양평물빛축제</p>
              <span class="grid-text-span">경기도 양평군</span>
            </div>
          <div class="grid">
          	<c:set var="imagePath" value="${context}/resources/image/festival/휴애리 유럽 수국축제/휴애리 유럽 수국축제_1_공공3유형" />
            <div class="grid-img" onclick="rcd8()" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
              <p class="grid-text-p">평창더위사냥축제</p>
              <span class="grid-text-span">강원특별자치도 평창군</span>
            </div>
          </div>
        </div>
        
        
        
        
      	<%@ include file="./views/footer.jsp" %>
      </div>
      
 
 
 
 
 
  <!-- ---------------------------script-------------------------------- -->
<!--   <script>

$(document).ready(function(){
	// 퀵배너 스크롤
	function updateChatIcon() {
		var quickPos = $('.chat-icon').offset().top;
		var winPos = $(window).scrollTop();
		if( winPos > quickPos ) $('.chat-icon .chat-icon-inner').addClass('fixed');
		else $('.chat-icon .chat-icon-inner').removeClass('fixed');
	}

	// 초기 로드 시 아이콘 상태 업데이트
	updateChatIcon();

	// 스크롤 이벤트 핸들러 등록
	$(window).scroll(function(){
		updateChatIcon();
	});
});
var context = "${context}";

var gridImages = document.querySelectorAll('.grid-img');
var gridP = document.querySelectorAll('.grid-text-p');
var gridSpan = document.querySelectorAll('.grid-text-span');
var button1 = document.querySelector('#button_1');
var button2 = document.querySelector('#button_2');
var images_1 = ['resources/image/main/grid_info_1.png', '../image/main/grid_info_3.jpg', '../image/main/grid_info_4.jpg', 
              '../image/main/grid_info_5.png', '../image/main/grid_info_6.jpg', '../image/main//grid_info_7.jpg', '../image/main/grid_info_8.jpg'];
var images_2 = ['resources/image/main/grid_info_8.jpg', '../image/main/grid_info_7.jpg', '../image/main/grid_info_6.jpg', '../image/main/grid_info_5.png', 
              '../image/main/grid_info_5.png', '../image/main/grid_info_6.jpg', '../image/main//grid_info_7.jpg', '../image/main/grid_info_8.jpg'];
var p_1 = ['구팔일 올데이 페스티벌', '대한민국 독서대전', '부천국제 만화축제', '서울 프린지 페스티벌', '시흥 거북섬 해양축제', '이월드 퍼플 아일랜드', '광주 추억의 충장축제', '인천개항장 문화재야행'];
var p_2 = ['a벌', 'dddd', '부천국ddd축제', '서울 프린지 페스티벌', '시흥 거북섬 해양축제', '이월드 퍼플 아일랜드', '광주 추억의 충장축제', '인천개항장 문화재야행'];
var span_1 = ['제주도 제주시', '경기도 고양시', '경기도 부천시', '서울 마포구', '경기도 시흥시', '대구 달서구', '광주 동구', '인천 중구'];
var span_2 = ['제ㅇㅇㅇ시', '경ㅇㅇ양시', '경기도 부천시', '서울 마포구', '경기도 시흥시', '대구 달서구', '광주 동구', '인천 중구'];

button1.addEventListener('click', function() {
changeContent(images_1, p_1, span_1);
});
button2.addEventListener('click', function() {
changeContent(images_2, p_2, span_2);
});
function changeContent(images, texts, spans) {
  for (var i = 0; i < gridImages.length; i++) {
	  gridImages[i].style.backgroundImage = `url(${context}${images[i]})`;
	    /*  gridImages[i].style.backgroundImage = `url(${images[i]})`; */
  /*   gridImages[i].style.backgroundImage = `url(context+`${images[i]})`; */
  /*   gridImages[i].style.backgroundImage = `url("${context}"+"${images[i]}")`; */
    gridP[i].textContent = texts[i];
    gridSpan[i].textContent = spans[i];
    }
  };
    
  
    var firstButton = document.getElementsByClassName('banner-inner-button')[0];
    var secondButton = document.getElementsByClassName('banner-inner-button')[1];
    secondButton.addEventListener('click', function() {   // 배경색 변경
      firstButton.style.backgroundColor = 'white';
      firstButton.style.color ='#767676';
      firstButton.style.fontweight='800';
      secondButton.style.backgroundColor = '#567ff2';
      secondButton.style.color ='white';});
    firstButton.addEventListener('click', function() {  // 배경색 원래대로 되돌리기
      firstButton.style.backgroundColor = '#567ff2';
      firstButton.style.color ='white';
      secondButton.style.backgroundColor = 'white';
      secondButton.style.color ='#767676';
    });

    var liElements = document.querySelectorAll('#banner-bottom-inner .banner-inner-button');
    liElements.forEach(function(liElement) {
      liElement.addEventListener('mouseenter', function() { // 마우스 호버 시 i 요소에 스타일 추가
        var iElement = liElement.querySelector('i');
        iElement.style.animation = 'fa-beat-fade 1s infinite';});
      liElement.addEventListener('mouseleave', function() {  // 마우스 이탈 시 i 요소의 스타일 제거
        var iElement = liElement.querySelector('i');
        iElement.style.animation = '';});
    });
  </script> -->
  
  
  
  
  <!-- ---------------------------swiper js-------------------------------- -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script>
  function handleClick() {
      document.querySelector('#chat_iframe').style.display = 'block';
    }
  document.querySelector('.chat-icon').addEventListener('click', handleClick);
    var galleryTop = new Swiper(".gallery-top", {
      spaceBetween: 10, speed: 800, loop: true, loopedSlides: 1,
      autoplay: {
        delay: 3000, disableOnInteraction: false},
      pagination: {
        el: ".swiper-pagination", type: "fraction"},
      navigation: {
        nextEl: ".swiper-button-next", prevEl: ".swiper-button-prev"},
      on: {activeIndexChange: function () {
        if (this.realIndex == 0) {
          document.getElementById("main-top-section").style.backgroundColor = "rgb(192, 228, 255)";
        } else if (this.realIndex === 1) {
          document.getElementById("main-top-section").style.backgroundColor = "rgb(252, 243, 224)";
        } else if (this.realIndex === 2) {
          document.getElementById("main-top-section").style.backgroundColor = "rgb(255, 234, 217)";
        } else if (this.realIndex === 3) {
          document.getElementById("main-top-section").style.backgroundColor = "rgb(247, 212, 237)";
        }},
      },
    });

    var galleryThumbs = new Swiper(".gallery-thumbs", {
      spaceBetween: 10, speed: 800, 
      pagination: {
        el: ".pagination_progress",
			  type: "progressbar",
		  },
      loop: true,loopedSlides: 1, allowTouchMove: false, 
    });

    $(".swiper").each(function (elem, target) {
      var swp = target.swiper;
      $(this).hover(
        function () {
          swp.autoplay.stop();
          $(".swiper-slide img").css({
            transform: "scale(1.15)",
            transition: "transform 0.2s linear",
          });
        },
        function () {
          swp.autoplay.start();
          $(".swiper-slide img").css({
            transform: "scale(1)",
            transition: "transform 0.2s linear",
          });
        }
      );
    });

    galleryTop.controller.control = galleryThumbs;
    galleryTop.controller.control = galleryThumbs;
    galleryThumbs.controller.control = galleryTop;
  </script>
  
  
  
  
  
  



  
  
  <!-- 따로 만든것!!! 여기는 제가 편집했습니다. -->
  <!-- button_1,2 관한것 -->
<script>
  const button1 = document.getElementById('button_1');
  const button2 = document.getElementById('button_2');
  const bottomGrid1 = document.querySelector('.bottom-grid1');
  const bottomGrid2 = document.querySelector('.bottom-grid2');

  button1.addEventListener('click', function () {
    bottomGrid1.style.display = 'grid';
    bottomGrid2.style.display = 'none';
  });

  button2.addEventListener('click', function () {
    bottomGrid1.style.display = 'none';
    bottomGrid2.style.display = 'grid';
  });
  
  var firstButton = document.getElementsByClassName('banner-inner-button')[0];
  var secondButton = document.getElementsByClassName('banner-inner-button')[1];
  secondButton.addEventListener('click', function() {   // 배경색 변경
    firstButton.style.backgroundColor = 'white';
    firstButton.style.color ='#767676';
    firstButton.style.fontweight='800';
    secondButton.style.backgroundColor = '#567ff2';
    secondButton.style.color ='white';});
  firstButton.addEventListener('click', function() {  // 배경색 원래대로 되돌리기
    firstButton.style.backgroundColor = '#567ff2';
    firstButton.style.color ='white';
    secondButton.style.backgroundColor = 'white';
    secondButton.style.color ='#767676';
  });

  var liElements = document.querySelectorAll('#banner-bottom-inner .banner-inner-button');
  liElements.forEach(function(liElement) {
    liElement.addEventListener('mouseenter', function() { // 마우스 호버 시 i 요소에 스타일 추가
      var iElement = liElement.querySelector('i');
      iElement.style.animation = 'fa-beat-fade 1s infinite';});
    liElement.addEventListener('mouseleave', function() {  // 마우스 이탈 시 i 요소의 스타일 제거
      var iElement = liElement.querySelector('i');
      iElement.style.animation = '';});
  });
  
  
  
 
  
</script>
  
  
  
  
  
  
  
  
  
  
  
  
  <!-- TT 추천여행지를 제가 임의로 넣었습니다. -->
<script>
    function rcd1() {
        var festivalName = encodeURIComponent("구팔일 올데이 페스티벌");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd2() {
        var festivalName = encodeURIComponent("광주비엔날레");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd3() {
        var festivalName = encodeURIComponent("둥실둥실해양페스타");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd4() {
        var festivalName = encodeURIComponent("무안연꽃축제");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd5() {
        var festivalName = encodeURIComponent("시흥거북섬해양축제");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd6() {
        var festivalName = encodeURIComponent("이월드 퍼플 아일랜드");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd7() {
        var festivalName = encodeURIComponent("양평물빛축제");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
    function rcd8() {
        var festivalName = encodeURIComponent("평창더위사냥축제");
        var url = "getFestival.do?festival_name=" + festivalName;
        window.location.href = url;
    }
</script>  
  
  
  
  
  </body>
</html>

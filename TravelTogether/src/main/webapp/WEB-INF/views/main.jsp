<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <c:set var="context" value="${pageContext.request.contextPath}" />
   <% String userId = (String)session.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel='stylesheet' type='text/css' media='all' href='${context}/resources/css/main.css'>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TravelTogether</title>
<script src="https://kit.fontawesome.com/cd8f90f87a.js"crossorigin="anonymous"></script>
</head>
<link rel="icon" type="image/png" sizes="16x16" href="${context}/resources/image/favi/favicon-16x16.png">
<body>
	<div id="container">
		<%@ include file="header.jsp" %>
			<div class="chat-icon">
				<a href="ChatRoomList" onclick="chatRoom(event)">
					<ul class="chat-icon-inner">
						<li>
							<i class="fa-solid fa-comment-dots"></i>
						</li>
					</ul>
				</a>
			</div>
		<div id="main-top-section" style="background-color: rgb(192, 228, 255)"> <!-- image swiper -->
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
        	<div class="wrap_thumb_layout"><!-- text swiper -->
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
				                <p> 저녁에 즐기는 <br />  알록달록 영덕 명소🌆 </p>
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
	              		<i class="fa-solid fa-circle-arrow-left" style="margin-top:0px"></i>
	            	</div>
	            	<div class="swiper-pagination"></div>
	            	<div class="swiper-button-next">
						<i class="fa-solid fa-circle-arrow-right" style="margin-top:0px"></i>
	            	</div>
				</div>
				<div class="pagination_progress"></div>
			</div>  
		</div>
   		<div class="middle-blank"></div>
		<div id ="main-middle-banner"> <!-- main-middle-banner -->
        	<div id="banner-top-box"> 
				<h2>여행콕콕</h2>
				<p>빅데이터 정보를 기반으로 이번달 가장 핫🔥한 여행지를 추천해드려요</p>
			</div>
        	<div id="banner-bottom-box">
          		<ul id="banner-bottom-inner">
            		<li class="banner-inner-button" id="button_1" type="button"> TT 추천 여행지
            			<i class="fa-solid fa-forward" style="color: black;"></i>
            		</li>
            		<li class="banner-inner-button" id="button_2" type="button">이번 달 인기 동행 여행지
            			<i class="fa-solid fa-forward" style="color: black;"></i>
            		</li>
          		</ul>
        	</div>
		</div>
		<div class="main-bottom-section"><!-- main-bottom-grid -->
			<div id="bottom-grid" class="bottom-grid1" >
				<c:forEach items="${festivalRandomList}" var="festivalrandom">   
					<div class="grid">
					<c:set var="imagePath" value="${context}/resources/image/festival/${festivalrandom.festival_name}/${festivalrandom.festival_name}_1_공공3유형" />
					<div class="grid-img" onclick="location.href='getFestival.do?festival_name=${festivalrandom.festival_name}'" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
						<p class="grid-text-p">${festivalrandom.festival_name}</p>
						<c:set var="raomdomfestival" value="${fn:split(festivalrandom.festival_address, ' ')}" />
						<span class="grid-text-span">${raomdomfestival[0]} ${raomdomfestival[1]}</span>
		            </div>
				</c:forEach>
			</div>
			<div id="bottom-grid" class="bottom-grid2" style="display: none;"> <!-- TT 추천 -->
				<c:forEach items="${festivalLikeList}" var="festivallike">
					<div class="grid">
						<c:set var="imagePath" value="${context}/resources/image/festival/${festivallike.festival_name}/${festivallike.festival_name}_1_공공3유형" />
			            <div class="grid-img" onclick="location.href='getFestival.do?festival_name=${festivallike.festival_name}'" style="background-image:url('${imagePath}.png'), url('${imagePath}.jpg');"></div>
						<p class="grid-text-p">${festivallike.festival_name}</p>
						<c:set var="addressArray" value="${fn:split(festivallike.festival_address, ' ')}" />
						<span class="grid-text-span">${addressArray[0]} ${addressArray[1]}</span>
					</div>
				</c:forEach> 
			</div>
			<%@ include file="footer.jsp" %>
		</div>
	</div>
	<script> 
		$(document).ready(function(){ // 퀵 배너 스크롤 
			function updateChatIcon() {
				var quickPos = $('.chat-icon').offset().top;
				var winPos = $(window).scrollTop();
				if( winPos > quickPos ) $('.chat-icon .chat-icon-inner').addClass('fixed');
				else $('.chat-icon .chat-icon-inner').removeClass('fixed');
			}
			updateChatIcon();// 초기 로드 시 아이콘 상태 업데이트
			$(window).scroll(function(){	// 스크롤 이벤트 핸들러 등록
				updateChatIcon();
			});
		});
	</script>
  <!-----------------------------swiper js-------------------------------- -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script>
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
			        }else if (this.realIndex === 1) {
			        	document.getElementById("main-top-section").style.backgroundColor = "rgb(252, 243, 224)";
			        }else if (this.realIndex === 2) {
			          	document.getElementById("main-top-section").style.backgroundColor = "rgb(255, 234, 217)";
			       	}else if (this.realIndex === 3) {
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
	        	});
		});
	    galleryTop.controller.control = galleryThumbs;
	    galleryTop.controller.control = galleryThumbs;
	    galleryThumbs.controller.control = galleryTop;
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

	  	let firstButton = document.getElementsByClassName('banner-inner-button')[0];
	  	let secondButton = document.getElementsByClassName('banner-inner-button')[1];
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
	
	  	let liElements = document.querySelectorAll('#banner-bottom-inner .banner-inner-button');
	  	liElements.forEach(function(liElement) {
	    	liElement.addEventListener('mouseenter', function() { // 마우스 호버 시 i 요소에 스타일 추가
				iElement = liElement.querySelector('i');
		      	iElement.style.animation = 'fa-beat-fade 1s infinite';});
	   		liElement.addEventListener('mouseleave', function() {  // 마우스 이탈 시 i 요소의 스타일 제거
	      		iElement = liElement.querySelector('i');
	      		iElement.style.animation = '';});
	  	});
	</script>
</body>
</html>
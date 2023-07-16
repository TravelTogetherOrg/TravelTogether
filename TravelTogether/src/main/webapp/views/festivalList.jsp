<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
<link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css?asdad">
<link rel="stylesheet" href="${context}/resources/css/festivalHover.css">

<title>Insert title here</title>
    <style>

      /* 폰트 */
      @font-face {
                font-family: 'HSSaemaul-Regular';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSSaemaul-Regular.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }

      @font-face {
          font-family: 'SUITE-Regular';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
          font-weight: 400;
          font-style: normal;
      }

      @font-face {
          font-family: 'Dovemayo_gothic';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
          font-weight: normal;
          font-style: normal;
      }


      .card {
        position: relative;
        overflow: hidden;
      }

      .fixed-image {
        width: 100%;
        height: 270px; /* 원하는 높이로 설정 */
        object-fit: cover;
      }


      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .card-margin {
        margin-bottom: 20px;
      }

      .card-border {
        border-radius: 20px;
        border: 2px solid rgb(192, 228, 255);
      }

    </style>

    <!-- 카카오api -->
    <style>
      .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left; font-family: 'SUITE-Regular', sans-serif;}
      .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
      .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: rgb(255, 194, 0);background: rgb(255, 194, 0) url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
      .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:8px 15px;font-size:14px;font-weight:bold;}
      .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    </style>

</head>
<body style="padding-top: 70px; line-height: -1.5px;">
    
	<%@ include file="header.jsp" %>





<main>

  <br>
  <!-- 상단 축제이름 -->
  <div class="container">
    <h1 style="font-family: 'SUITE-Regular', sans-serif; font-size: 40px; text-align: center; font-weight: bold;"><span style="color: rgb(129, 189, 235)">7월 </span>축제 리스트</h1>

  </div>  



  <!-- 카카오api -->
  <div class="container">
    <div id="map" class="mw-100" style="height: 500px; margin: 5px 0px; border-radius: 20px;"></div>
  </div>




  <div class="album py-5">

    <div class="container">

      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
          <span id="selectedRegion">지역 선택</span>
        </button>


        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="#" onclick="changeRegion('전체')">전체</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('서울')">서울</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('경기도')">경기도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('인천광역시')">인천광역시</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('강원도')">강원도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('대전광역시')">대전광역시</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('충청북도')">충청북도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('충청남도')">충청남도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('세종특별시')">세종특별시</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('부산광역시')">부산광역시</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('울산광역시')">울산광역시</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('대구광역시')">경상북도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('경상남도')">경상남도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('전라북도')">전라북도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('전라남도')">전라남도</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('광주광역시')">광주광역시</a></li>
          <li><a class="dropdown-item" href="#" onclick="changeRegion('제주도')">제주도</a></li>
          <!-- 나머지 항목들 -->
        </ul>
      </div>


      <br>

      <div id="bottom-grid" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		
		
		<c:forEach items="${festivalList}" var="festival">
		  <div class="col grid hvr-float card-margin">
		    <div class="card shadow-sm card-border">
		      <a href="getFestival.do?festival_name=${festival.festival_name }">
		        <c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_1_공공3유형" />
				<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'" />
		      </a>
		
		      <div class="card-body">
		        <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
		          <strong>${festival.festival_name}</strong>
		        </p>
					<c:set var="startDate" value="${festival.festival_startdate}" />
					<c:set var="formattedStartDate" value="${startDate.substring(0, 4)}.${startDate.substring(4, 6)}.${startDate.substring(6)}" />
					
					<c:set var="endDate" value="${festival.festival_enddate}" />
					<c:set var="formattedEndDate" value="${endDate.substring(0, 4)}.${endDate.substring(4, 6)}.${endDate.substring(6)}" />
					
					<p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
					  ${formattedStartDate} - ${formattedEndDate}
					</p>
		        <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
		          <c:set var="addressArray" value="${fn:split(festival.festival_address, ' ')}" />
					<c:set var="shortenedAddress" value="${addressArray[0]} ${addressArray[1]}" />
					${shortenedAddress}
		        </p>
		        <div class="d-flex justify-content-between align-items-center">
		          <div class="btn-group">
		          </div>
		<!--           <small class="text-muted">10일 전</small> -->
		        </div>
		      </div>
		    </div>
		  </div>     
		</c:forEach>
		

      </div>
    </div>
  </div>

</main>




	<%@ include file="footer.jsp" %>

<!-- 주소 2칸만 -->
<script>
  var addressElements = document.querySelectorAll('#address');
  
  
</script>


<!-- 지역 선택 스크립트 -->
<script>
  function changeRegion(region) {
    document.getElementById('selectedRegion').textContent = region;
  }
</script>

<!-- 카카오api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b0de7649944cbcadc52b390c8508cf"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b0de7649944cbcadc52b390c8508cf"></script>
<script>
  var mapContainer = document.getElementById("map"); // 지도를 표시할 div
  var mapOption = {
    center: new kakao.maps.LatLng(37, 127), // 지도의 중심좌표
    level: 13, // 지도의 확대 레벨
  };

  var map = new kakao.maps.Map(mapContainer, mapOption);

  var positions = [
    <c:forEach items="${festivalList}" var="festival">
      {
        title: "${festival.festival_name}",
        latlng: new kakao.maps.LatLng(${festival.festival_latitude}, ${festival.festival_longitude}),
        url: "getFestival.do?festival_name=${festival.festival_name}"
      },
    </c:forEach>
  ];

  var markerImage = new kakao.maps.MarkerImage(
    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
    new kakao.maps.Size(30, 40),
    { offset: new kakao.maps.Point(15, 69) }
  );

  positions.forEach(function (pos) {
    var marker = new kakao.maps.Marker({
      map: map,
      position: pos.latlng,
      image: markerImage
    });

    var content =
      '<div class="customoverlay">' +
      '<a href="' + pos.url + '" target="_blank">' +
      '<span class="title">' + pos.title + '</span>' +
      '</a>' +
      '</div>';

    var customOverlay = new kakao.maps.CustomOverlay({
      map: map,
      position: pos.latlng,
      content: content,
      yAnchor: 1,
    });

    kakao.maps.event.addListener(marker, "mouseover", function () {
      customOverlay.setMap(map);
    });

    kakao.maps.event.addListener(marker, "mouseout", function () {
      customOverlay.setMap(null);
    });
  });

  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>

     <script src="${context}/resources/js/bootstrap.bundle.min.js"></script>

      
</body>
</html>
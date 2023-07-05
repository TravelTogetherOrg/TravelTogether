<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
<link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css">
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
<body>
    
    <header>
      <div class="navbar navbar-skyblue bg-skyblue shadow-sm">
        <div class="container">
          <a href="festivalList.jsp" class="navbar-brand d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="60" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
            <strong>Header</strong>
          </a>
        </div>
      </div>
    </header>





<main>

  <br>
  <!-- 상단 축제이름 -->
  <div class="container">
    <h1 style="font-family: 'SUITE-Regular', sans-serif; font-size: 40px; text-align: center; font-weight: bold;">축제 리스트</h1>

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

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_5fed1f2a-ffe8-4e03-806f-65cbd2096f22_1.png" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>이월드 퍼플 아일랜드</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>
        
        
        

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_3231f42a-7997-47b7-b520-efdb8142a5f3_1.jpg" />
            </a>

            <div class="card-body">
                <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                  <strong>구팔일 올데이 페스티벌</strong>
                </p>
                <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                  2023.05.01 - 2023.06.30
                </p>
                <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                  대구 달서구
                </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_79f3d2d9-06c1-4d18-9a0e-a7d38aa0857e_1.png" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>대한민국 독서대전</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_75a8d8fa-6550-490a-bf9c-d670a8a56aaf_1.png" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>시흥거북섬해양축제</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_4f3f89d7-34c7-4f5b-8ede-d1f8ee106bad_1.jpg" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>서울프린지페스티벌</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_387cfe24-b54f-464d-a06d-c1599d7eba59_1.jpg" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>인천개항장 문화재야행</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>

        
        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_5fed1f2a-ffe8-4e03-806f-65cbd2096f22_1.png" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>이월드 퍼플 아일랜드</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>
        
        
        

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_3231f42a-7997-47b7-b520-efdb8142a5f3_1.jpg" />
            </a>

            <div class="card-body">
                <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                  <strong>구팔일 올데이 페스티벌</strong>
                </p>
                <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                  2023.05.01 - 2023.06.30
                </p>
                <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                  대구 달서구
                </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted">10일 전</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col grid hvr-float card-margin">
          <div class="card shadow-sm card-border">
            <a href="festivalDetail.jsp">
              <img class='img-fluid w-100 fixed-image' src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/300_79f3d2d9-06c1-4d18-9a0e-a7d38aa0857e_1.png" />
            </a>

            <div class="card-body">
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                <strong>대한민국 독서대전</strong>
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1em;">
                2023.05.01 - 2023.06.30
              </p>
              <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 0.5em;">
                대구 달서구
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                </div>
                <small class="text-muted" >10일 전</small>
              </div>
            </div>
          </div>
        </div>



      </div>
    </div>
  </div>

</main>




<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

<!-- 지역 선택 스크립트 -->
<script>
  function changeRegion(region) {
    document.getElementById('selectedRegion').textContent = region;
  }
</script>

<!-- 카카오api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b0de7649944cbcadc52b390c8508cf"></script>
<script>
  var mapContainer = document.getElementById("map"); // 지도를 표시할 div
  var mapOption = {
    center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
    level: 5, // 지도의 확대 레벨
  };

  var map = new kakao.maps.Map(mapContainer, mapOption);

  var positions = [
    {
      title: "구의야구공원",
      latlng: new kakao.maps.LatLng(37.54699, 127.09598),
    },
    {
      title: "마커2",
      latlng: new kakao.maps.LatLng(37.55001, 127.09023),
    },
    {
      title: "마커3",
      latlng: new kakao.maps.LatLng(37.54243, 127.09879),
    },
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
          '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
          '    <span class="title">' +
          pos.title +
          "</span>" +
          "  </a>" +
          "</div>";

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
          customOverlay.setMap(map);
        });
      });

      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    </script>

  


     <script src="${context}/resources/js/bootstrap.bundle.min.js"></script>

      
</body>
</html>
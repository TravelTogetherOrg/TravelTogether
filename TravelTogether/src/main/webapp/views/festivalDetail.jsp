<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<link rel="stylesheet" href="${context }/resources/css/bootstrap.min.css?dddddddd">
    <style>
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

      .text-start {
        display: flex;
        justify-content: flex-start;
      }

      .text-start .btn:nth-child(2) {
        order: 1;
        margin-left: auto;
      }




/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
/* 슬라이더 관한 사항 */


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

      /* button */
      /* 기본 스타일 */
      .btn {
        color: black;
        /* 다른 스타일 속성들 */
      }

      /* hover 상태일 때 스타일 */
      .btn:hover {
        color: rgb(247, 212, 237);
        /* 다른 스타일 속성들 */
      }


      /* slider */
      @media (max-width: 767px) {
		.carousel-inner .carousel-item > div {
			display: none;
		}
		.carousel-inner .carousel-item > div:first-child {
			display: block;
		}
	}

	.carousel-inner .carousel-item.active,
	.carousel-inner .carousel-item-next,
	.carousel-inner .carousel-item-prev {
		display: flex;
	}

	/* medium and up screens */
	@media (min-width: 768px) {

		.carousel-inner .carousel-item-end.active,
		.carousel-inner .carousel-item-next {
			transform: translateX(25%);
		}

		.carousel-inner .carousel-item-start.active, 
		.carousel-inner .carousel-item-prev {
			transform: translateX(-25%);
		}
	}

	.carousel-inner .carousel-item-end,
	.carousel-inner .carousel-item-start { 
		transform: translateX(0);
	}
  




/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */





/* 5개 그림이랑 있는 글씨 .lead */
  .lead {
    text-align: left;
  }


/* comment 댓글 */
  .comment {
      border: 1px solid #ddd;
      padding: 10px;
      margin-bottom: 10px;
    }

    .comment .comment-author {
      font-weight: bold;
      margin-bottom: 5px;
    }

    .comment .comment-content {
      margin-bottom: 0;
    }


    /* 포스터 옆 글씨 */
    #fest {
      padding-left: 10px;
    }

    </style>
  
  <style>
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #457cc4; background: #457cc4 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;}
    .overlay_info .desc {padding:10px;position: relative; min-width: 190px; height: 56px}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 10px; right: 10px; top: 10px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style>
</head>
<body class="stst" style="padding-top: 70px;">
    


	<%@ include file="header.jsp" %>



<main>

       

    <br>
    <div class="container text-center my-3">
      <p class="text-start">
        <button type="button" class="btn btn-outline-primary" style="font-family: 'SUITE-Regular', sans-serif;">
          <i class="bi bi-heart-fill text-primary" ></i> 좋아요 <b>100</b>
        </button>
        &nbsp;&nbsp;
<!--         <button type="button" class="btn btn-outline-primary" style="font-family: 'SUITE-Regular', sans-serif;">
          <i class="bi bi-bookmark-plus text-primary"></i> 찜하기 <b>200</b>
        </button> -->
        <button type="button" class="btn btn-lg btn-outline-primary"  
                style="font-family: 'SUITE-Regular', sans-serif;"
                onclick="location.href='views/boardList.jsp'">
          <i class="bi bi-chat-right-dots text-primary"></i> 동행자구하기
        </button>
      </p>
        
 
        
        <div class="row py-lg-3">
          <div class="col-lg-6 col-md-8 mx-auto">
          
            <h1 class="fw-bold fs-1" style="font-family: 'Dovemayo_gothic', sans-serif; ">${festival.festival_name }</h1>
	<h5 id="festivalStatus" class="d-inline-flex p-2 bd-highlight" style="font-family: 'SUITE-Regular', sans-serif; color: white">
	축제 상태
	</h5>

                <!-- <h4 class="card-body fw-bold text-danger" style="font-family: 'SUITE-Regular', sans-serif;">축제진행중</h4> -->
            <h4 class="fw-bold" style="font-family: 'SUITE-Regular', sans-serif;">
            		<c:set var="startDate" value="${festival.festival_startdate}" />
					<c:set var="formattedStartDate" value="${startDate.substring(0, 4)}.${startDate.substring(4, 6)}.${startDate.substring(6)}" />
					
					<c:set var="endDate" value="${festival.festival_enddate}" />
					<c:set var="formattedEndDate" value="${endDate.substring(0, 4)}.${endDate.substring(4, 6)}.${endDate.substring(6)}" />
										  ${formattedStartDate} - ${formattedEndDate}
            </h4>
          </div>
        </div>
    </div>

    <!-- slider -->
    <div class="container text-center my-3">
      <div class="row mx-auto my-auto justify-content-center">
        <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner" role="listbox">

            <div class="carousel-item active">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
		    	<c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_2_공공3유형" />
				<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'" />
                  </div>
                  <!-- <div class="card-img-overlay">글씨 넣으려면 넣기</div> -->
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
					<c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_3_공공3유형" />
					<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'.toLowerCase()" />
                  </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
					<c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_4_공공3유형" />
					<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'.toLowerCase()" />
				   </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
					<c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_5_공공3유형" />
					<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'.toLowerCase()" />
                 </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
					<c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_6_공공3유형" />
					<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'.toLowerCase()" />
                  </div>
                </div>
              </div>
            </div>

          </div>
          <a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          </a>
          <a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
          </a>
        </div>
      </div>		
    </div>

    <br>
    <div class="container my-3">
      <p class="text-start" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 2.5em;">
      ${festival.festival_detail_information }
      </p>

      <hr>

      
    <div class="row featurette">
      <div class="col-md-7 order-md-2">   
        
        <table style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 1.5em;" class="lead">
          <tr>
            <td>
              <img src="https://korean.visitkorea.or.kr/kfes/resources/img/valentine_day.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img>
          </td>
            <td id="fest">
            		<c:set var="startDate" value="${festival.festival_startdate}" />
					<c:set var="formattedStartDate" value="${startDate.substring(0, 4)}.${startDate.substring(4, 6)}.${startDate.substring(6)}" />
					
					<c:set var="endDate" value="${festival.festival_enddate}" />
					<c:set var="formattedEndDate" value="${endDate.substring(0, 4)}.${endDate.substring(4, 6)}.${endDate.substring(6)}" />
										  ${formattedStartDate} - ${formattedEndDate}
            
            <br></td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr>
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/location_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img>
          </td>
            <td id="fest">
            ${festival.festival_address }
              <br>
            </td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr style="vertical-align: top;">
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/coin_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest">
            ${festival.festival_fee }
          
            </td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr>
            <td> <img src="https://korean.visitkorea.or.kr/kfes/resources/img/megaphone_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest">${festival.festival_showaddress }</td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr>
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/call_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest">${festival.festival_number }</td>
          </tr>

          <tr>
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/instagram_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest"><a style="text-decoration:  none;" href="${festival.festival_instagram_address }" class="link-info">${festival.festival_instagram_name }</a></td>
          </tr>
        </table>
        <br>
        <a class="btn btn-primary text-white d-block text-center" href="${festival.festival_homepage_address }" role="button">공식홈페이지</a>

        
        <br>
      </div>


    
      <div class="col-md-5 order-md-1">
		<c:set var="imagePath" value="${context}/resources/image/festival/${festival.festival_name}/${festival.festival_name}_1_공공3유형" />
		<img class="img-fluid w-100 fixed-image" src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'.toLowerCase()" />

      </div>
    </div>    


    <!-- 지도 -->
    <div class="container">
      <div id="map" class="container text-center my-3" style="width:1300px;height:500px; border-radius: 10px; border-radius: 20px; margin-left: -15px"></div>
      <!-- <div id="roadview" class="container text-center my-3" style="width:1300px;height:400px"></div> -->
    </div>
    




    <!-- 댓글 목록 -->
    <!-- 댓글 입력 폼 -->
    <!-- <div class="container py-4" style="text-align: start;">
      <h1>댓글</h1>

      


      <div id="commentList"></div>


      
      <form id="commentForm" class="mb-4" action="">
        <div class="mb-3">
          <label for="name" class="form-label">이름</label>
          <input type="text" class="form-control" id="name" required>
        </div>
        <div class="mb-3">
          <label for="comment" class="form-label">댓글</label>
          <textarea class="form-control" id="comment" rows="4" placeholder="댓글을 작성해 주세요." required></textarea>
        </div>
        <button type="submit" class="btn btn-outline-primary">댓글 작성</button>
      </form>
  
      
    </div>
     -->

</main>
	<%@ include file="footer.jsp" %>





<!-- 지역 선택 스크립트 -->
<script>
  function changeRegion(region) {
    document.getElementById('selectedRegion').textContent = region;
  }
</script>



<!-- slider -->
<script>
  let items = document.querySelectorAll('.carousel .carousel-item')

  items.forEach((el) => {
    const minPerSlide = 4
    let next = el.nextElementSibling
    for (var i=1; i<minPerSlide; i++) {
      if (!next) {
          // wrap carousel by using first child
          next = items[0]
      }
      let cloneChild = next.cloneNode(true)
      el.appendChild(cloneChild.children[0])
      next = next.nextElementSibling
  }
  })
</script>


<!-- 축제 진행 기간 -->
<script>
  var startDateStr = "${festival.festival_startdate}"; // 축제 시작 날짜
  var endDateStr = "${festival.festival_enddate}"; // 축제 종료 날짜

//축제 시작일과 현재 날짜 비교
  var status;
  var startDate = new Date(startDateStr.slice(0, 4), startDateStr.slice(4, 6) - 1, startDateStr.slice(6));
  var endDate = new Date(endDateStr.slice(0, 4), endDateStr.slice(4, 6) - 1, endDateStr.slice(6));
  var currentDate = new Date();

  if (currentDate >= startDate) {
  // 축제가 시작한 경우
  if (currentDate <= endDate) {
  // 축제가 종료되지 않은 경우
  status = "<span style='background-color:#f7d4ed; border-radius: 10px; padding : 13px'>축제 진행 중</span>";
  
  
  } else {
  // 축제가 종료된 경우
  status = "<span style='background-color:red; border-radius: 10px; padding : 13px'>축제가 종료되었습니다.</span>";
  }
  } else {
  // 축제 시작일이 현재 날짜보다 미래인 경우 #6eb5db
  // D-day 계산
  var diffInMillies = startDate - currentDate;
  var diffInDays = Math.floor(diffInMillies / (1000 * 60 * 60 * 24)+(1));
  status = "<span style='background-color:#69b3db; border-radius: 10px; padding : 13px'>축제 예정 D-" + diffInDays + " 일</span>";
  }
  
  // 상태 텍스트 업데이트
  /* var festivalStatus = document.getElementById("festivalStatus");
  festivalStatus.textContent = status */;
  document.getElementById("festivalStatus").innerHTML = status;
  
</script>

<!-- 카카오api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b0de7649944cbcadc52b390c8508cf"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapCenter = new kakao.maps.LatLng(${festival.festival_latitude} , ${festival.festival_longitude}), // 지도의 중심좌표
      mapOption = {
          center: mapCenter, // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };
  
  var map = new kakao.maps.Map(mapContainer, mapOption);
  
  // 커스텀 오버레이에 표시할 내용입니다
  // HTML 문자열 또는 Dom Element 입니다
  var content = '<div class="overlay_info">';
  content += '    <a href="https://map.kakao.com/?itemId=11394059" target="_blank"><strong>${festival.festival_name}</strong></a>';
  content += '    <div class="desc">';
  content += '        <span class="address" style="font-family: \'SUITE-Regular\', sans-serif;">${festival.festival_address}</span>';
  content += '    </div>';
  content += '</div>';
  
  // 커스텀 오버레이가 표시될 위치입니다 
  var position = new kakao.maps.LatLng(${festival.festival_latitude}, ${festival.festival_longitude});
  
  // 커스텀 오버레이를 생성합니다
  var mapCustomOverlay = new kakao.maps.CustomOverlay({
      position: position,
      content: content,
      xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
      yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
  });
  
  // 커스텀 오버레이를 지도에 표시합니다
  mapCustomOverlay.setMap(map);
  
  var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
  var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
  var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
  
  //지도의 중심좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
  rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
      rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
  });

  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
  
  kakao.maps.event.addListener(rv, 'init', function() {
  
      // 커스텀 오버레이를 생성합니다
      var rvCustomOverlay = new kakao.maps.CustomOverlay({
          position: position,
          content: content,
          xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
          yAnchor: 0.5 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
      });
  
      //rvCustomOverlay.setAltitude(2); //커스텀 오버레이의 고도값을 설정합니다.(로드뷰 화면 중앙이 0입니다)
      rvCustomOverlay.setMap(rv);
  
      var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
      
      // 커스텀오버레이의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
      var viewpoint = projection.viewpointFromCoords(rvCustomOverlay.getPosition(), rvCustomOverlay.getAltitude());
  
      rv.setViewpoint(viewpoint); //커스텀 오버레이를 로드뷰의 가운데에 오도록 로드뷰의 시점을 변화 시킵니다.
  });



  </script>



<!-- 댓글 -->
<!-- <script>
  document.getElementById('commentForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 폼 제출 기본 동작 막기

    // 입력한 이름과 댓글 내용 가져오기
    var nameInput = document.getElementById('name');
    var commentInput = document.getElementById('comment');
    var name = nameInput.value;
    var comment = commentInput.value;

    // 댓글 출력하기
    var commentList = document.getElementById('commentList');
    var commentElement = document.createElement('div');
    commentElement.classList.add('card', 'mb-3');
    commentElement.innerHTML = `
      <div class="card-body">
        <h5 class="card-text">${comment}</h5>
        <p class="card-title">작성자 : ${name} 2023-06-26</p>
      </div>

    `;
    commentList.appendChild(commentElement);

    // 입력 필드 초기화
    nameInput.value = '';
    commentInput.value = '';
  });
</script> -->

    <script src="${context}/resources/js/bootstrap.bundle.min.js"></script>

      
</body>
</html>
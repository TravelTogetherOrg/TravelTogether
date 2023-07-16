<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

      .text-start .btn:nth-child(3) {
        order: 1;
        margin-left: auto;
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
  



  .lead {
    text-align: left;
  }


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
        <button type="button" class="btn btn-outline-primary" style="font-family: 'SUITE-Regular', sans-serif;">
          <i class="bi bi-bookmark-plus text-primary"></i> 찜하기 <b>200</b>
        </button>
        <button type="button" class="btn btn-lg btn-outline-primary"  
                style="font-family: 'SUITE-Regular', sans-serif;"
                onclick="location.href='festivalList.jsp'">
          <i class="bi bi-chat-right-dots text-primary"></i> 동행자구하기
        </button>
      </p>
        
        <div class="row py-lg-3">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-bold fs-1" style="font-family: 'Dovemayo_gothic', sans-serif; ">휴애리 봄 수국축제</h1>
            <h5 class="d-inline-flex p-2 bd-highlight" 
                style="background-color: #f7d4ed; font-family: 'SUITE-Regular', sans-serif; border-radius: 10px; color: white; ">
                축제 진행중
            </h5>

                <!-- <h4 class="card-body fw-bold text-danger" style="font-family: 'SUITE-Regular', sans-serif;">축제진행중</h4> -->
            <h4 class="fw-bold" style="font-family: 'SUITE-Regular', sans-serif;">2023.06.22 - 2023.07.01</h4>
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
                    <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_8.jpg" class="img-fluid">
                  </div>
                  <!-- <div class="card-img-overlay">글씨 넣으려면 넣기</div> -->
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
                    <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_6.jpg" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
                    <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_7.jpg" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
                    <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_9.jpg" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
                    <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_10.jpg" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-img">
                    <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_11.jpg" class="img-fluid">
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
        서귀포시 남원읍 신례리에 위치한 휴애리 자연생활공원은 제주도민과 제주를 찾는 관광객에게 보다 나은 볼거리를 제공하고 또 힐링의 공간이 되고자 오는 4월 7일부터 “휴애리 봄 수국축제”를 개최한다고 밝혔다.<br>
        이번 2023 휴애리 봄 수국축제는 정성스럽게 키운 다양한 수국을 온실, 수국정원, 등 공원 곳곳에서 감상할 수 있어 제주도민과 상춘객에게 인기가 좋은 제주 대표 봄 축제가 될 것으로 전망된다. 특별히 온실에서 다양한 수국을 올 봄 가장 많게 만나 볼 수 있으며 여름수국 과 유럽수국까지 준비하여 늦여름까지 진행할 예정이다.<br>
        전년도 보다 더 풍성하게 준비될 이번 휴애리 봄 수국축제는 신혼여행, 웨딩스냅, 우정스냅 등 인생사진 찍기 좋은 장소로 인정받은 제주여행의 필수 코스이고 가족, 연인, 친구와 함께 다양한 수국포토존 에서 아름다운 추억을 만들 수 있을 것이다.<br>
        휴애리는 여러 해 전부터 지역사회 환원 차원에서 제주도내 장애인단체, 보육원, 양로원 등은 축제 때마다 무료입장(사전예약 필수)을 진행하고 있으며 도민과 관광객 가운데 3자녀이상(소인, 청소년) 입장료 50%할인행사를 별도로 진행하고 있다.<br>
                
        <br>
        <div class="text-center" style="font-family: 'SUITE-Regular', sans-serif; font-size: 18px; line-height: 2.5em;">
        [행사내용]<br>
        ■ 상철체험프로그램<br>
        동물먹이주기체험(산토끼, 염소, 말, 흑돼지등)<br>
        자연 학습체험, 전통놀이체험(돌탑쌓기, 투호던지기, 굴렁쇠 체험, 제기차기, 널뛰기 등)
      </div>
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
            <td id="fest">2023.04.07 ~ 2023.05.31<br></td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr>
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/location_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img>
          </td>
            <td id="fest">
              제주특별자치도 서귀포시 신례동로 256 휴애리<br>
            </td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr style="vertical-align: top;">
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/coin_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest">
          성 인 : 13,000원/단체:9,000원/도민:8,000원<br>
          청소년 : 11,000원/단체:8,000원/도민:7,000원<br>
          어린이 : 10,000원/단체:7,000원/도민:6,000원<br>
          경로/장애인/국가유공자/군인/경찰/소방관 단체요금 적용<br>
          단체요금 20명 부터 적용<br>
          35개월까지는 무료입장<br>
          세자녀 50%할인(자녀만 할인혜택, 고등학생까지)<br>
          제주특별자치도민,장애인,유공자,군인,경찰,소방관은 반드시 신분증 및 증명서를 제시해야 합니다.<br>
          
            </td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr>
            <td> <img src="https://korean.visitkorea.or.kr/kfes/resources/img/megaphone_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest">휴애리 자연생활공원</td>
          </tr>

          <tr>
            <td><br></td>
          </tr>

          <tr>
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/call_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest">064-732-2144</td>
          </tr>

          <tr>
            <td><img src="https://korean.visitkorea.or.kr/kfes/resources/img/instagram_ico.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="40" height="40">
            </img></td>
            <td id="fest"><a style="text-decoration:  none;" href="https://www.instagram.com/jeju_hueree/" class="link-info">jeju_hueree</a></td>
          </tr>
        </table>
        <br>
        <a class="btn btn-primary text-white d-block text-center" href="http://hueree.com/index.php" role="button">공식홈페이지</a>

        
        <br>
      </div>
      
      <div class="col-md-5 order-md-1">
        <img src="https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_2e07f10a-0837-42f5-abd8-f18a2af0fb73_3.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500">
      </img>

      </div>
    </div>    


    <!-- 지도 -->
    <div class="container">
      <div id="map" class="container text-center my-3" style="width:1300px;height:500px; border-radius: 10px; border-radius: 20px;"></div>
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

<!-- 카카오api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b0de7649944cbcadc52b390c8508cf"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapCenter = new kakao.maps.LatLng(33.30938385474628 , 126.63540771521112), // 지도의 중심좌표
      mapOption = {
          center: mapCenter, // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };
  
  var map = new kakao.maps.Map(mapContainer, mapOption);
  
  // 커스텀 오버레이에 표시할 내용입니다
  // HTML 문자열 또는 Dom Element 입니다
  var content = '<div class="overlay_info">';
  content += '    <a href="https://place.map.kakao.com/27581976" target="_blank"><strong>휴애리자연생활공원</strong></a>';
  content += '    <div class="desc">';
  content += '        <span class="address" style="font-family: \'SUITE-Regular\', sans-serif;">제주특별자치도 서귀포시 신례동로 256 휴애리</span>';
  content += '    </div>';
  content += '</div>';
  
  // 커스텀 오버레이가 표시될 위치입니다 
  var position = new kakao.maps.LatLng(33.30938385474628, 126.63540771521112);
  
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
<script>
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
</script>

    <script src="${context}/resources/js/bootstrap.bundle.min.js"></script>

      
</body>
</html> --%>
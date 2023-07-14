<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="../resources/js/jquery-3.6.4.js"></script>
<script src="${pageContext.request.contextPath }../resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<style>
html, body {
    height: 100%
}
.container {   						/* footer 고정 */
		 min-height: 100%;
   		 position: relative;
   		 display: flex;
	}

#companioninfo {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse:collapse;
	box-sizing:border-box;
	text-decoration:none;
}

.companioninfo{
	min-height:100%;
	position : relative;
	padding-bottom : 200px;
}
table{
    text-align: center;
}
.title{
	margin-top: 100px;
	padding-bottom:10px;
}
#input_img{                  /* 프로필 이미지 추가 버튼 */
	border:1px solid #ccc; 
	border-radius: 5px; 
	padding:5px;
	text-align:center;
}


.rounded-image {            /* 사진파일 동그랗게 편집 */
    border-radius: 50%;
    overflow: hidden;
  }

#writedlist{                  /* 동행신청정보 탭 */
	border: 1px solid #ccc;
	flex: 1;
	padding: 10px;
	
}
.btn-default2{
	width: 49%;
}
#cominfoBtn_G{
	background: #2C3C5B;
	color: white;
}
#companioninfo_t, #msg2{
	display: none;
}
#endBtn{
	padding: 1px 3px 1px 3px;
}
a{
	text-decoration: none;
}
.textDiv{
	margin-top: 30px;
}

.wrapper {
	display: flex; /* Add flex display to the wrapper */
}


	
	
	#tabs {
		width: 200px; /* Adjust the width as per your preference */
		list-style: none;
		margin: 0;
		padding: 0;
	
	}
	
	#tabs li {
		margin: 0;
		padding: 0;
	}
	
	#tabs li a {
		display: block;
		padding: 10px;
		border-bottom: 2px solid #fff;
		text-align: center;
		color: #000;
		text-decoration: none;
		
		
	}
	
	#tabs li a.current {
		background: blue;
		color: white;
		
	}
	
	.tab-section {
		flex: 1;
		padding: 10px;
		border: 1px solid #ccc;
		margin-bottom: 50px; 
		
		
				
	}
	
	.sidebar {
		width: 220px;
		height: auto;            /* 사이드바 세로 박스 크기 */
		margin-bottom: 50px;            /* 하단 간격 */
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 10px;
				
						
	}
	
	.content {
		flex: 1;
		padding: 10px;
		height: 100%; 
		overflow-y: auto; 
		position: relative; 
	}
	
	#modifyBtn {
		position: absolute;
		bottom: 80px;
		right: 10%;
	}
 	#companioninfo_g td {
        padding: 5px; /* 셀의 내부 여백 조정 */
    }


	


</style>
<script>                 //사이드바 메뉴 선택된것만 보여주기
	$(() => {
		$('#tabs a').bind('click', function(e) {
			$('#tabs a.current').removeClass('current');
			$('.tab-section:visible').hide();
			$(this.hash).show();
			$(this).addClass('current');
			e.preventDefault();
		}).filter(':first').click();
	});

</script>
</head>
<body>


<jsp:include page="header.jsp"/>
	
		<div class="title">
		<h2 align="center">마이페이지</h2>
		</div>
	
	<div class="container">
		<div class="sidebar">
			<div class="sidebar-inner">
				<ul id="tabs">
					<li><a href="#description">계정설정</a></li>
					<li><a href="#companioninfo">동행신청정보</a></li>
					<li><a href="#details">예약내역</a></li>
					<li><a href="#review">여행후기</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div id="description" class="tab-section">
				<h2>계정설정</h2>
				<hr style="border-color: black;">
					
					<div style="display: flex; flex-direction: column; align-items: center; ">
						<div class="rounded-image">
						    <img id="img" src="../resources/image/mypage/3.jpg" height="200" width="200">
						</div>
						  <br>
 						<input id="input_img" type="file"><br>
					</div>
										
					<script>                  // 업로드 된 사진으로 바꿈
						let img = document.getElementById('img');
						let input = document.getElementById('input_img');
						
						input.onchange = (e) => {
							if(input.file[0])
								img.src = URL.createObjectURL(input.file[0])
						};
					</script>
					
			<div style="display: flex; align-items: flex-start;">
					<table id="info_table">
				
						<tr>
							<td>
								<h5><font style="font-weight: bold;">아이디 : <input type='text' name='member_id' value='${member.member_id}'size="24" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">이름 : <input type='text' name='member_name' value='${member.member_name}'size="24"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">생년월일 : <input type='text' name='member_birthday' value='${member.member_birthday}'size="24" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">성별 : <input type='text' name='member_gender' value='${member.member_gender}'size="24" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">가입일 :<input type='text' name='member_create_date' value='${member.member_create_date}'size="24" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">별명 :<input type='text' name='member_nickname' value='${member.member_nickname}'size="24"> </font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
					</table>
					
					<button type="button" id="modifyBtn" class="btn btn-default" onclick="location.href='profile_update.jsp'">수정하기</button>
				</div>
			</div>
			<!-- 동행신청정보 탭 -->
	<div id="companioninfo" class="tab-section">
			
		<div id="writedlist">
			<h2>동행 신청 내역</h2>
			<hr style="border-color: black;">
			<button id="cominfoBtn_G" class="btn btn-default btn-default2">보낸 동행신청 내역</button>
			<button id="cominfoBtn_T" class="btn btn-default btn-default2">받은 동행신청 내역</button><br><br>
			
			
			
			<!-- 보낸 동행 신청 -->
			<c:if test="">
			<table id="companioninfo_g" class="table">
				<tr style="background: #dfd9f7;">
					<td>글번호</td>
					<td>동행글 제목</td>
					<td>작성자</td>
					<td>수락여부</td>
				</tr>
				<c:forEach items="" var="companioninfo_g">
				<tr>
					<td>1</td>
					<td>동행구해요~</td>
					<td>홍길동</td>
					<td>수락여부</td>
				</tr>
				</c:forEach>
			</table> 
			</c:if>
			<div id="msg1">
				<c:if test="">
				<div class="textDiv">동행 신청내역이 없습니다.<br><a style="text-decoration: none;" href="동행게시판">동행신청 하러가기</a>
				</div>
				</c:if>
			</div>
			
			<!-- 받은 동행 신청 -->
			<c:if test="">
			<table id="companioninfo_t" class="table">
				<tr style="background: #dfd9f7;">
					<td style="width:10%">글번호</td>
					<td style="width:35%">동행글 제목</td>
					<td style="width:20%">신청자</td>
					<td style="width:20%">수락여부</td>
					<td style="width:15%">채팅</td>
				</tr>
				<c:forEach items="" var="companioninfo_t">
				<tr>
					<td>1</td>
					<td>동행구합니다~</td>
					<td>김철수</td>
					<td>
					<c:if test="">
						<button class="OkBtn btn btn-default">수락하기</button>
					</c:if>
					<c:if test="">
					&nbsp;&nbsp;&nbsp;
					</c:if>
					</td>
					<td id="inviteBtnTd">
					<c:if test="">
						<font style="color:blue;" color="blue">초대완료</font>
					</c:if>
					<c:if test="">
						<button class="ChattingBtn btn btn-default">채팅초대하기</button>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</table> 
			</c:if>
			<div id="msg2">
			<c:if test="">
			<div class="textDiv">받은 동행 신청내역이 없습니다.
			</div>
			</c:if>
			</div>
		</div>

	</div>
	


<script>
$(function() {
	if("${listView}"=="t"){
		cominfoBtn_T.click();
	}
});
</script>
<script>
$('#cominfoBtn_G').on('click',function(){
	$('#cominfoBtn_G').css('background','#2C3C5B');
	$('#cominfoBtn_G').css('color','white');
	$('#cominfoBtn_T').css('background','white');
	$('#cominfoBtn_T').css('color','#333');
	$('#companioninfo_g').css('display','table');
	$('#companioninfo_t').css('display','none');
	$('#msg1').css('display','block');
	$('#msg2').css('display','none');
})
$('#cominfoBtn_T').on('click',function(){
	$('#cominfoBtn_G').css('background','white');
	$('#cominfoBtn_G').css('color','#333');
	$('#cominfoBtn_T').css('background','#2C3C5B');
	$('#cominfoBtn_T').css('color','white');
	$('#companioninfo_g').css('display','none');
	$('#companioninfo_t').css('display','table');
	$('#msg1').css('display','none');
	$('#msg2').css('display','block');
})

$('.OkBtn').on('click',function(e){
	var bool = confirm("동행 신청을 수락하겠습니까?\n※수락 후 취소가 불가합니다.※");
	if(bool){
		var tdArr = new Array();    // 배열 선언
	    var checkBtn = $(this);
		
	    var tr = checkBtn.parent().parent();
	    var td = tr.children();
	    
	    var c_id = td.eq(0).text().trim();
	    var m_id = td.eq(2).text().trim();
	    window.location="updateCompanionOk.do?c_id="+c_id+"&m_id="+m_id;
	}else if(bool==false){
		return false;
	}
});

$('.ChattingBtn').on('click',function(e){
	var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
	
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
    var c_id = td.eq(0).text().trim();
    var m_id2 = td.eq(2).text().trim();	//신청자
	
	var bool = confirm("[" + m_id2 + "]를 [" + c_id + "번글 채팅방]에 초대하겠습니까?");
	if(bool){
		
	 	// 채팅방 개설(본인 insert)
	 	// 신청자 초대(상대방 insert)
	 	$.ajax({
	 		url : "inviteChat.do?c_id=" + c_id + "&m_id2=" + m_id2,
	 		success : function(){
				alert("초대가 완료되었습니다. \n [ 마이페이지 → 채팅방 ] 에서 확인하세요!");
				window.location = "CompanionStatus2.do?m_id=${sessionScope.userID}";
	 		},
	 		error : function(){
				alert("초대에 실패했습니다. 관리자에게 문의하세요!");	 			
	 		}
	 	});
	}else if(bool==false){
		return false;
	}
});
</script>
			
			<div id="details" class="tab-section">
				<h2>예약내역</h2>
				<hr style="border-color: black;">
				<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
			</div>
			<div id="review" class="tab-section">
				<h2>여행후기</h2>
				<hr style="border-color: black;">
				<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
			</div>
		</div>
	</div>
	
	
<jsp:include page="footer.jsp"/>
	
</body>
</html>
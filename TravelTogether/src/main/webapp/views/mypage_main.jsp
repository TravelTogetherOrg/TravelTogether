<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="${path}/resources/js/jquery-3.6.4.js"></script>
<script src="${path}/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage.css?ddd">
<script src="//code.jquery.com/jquery.min.js"></script>
<script> 
/* 사이드바 */
	$(() => {
		$('#tabs a').bind('click', function(e) {
			$('#tabs a.current').removeClass('current');
			$('.tab-section:visible').hide();
			$(this.hash).show();
			$(this).addClass('current');
			e.preventDefault();
		}).filter(':first').click();
	});
	
/* --------유효성--------- */
  window.onload = function() {
    var passwordInput = document.getElementById('password');
    var passwordConfirmInput = document.getElementById('password2');
    var form = document.getElementById('form');


    function validatePassword() {
      var password = passwordInput.value;
      var passwordConfirm = passwordConfirmInput.value;

 
      var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;

      if (!passwordPattern.test(password)) {
        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자(@$!%*#?&)를 포함해야 합니다.');
        /* passwordInput.value = '';
        passwordConfirmInput.value = ''; */
        return false;
        
      } else if (password !== passwordConfirm) {
        alert('비밀번호가 일치하지 않습니다.');
        /* passwordInput.value = '';
        passwordConfirmInput.value = ''; */
        return false;
      }

      return true;
    }
    form.onsubmit = function() {
      if (!validatePassword()) {
        return false; 
      }
    };
  };
</script>
</head>
<body>

<jsp:include page="header.jsp"/>
	
	<div class="title">
		<h2/>
	</div> 
	<div class="container">
		<div class="sidebar">
			<div class="sidebar-inner">
				<ul id="tabs">
					<li><a href="#description">계정설정</a></li>
					<li><a href="#companioninfo">동행신청정보</a></li>
					<li><a id="memberBoardLink" href="${path}/memberBoardList.do">작성 게시물 보기</a></li>
					<li><a href="#review">여행후기</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
		<form id="form" action="updateMember.do" method="post" enctype="multipart/form-data">
			<div id="description" class="tab-section">
				<h2>계정설정</h2>
				<hr style="border-color: #ccc;">
					
				<div style="display: flex; flex-direction: column; align-items: center; ">
					<c:if test="${ empty member.member_profile_url}">
						<div class="rounded-image">
							<img id="img" src="${path}/resources/image/member/member.png" height="150" width="150">
						</div>
					</c:if>
					<c:if test="${not empty member.member_profile_url}">
						<div class="rounded-image">
							<img id="img" src="${path}${member.member_profile_url}" height="150" width="150">
						</div>
					</c:if>
						<input id="input_img" type="file" name="member_profile_image" >
				</div>
									
				<script>                  
				// 사진업로드 처리
					$(document).on('change', '#input_img', function(e){
						var reader = new FileReader();
						    reader.onload = function (e) {
						    $('#img').attr('src', e.target.result);
					  	}
					  	reader.readAsDataURL(this.files[0]);
					});
				</script>
				
				<div class="info">
					<table id="info_table">
						<tr>
							<td>
								<h5><font style="font-weight: bold;">아이디<br><input type='text' name='member_id' value='${member.member_id}'size="40" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">이름<br><input type='text' name='member_name' value='${member.member_name}'size="40" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">별명<br><input type='text' name='member_nickname' value='${member.member_nickname}'size="40"> </font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">비밀번호<br><input type='password' id="password" name='member_password' value='${member.member_password}'size="40" required="required"> </font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">비밀번호 확인<br><input type='password' id="password2" value='${member.member_password}'size="40" required="required"> </font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">생년월일<br><input type='text' name='member_birthday' value='${member.member_birthday}'size="40" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">성별 <br><input type='text' name='member_gender' value='${member.member_gender}'size="40" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">가입일<br><input type='text' name='member_create_date' value='${member.member_create_date}'size="40" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
					</table>
				</div>
				<div id="btn">
					<input type="submit" id="modifyBtn" value="수정하기" class="btn btn-default">&nbsp;&nbsp;
					<a href="${path}/deleteMember.do?member_id=${member.member_id}" id="modifyBtn" class="btn btn-default">탈퇴하기</a>
				</div>
			</div>
		</form>
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
			<div class="textDiv">
				받은 동행 신청내역이 없습니다.
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
		<div id="details" class="tab-section">
			<h2>${memberBoardList.member_id} 님의 작성 게시물 입니다.</h2>
			<hr style="border-color: black;">
			<c:forEach items="${memberBoardList}" var="board">
				<tr>
					<td>${board.member_id}</td>
					<td>${board.festival_name}</td>				
					<td>${board.board_title}</td>
					<td>${board.board_start_date}</td>
					<td>${board.board_end_date}</td>
					<td>${board.board_total_people}</td>
					<td>${board.board_write_date}</td>
				</tr>			
			</c:forEach>
		</div>
		<div id="review" class="tab-section">
			<h2>여행후기</h2>
			<hr style="border-color: black;">
			<p>응. 없어~~</p>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"/>
 <script src="${path}/resources/js/mypage.js"></script>	
</body>
</html>
